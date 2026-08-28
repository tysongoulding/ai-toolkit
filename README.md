# AI Toolkit

> A unified, cross-harness foundation for AI coding agents across **Google Antigravity**, **Claude Code**, and **Cursor IDE** — featuring embedded context compression engines, upstream submodule tracking, and automated telemetry.

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Submodules](https://img.shields.io/badge/git-submodules-orange.svg)](#bundled-tools--submodules)
[![Node](https://img.shields.io/badge/node-%3E%3D20-green.svg)](https://nodejs.org)
[![Python](https://img.shields.io/badge/python-3.11%2B-blue.svg)](https://python.org)

---

## Overview

`ai-toolkit` decouples your personal workflow configurations, system prompt rules, and performance middleware from specific machine environments and editor harnesses. 

When switching between development environments or AI agents, `ai-toolkit` bootstraps your system in a single command.

---

## Repository Structure

```
ai-toolkit/
├── .github/workflows/
│   └── tokscale-cron.yml       # 3x daily automated token telemetry sync
├── installers/
│   ├── install-antigravity.ps1 # Deploys rules & registers MCP servers
│   ├── install-claude.ps1      # Deploys CLAUDE.md & shared tool packages
│   └── install-cursor.ps1      # Deploys .cursorrules & editor configurations
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

Each component under `repos/` is linked to a maintained personal fork, allowing independent updates while staying synchronized with upstream developments:

| Tool | Purpose | Upstream Source |
| :--- | :--- | :--- |
| **`context-mode`** | MCP server optimizing long-running agent context & file indexing | [`mksglu/context-mode`](https://github.com/mksglu/context-mode) |
| **`llmlingua`** | Fast prompt & context compression via `LLMLingua-2` Roberta models | [`microsoft/llmlingua`](https://github.com/microsoft/llmlingua) |
| **`mcp-compressor`** | Proxy wrapper compressing MCP tool call outputs inline | [`atlassian-labs/mcp-compressor`](https://github.com/atlassian-labs/mcp-compressor) |
| **`tokscale`** | Token usage analytics with automated 3x-daily GitHub Actions cron | [`junhoyeo/tokscale`](https://github.com/junhoyeo/tokscale) |

---

## Quick Start

### 1. Clone with Submodules

```bash
git clone --recurse-submodules https://github.com/tysongoulding/ai-toolkit.git
cd ai-toolkit
```

### 2. Bootstrap Your Target Harness

Execute the bootstrap script corresponding to your active environment:

```powershell
# Antigravity (Rules to ~/.gemini/GEMINI.md + MCP Server Registration)
./installers/install-antigravity.ps1

# Claude Code (Rules to ~/.claude/CLAUDE.md + Module Dependencies)
./installers/install-claude.ps1

# Cursor IDE (Rules to ~/.cursorrules + Environment Linkage)
./installers/install-cursor.ps1
```

---

## Maintenance & Upstream Sync

Fetch and merge the latest upstream releases across all submodules simultaneously:

```bash
git submodule update --remote --merge
```

To sync a specific submodule:

```bash
cd repos/<tool-name>
git fetch upstream
git merge upstream/main
cd ../..
git commit -am "chore(deps): update <tool-name> submodule"
```

---

## License

[MIT](LICENSE)
