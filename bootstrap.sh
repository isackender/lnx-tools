#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

need_cmd() {
  command -v "$1" >/dev/null 2>&1
}

if ! need_cmd apt; then
  echo "This bootstrap is intended to work with Debian/Ubuntu with apt."
  exit 1
fi

echo "Updating packages indexes..."
apt update

echo "Installing base tools (curl git nano htop)..."
apt install -y curl git nano htop

echo "Installing aliases..."
bash "$REPO_DIR/install-aliases.sh"

echo "Installing scripts..."
bash "$REPO_DIR/install-scripts.sh"

# Load aliases on current shell if bash_aliases exists
if [ -f "$HOME/.bash_aliases" ]; then
  # shellcheck disable=SC1090
  source "$HOME/.bash_aliases"
fi

printf "\n--\nBootstrap completed successfully, Neo.\n"
