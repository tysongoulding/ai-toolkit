#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
HARNESS_ROOT="$(dirname "$SCRIPT_DIR")"
CLAUDE_DIR="$HOME/.claude"

echo "Setting up Claude Code Harness for Linux/macOS..."

# 1. Deploy Global CLAUDE.md Rules
mkdir -p "$CLAUDE_DIR"
cp "$HARNESS_ROOT/claude/CLAUDE.md" "$CLAUDE_DIR/CLAUDE.md"
echo "Deployed rules to $CLAUDE_DIR/CLAUDE.md"

# 2. Setup shared dependencies
if [ -d "$HARNESS_ROOT/repos/llmlingua" ]; then
    python3 -m pip install -e "$HARNESS_ROOT/repos/llmlingua" || pip install -e "$HARNESS_ROOT/repos/llmlingua"
fi

if [ -d "$HARNESS_ROOT/repos/mcp-compressor" ]; then
    npm --prefix "$HARNESS_ROOT/repos/mcp-compressor" ci
    npm --prefix "$HARNESS_ROOT/repos/mcp-compressor" run build --if-present
fi

echo "Claude Code harness setup complete."
