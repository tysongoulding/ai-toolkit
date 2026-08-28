[CmdletBinding()]
param (
    [ValidateSet("antigravity", "claude", "cursor", "all")]
    [string]$Target = "all"
)

$ErrorActionPreference = "Stop"
$ScriptDir = if ($PSScriptRoot) { $PSScriptRoot } else { $PWD.Path }

if (-not (Test-Path "$ScriptDir\antigravity")) {
    $TempDir = Join-Path ([System.IO.Path]::GetTempPath()) ("ai-toolkit-" + [System.Guid]::NewGuid().ToString("N"))
    Write-Host "Cloning ai-toolkit to temporary directory..."
    git clone --recurse-submodules --depth 1 https://github.com/tysongoulding/ai-toolkit.git $TempDir
    $ScriptDir = $TempDir
}

switch ($Target) {
    "antigravity" { & "$ScriptDir\installers\install-antigravity.ps1" }
    "claude"      { & "$ScriptDir\installers\install-claude.ps1" }
    "cursor"      { & "$ScriptDir\installers\install-cursor.ps1" }
    "all" {
        & "$ScriptDir\installers\install-antigravity.ps1"
        & "$ScriptDir\installers\install-claude.ps1"
        & "$ScriptDir\installers\install-cursor.ps1"
    }
}

Write-Host "✓ Installation complete for target: $Target" -ForegroundColor Green
