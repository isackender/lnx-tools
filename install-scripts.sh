#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(dirname "$0")/scripts"
TARGET_DIR="/usr/local/bin"

# Install scripts to backup/restore nginx
install -m 0755 "$SCRIPT_DIR/backup-nginx" "$TARGET_DIR/backup-nginx"
install -m 0755 "$SCRIPT_DIR/restore-nginx" "$TARGET_DIR/restore-nginx"

printf "\n--\nScripts installed in %s, Neo.\n" "$TARGET_DIR"
