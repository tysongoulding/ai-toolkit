# Cursor IDE Harness Installer
$ErrorActionPreference = "Stop"
$HarnessRoot = Split-Path -Parent $PSScriptRoot
$CursorDir = "$env:USERPROFILE\.cursor"

Write-Host "Setting up Cursor IDE Harness..."

if (Test-Path "$HarnessRoot\repos\llmlingua") {
    python -m pip install -e "$HarnessRoot\repos\llmlingua"
}

if (Test-Path "$HarnessRoot\repos\mcp-compressor") {
    npm --prefix "$HarnessRoot\repos\mcp-compressor" ci
    npm --prefix "$HarnessRoot\repos\mcp-compressor" run build --if-present
}

Write-Host "Cursor IDE harness setup complete."
