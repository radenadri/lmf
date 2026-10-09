#!/usr/bin/env bash
set -euo pipefail

# lmf (Let Me Finish) Installer
# Usage:
#   curl -fsSL https://raw.githubusercontent.com/radenadri/lmf/main/install.sh | bash
# Options:
#   --global     Install globally for Google Antigravity (~/.gemini/config/skills/lmf)
#   --claude     Install project-local for Claude Code (.claude/skills/lmf)
#   --help       Show help message

REPO_RAW_URL="https://raw.githubusercontent.com/radenadri/lmf/main"
TARGET_DIR=".agents/skills/lmf"
MODE="antigravity-local"

for arg in "$@"; do
  case "$arg" in
    --global)
      TARGET_DIR="$HOME/.gemini/config/skills/lmf"
      MODE="antigravity-global"
      shift
      ;;
    --claude)
      TARGET_DIR=".claude/skills/lmf"
      MODE="claude-local"
      shift
      ;;
    --help|-h)
      echo "lmf (Let Me Finish) Installer"
      echo "Usage:"
      echo "  bash install.sh [OPTIONS]"
      echo ""
      echo "Options:"
      echo "  (default)  Install project-local in .agents/skills/lmf"
      echo "  --global   Install globally in ~/.gemini/config/skills/lmf"
      echo "  --claude   Install project-local in .claude/skills/lmf"
      exit 0
      ;;
  esac
done

echo "==> Installing lmf skill to: ${TARGET_DIR} (${MODE})"
mkdir -p "${TARGET_DIR}"

# Download SKILL.md and TEMPLATE.md
curl -fsSL "${REPO_RAW_URL}/SKILL.md" -o "${TARGET_DIR}/SKILL.md"
curl -fsSL "${REPO_RAW_URL}/TEMPLATE.md" -o "${TARGET_DIR}/TEMPLATE.md"

# If Claude Code mode, also install command shortcut
if [ "${MODE}" = "claude-local" ]; then
  mkdir -p .claude/commands
  cat << 'EOF' > .claude/commands/lmf.md
---
description: Let Me Finish (lmf) - Delegate autonomous code writing to modular tutorial guides in lmf/ so you write and own your code.
---

When the user runs `/lmf <task>` or asks to guide an implementation:
1. Load and strictly obey the instructions in `.claude/skills/lmf/SKILL.md`.
2. Do not modify or create any source code files outside `lmf/`.
3. Create the step-by-step implementation guide at `lmf/<module>/<001>_<feature>.md` using `.claude/skills/lmf/TEMPLATE.md`.
4. Update `lmf/README.md` and stand down.
EOF
  echo "==> Created Claude Code slash command: .claude/commands/lmf.md"
fi

echo "==> Successfully installed lmf!"
echo "    Start using by typing '/lmf <task>' or 'lmf: <task>' in your chat."
