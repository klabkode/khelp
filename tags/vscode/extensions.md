# VS Code Extension Management

This guide shows how to manage VS Code extensions using the command line instead of the UI.

## Extensions path

```text
C:\Users\<username>\.vscode\extensions

or

~/.vscode/extensions
```

## Prerequisites

Ensure the `code` command is available in your terminal.

- **Windows / Linux**: Added automatically when VS Code is installed.
- **macOS**: Open the Command Palette (`Cmd+Shift+P`) and run **Shell Command: Install 'code' command in PATH**.

## List Installed Extensions

```text
code --list-extensions
```

## Show Extensions with Versions

```text
code --list-extensions --show-versions
```

## Install an Extension

```text
code --install-extension <extension-id>
```

## Install from a VSIX File

```text
code --install-extension <path-to-file.vsix>
```

## Force Reinstall an Extension

```text
code --install-extension <extension-id> --force
```

## Install Pre-release Version

```text
code --install-extension <extension-id> --pre-release
```

## Uninstall an Extension

```text
code --uninstall-extension <extension-id>
```

## Update Extensions

```text
code --update-extensions
```

## Export Installed Extensions

```text
code --list-extensions > extensions.txt
```

## Import Extensions from File

Restores extensions exported with the command above.

**PowerShell (Windows):**

```text
Get-Content extensions.txt | ForEach-Object { code --install-extension $_ }
```

**Bash (macOS / Linux):**

```text
cat extensions.txt | xargs -L 1 code --install-extension
```

## Disable All Extensions Temporarily

```text
code --disable-extensions
```

## Disable a Specific Extension

```text
code --disable-extension <extension-id>
```

## Enable a Specific Extension

```text
code --enable-extension <extension-id>
```

## Profile-scoped Extension Management

Install or manage extensions within a named profile.

```text
code --profile <profile-name> --install-extension <extension-id>
```

```text
code --profile <profile-name> --uninstall-extension <extension-id>
```

```text
code --profile <profile-name> --list-extensions
```

## Summary

Use CLI commands to efficiently manage VS Code extensions.

| Task | Command |
|---|---|
| List extensions | `code --list-extensions` |
| List with versions | `code --list-extensions --show-versions` |
| Install by ID | `code --install-extension <id>` |
| Install from VSIX | `code --install-extension <file.vsix>` |
| Force reinstall | `code --install-extension <id> --force` |
| Install pre-release | `code --install-extension <id> --pre-release` |
| Uninstall | `code --uninstall-extension <id>` |
| Update all | `code --update-extensions` |
| Export list | `code --list-extensions > extensions.txt` |
| Disable all | `code --disable-extensions` |
| Disable specific | `code --disable-extension <id>` |
| Enable specific | `code --enable-extension <id>` |
| Profile-scoped install | `code --profile <name> --install-extension <id>` |
