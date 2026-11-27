#!/usr/bin/env bash
# Prints the handoff menu (ready-made AskUserQuestion input) and the git state, for SKILL.md to inject.
SLOTS=3
# Key slots by the repo root, so a session that has cd'd into a subfolder still saves and loads the
# same slots as one started at the root. Outside a repo, the folder itself is the key.
root=$(git rev-parse --show-toplevel 2>/dev/null || pwd)
dir="$HOME/.claude/handoffs/$(printf '%s' "$root" | tr / -)"
esc() { sed 's/\\/\\\\/g; s/"/\\"/g'; }

# "40m ago", "3h ago", "2d ago" from a file's modification time.
age() {
  local then now mins
  then=$(stat -f %m "$1" 2>/dev/null || stat -c %Y "$1" 2>/dev/null) || return
  now=$(date +%s)
  mins=$(((now - then) / 60))
  if [ "$mins" -lt 60 ]; then
    echo "${mins}m ago"
  elif [ "$mins" -lt 2880 ]; then
    echo "$((mins / 60))h ago"
  else
    echo "$((mins / 1440))d ago"
  fi
}

echo "SLOT_FOLDER=$dir"
opts=""
for n in $(seq 1 "$SLOTS"); do
  f="$dir/slot-$n.md"
  if [ -f "$f" ]; then
    title=$(sed -n '1s/^# Handoff: //p' "$f" | cut -c1-40 | esc)
    saved=$(sed -n 's/^Saved: \([^ ]*\).*/\1/p' "$f" | head -1 | tr T ' ' | cut -c1-16)
    opt="{\"label\":\"Slot $n: $title\",\"description\":\"Saved $saved ($(age "$f"))\"}"
  else
    opt="{\"label\":\"Slot $n: empty\",\"description\":\"Nothing saved here\"}"
  fi
  opts="${opts:+$opts,}$opt"
done
echo "MENU_JSON:"
echo "{\"questions\":[{\"header\":\"Handoff\",\"question\":\"Save or load?\",\"multiSelect\":false,\"options\":[{\"label\":\"save\",\"description\":\"Save this session into a slot\"},{\"label\":\"load\",\"description\":\"Load a slot into this session\"}]},{\"header\":\"Slot\",\"question\":\"Which slot?\",\"multiSelect\":false,\"options\":[$opts]}]}"

if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  echo "GIT:"
  git -C "$root" status -sb
  echo "DIFF: $(git -C "$root" diff --stat | tail -1 | sed 's/^ *//')"
fi
true
