# Installation

## Windows

For eza themes, create `$HOME\\AppData\\Roaming\\eza` and copy `theme.yml` from
<https://github.com/catppuccin/eza/tree/main/themes>

For GlazeWM, `cd` to `$HOME\\AppData\\Roaming\\zebar\\downloads\\glzr-io.starter@0.0.0`

```powershell
New-Item -ItemType HardLink -Path with-glazewm.html -Target $HOME\src\github\dotfiles\zebar\with-glazewm.html
New-Item -ItemType HardLink -Path styles.css -Target $HOME\src\github\dotfiles\glazewm\styles.css
```

For Windows Terminal, `cd` to `$HOME\\AppData\\Local\\Packages\\Microsoft.WindowsTerminal_8wekyb3d8bbwe\\LocalState`

```powershell
New-Item -ItemType SymbolicLink -Path settings.json -Target $HOME\src\github\dotfiles\Microsoft.WindowsTerminal\settings.json
```

For VS Code, `cd` to `$HOME\\AppData\\Roaming\\Code\\User`

```powershell
New-Item -ItemType SymbolicLink -Path settings.json -Target $HOME\src\github\dotfiles\Code\settings.json
New-Item -ItemType SymbolicLink -Path keybindings.json -Target $HOME\src\github\dotfiles\Code\keybindings.json
```

For IntelliJ IDEA, `cd` to `$HOME`

```powershell
New-Item -ItemType SymbolicLink -Path .ideavimrc -Target $HOME\src\github\dotfiles\ideavim\ideavimrc
```
