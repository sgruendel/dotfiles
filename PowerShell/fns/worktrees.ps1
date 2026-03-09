# see https://github.com/basecamp/omarchy/blob/master/default/bash/fns/worktrees
# Create a new worktree and branch from within current git directory.
function ga {
  param(
    [string]$Branch
  )

  if (-not $Branch) {
    Write-Host "Usage: ga [branch name]"
    return 1
  }

  $base = Split-Path -Leaf (Get-Location)
  $parent = Split-Path -Parent (Get-Location)
  $path = Join-Path $parent "${base}--${Branch}"

  git worktree add -b $Branch $path
  if ($LASTEXITCODE -ne 0) {
    return 1
  }

  mise trust $path
  Set-Location $path
}

# Remove worktree and branch from within active worktree directory.
function gd {
  $choices = [System.Management.Automation.Host.ChoiceDescription[]]@(
    "&Yes",
    "&No"
  )
  $decision = $Host.UI.PromptForChoice(
    "Confirm",
    "Remove worktree and branch?",
    $choices,
    1
  )
  if ($decision -ne 0) {
    return
  }

  $cwd = (Get-Location).Path
  $worktree = Split-Path -Leaf $cwd
  $parts = $worktree -split '--', 2

  # Protect against accidentally nuking a non-worktree directory.
  if ($parts.Count -lt 2) {
    return
  }

  $root = $parts[0]
  $branch = $parts[1]

  if ($root -ne $worktree) {
    $parent = Split-Path -Parent $cwd
    Set-Location (Join-Path $parent $root)

    git worktree remove $cwd --force
    if ($LASTEXITCODE -ne 0) {
      return 1
    }

    git branch -D $branch
  }
}