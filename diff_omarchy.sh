#!/bin/bash

BASE=~/src/github/omarchy/config/

for c in hypr/*.conf; do
  o=${BASE}hypr/${c#*/}
  diff -u "$c" "$o"
done
#diff -u hypr/bindings.conf ~/src/github/omarchy/config/hypr/bindings.conf

for c in waybar/*; do
  o=${BASE}waybar/${c#*/}
  diff -u "$c" "$o"
done

for c in alacritty/*; do
  o=${BASE}alacritty/${c#*/}
  diff -u "$c" "$o"
done
