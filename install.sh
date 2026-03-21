#!/usr/bin/env bash
set -euo pipefail

REPO_URL="${1:-https://github.com/Linfee/astro-nvim-config.git}"
TARGET_DIR="${NVIM_ASTRO_HOME:-$HOME/.nvim.astro}"
LOADER_DIR="${NVIM_CONFIG_HOME:-$HOME/.config/nvim}"
TIMESTAMP="$(date +%Y%m%d-%H%M%S)"

backup_if_exists() {
  local path="$1"
  if [ -e "$path" ] || [ -L "$path" ]; then
    local backup="${path}.bak.${TIMESTAMP}"
    echo "[backup] $path -> $backup"
    mv "$path" "$backup"
  fi
}

if ! command -v git >/dev/null 2>&1; then
  echo "git is required but not found"
  exit 1
fi

backup_if_exists "$TARGET_DIR"

echo "[clone] $REPO_URL -> $TARGET_DIR"
git clone --depth=1 "$REPO_URL" "$TARGET_DIR"

mkdir -p "$LOADER_DIR"
cat > "$LOADER_DIR/init.lua" <<'EOF'
if vim.g.vscode then
  local home = "~/.nvim.vscode"
  vim.opt.rtp:prepend(home)
  -- require "setup"
else
  local home = "~/.nvim.astro"
  vim.opt.rtp:prepend(home)
  require("setup")
end
EOF

echo "[done] installed to $TARGET_DIR"
echo "Run: nvim"
