#!/bin/bash
# Check that all config files are symlinked from the dotfiles repo

BASE=~/.config/

for c in hypr/*.conf; do
  o=${BASE}hypr/${c#*/}
  if ! [ -L "$o" ]; then
    echo "$o is not a symlink"
  fi
done

for c in waybar/*; do
  o=${BASE}waybar/${c#*/}
  if ! [ -L "$o" ]; then
    echo "$o is not a symlink"
  fi
done

for c in alacritty/*; do
  o=${BASE}alacritty/${c#*/}
  if ! [ -L "$o" ]; then
    echo "$o is not a symlink"
  fi
done

for c in solaar/*; do
  o=${BASE}solaar/${c#*/}
  if ! [ -L "$o" ]; then
    echo "$o is not a symlink"
  fi
done

for c in Code/*; do
  o=${BASE}Code/User/${c#*/}
  if ! [ -L "$o" ]; then
    echo "$o is not a symlink"
  fi

  # Antigravity is VSCode based and uses the same config
  oa=${BASE}Antigravity/User/${c#*/}
  if ! [ -L "$oa" ]; then
    echo "$oa is not a symlink"
  fi
done

# ./gitconfig/config is symlinked to ~/.config/git/config
o=${BASE}/git/config
if ! [ -L "$o" ]; then
  echo "$o is not a symlink"
fi

# ./ideavim/ideavimrc is symlinked to ~/.ideavimrc
o=~/.ideavimrc
if ! [ -L "$o" ]; then
  echo "$o is not a symlink"
fi
