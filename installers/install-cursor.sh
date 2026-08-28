#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
HARNESS_ROOT="$(dirname "$SCRIPT_DIR")"
CURSOR_DIR="$HOME/.cursor"

echo "Setting up Cursor IDE Harness for Linux/macOS..."

# 1. Deploy Global Cursor Rules
mkdir -p "$CURSOR_DIR"
cp "$HARNESS_ROOT/cursor/.cursorrules" "$HOME/.cursorrules"
echo "Deployed rules to $HOME/.cursorrules"

# 2. Setup shared dependencies
if [ -d "$HARNESS_ROOT/repos/llmlingua" ]; then
    python3 -m pip install -e "$HARNESS_ROOT/repos/llmlingua" || pip install -e "$HARNESS_ROOT/repos/llmlingua"
fi

if [ -d "$HARNESS_ROOT/repos/mcp-compressor" ]; then
    npm --prefix "$HARNESS_ROOT/repos/mcp-compressor" ci
    npm --prefix "$HARNESS_ROOT/repos/mcp-compressor" run build --if-present
fi

echo "Cursor IDE harness setup complete."
