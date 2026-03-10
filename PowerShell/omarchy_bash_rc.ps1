# see https://github.com/basecamp/omarchy/blob/master/default/bash/rc

. (Join-Path $PSScriptRoot 'aliases.ps1')

$functionsDir = Join-Path $PSScriptRoot 'fns'
if (Test-Path $functionsDir) {
    Get-ChildItem -Path $functionsDir -Filter '*.ps1' -File |
        Sort-Object Name |
        ForEach-Object {
            . $_.FullName
        }
}

. (Join-Path $PSScriptRoot 'init.ps1')