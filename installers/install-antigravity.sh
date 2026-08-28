#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
HARNESS_ROOT="$(dirname "$SCRIPT_DIR")"
GEMINI_DIR="$HOME/.gemini"
GEMINI_CONFIG_DIR="$GEMINI_DIR/config"

echo "Setting up Antigravity Harness for Linux/macOS..."

# 1. Deploy Global GEMINI.md Rules
mkdir -p "$GEMINI_DIR"
cp "$HARNESS_ROOT/antigravity/GEMINI.md" "$GEMINI_DIR/GEMINI.md"
echo "Deployed rules to $GEMINI_DIR/GEMINI.md"

# 2. Install LLMLingua in editable mode
if [ -d "$HARNESS_ROOT/repos/llmlingua" ]; then
    echo "Installing LLMLingua..."
    python3 -m pip install -e "$HARNESS_ROOT/repos/llmlingua" || pip install -e "$HARNESS_ROOT/repos/llmlingua"
fi

# 3. Build MCP Compressor
if [ -d "$HARNESS_ROOT/repos/mcp-compressor" ]; then
    echo "Building MCP Compressor..."
    npm --prefix "$HARNESS_ROOT/repos/mcp-compressor" ci
    npm --prefix "$HARNESS_ROOT/repos/mcp-compressor" run build --if-present
fi

# 4. Register MCP Server
mkdir -p "$GEMINI_CONFIG_DIR"
MCP_CONFIG_PATH="$GEMINI_CONFIG_DIR/mcp_config.json"
MCP_DIST="$HARNESS_ROOT/repos/mcp-compressor/dist/index.js"

if [ -f "$MCP_DIST" ]; then
    python3 -c "
import json, os
p = '$MCP_CONFIG_PATH'
dist = '$MCP_DIST'
data = {'mcpServers': {}}
if os.path.exists(p):
    try:
        with open(p, 'r') as f: data = json.load(f)
    except Exception: pass
data.setdefault('mcpServers', {})['mcp-compressor'] = {'command': 'node', 'args': [dist]}
with open(p, 'w') as f: json.dump(data, f, indent=2)
"
    echo "Configured mcp-compressor in $MCP_CONFIG_PATH"
fi

echo "Antigravity setup complete."
