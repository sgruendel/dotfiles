# Installation

## Windows

For GlazeWM, `cd` to `$HOME\AppData\Roaming\zebar\downloads\glzr-io.starter@0.0.0`

```powershell
New-Item -ItemType HardLink -Path with-glazewm.html -Target $HOME\src\github\dotfiles\zebar\with-glazewm.html
New-Item -ItemType HardLink -Path styles.css -Target $HOME\src\github\dotfiles\glazewm\styles.css
```

For PowerShell, `cd` to `$HOME\Documents\PowerShell`

```powershell
New-Item -ItemType SymbolicLink -Path Microsoft.PowerShell_profile.ps1 -Target $HOME\src\github\dotfiles\PowerShell\Microsoft.PowerShell_profile.ps1
New-Item -ItemType SymbolicLink -Path aliases.ps1 -Target $HOME\src\github\dotfiles\PowerShell\aliases.ps1
New-Item -ItemType SymbolicLink -Path init.ps1 -Target $HOME\src\github\dotfiles\PowerShell\init.ps1
New-Item -ItemType SymbolicLink -Path fns -Target $HOME\src\github\dotfiles\PowerShell\fns
```

For Windows Terminal, `cd` to `$HOME\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState`

```powershell
New-Item -ItemType SymbolicLink -Path settings.json -Target $HOME\src\github\dotfiles\Microsoft.WindowsTerminal\settings.json
```

For VS Code, `cd` to `$HOME\AppData\Roaming\Code\User`

```powershell
New-Item -ItemType SymbolicLink -Path settings.json -Target $HOME\src\github\dotfiles\Code\settings.json
New-Item -ItemType SymbolicLink -Path keybindings.json -Target $HOME\src\github\dotfiles\Code\keybindings.json
```

For IntelliJ IDEA, `cd` to `$HOME`

```powershell
New-Item -ItemType SymbolicLink -Path .ideavimrc -Target $HOME\src\github\dotfiles\ideavim\ideavimrc
```
