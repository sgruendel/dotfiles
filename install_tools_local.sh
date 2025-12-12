#!/bin/bash

cd $HOME
mkdir -p .local/bin
cd .local/bin

# install bat
curl -Lo bat.tar.gz https://github.com/sharkdp/bat/releases/download/v0.26.1/bat-v0.26.1-x86_64-unknown-linux-gnu.tar.gz
tar -xf bat.tar.gz --strip-components=1 "*/bat"
rm bat.tar.gz

# install eza
curl -Lo eza.zip https://github.com/eza-community/eza/releases/download/v0.23.4/eza_x86_64-unknown-linux-gnu.zip
unzip eza
rm eza.zip
cd
mkdir -p .config/eza
cd .config/eza
curl -Lo theme.yml https://raw.githubusercontent.com/catppuccin/eza/refs/heads/main/themes/mocha/catppuccin-mocha-mauve.yml
cd $HOME/.local/bin

# install fd
curl -Lo fd.tar.gz https://github.com/sharkdp/fd/releases/download/v10.3.0/fd-v10.3.0-x86_64-unknown-linux-gnu.tar.gz
tar -xf fd.tar.gz --strip-components=1 "*/fd"
rm fd.tar.gz

# install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
cd $HOME/.local/bin

# install ripgrep
curl -Lo ripgrep.tar.gz https://github.com/BurntSushi/ripgrep/releases/download/15.1.0/ripgrep-15.1.0-x86_64-unknown-linux-musl.tar.gz
tar -xf ripgrep.tar.gz --strip-components=1 "*/rg"
rm ripgrep.tar.gz

# install zoxide
curl https://raw.githubusercontent.com/ajeetdsouza/zoxide/refs/heads/main/install.sh | bash

# starship, see https://starship.rs/#quick-install
curl -sS https://starship.rs/install.sh | sh -s -- -b ~/.local/bin -y

# lazydocker, see https://github.com/jesseduffield/lazydocker#installation
#curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash

# lazygit, see https://github.com/jesseduffield/lazygit?tab=readme-ov-file#debian-and-ubuntu
#LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
#curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
#tar xf lazygit.tar.gz lazygit
#sudo install lazygit -D -t /usr/local/bin/
#rm lazygit lazygit.tar.gz

# neovim / LazyVim, see https://medium.com/@jogarcia/install-neovim-on-debian-based-c4392a726320
# on debian, might need "sudo apt-get install software-properties-common" first
