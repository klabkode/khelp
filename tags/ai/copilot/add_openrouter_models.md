# How to Add OpenRouter Models to GitHub Copilot in VS Code

## Step 1 — Install Required Extensions

Install these VS Code extensions:

- GitHub Copilot Chat
  <https://marketplace.visualstudio.com/items?itemName=GitHub.copilot-chat>

Sign in using your GitHub account after installation.

## Step 2 — Create an OpenRouter API Key

Open:

<https://openrouter.ai/keys>

Create a new API key.

Example:

```text
sk-or-v1-xxxxxxxxxxxxxxxx
```

Copy and save the key securely.

## Step 3 — Open GitHub Copilot Model Management

Open the Command Palette:

```text
Ctrl + Shift + P
```

Run:

```text
GitHub Copilot: Manage Models
```

This opens the Copilot model management UI.

## Step 4 — Add OpenRouter Models Using the UI

Inside the model management window:

1. Click **Add Models**
2. Choose **OpenRouter** as the provider
3. Enter the **Group Name** and **API Key**
4. GitHub Copilot will automatically fetch the available models

## Step 5 — Restart VS Code

Completely close and reopen VS Code.

This refreshes Copilot model registrations.

## Step 6 — Select the Model in Copilot Chat

Open GitHub Copilot Chat.

Click the model picker dropdown.

You should now see available OpenRouter models:

- openai/gpt-4o
- anthropic/claude-sonnet-4
- google/gemini-2.5-pro
- meta-llama/llama-4-maverick

Select a model and start using it inside VS Code.

---
