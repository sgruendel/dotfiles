#!/bin/bash

set -e

# Iterate files in current directory. For each regular file, use `file` to
# check whether it contains EXIF image data and, if so, extract the date
# (YYYY-MM-DD) from EXIF using ImageMagick's `identify`.
for f in *; do
	[ -f "$f" ] || continue

	# Use `file` output to detect EXIF-containing images
	file_out=$(file -b -- "$f")
	case "${file_out,,}" in
		*exif*|*jpeg*|*jfif*|*tiff*) ;;
		*)
			continue
			;;
	esac

	# Try common EXIF tags in order
	date_raw=$(magick identify -format "%[EXIF:DateTimeOriginal]" -- "$f" 2>/dev/null || true)
	if [ -z "$date_raw" ]; then
		date_raw=$(magick identify -format "%[EXIF:CreateDate]" -- "$f" 2>/dev/null || true)
	fi
	if [ -z "$date_raw" ]; then
		date_raw=$(magick identify -format "%[EXIF:DateTimeDigitized]" -- "$f" 2>/dev/null || true)
	fi

	if [ -n "$date_raw" ]; then
		# date_raw typically looks like: 2025:12:21 10:00:00 or 2025:12:21T10:00:00
		date_part=${date_raw%%[ T]*}
		# Convert YYYY:MM:DD to YYYY-MM
		yyyy_mm=$(awk -F: '{printf "%s-%02d", $1, $2}' <<<"$date_part")
		#printf '%s -> %s\n' "$f" "$yyyy_mm"
		mkdir -p "$yyyy_mm"
		mv -v "$f" "${yyyy_mm}/$f"
	else
		printf '%s -> (no EXIF date)\n' "$f"
	fi
done
