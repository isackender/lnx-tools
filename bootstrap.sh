#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Installing base tools..."
apt install -y nano htop

echo "Installing aliases..."
bash "$REPO_DIR/install-aliases.sh"

echo "Installing scripts..."
bash "$REPO_DIR/install-scripts.sh"

# Load aliases on current shell if bash_aliases exists
if [ -f "$HOME/.bash_aliases" ]; then
  # shellcheck disable=SC1090
  source "$HOME/.bash_aliases"
fi

printf "\n--\nBootstrap completed successfully.\n"
