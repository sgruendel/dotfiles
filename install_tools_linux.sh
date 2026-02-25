#!/bin/bash

# identify OS
. /etc/os-release

case $ID in
ubuntu | debian)
  # batcat from bat
  # fdfind from fd-find
  sudo apt-get install -y bat btop fd-find fzf ripgrep zoxide
  ;;
rocky)
  sudo dnf install -y bat btop fd-find fzf ripgrep zoxide
  ;;
esac

# eza
case $ID in
ubuntu | debian)
  # see https://github.com/eza-community/eza/blob/main/INSTALL.md#debian-and-ubuntu
  wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
  echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
  sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
  sudo apt-get update
  sudo apt-get install eza
  ;;
rocky)
  # see https://github.com/eza-community/eza/blob/main/INSTALL.md#manual-linux
  wget -c https://github.com/eza-community/eza/releases/latest/download/eza_x86_64-unknown-linux-gnu.tar.gz -O - | tar xz
  sudo chmod +x eza
  sudo chown root:root eza
  sudo mv eza /usr/local/bin/eza
  ;;
esac
mkdir -p ~/.config/eza
curl https://raw.githubusercontent.com/catppuccin/eza/refs/heads/main/themes/mocha/catppuccin-mocha-mauve.yml -o ~/.config/eza/theme.yml

# starship, see https://starship.rs/#quick-install
curl -sS https://starship.rs/install.sh | sh

# lazydocker, see https://github.com/jesseduffield/lazydocker#installation
if command -v docker &>/dev/null; then
  curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash
fi

# TODO debian >=13 / ubuntu >= 25.10: install from apt repo

# lazygit, see https://github.com/jesseduffield/lazygit?tab=readme-ov-file#debian-and-ubuntu
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit -D -t /usr/local/bin/
rm lazygit lazygit.tar.gz

# mise, see https://mise.jdx.dev/installing-mise.html
curl https://mise.run | sh

# install Node.js LTS via mise
mise use -g node@lts

# install uv, see https://docs.astral.sh/uv/getting-started/installation/
curl -LsSf https://astral.sh/uv/install.sh | sh

# neovim, see https://neovim.io/doc2/install/#install-from-download
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim-linux-x86_64
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
sudo ln -sf /opt/nvim-linux-x86_64/bin/nvim /usr/local/bin/
rm nvim-linux-x86_64.tar.gz

# dependencies, for Rocky Linux see https://docs.rockylinux.org/10/books/nvchad/install_nvim/#__tabbed_1_1
sudo npm -g install tree-sitter-cli

# LazyVim
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git

# https://github.com/koalaman/shellcheck
sudo apt-get install shellcheck
