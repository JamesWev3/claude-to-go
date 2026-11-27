#!/bin/bash
# Run on the work Mac: refreshes this repo from the live setup and pushes it, so the laptop can pull it.
set -euo pipefail
cd "$(dirname "$0")"

work_memory="$HOME/.claude/projects/-Users-jamesweatherill-dev/memory"
style_memories="readable-low-code open-files-proactively creative-diagrams exact-edit-pointers
  dont-overtrim-messages plain-english-over-maths prefer-a4 scannable-pages-not-dense no-quiz-review-steps
  meaningful-human-role usable-before-deeper single-purpose-tools no-claude-bias-in-comparisons
  code-comment-density commit-messages-title-only explainer-time-budget one-thing-at-a-time-rounds
  tooling-map-pattern screenshots-only-when-told ponytail-thinking"

# The Blink-only section stays behind
{
  awk '/^## Where things live/{skip=1; next} /^## /{skip=0} !skip' "$HOME/dev/CLAUDE.md"
  cat <<'EOF'

## This laptop

My personal Mac. kitty and Neovim aren't set up here yet, so open files in their default app instead.
EOF
} > CLAUDE.md

# laptop-cleanup.md lives only here, so it's kept by hand rather than copied
{
  for name in $style_memories; do
    cp "$work_memory/$name.md" memory/
    grep -F "($name.md)" "$work_memory/MEMORY.md"
  done
  echo "- [Laptop cleanup](laptop-cleanup.md) — THE job here: slow + hot personal Mac; look first, backup first, nothing irreversible without his OK"
} > memory/MEMORY.md

rsync -a --delete "$HOME/.claude/skills/readable-low-code" "$HOME/.claude/skills/handoff" skills/

rm -f MyClaude.zip
ditto -c -k --keepParent "$HOME/Applications/MyClaude.app" MyClaude.zip

git add -A
if git diff --cached --quiet; then
  echo "Nothing changed since the last pack."
  exit 0
fi
git commit -m "Pack from the work Mac"
git push
