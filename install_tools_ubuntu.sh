#!/bin/bash

# batcat from bat
# fdfind from fd-find
# rg from ripgrep
sudo apt-get install bat fd-find fzf ripgrep zoxide

# eza, see https://github.com/eza-community/eza/blob/main/INSTALL.md#debian-and-ubuntu
wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
sudo apt-get update
sudo apt-get install eza

# starship, see https://starship.rs/#quick-install
curl -sS https://starship.rs/install.sh | sh

# lazygit, see https://github.com/jesseduffield/lazygit?tab=readme-ov-file#debian-and-ubuntu
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit -D -t /usr/local/bin/
rm lazygit lazygit.tar.gz
