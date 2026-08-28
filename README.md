# AI Toolkit

> A unified, cross-harness foundation for AI coding agents across **Google Antigravity**, **Claude Code**, and **Cursor IDE** — featuring embedded context compression engines, upstream submodule tracking, and automated telemetry.

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Submodules](https://img.shields.io/badge/git-submodules-orange.svg)](#bundled-tools--submodules)
[![Node](https://img.shields.io/badge/node-%3E%3D20-green.svg)](https://nodejs.org)
[![Python](https://img.shields.io/badge/python-3.11%2B-blue.svg)](https://python.org)

---

## One-Line Remote Install

### macOS & Linux
```bash
curl -fsSL https://raw.githubusercontent.com/tysongoulding/ai-toolkit/main/install.sh | bash
```
> Install specific target: `curl -fsSL ... | bash -s -- antigravity` (`claude` | `cursor` | `all`)

### Windows (PowerShell)
```powershell
irm https://raw.githubusercontent.com/tysongoulding/ai-toolkit/main/install.ps1 | iex
```
> Install specific target: `& ([scriptblock]::Create((irm https://raw.githubusercontent.com/tysongoulding/ai-toolkit/main/install.ps1))) -Target antigravity`

---

## Local Setup & Targets

Clone the repository with submodules:

```bash
git clone --recurse-submodules https://github.com/tysongoulding/ai-toolkit.git
cd ai-toolkit
```

### Installation Targets

| Target | Destination | What It Configures |
| :--- | :--- | :--- |
| **`antigravity`** | `~/.gemini/GEMINI.md`<br>`~/.gemini/config/mcp_config.json` | • Deploys Antigravity system rules with path anchors<br>• Installs `llmlingua` Python module in editable mode<br>• Builds & registers `mcp-compressor` in MCP config |
| **`claude`** | `~/.claude/CLAUDE.md` | • Deploys Claude Code directives (stripped of IDE-specific paths)<br>• Installs `llmlingua` Python package<br>• Builds `mcp-compressor` node dependencies |
| **`cursor`** | `~/.cursorrules` | • Deploys Cursor IDE rules for Composer/Agent mode<br>• Installs `llmlingua` Python package<br>• Builds `mcp-compressor` node dependencies |
| **`all`** *(default)* | All destinations above | • Executes `antigravity`, `claude`, and `cursor` in sequence for full multi-harness machine bootstrap |

### Local Execution Syntax

```bash
# macOS & Linux
./install.sh antigravity
./install.sh claude
./install.sh cursor
./install.sh all        # Default

# Windows (PowerShell)
.\install.ps1 -Target antigravity
.\install.ps1 -Target claude
.\install.ps1 -Target cursor
.\install.ps1 -Target all  # Default
```

---

## Repository Structure

```
ai-toolkit/
├── install.sh                  # 1-Line unified POSIX installer
├── install.ps1                 # 1-Line unified Windows PowerShell installer
├── .github/workflows/
│   └── tokscale-cron.yml       # 3x daily automated token telemetry sync
├── installers/
│   ├── install-antigravity.sh  # POSIX Antigravity installer
│   ├── install-antigravity.ps1 # Windows PowerShell Antigravity installer
│   ├── install-claude.sh       # POSIX Claude Code installer
│   ├── install-claude.ps1      # Windows PowerShell Claude Code installer
│   ├── install-cursor.sh       # POSIX Cursor IDE installer
│   └── install-cursor.ps1      # Windows PowerShell Cursor IDE installer
├── antigravity/
│   ├── GEMINI.md               # Antigravity system rules & path anchors
│   └── README.md
├── claude/
│   ├── CLAUDE.md               # Claude Code operational directives
│   └── README.md
├── cursor/
│   ├── .cursorrules            # Cursor IDE engineering constraints
│   └── README.md
└── repos/                      # Upstream tools tracked via Git Submodules
    ├── context-mode/           # High-efficiency session & tool-call optimizer
    ├── llmlingua/              # Neural prompt & context compression (LLMLingua-2)
    ├── mcp-compressor/         # MCP middleware proxy for token reduction
    └── tokscale/               # Multi-agent token accounting & cost dashboard
```

---

## Bundled Tools & Submodules

| Tool | Purpose | Upstream Source |
| :--- | :--- | :--- |
| **`context-mode`** | MCP server optimizing long-running agent context & file indexing | [`mksglu/context-mode`](https://github.com/mksglu/context-mode) |
| **`llmlingua`** | Fast prompt & context compression via `LLMLingua-2` Roberta models | [`microsoft/llmlingua`](https://github.com/microsoft/llmlingua) |
| **`mcp-compressor`** | Proxy wrapper compressing MCP tool call outputs inline | [`atlassian-labs/mcp-compressor`](https://github.com/atlassian-labs/mcp-compressor) |
| **`tokscale`** | Token usage analytics with automated 3x-daily GitHub Actions cron | [`junhoyeo/tokscale`](https://github.com/junhoyeo/tokscale) |

---

## Maintenance & Upstream Sync

Fetch and merge latest upstream releases across all submodules simultaneously:

```bash
git submodule update --remote --merge
```

---

## License

[MIT](LICENSE)
