# Claude Code Tools

## Core Tools
- **Agent** – Spawns subagents with separate context
- **Bash** – Executes shell commands
- **Edit** – Makes targeted file edits
- **Read** – Reads file contents
- **Write** – Creates/overwrites files
- **Glob** – Finds files by pattern
- **Grep** – Searches file contents
- **WebFetch** – Fetches and extracts from URLs
- **WebSearch** – Performs web searches

## Code Intelligence
- **LSP** – Language server for definitions, references, type checking

## Task & Workflow
- **Agent** – Spawns subagents
- **Workflow** – Runs dynamic workflows
- **Skill** – Executes reusable prompt-based workflows
- **TaskCreate/TaskGet/TaskList/TaskUpdate/TaskStop** – Task management
- **CronCreate/CronDelete/CronList** – Schedules tasks

## Interaction
- **AskUserQuestion** – Asks multiple-choice questions
- **PushNotification** – Sends desktop/phone notifications
- **Monitor** – Watches logs/files and reacts to changes

## Planning & Execution
- **EnterPlanMode/ExitPlanMode** – Design-first approach
- **EnterWorktree/ExitWorktree** – Isolated git worktrees

## External Integration
- **ListMcpResourcesTool/ReadMcpResourceTool** – MCP server resources
- **ToolSearch** – Loads deferred tools
- **WaitForMcpServers** – Waits for MCP connections

## Advanced
- **PowerShell** – Native PowerShell on Windows
- **NotebookEdit** – Modifies Jupyter notebooks
- **RemoteTrigger** – Creates/runs Routines on claude.ai
- **SendMessage/TeamCreate/TeamDelete** – Agent teams (experimental)
- **ShareOnboardingGuide** – Shares team onboarding

See [tools-reference](https://code.claude.com/docs/en/tools-reference) for full details, permissions, and behavior specs.

