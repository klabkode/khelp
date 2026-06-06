# Plugins Reference

Complete technical reference for Claude Code plugin system, including schemas, CLI commands, and component specifications.

## Skills

Plugins add skills to Claude Code, creating `/name` shortcuts that you or Claude can invoke.

**Location:** `skills/` or `commands/` directory in plugin root, or a single `SKILL.md` file at the plugin root

**File format:** Skills are directories with `SKILL.md`; commands are simple markdown files

**Skill structure:**
```
skills/
├── pdf-processor/
│   ├── SKILL.md
│   ├── reference.md (optional)
│   └── scripts/ (optional)
└── code-reviewer/
    └── SKILL.md
```

**Integration behavior:**
- Skills and commands are automatically discovered when the plugin is installed
- Claude can invoke them automatically based on task context
- Skills can include supporting files alongside `SKILL.md`

## Agents

Plugins can provide specialized subagents for specific tasks that Claude can invoke automatically when appropriate.

**Location:** `agents/` directory in plugin root

**File format:** Markdown files describing agent capabilities

**Agent structure:**
```yaml
---
name: agent-name
description: What this agent specializes in and when Claude should invoke it
model: sonnet
effort: medium
maxTurns: 20
disallowedTools: Write, Edit
---

Detailed system prompt for the agent describing its role, expertise, and behavior.
```

**Supported frontmatter fields:** `name`, `description`, `model`, `effort`, `maxTurns`, `tools`, `disallowedTools`, `skills`, `memory`, `background`, `isolation`

**Note:** The only valid `isolation` value is `"worktree"`. For security reasons, `hooks`, `mcpServers`, and `permissionMode` are not supported for plugin-shipped agents.

## Hooks

Plugins can provide event handlers that respond to Claude Code events automatically.

**Location:** `hooks/hooks.json` in plugin root, or inline in `plugin.json`

**Format:** JSON configuration with event matchers and actions

**Hook configuration example:**
```json
{
  "hooks": {
    "PostToolUse": [
      {
        "matcher": "Write|Edit",
        "hooks": [
          {
            "type": "command",
            "command": "\"${CLAUDE_PLUGIN_ROOT}\"/scripts/format-code.sh"
          }
        ]
      }
    ]
  }
}
```

### Hook Events

| Event | When it fires |
|-------|---------------|
| `SessionStart` | When a session begins or resumes |
| `Setup` | When you start Claude Code with `--init-only`, or with `--init` or `--maintenance` in `-p` mode |
| `UserPromptSubmit` | When you submit a prompt, before Claude processes it |
| `UserPromptExpansion` | When a user-typed command expands into a prompt, before it reaches Claude. Can block the expansion |
| `PreToolUse` | Before a tool call executes. Can block it |
| `PermissionRequest` | When a permission dialog appears |
| `PermissionDenied` | When a tool call is denied by the auto mode classifier |
| `PostToolUse` | After a tool call succeeds |
| `PostToolUseFailure` | After a tool call fails |
| `PostToolBatch` | After a full batch of parallel tool calls resolves |
| `Notification` | When Claude Code sends a notification |
| `MessageDisplay` | While assistant message text is displayed |
| `SubagentStart` | When a subagent is spawned |
| `SubagentStop` | When a subagent finishes |
| `TaskCreated` | When a task is being created via TaskCreate |
| `TaskCompleted` | When a task is being marked as completed |
| `Stop` | When Claude finishes responding |
| `StopFailure` | When the turn ends due to an API error |
| `TeammateIdle` | When an agent team teammate is about to go idle |
| `InstructionsLoaded` | When a `CLAUDE.md` or `.claude/rules/*.md` file is loaded into context |
| `ConfigChange` | When a configuration file changes during a session |
| `CwdChanged` | When the working directory changes |
| `FileChanged` | When a watched file changes on disk |
| `WorktreeCreate` | When a worktree is being created |
| `WorktreeRemove` | When a worktree is being removed |
| `PreCompact` | Before context compaction |
| `PostCompact` | After context compaction completes |
| `Elicitation` | When an MCP server requests user input during a tool call |
| `ElicitationResult` | After a user responds to an MCP elicitation |
| `SessionEnd` | When a session terminates |

### Hook Types

- **`command`** – Execute shell commands or scripts
- **`http`** – Send the event JSON as a POST request to a URL
- **`mcp_tool`** – Call a tool on a configured MCP server
- **`prompt`** – Evaluate a prompt with an LLM (uses `$ARGUMENTS` placeholder for context)
- **`agent`** – Run an agentic verifier with tools for complex verification tasks

## MCP Servers

Plugins can bundle Model Context Protocol (MCP) servers to connect Claude Code with external tools and services.

**Location:** `.mcp.json` in plugin root, or inline in `plugin.json`

**Format:** Standard MCP server configuration

**MCP server configuration example:**
```json
{
  "mcpServers": {
    "plugin-database": {
      "command": "${CLAUDE_PLUGIN_ROOT}/servers/db-server",
      "args": ["--config", "${CLAUDE_PLUGIN_ROOT}/config.json"],
      "env": {
        "DB_PATH": "${CLAUDE_PLUGIN_ROOT}/data"
      }
    },
    "plugin-api-client": {
      "command": "npx",
      "args": ["@company/mcp-server", "--plugin-mode"],
      "cwd": "${CLAUDE_PLUGIN_ROOT}"
    }
  }
}
```

**Integration behavior:**
- Plugin MCP servers start automatically when the plugin is enabled
- Servers appear as standard MCP tools in Claude's toolkit
- Server capabilities integrate seamlessly with Claude's existing tools
- Plugin servers can be configured independently of user MCP servers

## LSP Servers

Plugins can provide Language Server Protocol (LSP) servers to give Claude real-time code intelligence while working on your codebase.

**LSP integration provides:**
- Instant diagnostics: Claude sees errors and warnings immediately after each edit
- Code navigation: go to definition, find references, and hover information
- Language awareness: type information and documentation for code symbols

**Location:** `.lsp.json` in plugin root, or inline in `plugin.json`

**Format:** JSON configuration mapping language server names to their configurations

**.lsp.json file format:**
```json
{
  "go": {
    "command": "gopls",
    "args": ["serve"],
    "extensionToLanguage": {
      ".go": "go"
    }
  }
}
```

**Inline in plugin.json:**
```json
{
  "name": "my-plugin",
  "lspServers": {
    "go": {
      "command": "gopls",
      "args": ["serve"],
      "extensionToLanguage": {
        ".go": "go"
      }
    }
  }
}
```

### Required Fields

| Field | Description |
|-------|-------------|
| `command` | The LSP binary to execute (must be in PATH) |
| `extensionToLanguage` | Maps file extensions to language identifiers |

### Optional Fields

| Field | Description |
|-------|-------------|
| `args` | Command-line arguments for the LSP server |
| `transport` | Communication transport: `stdio` (default) or `socket` |
| `env` | Environment variables to set when starting the server |
| `initializationOptions` | Options passed to the server during initialization |
| `settings` | Settings passed via `workspace/didChangeConfiguration` |
| `workspaceFolder` | Workspace folder path for the server |
| `startupTimeout` | Max time to wait for server startup (milliseconds) |
| `maxRestarts` | Maximum number of restart attempts before giving up |

**Note:** You must install the language server binary separately. LSP plugins configure how Claude Code connects to a language server, but they don't include the server itself.

### Available LSP Plugins

| Plugin | Language server | Install command |
|--------|-----------------|-----------------|
| `pyright-lsp` | Pyright (Python) | `pip install pyright` or `npm install -g pyright` |
| `typescript-lsp` | TypeScript Language Server | `npm install -g typescript-language-server typescript` |
| `rust-analyzer-lsp` | rust-analyzer | See rust-analyzer installation |

## Monitors

Plugins can declare background monitors that Claude Code starts automatically when the plugin is active. Each monitor runs a shell command for the lifetime of the session and delivers every stdout line to Claude as a notification.

**Location:** `monitors/monitors.json` in the plugin root, or inline in `plugin.json`

**Format:** JSON array of monitor entries

**Example monitors/monitors.json:**
```json
[
  {
    "name": "deploy-status",
    "command": "\"${CLAUDE_PLUGIN_ROOT}\"/scripts/poll-deploy.sh ${user_config.api_endpoint}",
    "description": "Deployment status changes"
  },
  {
    "name": "error-log",
    "command": "tail -F ./logs/error.log",
    "description": "Application error log",
    "when": "on-skill-invoke:debug"
  }
]
```

### Required Fields

| Field | Description |
|-------|-------------|
| `name` | Identifier unique within the plugin |
| `command` | Shell command run as a persistent background process |
| `description` | Short summary of what is being watched |

### Optional Fields

| Field | Description |
|-------|-------------|
| `when` | Controls when the monitor starts. `"always"` (default) or `"on-skill-invoke:<skill-name>"` |

**Note:** Monitors are an experimental component. Plugin monitors require Claude Code v2.1.105 or later.

## Themes

Plugins can ship color themes that appear in `/theme` alongside the built-in presets and the user's local themes.

**Theme example:**
```json
{
  "name": "Dracula",
  "base": "dark",
  "overrides": {
    "claude": "#bd93f9",
    "error": "#ff5555",
    "success": "#50fa7b"
  }
}
```

**Note:** Themes are an experimental component. Plugin themes are read-only; pressing Ctrl+E on one in `/theme` copies it into `~/.claude/themes/` so the user can edit the copy.

## Plugin Installation Scopes

When you install a plugin, you choose a scope that determines where the plugin is available and who else can use it:

| Scope | Settings file | Use case |
|-------|---------------|----------|
| `user` | `~/.claude/settings.json` | Personal plugins available across all projects (default) |
| `project` | `.claude/settings.json` | Team plugins shared via version control |
| `local` | `.claude/settings.local.json` | Project-specific plugins, gitignored |
| `managed` | Managed settings | Managed plugins (read-only, update only) |

## Skills-Directory Plugins

Any folder under a skills directory that contains a `.claude-plugin/plugin.json` manifest is loaded as a plugin named `<name>@skills-dir` on the next session, with no marketplace and no install step.

**Skills directory tree:**

| What you have | What it is |
|---------------|-----------|
| `<skills-dir>/foo/SKILL.md` with no manifest | A plain skill named `foo` |
| `<skills-dir>/foo/.claude-plugin/plugin.json` | A plugin `foo@skills-dir` |
| `<plugin>/skills/bar/SKILL.md` | A skill `bar` packaged inside a plugin |

### Where the Plugin Loads From

| Skills directory | Scope | Loads |
|------------------|-------|-------|
| `~/.claude/skills/` | personal | In every project |
| `<cwd>/.claude/skills/` | project | Only after you accept the workspace trust dialog |

**Note:** A project-scope plugin is checked into the repository and reaches every collaborator who clones it. Project-scope `@skills-dir` plugins load only from the `.claude/skills/` of the directory where you start Claude Code.

## Plugin Manifest Schema

The `.claude-plugin/plugin.json` file defines your plugin's metadata and configuration.

### Complete Schema

```json
{
  "name": "plugin-name",
  "displayName": "Plugin Name",
  "version": "1.2.0",
  "description": "Brief plugin description",
  "author": {
    "name": "Author Name",
    "email": "author@example.com",
    "url": "https://github.com/author"
  },
  "homepage": "https://docs.example.com/plugin",
  "repository": "https://github.com/author/plugin",
  "license": "MIT",
  "keywords": ["keyword1", "keyword2"],
  "skills": "./custom/skills/",
  "commands": ["./custom/commands/special.md"],
  "agents": ["./custom/agents/reviewer.md"],
  "hooks": "./config/hooks.json",
  "mcpServers": "./mcp-config.json",
  "outputStyles": "./styles/",
  "lspServers": "./.lsp.json",
  "experimental": {
    "themes": "./themes/",
    "monitors": "./monitors.json"
  },
  "dependencies": [
    "helper-lib",
    { "name": "secrets-vault", "version": "~2.1.0" }
  ]
}
```

### Required Fields

If you include a manifest, `name` is the only required field.

| Field | Type | Description | Example |
|-------|------|-------------|---------|
| `name` | string | Unique identifier (kebab-case, no spaces) | `"deployment-tools"` |

### Metadata Fields

| Field | Type | Description | Example |
|-------|------|-------------|---------|
| `$schema` | string | JSON Schema URL for editor autocomplete | `"https://json.schemastore.org/claude-code-plugin-manifest.json"` |
| `displayName` | string | Human-readable name shown in the `/plugin` picker | `"Deployment Tools"` |
| `version` | string | Semantic version | `"2.1.0"` |
| `description` | string | Brief explanation of plugin purpose | `"Deployment automation tools"` |
| `author` | object | Author information | `{"name": "Dev Team"}` |
| `homepage` | string | Documentation URL | `"https://docs.example.com"` |
| `repository` | string | Source code URL | `"https://github.com/user/plugin"` |
| `license` | string | License identifier | `"MIT"`, `"Apache-2.0"` |
| `keywords` | array | Discovery tags | `["deployment", "ci-cd"]` |
| `defaultEnabled` | boolean | Whether the plugin starts enabled (default: `true`) | `false` |

### Component Path Fields

| Field | Type | Description | Example |
|-------|------|-------------|---------|
| `skills` | string\|array | Custom skill directories | `"./custom/skills/"` |
| `commands` | string\|array | Custom flat `.md` skill files | `"./custom/cmd.md"` |
| `agents` | string\|array | Custom agent files | `"./custom/agents/reviewer.md"` |
| `hooks` | string\|array\|object | Hook config paths or inline config | `"./my-extra-hooks.json"` |
| `mcpServers` | string\|array\|object | MCP config paths or inline config | `"./my-extra-mcp-config.json"` |
| `outputStyles` | string\|array | Custom output style files/directories | `"./styles/"` |
| `lspServers` | string\|array\|object | Language Server Protocol configs | `"./.lsp.json"` |
| `experimental.themes` | string\|array | Color theme files/directories | `"./themes/"` |
| `experimental.monitors` | string\|array | Background Monitor configurations | `"./monitors.json"` |
| `dependencies` | array | Other plugins this plugin requires | `[{ "name": "secrets-vault", "version": "~2.1.0" }]` |

### User Configuration

The `userConfig` field declares values that Claude Code prompts the user for when the plugin is enabled.

**Example:**
```json
{
  "userConfig": {
    "api_endpoint": {
      "type": "string",
      "title": "API endpoint",
      "description": "Your team's API endpoint"
    },
    "api_token": {
      "type": "string",
      "title": "API token",
      "description": "API authentication token",
      "sensitive": true
    }
  }
}
```

**Field options:**

| Field | Required | Description |
|-------|----------|-------------|
| `type` | Yes | One of `string`, `number`, `boolean`, `directory`, or `file` |
| `title` | Yes | Label shown in the configuration dialog |
| `description` | Yes | Help text shown beneath the field |
| `sensitive` | No | If `true`, masks input and stores in secure storage |
| `required` | No | If `true`, validation fails when empty |
| `default` | No | Value used when the user provides nothing |
| `multiple` | No | For `string` type, allow an array of strings |
| `min` / `max` | No | Bounds for `number` type |

**Substitution:** Each value is available as `${user_config.KEY}` in MCP and LSP server configs, hook commands, and monitor commands.

### Channels

The `channels` field lets a plugin declare one or more message channels that inject content into the conversation.

**Example:**
```json
{
  "channels": [
    {
      "server": "telegram",
      "userConfig": {
        "bot_token": {
          "type": "string",
          "title": "Bot token",
          "description": "Telegram bot token",
          "sensitive": true
        },
        "owner_id": {
          "type": "string",
          "title": "Owner ID",
          "description": "Your Telegram user ID"
        }
      }
    }
  ]
}
```

---

See [Plugins](https://code.claude.com/docs/en/plugins) for complete details on creating and distributing plugins.

