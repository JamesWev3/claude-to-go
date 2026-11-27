#!/bin/bash
# Sets this Mac up the way James and Claude work: Claude Code and its config, Ponytail, Exa and MyClaude.
# Safe to run again after a git pull: the laptop's own settings and memories are never overwritten.
set -euo pipefail

here="$(cd "$(dirname "$0")" && pwd)"
claude="$HOME/.local/bin/claude"
export CLAUDE_CONFIG_DIR="$HOME/.claude-me"   # MyClaude's "me" account reads this folder
# Claude keeps memories per folder, and MyClaude starts chats in ~/dev (/Users/x/dev -> -Users-x-dev)
memory="$CLAUDE_CONFIG_DIR/projects/$(printf '%s' "$HOME/dev" | tr -c 'A-Za-z0-9' '-')/memory"
app_settings="$HOME/Library/Application Support/MyClaude"

if pgrep -xq MyClaude; then
  echo "Quit MyClaude first, then run this again."
  exit 1
fi

eval "$(/opt/homebrew/bin/brew shellenv)"

if [ ! -x "$claude" ]; then
  curl -fsSL https://claude.ai/install.sh | bash
fi

mkdir -p "$memory" "$HOME/.claude/skills" "$HOME/Applications" "$app_settings"
cp "$here/CLAUDE.md" "$CLAUDE_CONFIG_DIR/CLAUDE.md"
[ -e "$CLAUDE_CONFIG_DIR/settings.json" ] || cp "$here/settings.json" "$CLAUDE_CONFIG_DIR/settings.json"
[ -e "$memory/MEMORY.md" ] || cp "$here/memory/"*.md "$memory/"
# The handoff skill looks for itself in ~/.claude/skills, as on the work Mac
cp -R "$here/skills/." "$HOME/.claude/skills/"
[ -e "$CLAUDE_CONFIG_DIR/skills" ] || ln -s "$HOME/.claude/skills" "$CLAUDE_CONFIG_DIR/skills"

"$claude" plugin marketplace add DietrichGebert/ponytail
"$claude" plugin install ponytail@ponytail
"$claude" mcp get exa >/dev/null 2>&1 || "$claude" mcp add --scope user --transport http exa https://mcp.exa.ai/mcp/oauth

brew install --cask font-googlesanscode-nerd-font
rm -rf "$HOME/Applications/MyClaude.app"
ditto -x -k "$here/MyClaude.zip" "$HOME/Applications"
# bili is a proxy that only runs on the work Mac
[ -e "$app_settings/settings.json" ] || echo '{"bili": false}' > "$app_settings/settings.json"

for line in 'eval "$(/opt/homebrew/bin/brew shellenv)"' 'export PATH="$HOME/.local/bin:$PATH"' 'export CLAUDE_CONFIG_DIR="$HOME/.claude-me"'; do
  grep -qxF "$line" "$HOME/.zshrc" 2>/dev/null || echo "$line" >> "$HOME/.zshrc"
done

"$claude" auth status >/dev/null 2>&1 || "$claude" auth login
open "$HOME/Applications/MyClaude.app"
echo
echo "All set. In MyClaude, say: start the laptop cleanup"
