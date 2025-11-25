# installation

## Windows

For eza themes, create AppData\Roaming\eza and copy theme.yml from https://github.com/catppuccin/eza/tree/main/themes

For GlazeWM, cd to AppData\Roaming\zebar\downloads\glzr-io.starter@0.0.0
New-Item -ItemType HardLink -Path with-glazewm.html -Target C:\Users\gruendel\src\github\dotfiles\zebar\with-glazewm.html
New-Item -ItemType HardLink -Path styles.css -Target C:\Users\gruendel\src\github\dotfiles\glazewm\styles.css

For Windows Terminal, cd to AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState
New-Item -ItemType SymbolicLink -Path settings.json -Target C:\Users\gruendel\src\github\dotfiles\Microsoft.WindowsTerminal\settings.json

For VS Code, cd to AppData\Roaming\Code\User
New-Item -ItemType SymbolicLink -Path settings.json -Target C:\Users\gruendel\src\github\dotfiles\Code\settings.json
New-Item -ItemType SymbolicLink -Path keybindings.json -Target C:\Users\gruendel\src\github\dotfiles\Code\keybindings.json
