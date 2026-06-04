#!/usr/bin/env bash
set -euo pipefail

REPO_URL="${1:-}"
TARGET_DIR="${HOME}/.agents/skills/figma-ui-restore"

if [ -z "$REPO_URL" ]; then
  echo "用法: ./scripts/install-codex.sh <YOUR_REPO_URL>"
  exit 1
fi

mkdir -p "${HOME}/.agents/skills"

if [ -d "$TARGET_DIR/.git" ]; then
  git -C "$TARGET_DIR" pull --ff-only
else
  rm -rf "$TARGET_DIR"
  git clone "$REPO_URL" "$TARGET_DIR"
fi

echo "已安装到: $TARGET_DIR"
echo "触发方式: 请使用 figma-ui-restore。"
