# Claude Code Harness Installer
$ErrorActionPreference = "Stop"
$HarnessRoot = Split-Path -Parent $PSScriptRoot
$ClaudeDir = "$env:USERPROFILE\.claude"

Write-Host "Setting up Claude Code Harness..."

# 1. Deploy Global CLAUDE.md Rules
New-Item -ItemType Directory -Force -Path $ClaudeDir | Out-Null
Copy-Item -Path "$HarnessRoot\claude\CLAUDE.md" -Destination "$ClaudeDir\CLAUDE.md" -Force
Write-Host "Deployed rules to $ClaudeDir\CLAUDE.md"

# 2. Setup shared dependencies
if (Test-Path "$HarnessRoot\repos\llmlingua") {
    python -m pip install -e "$HarnessRoot\repos\llmlingua"
}

if (Test-Path "$HarnessRoot\repos\mcp-compressor") {
    npm --prefix "$HarnessRoot\repos\mcp-compressor" ci
    npm --prefix "$HarnessRoot\repos\mcp-compressor" run build --if-present
}

Write-Host "Claude Code harness setup complete."
