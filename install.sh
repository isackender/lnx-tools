#!/usr/bin/env bash

set -e

ALIASES_FILE="$HOME/.bash_aliases"

echo "Installing Neo aliases..."

touch "$ALIASES_FILE"

# Avoid duplicates
grep -q "Neo aliases" "$ALIASES_FILE" && {
    echo "Aliases already installed."
    exit 0
}

cat >> "$ALIASES_FILE" << 'EOF'

# ---- Neo aliases ----
alias edalias='nano ~/.bash_aliases && sourcealias'
alias sourcealias="source ~/.bash_aliases && printf '\n--\nAliases updated, Neo.\n'"
alias updateos="sudo apt update && sudo apt upgrade -y && printf '\n--\nSystem updated, Neo.\n'"
# -----------------------

EOF

echo "Aliases installed."

# Load aliases
source "$ALIASES_FILE"

printf "\n--\nAliases loaded, Neo.\n"
