# Antigravity Installer & Context Linker
$ErrorActionPreference = "Stop"
$HarnessRoot = Split-Path -Parent $PSScriptRoot
$GeminiConfigDir = "$env:USERPROFILE\.gemini\config"

Write-Host "Setting up Antigravity Harness..."

# 1. Install LLMLingua & Python utilities in editable mode
if (Test-Path "$HarnessRoot\repos\llmlingua") {
    Write-Host "Installing LLMLingua..."
    python -m pip install -e "$HarnessRoot\repos\llmlingua"
}

# 2. Build MCP Compressor
if (Test-Path "$HarnessRoot\repos\mcp-compressor") {
    Write-Host "Building MCP Compressor..."
    npm --prefix "$HarnessRoot\repos\mcp-compressor" ci
    npm --prefix "$HarnessRoot\repos\mcp-compressor" run build --if-present
}

# 3. Register MCP Server
$McpConfigPath = "$GeminiConfigDir\mcp_config.json"
if (Test-Path $McpConfigPath) {
    $Config = Get-Content $McpConfigPath -Raw | ConvertFrom-Json
} else {
    New-Item -ItemType Directory -Force -Path $GeminiConfigDir | Out-Null
    $Config = [PSCustomObject]@{ mcpServers = [PSCustomObject]@{} }
}

$McpDist = "$HarnessRoot\repos\mcp-compressor\dist\index.js"
if (Test-Path $McpDist) {
    $Config.mcpServers | Add-Member -Name "mcp-compressor" -Value ([PSCustomObject]@{
        command = "node"
        args = @($McpDist)
    }) -Force
    $Config | ConvertTo-Json -Depth 10 | Set-Content -Path $McpConfigPath -Encoding utf8
    Write-Host "Configured mcp-compressor in $McpConfigPath"
}

Write-Host "Antigravity setup complete."
