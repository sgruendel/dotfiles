#!/bin/bash
# Check that all config files are symlinked from the dotfiles repo

BASE=~/.config/

check_symlink_and_exists() {
  local path=$1

  if ! [ -L "$path" ]; then
    echo "$path is not a symlink"
  fi

  if ! [ -e "$path" ]; then
    echo "$path does not exist"
  fi
}

for c in hypr/*.conf; do
  o=${BASE}hypr/${c#*/}
  check_symlink_and_exists "$o"
done

for c in waybar/*; do
  o=${BASE}waybar/${c#*/}
  check_symlink_and_exists "$o"
done

for c in alacritty/*; do
  o=${BASE}alacritty/${c#*/}
  check_symlink_and_exists "$o"
done

for c in lazygit/*; do
  o=${BASE}lazygit/${c#*/}
  check_symlink_and_exists "$o"
done

for c in solaar/*; do
  o=${BASE}solaar/${c#*/}
  check_symlink_and_exists "$o"
done

for c in television/*; do
  o=${BASE}television/${c#*/}
  check_symlink_and_exists "$o"
done

for c in tmux/*; do
  if [ "${c#*/}" = "gitmux.conf" ]; then
    o=~/.gitmux.conf
  else
    o=${BASE}tmux/${c#*/}
  fi
  check_symlink_and_exists "$o"
done

for c in Code/*; do
  o=${BASE}Code/User/${c#*/}
  check_symlink_and_exists "$o"

  # Antigravity is VSCode based and uses the same config
  oa=${BASE}Antigravity/User/${c#*/}
  check_symlink_and_exists "$oa"
done

# ./gitconfig/config is symlinked to ~/.config/git/config
o=${BASE}git/config
check_symlink_and_exists "$o"

# ./ideavim/ideavimrc is symlinked to ~/.ideavimrc
o=~/.ideavimrc
check_symlink_and_exists "$o"
