# Claude Code Harness Installer
$ErrorActionPreference = "Stop"
$HarnessRoot = Split-Path -Parent $PSScriptRoot
$ClaudeDir = "$env:USERPROFILE\.claude"

Write-Host "Setting up Claude Code Harness..."

if (Test-Path "$HarnessRoot\repos\llmlingua") {
    python -m pip install -e "$HarnessRoot\repos\llmlingua"
}

if (Test-Path "$HarnessRoot\repos\mcp-compressor") {
    npm --prefix "$HarnessRoot\repos\mcp-compressor" ci
    npm --prefix "$HarnessRoot\repos\mcp-compressor" run build --if-present
}

Write-Host "Claude Code harness setup complete."
