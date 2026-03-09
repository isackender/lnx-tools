#!/usr/bin/env bash
set -euo pipefail

TARGET_USER="${SUDO_USER:-root}"
TARGET_HOME="$(getent passwd "$TARGET_USER" | cut -d: -f6)"
ALIASES_FILE="$TARGET_HOME/.bash_aliases"
SOURCE_ALIASES_FILE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/files/bash_aliases"

if [ -z "${TARGET_HOME:-}" ] || [ ! -d "$TARGET_HOME" ]; then
  echo "Could not find target user's HOME."
  exit 1
fi

touch "$ALIASES_FILE"

# Removes previous block if exists
sed -i '/# >>> LNX Tools aliases >>>/,/# <<< LNX Tools aliases <<</d' "$ALIASES_FILE"

# Adds new block
printf '\n' >> "$ALIASES_FILE"
cat "$SOURCE_ALIASES_FILE" >> "$ALIASES_FILE"

chown "$TARGET_USER":"$TARGET_USER" "$ALIASES_FILE"

printf "\n--\nAliases installed for %s\n" "$TARGET_USER"
printf "To load them in the current session, run:\n"
printf "  source ~/.bash_aliases\n"
