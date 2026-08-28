# AI Toolkit

> A unified, cross-harness foundation for AI coding agents across **Google Antigravity**, **Claude Code**, and **Cursor IDE** — featuring embedded context compression engines, upstream submodule tracking, and automated telemetry.

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Submodules](https://img.shields.io/badge/git-submodules-orange.svg)](#bundled-tools--submodules)
[![Node](https://img.shields.io/badge/node-%3E%3D20-green.svg)](https://nodejs.org)
[![Python](https://img.shields.io/badge/python-3.11%2B-blue.svg)](https://python.org)

---

## One-Line Install

### macOS & Linux
```bash
curl -fsSL https://raw.githubusercontent.com/tysongoulding/ai-toolkit/main/install.sh | bash
```
> Or install a specific target: `curl -fsSL ... | bash -s -- antigravity` (`claude` | `cursor` | `all`)

### Windows (PowerShell)
```powershell
irm https://raw.githubusercontent.com/tysongoulding/ai-toolkit/main/install.ps1 | iex
```
> Or install a specific target: `& ([scriptblock]::Create((irm https://raw.githubusercontent.com/tysongoulding/ai-toolkit/main/install.ps1))) -Target antigravity`

---

## Local Setup

If you prefer to clone locally:

```bash
git clone --recurse-submodules https://github.com/tysongoulding/ai-toolkit.git
cd ai-toolkit

# macOS / Linux
./install.sh all

# Windows (PowerShell)
.\install.ps1 -Target all
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
