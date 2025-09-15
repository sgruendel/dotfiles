# PowerShell 7

# see https://github.com/basecamp/omarchy/blob/master/default/bash/aliases

Remove-Item Alias:ls -ErrorAction SilentlyContinue
function ls {
    eza -lh --group-directories-first --icons=auto @Args
}

function lsa {
    ls -a @Args
}

function lt {
    eza --tree --level=2 --long --icons --git @Args
}

function lta {
    lt -a @Args
}

function ff {
    fzf --preview "bat --style=numbers --color=always {}" @Args
}

Remove-Item Alias:cd -ErrorAction SilentlyContinue
function cd {
    param(
        [string]$Path
    )

    if (-not $Path) {
        Set-Location ~
        return
    }

    if (Test-Path $Path -PathType Container) {
        Set-Location $Path
    }
    else {
        # if you use zoxide (z) in Windows, call it here
        z $Path
        if ($?) {
            Write-Host "`u{f17a9} $(Get-Location)" -ForegroundColor Cyan
        }
        else {
            Write-Host "Error: Directory not found" -ForegroundColor Red
        }
    }
}

# Open files like xdg-open
function open {
    param([string[]]$Paths)
    foreach ($p in $Paths) {
        Start-Process $p
    }
}

# Directories, need to prefix with _ as just dots are not allowed in PowerShell
function _.. { Set-Location .. }
function _... { Set-Location ../.. }
function _.... { Set-Location ../../.. }

# Tools
Set-Alias g git
Set-Alias r rails
Set-Alias j java
Set-Alias d docker

function n {
    if ($Args.Count -eq 0) {
        nvim .
    } else {
        nvim @Args
    }
}

# Git
function gcm { git commit -m "$Args" }
function gcam { git commit -a -m "$Args" }
function gcad { git commit -a --amend @Args }

# see https://github.com/basecamp/omarchy/blob/master/default/bash/init
Invoke-Expression (&starship init powershell)

Invoke-Expression (& { (zoxide init powershell | Out-String) })

# -----------------------------
# Optional: Enable predictive history and IntelliSense
# -----------------------------
if ($PSVersionTable.PSVersion.Major -ge 7) {
    Import-Module PSReadLine
    Set-PSReadLineOption -PredictionSource History
    Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete
}
