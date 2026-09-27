#!/bin/bash
#
# Sync all projects in ~/Projects/github to the laptop via rsync over SSH.
#
# - .gitignore files are respected (node_modules, build output, etc. are skipped)
# - .git directories ARE included, so repos stay functional on the laptop
# - Destination is mirrored exactly (--delete)
#
# Usage:
#   ./sync-to-laptop.sh stefan@laptop                 # copies to same path on laptop
#   ./sync-to-laptop.sh stefan@laptop:/other/path     # copies to custom path
#   DRYRUN=1 ./sync-to-laptop.sh stefan@laptop        # show what would happen

set -euo pipefail

SOURCE_DIR="$HOME/Projects/github"

if [[ $# -lt 1 ]]; then
    echo "Usage: $0 user@host[:destination_path]" >&2
    echo "Example: $0 stefan@laptop" >&2
    exit 1
fi

TARGET="$1"

# If no explicit destination path given, mirror to the same absolute path
if [[ "$TARGET" != *:* ]]; then
    TARGET="$TARGET:$SOURCE_DIR"
fi

RSYNC_OPTS=(
    --archive          # recursive, preserves permissions, timestamps, symlinks
    --compress         # compress during transfer
    --delete           # remove files on laptop that no longer exist locally
    --partial          # keep partially transferred files on interruption
    --info=progress2   # overall progress
    --human-readable
    --filter=':- .gitignore'  # read .gitignore in every dir, gitignore-style rules
)

if [[ "${DRYRUN:-0}" == "1" ]]; then
    RSYNC_OPTS+=(--dry-run --itemize-changes)
    echo "DRY RUN - no changes will be made"
fi

echo "Syncing $SOURCE_DIR/ -> $TARGET"
rsync "${RSYNC_OPTS[@]}" "$SOURCE_DIR/" "$TARGET"
echo "Done."
