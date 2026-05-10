#!/bin/bash
# Compare the config files with the ones provided in the Omarchy repo

BASE=~/Projects/github/omarchy/config/

for c in hypr/*.conf; do
  o=${BASE}hypr/${c#*/}
  diff -u "$c" "$o"
done

for c in waybar/*; do
  o=${BASE}waybar/${c#*/}
  diff -u "$c" "$o"
done

for c in alacritty/*; do
  o=${BASE}alacritty/${c#*/}
  diff -u "$c" "$o"
done

for c in lazygit/*; do
  o=${BASE}lazygit/${c#*/}
  diff -u "$c" "$o"
done

for c in solaar/*; do
  o=${BASE}solaar/${c#*/}
  diff -u "$c" "$o"
done

for c in television/*; do
  o=${BASE}television/${c#*/}
  diff -u "$c" "$o"
done

for c in tmux/*; do
  if [ "${c#*/}" = "gitmux.conf" ]; then
    o=~/.gitmux.conf
  else
    o=${BASE}tmux/${c#*/}
  fi
  diff -u "$c" "$o"
done

for c in Code/*; do
  o=${BASE}Code/User/${c#*/}
  diff -u "$c" "$o"

  # Antigravity is VSCode based and uses the same config
  oa=${BASE}Antigravity/User/${c#*/}
  diff -u "$c" "$oa"
done

# ./gitconfig/config is symlinked to ~/.config/git/config
o=${BASE}git/config
diff -u "gitconfig/config" "$o"

# ./ideavim/ideavimrc is symlinked to ~/.ideavimrc
o=~/.ideavimrc
diff -u "ideavim/ideavimrc" "$o"
