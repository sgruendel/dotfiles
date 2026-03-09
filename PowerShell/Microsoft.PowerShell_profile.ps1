# PowerShell 7

$aliasesScript = Join-Path $PSScriptRoot 'aliases.ps1'
Write-Host "Loading aliases from $aliasesScript" -ForegroundColor DarkGray
if (Test-Path $aliasesScript) {
    . $aliasesScript
    Write-Host "Aliases loaded (cd, open, lta, ff, eff,.., ...)" -ForegroundColor DarkGray
}

$functionsDir = Join-Path $PSScriptRoot 'fns'
Write-Host "Loading function scripts from $functionsDir" -ForegroundColor DarkGray
if (Test-Path $functionsDir) {
    Get-ChildItem -Path $functionsDir -Filter '*.ps1' -File |
        Sort-Object Name |
        ForEach-Object {
            . $_.FullName
            Write-Host "Loaded function script: $($_.Name)" -ForegroundColor DarkGray
        }
}

$initScript = Join-Path $PSScriptRoot 'init.ps1'
Write-Host "Loading shell init from $initScript" -ForegroundColor DarkGray
if (Test-Path $initScript) {
    . $initScript
    Write-Host "Shell init loaded (starship, zoxide)" -ForegroundColor DarkGray
}

# -----------------------------
# Optional: Enable predictive history and IntelliSense
# -----------------------------
if ($PSVersionTable.PSVersion.Major -ge 7) {
    Import-Module PSReadLine
    Set-PSReadLineOption -PredictionSource History
    Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete
}

if (Get-Command git-wt -ErrorAction SilentlyContinue) { Invoke-Expression (& git-wt config shell init powershell | Out-String) }
