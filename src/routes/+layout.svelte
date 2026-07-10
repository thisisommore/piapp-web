<script lang="ts">
	import './layout.css';
	import favicon from '$lib/assets/favicon.svg';

	let { children } = $props();
</script>

<svelte:head>
	<link rel="icon" href={favicon} />
	<meta name="theme-color" content="#0b0c10" />
</svelte:head>

<div class="relative min-h-dvh">
	<div class="pointer-events-none absolute inset-0 overflow-hidden" aria-hidden="true">
		<div
			class="absolute -top-32 left-1/2 h-[28rem] w-[42rem] -translate-x-1/2 rounded-full bg-indigo-500/15 blur-3xl"
		></div>
		<div class="absolute top-1/3 -right-24 h-72 w-72 rounded-full bg-teal-500/10 blur-3xl"></div>
	</div>

	<header class="relative z-10 border-b border-white/5 bg-surface/70 backdrop-blur-md">
		<div class="mx-auto flex max-w-3xl items-center justify-between px-5 py-4 sm:px-6">
			<a href="/" class="group flex items-center gap-2.5 no-underline">
				<span
					class="font-serif text-2xl font-thin tracking-tight text-pi-soft transition group-hover:text-white"
					>π</span
				>
				<span class="text-sm font-medium tracking-wide text-white/90">Pi Dev</span>
			</a>
			<nav class="flex items-center gap-5 text-sm text-white/60">
				<a href="/support" class="transition hover:text-white">Support</a>
				<a href="/privacy" class="transition hover:text-white">Privacy</a>
			</nav>
		</div>
	</header>

	<main class="relative z-10">{@render children()}</main>

	<footer class="relative z-10 border-t border-white/5 py-8">
		<div
			class="mx-auto flex max-w-3xl flex-col gap-2 px-5 text-sm text-white/40 sm:flex-row sm:items-center sm:justify-between sm:px-6"
		>
			<p>© {new Date().getFullYear()} Pi Dev</p>
			<div class="flex items-center gap-4">
				<a href="/support" class="transition hover:text-white/70">Support</a>
				<a href="/privacy" class="transition hover:text-white/70">Privacy Policy</a>
			</div>
		</div>
	</footer>
</div>
