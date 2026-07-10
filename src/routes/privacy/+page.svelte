<script lang="ts">
	const lastUpdated = 'July 9, 2026';
</script>

<svelte:head>
	<title>Privacy Policy · Pi Dev</title>
	<meta
		name="description"
		content="Privacy Policy for the Pi Dev iOS app and related Pi server software."
	/>
	<meta name="robots" content="index,follow" />
</svelte:head>

<article class="mx-auto max-w-3xl px-5 py-12 sm:px-6 sm:py-16">
	<header class="mb-10 border-b border-white/10 pb-8">
		<p class="mb-3 text-xs font-medium tracking-widest text-pi-soft uppercase">Legal</p>
		<h1 class="text-3xl font-semibold tracking-tight text-white sm:text-4xl">Privacy Policy</h1>
		<p class="mt-3 text-sm text-white/50">Last updated: {lastUpdated}</p>
	</header>

	<div
		class="prose prose-invert prose-headings:scroll-mt-24 prose-headings:font-semibold prose-headings:tracking-tight prose-h2:mt-12 prose-h2:text-xl prose-h3:text-base prose-p:text-white/70 prose-li:text-white/70 prose-strong:text-white prose-a:text-pi-soft prose-a:no-underline hover:prose-a:underline prose-hr:border-white/10 max-w-none"
	>
		<p>
			This Privacy Policy describes how <strong>Pi Dev</strong> (“we,” “us,” or “our”) handles
			information when you use the Pi Dev iOS application (the “App”) and related documentation on
			this website. Pi Dev is a coding-agent client that connects to a Pi backend server that
			<em>you</em> (or your organization) operate.
		</p>

		<p>
			We designed Pi Dev around a simple idea: your prompts, code, and sessions stay on the
			infrastructure you configure. We do not operate a mandatory cloud account service for the App,
			and we do not sell personal information.
		</p>

		<hr />

		<h2 id="summary">1. Summary</h2>
		<ul>
			<li>
				<strong>No Pi Dev account required.</strong> You connect the App to a server URL and an authentication
				token that you control.
			</li>
			<li>
				<strong>Conversation content is not sent to a Pi Dev cloud.</strong>
				Messages, files, and repository URLs go to the Pi server you configure.
			</li>
			<li>
				<strong>Local settings only on device.</strong> The App stores your server URL and auth token
				on the device for convenience.
			</li>
			<li>
				<strong>No advertising or analytics SDKs</strong> are bundled in the App for tracking users across
				apps or websites.
			</li>
			<li>
				<strong>Third-party AI providers</strong> may process prompts if the operator of your Pi server
				configures LLM API keys (for example OpenAI, Anthropic, Google, or others).
			</li>
		</ul>

		<hr />

		<h2 id="who">2. Who this policy covers</h2>
		<p>This policy applies to:</p>
		<ul>
			<li>The <strong>Pi Dev</strong> iOS app</li>
			<li>This public website (including this Privacy Policy page), when hosted by us</li>
		</ul>
		<p>
			It does <strong>not</strong> control how a third party runs their own Pi server, network, or LLM
			provider account. If you connect the App to a server operated by someone else (for example an employer),
			their policies may also apply to data processed on that server.
		</p>

		<hr />

		<h2 id="collect">3. Information we collect and process</h2>

		<h3 id="device">3.1 Information stored on your device</h3>
		<p>The App may store the following locally (via system preferences storage):</p>
		<ul>
			<li>
				<strong>Server URL</strong> - the address of the Pi backend you choose to use
			</li>
			<li>
				<strong>Authentication token</strong> - the API token required by that server
			</li>
		</ul>
		<p>
			Chat UI state (drafts, in-progress messages, selected model, attachments before send) is held
			in memory while you use the App and is not used to build marketing profiles.
		</p>

		<h3 id="you-provide">3.2 Information you provide while using the App</h3>
		<p>
			When you use Pi Dev, content you create or attach is sent to
			<strong> your configured Pi server</strong>, not to a separate Pi Dev account backend. That
			content may include:
		</p>
		<ul>
			<li>Chat messages and prompts</li>
			<li>Pasted text</li>
			<li>Contents of files you choose to attach (for example source code or plain text)</li>
			<li>
				Git repository URLs or paths you choose to include so the server can work in that project
				context
			</li>
			<li>Preferences such as model selection and thinking level, when the server supports them</li>
		</ul>
		<p>
			Do not attach secrets, credentials, or personal data you are not willing to send to the server
			and any LLM providers that server uses.
		</p>

		<h3 id="github">3.3 Optional GitHub public API lookups</h3>
		<p>
			If you use the repository picker to search public GitHub repositories by username, the App
			requests public repository metadata from
			<code>api.github.com</code> (for example repository name, description, and clone URL). That request
			is made from your device to GitHub. We do not use this to create a Pi Dev user profile, and the
			App does not require a GitHub login for public repo search.
		</p>
		<p>
			GitHub’s processing of those requests is governed by
			<a
				href="https://docs.github.com/en/site-policy/privacy-policies/github-general-privacy-statement"
				rel="noopener noreferrer"
				target="_blank">GitHub’s privacy policy</a
			>.
		</p>

		<h3 id="website">3.4 This website</h3>
		<p>
			This site primarily serves static informational pages (such as this policy). We do not require
			you to create an account to read it. Standard web server or hosting logs (for example IP
			address, user agent, and requested URL) may be generated by the host that serves the site, for
			security and reliability. We do not use third-party advertising cookies on this policy page.
		</p>

		<h3 id="not-collected">3.5 Information we do not collect</h3>
		<p>As implemented today, Pi Dev does not:</p>
		<ul>
			<li>Create or require a Pi Dev user account or email signup</li>
			<li>Include third-party advertising, cross-app tracking, or marketing analytics SDKs</li>
			<li>
				Access your contacts, precise location, microphone, camera, or photo library as part of core
				product features
			</li>
			<li>Sell your personal information</li>
		</ul>

		<hr />

		<h2 id="server">4. How the Pi server handles data</h2>
		<p>
			Pi Dev talks to a Pi backend over HTTPS/HTTP using a bearer (or equivalent) API token.
			Depending on how that server is configured, it may:
		</p>
		<ul>
			<li>
				<strong>Authenticate</strong> every request with the shared API token
			</li>
			<li>
				<strong>Persist chat sessions</strong> on disk (unless session persistence is disabled by the
				operator)
			</li>
			<li>
				<strong>Stream agent events</strong> (assistant text, tool use, and related session updates) back
				to the App
			</li>
			<li>
				<strong>Clone git repositories</strong> you supply into a working directory on the server machine
			</li>
			<li>
				<strong>Run developer tools</strong> on the server (for example shell commands in the agent workspace)
				as part of the coding agent
			</li>
			<li>
				<strong>Call third-party LLM APIs</strong> using API keys stored on the server (for example in
				the operator’s agent auth configuration), so prompt and context data may leave the server and
				go to those providers
			</li>
		</ul>
		<p>
			Operators can typically configure the working directory, session storage location, default
			model/provider, and whether sessions are kept. If you self-host, you control retention and
			access. If someone else hosts the server, ask them how long sessions are kept and which model
			providers they use.
		</p>

		<hr />

		<h2 id="use">5. How information is used</h2>
		<p>Information processed through Pi Dev is used to:</p>
		<ul>
			<li>Connect the App to your chosen server</li>
			<li>Provide coding-agent chat, tools, and session history</li>
			<li>Clone or open repositories and apply model/thinking settings you select</li>
			<li>Operate, secure, and debug software you or your operator run</li>
		</ul>
		<p>
			We do not use App conversation content for advertising. We do not sell personal information.
		</p>

		<hr />

		<h2 id="sharing">6. Sharing and third parties</h2>
		<p>Data may be shared only as needed to operate the product:</p>
		<ul>
			<li>
				<strong>Your Pi server operator</strong> - receives the content and settings you send from the
				App
			</li>
			<li>
				<strong>LLM and model providers</strong> - if configured on the server, prompts and related context
				may be sent to those providers under their terms and privacy policies
			</li>
			<li>
				<strong>GitHub</strong> - if you use public repository search, GitHub receives the public API
				request from your device
			</li>
			<li>
				<strong>Infrastructure providers</strong> - if we host this website, standard hosting and network
				providers may process technical logs
			</li>
			<li>
				<strong>Legal requirements</strong> - we may disclose information if required by law, regulation,
				or valid legal process
			</li>
		</ul>

		<hr />

		<h2 id="retention">7. Retention</h2>
		<ul>
			<li>
				<strong>On device:</strong> Server URL and auth token remain until you clear App data, reinstall
				the App, or change/remove those settings.
			</li>
			<li>
				<strong>On the Pi server:</strong> Session files and cloned repositories are retained according
				to the server operator’s configuration and practices (including optional settings that disable
				session persistence).
			</li>
			<li>
				<strong>LLM providers:</strong> Retention of prompts and outputs is governed by each provider’s
				policy and the operator’s agreement with them.
			</li>
		</ul>

		<hr />

		<h2 id="security">8. Security</h2>
		<p>
			The App sends the authentication token on API requests so only clients that know the token can
			use the server. You should:
		</p>
		<ul>
			<li>Use a strong, unique API token</li>
			<li>Prefer HTTPS endpoints and avoid sharing tokens in screenshots or chat</li>
			<li>
				Treat the Pi server like a development machine: it may store code, sessions, and credentials
				for model providers
			</li>
			<li>Limit who can reach the server on the network and who knows the token</li>
		</ul>
		<p>
			No method of transmission or storage is completely secure. Use Pi Dev only with servers and
			networks you trust.
		</p>

		<hr />

		<h2 id="children">9. Children’s privacy</h2>
		<p>
			Pi Dev is not directed at children under 13 (or the equivalent minimum age in your
			jurisdiction). We do not knowingly collect personal information from children. If you believe
			a child has provided personal information through the App, contact us and we will take
			appropriate steps.
		</p>

		<hr />

		<h2 id="rights">10. Your choices and rights</h2>
		<p>Depending on your situation, you can:</p>
		<ul>
			<li>Disconnect the App by clearing the saved server URL and token (or deleting the App)</li>
			<li>Stop sending content by not submitting prompts or attachments</li>
			<li>Ask the operator of your Pi server to delete session files or disable persistence</li>
			<li>
				Review and exercise rights under applicable law (for example access, deletion, or
				correction) with the party that controls the relevant data - often the server operator for
				session content
			</li>
		</ul>
		<p>
			If you contact us about a privacy request, we will help identify whether the data is
			controlled by us (for example website hosting) or by your server operator.
		</p>

		<hr />

		<h2 id="international">11. International processing</h2>
		<p>
			If you use a server or model provider in another country, your information may be processed in
			that country. Those jurisdictions may have different data-protection laws than your own.
		</p>

		<hr />

		<h2 id="apple">12. Apple App Store and device permissions</h2>
		<p>
			Pi Dev uses system capabilities only as needed for product features, such as network access to
			your server and optional file import for context. We do not use App Tracking Transparency for
			cross-app advertising, because we do not track you across apps and websites for ads.
		</p>
		<p>
			Apple may independently collect certain analytics related to App Store distribution according
			to your device settings and Apple’s policies. That collection is controlled by Apple, not by
			Pi Dev.
		</p>

		<hr />

		<h2 id="changes">13. Changes to this policy</h2>
		<p>
			We may update this Privacy Policy from time to time. When we do, we will revise the “Last
			updated” date at the top of this page. Continued use of the App or website after changes
			become effective constitutes acceptance of the updated policy, except where applicable law
			requires additional notice or consent.
		</p>

		<hr />

		<h2 id="contact">14. Contact</h2>
		<p>
			For privacy questions about Pi Dev or this policy, contact the developer through the support
			channel listed on the App Store product page for Pi Dev, or the contact method provided with
			your distribution of the App.
		</p>
		<p>
			If your question concerns data stored on a Pi server you do not operate, please also contact
			that server’s operator.
		</p>
	</div>
</article>
