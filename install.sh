#!/usr/bin/env bash
set -euo pipefail

REPO_URL="https://github.com/isackender/lnx-tools.git"
TARGET_DIR="/tmp/lnx-tools"

if ! command -v apt >/dev/null 2>&1; then
  echo "This installer is intended to work with Debian/Ubuntu with apt."
  exit 1
fi

echo "Installing minimum dependencies..."
apt update
apt install -y git

if [ -d "$TARGET_DIR/.git" ]; then
  echo "Updating existing repository..."
  git -C "$TARGET_DIR" pull --ff-only
else
  echo "Clonning repository..."
  rm -rf "$TARGET_DIR"
  git clone "$REPO_URL" "$TARGET_DIR"
fi

echo "Executing bootstrap..."
bash "$TARGET_DIR/bootstrap.sh"
