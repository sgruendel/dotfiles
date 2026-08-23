#!/bin/bash
# Compare the config files with the ones provided in the Omarchy repo

BASE=~/Projects/github/omarchy-quattro/config/

for c in omarchy/*; do
  o=${BASE}omarchy/${c#*/}
  delta "$c" "$o"
done

for c in hypr/*.lua; do
  o=${BASE}hypr/${c#*/}
  delta "$c" "$o"
done

# for c in waybar/*; do
#   o=${BASE}waybar/${c#*/}
#   delta "$c" "$o"
# done
#
# for c in alacritty/*; do
#   o=${BASE}alacritty/${c#*/}
#   delta "$c" "$o"
# done

for c in herdr/*; do
  o=${BASE}herdr/${c#*/}
  delta "$c" "$o"
done

for c in lazygit/*; do
  o=${BASE}lazygit/${c#*/}
  delta "$c" "$o"
done

# for c in solaar/*; do
#   o=${BASE}solaar/${c#*/}
#   delta "$c" "$o"
# done

# for c in television/*; do
#   o=${BASE}television/${c#*/}
#   delta "$c" "$o"
# done

for c in tmux/*; do
  if [ "${c#*/}" = "gitmux.conf" ]; then
    continue   # not in Omarchy
  else
    o=${BASE}tmux/${c#*/}
  fi
  delta "$c" "$o"
done

for c in voxtype/*; do
  o=${BASE}voxtype/${c#*/}
  delta "$c" "$o"
done

# gitconfig/config is symlinked to ~/.config/git/config
o=${BASE}git/config
delta git/config $o

# X/XCompose is symlinked to ~/.XCompose
o=${BASE}../install/user/xcompose.sh
delta X/XCompose $o

