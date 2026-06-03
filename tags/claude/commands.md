# Claude Code Commands

## /add-dir
Add a working directory for file access during the current session.

## /agents
Manage agent configurations.

## /autofix-pr
Spawn a Claude Code on the web session that watches the current branch's PR and pushes fixes when CI fails or reviewers leave comments.

## /background
Detach the current session to run as a background agent and free this terminal. Alias: `/bg`

## /batch
Orchestrate large-scale changes across a codebase in parallel. (Skill)

## /branch
Create a branch of the current conversation at this point. Alias: `/fork`

## /btw
Ask a quick side question without adding to the conversation.

## /chrome
Configure Claude in Chrome settings.

## /claude-api
Load Claude API reference material for your project's language. (Skill)

## /clear
Start a new conversation with empty context. Aliases: `/reset`, `/new`

## /code-review
Review the current diff for correctness bugs and cleanups. (Skill)

## /color
Set the prompt bar color for the current session.

## /compact
Free up context by summarizing the conversation so far.

## /config
Open the Settings interface to adjust theme, model, output style, and other preferences. Alias: `/settings`

## /context
Visualize current context usage as a colored grid.

## /copy
Copy the last assistant response to clipboard.

## /cost
Alias for `/usage`

## /debug
Enable debug logging for the current session and troubleshoot issues. (Skill)

## /deep-research
Fan out web searches on a question, fetch and cross-check sources, and synthesize a cited report. (Workflow)

## /desktop
Continue the current session in the Claude Code Desktop app. Alias: `/app`

## /diff
Open an interactive diff viewer showing uncommitted changes and per-turn diffs.

## /doctor
Diagnose and verify your Claude Code installation and settings.

## /effort
Set the model effort level.

## /exit
Exit the CLI. Alias: `/quit`

## /export
Export the current conversation as plain text.

## /fast
Toggle fast mode on or off.

## /feedback
Submit feedback, report a bug, or share your conversation. Aliases: `/bug`, `/share`

## /fewer-permission-prompts
Scan your transcripts for common read-only Bash and MCP tool calls. (Skill)

## /focus
Toggle the focus view, which shows only your last prompt and final response.

## /goal
Set a goal: Claude keeps working across turns until the condition is met.

## /heapdump
Write a JavaScript heap snapshot and memory breakdown for diagnosing high memory usage.

## /help
Show help and available commands.

## /hooks
View hook configurations for tool events.

## /ide
Manage IDE integrations and show status.

## /init
Initialize project with a CLAUDE.md guide.

## /insights
Generate a report analyzing your Claude Code sessions.

## /install-github-app
Set up the Claude GitHub Actions app for a repository.

## /install-slack-app
Install the Claude Slack app.

## /keybindings
Open or create your keybindings configuration file.

## /login
Sign in to your Anthropic account.

## /logout
Sign out from your Anthropic account.

## /loop
Run a prompt repeatedly while the session stays open. (Skill) Alias: `/proactive`

## /mcp
Manage MCP server connections and OAuth authentication.

## /memory
Edit CLAUDE.md memory files, enable or disable auto-memory.

## /mobile
Show QR code to download the Claude mobile app. Aliases: `/ios`, `/android`

## /model
Switch the AI model and save it as your default for new sessions.

## /passes
Share a free week of Claude Code with friends.

## /permissions
Manage allow, ask, and deny rules for tool permissions. Alias: `/allowed-tools`

## /plugin
Manage Claude Code plugins.

## /powerup
Discover Claude Code features through quick interactive lessons.

## /privacy-settings
View and update your privacy settings.

## /radio
Open Claude FM lo-fi radio in your browser.

## /recap
Generate a one-line summary of the current session on demand.

## /release-notes
View the changelog in an interactive version picker.

## /reload-plugins
Reload all active plugins to apply pending changes without restarting.

## /reload-skills
Re-scan skill and command directories so skills added or changed on disk become available.

## /remote-control
Make this session available for remote control from claude.ai. Alias: `/rc`

## /remote-env
Configure the default remote environment for web sessions started with `--remote`.

## /rename
Rename the current session and show the name on the prompt bar.

## /resume
Resume a conversation by ID or name, or open the session picker. Alias: `/continue`

## /review
Review a pull request locally in your current session.

## /rewind
Rewind the conversation and/or code to a previous point. Aliases: `/checkpoint`, `/undo`

## /run
Launch and drive your project's app to see a change working. (Skill)

## /run-skill-generator
Teach `/run` and `/verify` how to build, launch, and drive your project's app. (Skill)

## /sandbox
Toggle sandbox mode.

## /schedule
Create, update, list, or run routines on Anthropic-managed cloud infrastructure. Alias: `/routines`

## /scroll-speed
Adjust mouse wheel scroll speed interactively.

## /security-review
Analyze pending changes on the current branch for security vulnerabilities.

## /setup-bedrock
Configure Amazon Bedrock authentication, region, and model pins.

## /setup-vertex
Configure Google Vertex AI authentication, project, region, and model pins.

## /simplify
Review the changed code for cleanup opportunities and apply the fixes. (Skill)

## /skills
List available skills.

## /stats
Alias for `/usage`. Opens on the Stats tab.

## /status
Open the Settings interface showing version, model, account, and connectivity.

## /statusline
Configure Claude Code's status line.

## /stickers
Order Claude Code stickers.

## /stop
Stop the current background session.

## /tasks
List and manage background tasks. Also available as `/bashes`.

## /team-onboarding
Generate a team onboarding guide from your Claude Code usage history.

## /teleport
Pull a Claude Code on the web session into this terminal. Alias: `/tp`

## /terminal-setup
Configure terminal keybindings for Shift+Enter and other shortcuts.

## /theme
Change the color theme.

## /tui
Set the terminal UI renderer and relaunch into it.

## /ultraplan
Draft a plan in an ultraplan session, review it in your browser, then execute remotely.

## /ultrareview
Run a deep, multi-agent code review in a cloud sandbox. (Alias for `/code-review ultra`)

## /upgrade
Open the upgrade page to switch to a higher plan tier.

## /usage
Show session cost, plan usage limits, and activity stats. Aliases: `/cost`, `/stats`

## /verify
Confirm a code change does what it should by building and running your project's app. (Skill)

## /voice
Toggle voice dictation, or enable it in a specific mode.

## /web-setup
Connect your GitHub account to Claude Code on the web using your local gh CLI credentials.

## /workflows
Open the workflow progress view to watch, pause, resume, or save running and completed workflows.

---

**Legend:**
- **(Skill)** – Bundled skill that Claude can invoke automatically when relevant
- **(Workflow)** – Bundled dynamic workflow that runs in the background
- **Alias** – Alternative command name

See [commands](https://code.claude.com/docs/en/commands) for full details.

