# Pi Dev web

Public site for **Pi Dev**, including the [Privacy Policy](/privacy).

SvelteKit + Tailwind, served in production with [`@sveltejs/adapter-node`](https://svelte.dev/docs/kit/adapter-node).

## Developing

```sh
pnpm install
pnpm dev
```

## Production build (local)

```sh
pnpm build
ORIGIN=http://localhost:3000 pnpm start
```

## Docker (production)

```sh
# Build
docker build -t piapp-web .

# Run (set ORIGIN to your public URL)
docker run --rm -p 3000:3000 \
  -e ORIGIN=https://your.domain \
  piapp-web
```

Useful environment variables (adapter-node):

| Variable           | Default      | Notes                                           |
| ------------------ | ------------ | ----------------------------------------------- |
| `PORT`             | `3000`       | Listen port                                     |
| `HOST`             | `0.0.0.0`    | Listen address                                  |
| `ORIGIN`           | -            | Public origin, e.g. `https://example.com`       |
| `PROTOCOL_HEADER`  | -            | e.g. `x-forwarded-proto` behind a trusted proxy |
| `HOST_HEADER`      | -            | e.g. `x-forwarded-host` behind a trusted proxy  |
| `BODY_SIZE_LIMIT`  | `1M` (image) | Max request body size                           |
| `SHUTDOWN_TIMEOUT` | `30`         | Seconds to drain on SIGTERM                     |

Only set `PROTOCOL_HEADER` / `HOST_HEADER` when the app is behind a **trusted** reverse proxy.
