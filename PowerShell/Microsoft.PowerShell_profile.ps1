# PowerShell 7

$omarchyScript = Join-Path $PSScriptRoot 'omarchy_bash_rc.ps1'

Write-Host "Loading omarchy env from $omarchyScript" -ForegroundColor DarkGray
if (Test-Path $omarchyScript) {
    . $omarchyScript
    Write-Host "Omarchy env loaded" -ForegroundColor DarkGray
}

# see https://confluence.garmin.com/display/ITINTARCH/Credential+Management+-+Setup+Vault+CLI
function vaultola {
    $env:VAULT_ADDR='https://vault-ola.garmin.com'
    vault login -format=json -method=ldap "username=$env:USERNAME"
}
function vaultkcg {
    $env:VAULT_ADDR='https://vault-kcg.garmin.com'
    vault login -format=json -method=ldap "username=$env:USERNAME"
}
function vaultcn1 {
    $env:VAULT_ADDR='https://vault-cn1.garmin.com'
    vault login -format=json -method=ldap "username=$env:USERNAME"
}
function vaultukb {
    $env:VAULT_ADDR='https://vault-ukb.garmin.com'
    vault login -format=json -method=ldap "username=$env:USERNAME"
}

$sshAgentIdentities = & ssh-add.exe -l 2>$null
$hasLoadedSshIdentity = $sshAgentIdentities | Where-Object { $_ -match '^\d+\s+(SHA256:|MD5:)' }

if (-not $hasLoadedSshIdentity) {
    Write-Host "No SSH identities loaded in ssh-agent. Attempting to load..." -ForegroundColor Yellow
    ssh-add.exe
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
