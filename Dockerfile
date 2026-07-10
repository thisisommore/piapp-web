# syntax=docker/dockerfile:1

# Production image for Pi Dev web (SvelteKit + adapter-node).
# Build:  docker build -t piapp-web .
# Run:    docker run --rm -p 3000:3000 -e ORIGIN=http://localhost:3000 piapp-web

ARG NODE_VERSION=22

# -----------------------------------------------------------------------------
# Base: Node + pnpm via Corepack (matches project lockfile tooling)
# -----------------------------------------------------------------------------
FROM node:${NODE_VERSION}-alpine AS base

ENV PNPM_HOME=/pnpm
ENV PATH=$PNPM_HOME:$PATH

RUN corepack enable \
	&& corepack prepare pnpm@10.19.0 --activate

WORKDIR /app

# -----------------------------------------------------------------------------
# Dependencies (cached unless lockfile / package manifests change)
# -----------------------------------------------------------------------------
FROM base AS deps

COPY package.json pnpm-lock.yaml pnpm-workspace.yaml .npmrc ./

RUN --mount=type=cache,id=pnpm,target=/pnpm/store \
	pnpm install --frozen-lockfile

# -----------------------------------------------------------------------------
# Build
# -----------------------------------------------------------------------------
FROM base AS builder

COPY --from=deps /app/node_modules ./node_modules
COPY . .

ENV NODE_ENV=production

RUN pnpm run build

# -----------------------------------------------------------------------------
# Production runner (no toolchain, no source, non-root)
# All app deps are devDependencies and bundled by adapter-node, so the runtime
# only needs the build output + package.json (for "type": "module").
# -----------------------------------------------------------------------------
FROM node:${NODE_VERSION}-alpine AS runner

WORKDIR /app

ENV NODE_ENV=production \
	PORT=3000 \
	HOST=0.0.0.0 \
	BODY_SIZE_LIMIT=1M \
	# Graceful drain window for SIGTERM/SIGINT (adapter-node default is 30s)
	SHUTDOWN_TIMEOUT=30

RUN addgroup --system --gid 1001 nodejs \
	&& adduser --system --uid 1001 --ingroup nodejs sveltekit

COPY --from=builder --chown=sveltekit:nodejs /app/build ./build
COPY --from=builder --chown=sveltekit:nodejs /app/package.json ./package.json

USER sveltekit

EXPOSE 3000

HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \
	CMD node -e "fetch('http://127.0.0.1:'+(process.env.PORT||3000)+'/').then((r)=>process.exit(r.ok?0:1)).catch(()=>process.exit(1))"

CMD ["node", "build"]
