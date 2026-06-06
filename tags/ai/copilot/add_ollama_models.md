# How to Add Ollama Cloud Models to GitHub Copilot in VS Code

## Method 1: With API Keys

### Step 1 — Install Required Extensions

Install these VS Code extensions:

- GitHub Copilot Chat
  <https://marketplace.visualstudio.com/items?itemName=GitHub.copilot-chat>

Sign in using your GitHub account after installation.

### Step 2 — Create an Ollama API Key

Open:

<https://ollama.com/settings/keys>

Create a new API key.

Example:

```text
ollama_xxxxxxxxxxxxxxxx
```

Copy and save the key securely.

### Step 3 — Open GitHub Copilot Model Management

Open the Command Palette:

```text
Ctrl + Shift + P
```

Run:

```text
GitHub Copilot: Manage Models
```

This opens the Copilot model management UI.

### Step 4 — Add Ollama Cloud Models Using the UI

Inside the model management window:

1. Click **Add Models**
2. Choose **Ollama** as the provider
3. Enter the **Group Name** and set the API endpoint to: <https://ollama.com>
4. GitHub Copilot will automatically fetch the available models

### Step 5 — Add API Key to Enable Model Access

Running the models without an API key will not work and may produce an error similar to:

```text
Sorry, your request failed. Please try again.

Copilot Request id: xxxxxxxxxx

Reason: token expired or invalid: 401: Error: token expired or invalid: 401 at Pj._provideLanguageModelResponse
```

To resolve this issue, manually add the API key in the VS Code model configuration file:

$HOME/.config/Code/User/chatLanguageModels.json:

```json
{
  "name": "Ollama",
  "vendor": "ollama",
  "url": "https://ollama.com",
  "apiKey": "your_api_key_here"
}
```

### Step 6 — Restart VS Code

Completely close and reopen VS Code.

This refreshes Copilot model registrations.

### Step 7 — Select the Model in Copilot Chat

Open GitHub Copilot Chat.

Click the model picker dropdown.

You should now see available Ollama cloud models such as:

- qwen3
- llama3.3
- deepseek-r1
- mistral
- gemma3

Select a model and start using it inside VS Code.

> Note:
>
> - This setup uses Ollama cloud-hosted models.
> - Ollama does NOT need to be installed locally.

---

## Method 2: Using Ollama CLI command

### Step 1 — Install Ollama

Download and install Ollama from:

<https://ollama.com/download>

### Step 2 — Launch VS Code with an Ollama Cloud Model

Run the following command:

```text
ollama launch vscode --model <MODEL>
```

Examples:

```bash
ollama launch vscode --model gemma4:31b-cloud

ollama launch vscode --model gpt-oss:120b-cloud
```

---
