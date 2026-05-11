# Installation

## Linux

For tmux, `cd` to `$HOME`

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
ln -sf ~/src/github/dotfiles/tmux/tmux.conf .config/tmux/tmux.conf
ln -sf ~/src/github/dotfiles/tmux/gitmux.conf .gitmux.conf
git clone -b v2.3.0 https://github.com/catppuccin/tmux.git ~/.config/tmux/plugins/catppuccin/tmux
```

## Windows

For GlazeWM, `cd` to `$HOME\AppData\Roaming\zebar\downloads\glzr-io.starter@0.0.0`

```powershell
New-Item -ItemType HardLink -Path with-glazewm.html -Target $HOME\Projects\dotfiles\zebar\with-glazewm.html
New-Item -ItemType HardLink -Path styles.css -Target $HOME\Projects\dotfiles\glazewm\styles.css
```

For PowerShell, `cd` to `$HOME\Documents\PowerShell`

```powershell
New-Item -ItemType SymbolicLink -Path Microsoft.PowerShell_profile.ps1 -Target $HOME\Projects\dotfiles\PowerShell\Microsoft.PowerShell_profile.ps1
New-Item -ItemType SymbolicLink -Path omarchy_bash_rc.ps1 -Target $HOME\Projects\dotfiles\PowerShell\omarchy_bash_rc.ps1
New-Item -ItemType SymbolicLink -Path aliases.ps1 -Target $HOME\Projects\dotfiles\PowerShell\aliases.ps1
New-Item -ItemType SymbolicLink -Path init.ps1 -Target $HOME\Projects\dotfiles\PowerShell\init.ps1
New-Item -ItemType SymbolicLink -Path fns -Target $HOME\Projects\dotfiles\PowerShell\fns
```

For Windows Terminal, `cd` to `$HOME\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState`

```powershell
New-Item -ItemType SymbolicLink -Path settings.json -Target $HOME\Projects\dotfiles\Microsoft.WindowsTerminal\settings.json
```

For psmux, `cd` to `$HOME`

```powershell
New-Item -ItemType SymbolicLink -Path .psmux.conf -Target $HOME\Projects\dotfiles\tmux\psmux.conf
git clone https://github.com/psmux/psmux-plugins.git "$env:TEMP\psmux-plugins" ; Copy-Item "$env:TEMP\psmux-plugins\ppm" "$env:USERPROFILE\.psmux\plugins\ppm" -Recurse ; Remove-Item "$env:TEMP\psmux-plugins" -Recurse -Force
```

For VS Code, `cd` to `$HOME\AppData\Roaming\Code\User`

```powershell
New-Item -ItemType SymbolicLink -Path settings.json -Target $HOME\Projects\dotfiles\Code\settings.json
New-Item -ItemType SymbolicLink -Path keybindings.json -Target $HOME\Projects\dotfiles\Code\keybindings.json
```

For IntelliJ IDEA, `cd` to `$HOME`

```powershell
New-Item -ItemType SymbolicLink -Path .ideavimrc -Target $HOME\Projects\dotfiles\ideavim\ideavimrc
```
