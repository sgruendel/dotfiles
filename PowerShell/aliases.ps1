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

function eff {
    $selection = ff @Args
    if (-not $selection) {
        return
    }
    nvim @($selection)
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

# Directories
function .. { Set-Location .. }
function ... { Set-Location ../.. }
function .... { Set-Location ../../.. }

# Tools
Set-Alias c opencode
Set-Alias d docker
Set-Alias j java
Set-Alias r rails
function t {
    tmux attach
    if ($LASTEXITCODE -ne 0) {
        tmux new -s Work
    }
}

function n {
    if ($Args.Count -eq 0) {
        nvim .
    } else {
        nvim @Args
    }
}

# Git
Set-Alias g git
function gcm { git commit -m "$Args" }
function gcam { git commit -a -m "$Args" }
function gcad { git commit -a --amend @Args }
