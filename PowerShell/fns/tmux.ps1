# see https://github.com/basecamp/omarchy/blob/master/default/bash/fns/tmux
# Create a Tmux Dev Layout with editor, ai, and terminal
# Usage: tdl <c|cx|codex|other_ai> [<second_ai>]
function tdl {
  param(
    [string]$Ai,
    [string]$SecondAi
  )

  if (-not $Ai) {
    Write-Host "Usage: tdl <c|cx|codex|other_ai> [<second_ai>]"
    return 1
  }

  if (-not $env:TMUX) {
    Write-Host "You must start tmux to use tdl."
    return 1
  }

  $currentDir = (Get-Location).Path
  $editorPane = $env:TMUX_PANE

  Write-Host "Renaming window $editorPane to $(Split-Path -Leaf $currentDir)" -ForegroundColor DarkGray
  tmux rename-window -t $editorPane (Split-Path -Leaf $currentDir)

  # Split window vertically - top 85%, bottom 15% (target editor pane explicitly)
  tmux split-window -v -p 15 -t $editorPane -c $currentDir

  # Split editor pane horizontally - AI on right 30% (capture new pane ID directly)
  $aiPane = tmux split-window -h -p 30 -t $editorPane -c $currentDir -P -F '#{pane_id}'

  # If second AI provided, split the AI pane vertically
  if ($SecondAi) {
    $ai2Pane = tmux split-window -v -t $aiPane -c $currentDir -P -F '#{pane_id}'
    tmux send-keys -t $ai2Pane $SecondAi C-m
  }

  # Run ai in the right pane
  tmux send-keys -t $aiPane $Ai C-m

  # Run editor in the left pane
  $editorCmd = if ($env:EDITOR) { "$($env:EDITOR) ." } else { 'nvim .' }
  tmux send-keys -t $editorPane $editorCmd C-m

  # Select the editor pane for focus
  tmux select-pane -t $editorPane
}

# Create multiple tdl windows with one per subdirectory in the current directory
# Usage: tdlm <c|cx|codex|other_ai> [<second_ai>]
function tdlm {
  param(
    [string]$Ai,
    [string]$SecondAi
  )

  if (-not $Ai) {
    Write-Host "Usage: tdlm <c|cx|codex|other_ai> [<second_ai>]"
    return 1
  }

  if (-not $env:TMUX) {
    Write-Host "You must start tmux to use tdlm."
    return 1
  }

  $baseDir = (Get-Location).Path
  $first = $true

  # Rename the session to the current directory name (replace dots/colons which tmux disallows)
  $sessionName = (Split-Path -Leaf $baseDir) -replace '[\.:]', '-'
  tmux rename-session $sessionName

  Get-ChildItem -Path $baseDir -Directory | ForEach-Object {
    $dirPath = $_.FullName

    if ($first) {
      # Reuse the current window for the first project
      if (-not $SecondAi) {
        $cmd = "Set-Location '$dirPath'; tdl '$Ai'"
      } else {
        $cmd = "Set-Location '$dirPath'; tdl '$Ai' '$SecondAi'"
      }

      tmux send-keys -t $env:TMUX_PANE $cmd C-m
      $first = $false
    } else {
      $paneId = tmux new-window -c $dirPath -P -F '#{pane_id}'

      if (-not $SecondAi) {
        $cmd = "tdl '$Ai'"
      } else {
        $cmd = "tdl '$Ai' '$SecondAi'"
      }

      tmux send-keys -t $paneId $cmd C-m
    }
  }
}

# Create a multi-pane swarm layout with the same command started in each pane (great for AI)
# Usage: tsl <pane_count> <command>
function tsl {
  param(
    [string]$PaneCount,
    [string]$Command
  )

  $cmd = "$Command".Trim()
  $paneCountInt = 0
  [void][int]::TryParse("$PaneCount", [ref]$paneCountInt)

  if ($paneCountInt -lt 1 -or -not $cmd) {
    Write-Host "Usage: tsl <pane_count> <command>"
    return 1
  }

  if (-not $env:TMUX) {
    Write-Host "You must start tmux to use tsl."
    return 1
  }

  $currentDir = (Get-Location).Path
  $panes = @()

  tmux rename-window -t $env:TMUX_PANE (Split-Path -Leaf $currentDir)

  $panes += $env:TMUX_PANE

  while ($panes.Count -lt $paneCountInt) {
    $splitTarget = $panes[$panes.Count - 1]
    $newPane = tmux split-window -h -t $splitTarget -c $currentDir -P -F '#{pane_id}'
    $panes += $newPane
    tmux select-layout -t $panes[0] tiled | Out-Null
  }

  foreach ($pane in $panes) {
    tmux send-keys -t $pane $cmd C-m
  }

  tmux select-pane -t $panes[0]
}
