#!/usr/bin/env bash
set -euo pipefail

ALIASES_FILE="$HOME/.bash_aliases"
SOURCE_ALIASES_FILE="$(dirname "$0")/files/bash_aliases"

touch "$ALIASES_FILE"

# Removes previous block if it exists
sed -i '/# >>> Neo bootstrap aliases >>>/,/# <<< Neo bootstrap aliases <<</d' "$ALIASES_FILE"

# Adds new block
printf '\n' >> "$ALIASES_FILE"
cat "$SOURCE_ALIASES_FILE" >> "$ALIASES_FILE"

printf "\n--\nAliases installed, Neo.\n"
