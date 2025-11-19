# install PowerShell 7
winget install --id Microsoft.Powershell

# install tools
winget install -e sharkdp.bat
winget install -e eza-community.eza
winget install -e sharkdp.fd
winget install -e fzf
winget install -e BurntSushi.ripgrep.MSVC
winget install -e starship
winget install -e ajeetdsouza.zoxide

# install neovim / LazyVim
winget install -e Neovim.Neovim
git clone https://github.com/LazyVim/starter $env:LOCALAPPDATA\nvim
Remove-Item $env:LOCALAPPDATA\nvim\.git -Recurse -Force

# https://github.com/koalaman/shellcheck
winget install -e koalaman.shellcheck
