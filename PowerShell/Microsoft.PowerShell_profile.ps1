# PowerShell 7

$omarchyScript = Join-Path $PSScriptRoot 'omarchy_bash_rc.ps1'

Write-Host "Loading omarchy env from $omarchyScript" -ForegroundColor DarkGray
if (Test-Path $omarchyScript) {
    . $omarchyScript
    Write-Host "Omarchy env loaded" -ForegroundColor DarkGray
}
