#!/bin/sh
set -e
if [ $# -lt 1 ]; then
	echo "Usage: $(basename "$0") <input-image> [left-out] [right-out]"
	exit 2
fi
in="$1"
ext="${in##*.}"
base="${in%.*}"
left="${2:-${base}-left.${ext}}"
right="${3:-${base}-right.${ext}}"
dims=$(magick identify -format "%w %h" "$in")
# shellcheck disable=SC2086 # we want word splitting here
set -- $dims
W=$1
H=$2
half=$((W / 2))

magick "$in" -crop "${half}x${H}+0+0" +repage "$left"
magick "$in" -crop "${half}x${H}+${half}+0" +repage "$right"
