# AI Toolkit

Centralized toolkit for AI agent harnesses, workflows, configurations, and environment setups across Antigravity, Claude Code, and Cursor.

## Structure

```
ai-toolkit/
├── repos/                  # Forked upstream tools as Git Submodules
│   ├── context-mode/       # Fork of mksglu/context-mode
│   ├── mcp-compressor/     # Fork of atlassian-labs/mcp-compressor
│   ├── llmlingua/          # Fork of microsoft/llmlingua
│   └── tokscale/           # Fork of junhoyeo/tokscale
├── installers/             # Harness bootstrap and linking scripts
│   ├── install-antigravity.ps1
│   ├── install-claude.ps1
│   └── install-cursor.ps1
├── antigravity/            # Antigravity configurations, rules, workflows, and tools
├── claude/                 # Claude configurations, prompts, tools, and harness settings
├── cursor/                 # Cursor IDE rules, extensions, and workspace configurations
└── .github/workflows/
    └── tokscale-cron.yml   # 3x daily tokscale automated execution
```

## Setup & Bootstrap

Clone with submodules:
```powershell
git clone --recurse-submodules https://github.com/tysongoulding/ai-toolkit.git
```

Run target harness installer:
```powershell
# For Antigravity:
./installers/install-antigravity.ps1

# For Claude:
./installers/install-claude.ps1

# For Cursor:
./installers/install-cursor.ps1
```

## Submodule Upstream Sync

Update all forks to latest upstream:
```powershell
git submodule update --remote --merge
```
