# OpenRouter — Free LLM for Kline

> **Mindset: $0/token · Industry-grade coding · Smart reasoning**
>
> A comprehensive audit of all free models available on OpenRouter evaluated
> against Kline's real requirements: tool calling, streaming, long context,
> agentic coding loops, and deep reasoning.

## Table of Contents

1. [Kline Requirements Checklist](#kline-requirements-checklist)
2. [S-Tier — Free Coding Powerhouses](#s-tier--free-coding-powerhouses)
3. [A-Tier — Deep Reasoning Free](#a-tier--deep-reasoning-free)
4. [B-Tier — Long Context + Agentic](#b-tier--long-context--agentic)
5. [C-Tier — Solid Supporting Cast](#c-tier--solid-supporting-cast)
6. [Free Auto-Router](#free-auto-router)
7. [Rate Limits — Critical Reality Check](#rate-limits--critical-reality-check)
8. [Final Ranking](#final-ranking-free-models-for-kline)
9. [Kline Config — Free Mode](#kline-config--free-mode)
10. [Rotation Strategy](#recommended-rotation-strategy-for-kline)
11. [Sources](#sources)

## Kline Requirements Checklist

Critical non-negotiables for any model to work well in Kline:

| Requirement | Why It Matters |
|---|---|
| **Tool calling / function calling** | `bash`, `read_file`, `write_file`, `edit_file` schema compliance |
| **Streaming (text-delta)** | Real-time terminal rendering |
| **Long context (≥128K)** | Full codebase visibility, session history |
| **High code output quality** | No half-finished implementations |
| **Reasoning / CoT** | Complex debugging, multi-step agentic loops |
| **Reliable instruction following** | Kline's tool approval prompts, edit diffs |

All models in this audit are available at **$0/token** via OpenRouter's `:free`
suffix. A single OpenRouter API key is all you need.

## S-Tier — Free Coding Powerhouses

> The two models that deliver genuine industrial-grade coding at zero cost.

| Model | OpenRouter ID | Arch / Params | Context | Max Out | SWE-bench | HumanEval | Tool Call | Reasoning | Kline Score |
|---|---|---|---|---|---|---|---|---|---|
| **Qwen3 Coder 480B** | `qwen/qwen3-coder:free` | MoE 480B / 35B active | **1M** | — | **#1 free** | State-of-art | ✅ Native | ✅ Thinking mode | ⭐⭐⭐⭐⭐ |
| **Laguna M.1** | `poolside/laguna-m.1:free` | MoE 225B / 23B active | 131K | **8K** | **72.5%** | Purpose-built | ✅ Native | ✅ Yes | ⭐⭐⭐⭐⭐ |

### Qwen3 Coder 480B — `qwen/qwen3-coder:free`

The undisputed best free coding model on OpenRouter. Purpose-built for agentic
coding: function calling, tool use, and long-context repository reasoning at
a 1M token window. 480B total / 35B active MoE delivers frontier-class
intelligence at efficient per-request compute cost.

**Why it wins for Kline:**
- Designed from the ground up for tool use in agentic loops
- Thinking mode enables step-by-step reasoning before code output
- 1M context = full project history + multi-file awareness in one session
- Best free SWE-bench trajectory (Qwen family leads free-tier coding)

### Laguna M.1 — `poolside/laguna-m.1:free`

Poolside's flagship coding agent. 225B MoE trained completely from scratch on
30 trillion tokens using 6,144 interconnected NVIDIA Hopper GPUs. Scores
**72.5% on SWE-bench Verified** — the highest free SWE-bench score available
on OpenRouter as of June 2026. Also scores 46.9% on the harder SWE-bench Pro.

**Why it wins for Kline:**
- Tool calling is first-class, not bolted on — built for coding agents
- 72.5% SWE-bench = real GitHub bug-fixing capability, not just autocomplete
- 8K max output handles large function bodies and full file rewrites
- Free tier available for a limited time via OpenRouter

## A-Tier — Deep Reasoning Free

> When you need the model to *think hard* — complex architecture, deep bugs,
> multi-file reasoning.

| Model | OpenRouter ID | Arch / Params | Context | Max Out | MMLU | HumanEval | AIME 2025 | Tool Call | Reasoning |
|---|---|---|---|---|---|---|---|---|---|
| **GPT-OSS 120B** | `openai/gpt-oss-120b:free` | MoE 117B / 5.1B active | 131K | — | **94.2%** | **87.3%** | **96.6%** | ✅ Native | ✅ Configurable depth + CoT |
| **DeepSeek R1** | `deepseek/deepseek-r1:free` | MoE 671B / 37B active | 163K | 32K | 90.8% | 90.2% | 87.5% | ✅ Yes | ✅ **Full extended CoT** |
| **Qwen3 235B A22B** | `qwen/qwen3-235b-a22b:free` | MoE 235B / 22B active | 262K | — | — | — | 92.3% | ✅ Yes | ✅ Thinking mode |

### GPT-OSS 120B — `openai/gpt-oss-120b:free`

OpenAI's open-weight release. Runs on a single H100 with MXFP4 quantization
(5.1B active per forward pass). Native tool use including function calling,
browsing, and structured output. Configurable reasoning depth with full
chain-of-thought access. Outperforms o4-mini on HealthBench and leads on
TauBench (agentic tasks).

**Benchmarks:** MMLU 94.2% · HumanEval 87.3% · AIME 96.6%

**Why it matters for Kline:**
- Closest free equivalent to a paid OpenAI frontier model
- Native tool calling with browsing and structured output — reliable schema compliance
- Configurable reasoning depth matches Kline's effort-level concept

### DeepSeek R1 — `deepseek/deepseek-r1:free`

The reasoning giant. 671B/37B MoE with the deepest public chain-of-thought
available in any free model. Every response includes the full thinking trace,
visible in Kline's streaming output. Gold-standard for math and logical
reasoning.

**Benchmarks:** MATH-500 97.3% · MMLU 90.8% · HumanEval 90.2% · AIME 87.5%

**When to use in Kline:**
- Complex architectural decisions across multiple files
- Deep debugging sessions requiring step-by-step trace analysis
- Algorithmic design problems where reasoning trace is as valuable as the answer
- `/effort high` equivalent workflows

### Qwen3 235B A22B — `qwen/qwen3-235b-a22b:free`

Best free all-rounder when Qwen3 Coder rate-limits. 235B/22B MoE, 262K
context, thinking mode, Chatbot Arena score 1422. Strong on broad knowledge,
tool use, and general instruction following alongside coding tasks.

**Benchmarks:** AIME 2025 92.3% · Chatbot Arena 1422

## B-Tier — Long Context + Agentic

> When a session spans the entire codebase or runs long multi-step pipelines.

| Model | OpenRouter ID | Arch / Params | Context | Max Out | SWE-bench | Tool Call | Reasoning | Strength |
|---|---|---|---|---|---|---|---|---|
| **Nemotron 3 Ultra** | `nvidia/nemotron-3-ultra-550b-a55b:free` | Transformer-Mamba MoE 550B / 55B | **1M** | **65K** | Strong | ✅ Yes | ✅ Multi-step | Long-context orchestration |
| **Nemotron 3 Super** | `nvidia/nemotron-3-super-120b-a12b:free` | Mamba-Transformer MoE 120B / 12B | **1M** | — | **60.47%** | ✅ Yes | ✅ Multi-step | Speed + 1M context |
| **Laguna XS.2** | `poolside/laguna-xs.2:free` | — | 128K | 8K | **68.2%** | ✅ Native | ✅ Yes | Compact coding agent |

### Nemotron 3 Ultra — `nvidia/nemotron-3-ultra-550b-a55b:free`

NVIDIA's hybrid Transformer-Mamba MoE architecture. Best free model for
**1M-token context** use cases: full repo ingestion, long research sessions,
multi-agent orchestration pipelines. 65K max output supports generating large
code files without truncation.

**When to use in Kline:** Full-project sessions, reading entire codebases
before making changes, long `/resume` sessions with dense history.

### Nemotron 3 Super — `nvidia/nemotron-3-super-120b-a12b:free`

Leaner variant (12B active), same 1M context. 60.47% SWE-bench. Multi-Token
Prediction (MTP) delivers 50%+ faster token generation than comparable open
models. Good high-volume daily driver when Ultra's rate limit is exhausted.

### Laguna XS.2 — `poolside/laguna-xs.2:free`

Smaller Poolside model (68.2% SWE-bench Verified), Apache 2.0 open weights.
Efficient coding agent with native tool calling. Best secondary model when
Laguna M.1 hits its daily limit.

## C-Tier — Solid Supporting Cast (Free)

> Reliable, capable models for specific Kline workflows.

| Model | OpenRouter ID | Context | Tool Call | Vision | Reasoning | Best Use in Kline |
|---|---|---|---|---|---|---|
| **DeepSeek Chat V3.1** | `deepseek/deepseek-chat-v3.1:free` | 163K | ✅ Reliable | ❌ | ✅ Yes | Fast chat + reliable tool-calling fallback |
| **Llama 4 Scout** | `meta-llama/llama-4-scout:free` | **512K** | ✅ Yes | ❌ | Limited | Ultra-long context file reads |
| **Llama 4 Maverick** | `meta-llama/llama-4-maverick:free` | 128K | ✅ Consistent | ✅ Text+Image | Limited | Image+code (screenshot analysis) |
| **Gemma 4 31B** | `google/gemma-4-31b-it:free` | 262K | ✅ Native | ✅ Text+Image | ✅ Thinking | Vision + tools, 140+ languages |
| **Owl Alpha** | `openrouter/owl-alpha:free` | — | ✅ Native | ❌ | — | Lightweight agentic loops |

### Notable Callouts

**Llama 4 Scout** (`meta-llama/llama-4-scout:free`) — 512K context at zero
cost is exceptional. Use for reading and indexing very large codebases before
switching to a coding model for the actual changes.

**Gemma 4 31B** (`google/gemma-4-31b-it:free`) — 262K context, native
function calling, vision support, thinking mode, and 140+ language support.
Best free option for Kline's `computer_use` screenshot analysis workflow when
combined with coding tasks.

**DeepSeek Chat V3.1** (`deepseek/deepseek-chat-v3.1:free`) — Passes
tool-calling tests consistently. Reliable fallback when quota runs out on
primary models.

## Free Auto-Router

| Model | OpenRouter ID | Context | Behavior |
|---|---|---|---|
| **OpenRouter Free** | `openrouter/free` | 200K | Auto-selects best available free model; filters by vision / tool-calling / structured-output needs |

Use `openrouter/free` as a zero-config default in development. It automatically
routes to the most capable available free model that matches your request's
feature requirements (tool calling, vision, etc.), providing natural rotation
without manual switching.

## Rate Limits — Critical Reality Check

| Account State | Requests / min | Requests / day |
|---|---|---|
| No balance | 20 | **50** |
| Any balance added | 20 | **1,000** |
| $10+ credit added | 20 | **1,000** |

> **Action required:** Add $10 credit to your OpenRouter account once.
> Even if you only ever use `:free` models, this unlocks 1,000 requests/day
> (20x the default cap). A typical Kline session with complex multi-tool calls
> consumes 10–30 requests. At 50/day you'll hit the wall within 2–3 sessions.
> At 1,000/day you have full working capacity for free.

## Final Ranking: Free Models for Kline

| Rank | Model | OpenRouter ID | Key Strength |
|---|---|---|---|
| 🥇 **1** | **Qwen3 Coder 480B** | `qwen/qwen3-coder:free` | Best free coding model · 1M ctx · native tool use · thinking mode |
| 🥈 **2** | **Laguna M.1** | `poolside/laguna-m.1:free` | 72.5% SWE-bench · purpose-built coding agent · 225B MoE |
| 🥉 **3** | **GPT-OSS 120B** | `openai/gpt-oss-120b:free` | OpenAI quality · 94.2% MMLU · 87.3% HumanEval · native tool use |
| **4** | **DeepSeek R1** | `deepseek/deepseek-r1:free` | Deepest free reasoning · full CoT · 90.2% HumanEval |
| **5** | **Qwen3 235B** | `qwen/qwen3-235b-a22b:free` | 92.3% AIME · 262K ctx · thinking mode · best free all-rounder |
| **6** | **Nemotron 3 Ultra** | `nvidia/nemotron-3-ultra-550b-a55b:free` | 1M ctx · 65K output · orchestration powerhouse |
| **7** | **Laguna XS.2** | `poolside/laguna-xs.2:free` | 68.2% SWE-bench · Apache 2.0 · compact agent |
| **8** | **Nemotron 3 Super** | `nvidia/nemotron-3-super-120b-a12b:free` | 60.47% SWE-bench · 1M ctx · fastest free throughput |

## Kline Config — Free Mode

All free models route through OpenRouter's OpenAI-compatible endpoint.
Set these environment variables once:

```bash
CLINE_PROVIDER=openai-compatible
CLINE_BASE_URL=https://openrouter.ai/api/v1
CLINE_API_KEY=sk-or-<your-key>
```

Then switch `CLINE_MODEL_ID` per use case:

```bash
# Best: Industrial coding power
CLINE_MODEL_ID=qwen/qwen3-coder:free

# Best SWE-bench score (purpose-built coding agent)
CLINE_MODEL_ID=poolside/laguna-m.1:free

# Best reasoning depth (full CoT chain-of-thought)
CLINE_MODEL_ID=deepseek/deepseek-r1:free

# Best OpenAI-grade free (native tool use + configurable reasoning)
CLINE_MODEL_ID=openai/gpt-oss-120b:free

# Best 1M context + 65K output (full repo visibility)
CLINE_MODEL_ID=nvidia/nemotron-3-ultra-550b-a55b:free

# Zero-config auto-rotation (development / prototyping)
CLINE_MODEL_ID=openrouter/free
```

## Recommended Rotation Strategy for Kline

```
Primary coding session     →  qwen/qwen3-coder:free
Quota exhausted on Qwen?   →  poolside/laguna-m.1:free  →  openai/gpt-oss-120b:free
Hard architectural problem →  deepseek/deepseek-r1:free  (full CoT traces)
Broad knowledge + coding   →  qwen/qwen3-235b-a22b:free
Need 1M+ context window    →  nvidia/nemotron-3-ultra-550b-a55b:free
computer_use screenshots   →  google/gemma-4-31b-it:free  or  meta-llama/llama-4-maverick:free
Zero friction dev/test     →  openrouter/free  (auto-router)
```

## Benchmark Reference

| Benchmark | What It Measures | Why It Matters for Kline |
|---|---|---|
| **SWE-bench Verified** | Resolving real GitHub issues end-to-end | Best proxy for real-world coding agent performance |
| **SWE-bench Pro** | Harder multi-file GitHub issues | Long-horizon agentic coding capability |
| **HumanEval** | Function-level code completion | Core code generation quality |
| **AIME 2025** | Competition math reasoning | Proxy for deep structured reasoning |
| **MMLU** | Broad knowledge across 57 domains | General intelligence for context understanding |

## Sources

- [OpenRouter Free Models Collection](https://openrouter.ai/collections/free-models)
- [OpenRouter Free Models: All 27 Listed (Jun 2026)](https://costgoat.com/pricing/openrouter-free-models)
- [Best Free Models on OpenRouter 2026 — TeamDay.ai](https://www.teamday.ai/blog/best-free-ai-models-openrouter-2026)
- [Laguna M.1 (free) — OpenRouter](https://openrouter.ai/poolside/laguna-m.1:free)
- [Introducing Laguna XS.2 and M.1 — Poolside Blog](https://poolside.ai/blog/introducing-laguna-xs2-m1)
- [GPT-OSS 120B (free) — OpenRouter](https://openrouter.ai/openai/gpt-oss-120b:free)
- [Introducing GPT-OSS — OpenAI](https://openai.com/index/introducing-gpt-oss/)
- [Nemotron 3 Ultra (free) — OpenRouter](https://openrouter.ai/nvidia/nemotron-3-ultra-550b-a55b:free)
- [Nemotron 3 Super (free) — OpenRouter](https://openrouter.ai/nvidia/nemotron-3-super-120b-a12b:free)
- [Qwen3 Coder 480B — OpenRouter](https://openrouter.ai/qwen/qwen3-coder)
- [OpenRouter Best Coding Models](https://openrouter.ai/collections/programming)
- [Free Models for AI Agents — BrainRoad](https://brainroad.com/openrouter-free-models-which-ones-actually-work-for-ai-agents/)
- [OpenRouter Free API Strategy Guide](https://buldrr.com/openrouter-free-api-keys-free-models-simple-guide/)

*Generated: June 6, 2026 · Kline project · klabkode/kline*

---

