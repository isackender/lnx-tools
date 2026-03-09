#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SCRIPT_DIR="$REPO_DIR/scripts"
TARGET_DIR="/usr/local/bin"

# Install scripts to backup and restore nginx
install -m 0755 "$SCRIPT_DIR/backup-nginx" "$TARGET_DIR/backup-nginx"
install -m 0755 "$SCRIPT_DIR/restore-nginx" "$TARGET_DIR/restore-nginx"

printf "\n--\nScripts installed in %s\n" "$TARGET_DIR"
