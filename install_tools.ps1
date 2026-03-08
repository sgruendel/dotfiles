# install PowerShell 7
winget install -e Microsoft.Powershell

# install tools
winget install -e sharkdp.bat
winget install -e eza-community.eza
winget install -e sharkdp.fd
winget install -e junegunn.fzf
winget install -e BurntSushi.ripgrep.MSVC
winget install -e starship
winget install -e ajeetdsouza.zoxide
winget install -e psmux
winget install -e JesseDuffield.Lazydocker
winget install -e JesseDuffield.lazygit

# https://yazi-rs.github.io/docs/installation/#install-with-winget
winget install -e sxyazi.yazi jqlang.jq

# https://docs.astral.sh/uv/getting-started/installation/
winget install -e astral-sh.uv

# install neovim / LazyVim
$neovimZipUrl = "https://github.com/neovim/neovim/releases/download/v0.11.6/nvim-win64.zip"
$neovimZipPath = Join-Path $env:TEMP "nvim-win64.zip"
$neovimInstallDir = Join-Path $env:LOCALAPPDATA "nvim-win64"

Invoke-WebRequest -Uri $neovimZipUrl -OutFile $neovimZipPath
if (Test-Path $neovimInstallDir) {
	Remove-Item $neovimInstallDir -Recurse -Force
}
Expand-Archive -Path $neovimZipPath -DestinationPath $env:LOCALAPPDATA -Force
Remove-Item $neovimZipPath -Force

$neovimBinDir = Join-Path $neovimInstallDir "bin"
$normalizedNeovimBinDir = $neovimBinDir.TrimEnd('\\')
$userPath = [Environment]::GetEnvironmentVariable("Path", "User")
$userPathEntries = @()
if ($userPath) {
	$userPathEntries = $userPath -split ';' | Where-Object { $_ }
}

if (-not ($userPathEntries | Where-Object { $_.TrimEnd('\\') -ieq $normalizedNeovimBinDir })) {
	$newUserPath = (($userPathEntries + $neovimBinDir) -join ';')
	[Environment]::SetEnvironmentVariable("Path", $newUserPath, "User")
}

if (-not (($env:Path -split ';') | Where-Object { $_.TrimEnd('\\') -ieq $normalizedNeovimBinDir })) {
	$env:Path = "$env:Path;$neovimBinDir"
}

git clone https://github.com/LazyVim/starter $env:LOCALAPPDATA\nvim
Remove-Item $env:LOCALAPPDATA\nvim\.git -Recurse -Force

# https://github.com/koalaman/shellcheck
winget install -e koalaman.shellcheck

# install eza Catppuccin theme
$ezaConfigDir = Join-Path $env:LOCALAPPDATA "eza"
if (-not (Test-Path $ezaConfigDir)) {
    New-Item -ItemType Directory -Path $ezaConfigDir | Out-Null
}
$ezaThemeUrl = "https://raw.githubusercontent.com/catppuccin/eza/main/themes/mocha/catppuccin-mocha-mauve.yml"
$ezaThemePath = Join-Path $ezaConfigDir "theme.yml"
Invoke-WebRequest -Uri $ezaThemeUrl -OutFile $ezaThemePath
