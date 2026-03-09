#!/usr/bin/env bash
set -euo pipefail

# Run with curl -fsSL https://raw.githubusercontent.com/isackender/lnx-tools/main/install.sh | bash
REPO_URL="https://github.com/isackender/lnx-tools.git"
TARGET_DIR="/opt/lnx-tools"

if ! command -v apt >/dev/null 2>&1; then
  echo "This installer is intended to work on Debian/Ubuntu systems with apt."
  exit 1
fi

if [ "$(id -u)" -ne 0 ]; then
  echo "This installer should be executed as root."
  echo "Example:"
  echo "  curl -fsSL https://raw.githubusercontent.com/isackender/lnx-tools/main/install.sh | bash"
  exit 1
fi

echo "Updating packages indexes..."
apt update

echo "Installing necessary dependencies..."
apt install -y git ca-certificates

if [ -d "$TARGET_DIR/.git" ]; then
  echo "Updating existing repository in $TARGET_DIR ..."
  git -C "$TARGET_DIR" fetch --all --prune
  git -C "$TARGET_DIR" reset --hard origin/main
else
  echo "Clonning repository in $TARGET_DIR ..."
  rm -rf "$TARGET_DIR"
  git clone "$REPO_URL" "$TARGET_DIR"
fi

echo "Executing bootstrap..."
bash "$TARGET_DIR/bootstrap.sh"

printf "\n--\nInstall completed successfully.\n"
