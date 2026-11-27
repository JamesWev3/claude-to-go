# Claude to go

How James and Claude work together, packed so a fresh Mac gets it with one pasted line.

## On a new Mac

Paste this into Terminal. It asks for your Mac password, a GitHub code and your Claude sign-in:

```sh
{ [ -x /opt/homebrew/bin/brew ] || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; } && /opt/homebrew/bin/brew install gh && /opt/homebrew/bin/gh auth login --hostname github.com --web --git-protocol https && /opt/homebrew/bin/gh auth setup-git && /opt/homebrew/bin/gh repo clone JamesWev3/claude-to-go ~/dev/claude-to-go && ~/dev/claude-to-go/setup.sh
```

Sign in to Claude with your **personal** account. MyClaude opens at the end.

## Getting updates

```sh
cd ~/dev/claude-to-go && git pull && ./setup.sh
```

`CLAUDE.md`, the skills and MyClaude are refreshed. The laptop's own settings and memories are left alone.

## What's inside

- `CLAUDE.md`: how to work with me (the work Mac's copy, minus the Blink "Where things live" section)
- `memory/`: 20 working-style memories plus the laptop cleanup brief
- `skills/`: readable-low-code and handoff
- `settings.json`: model, theme, effort levels and Ponytail's options
- `MyClaude.zip`: the app, as built on the work Mac
- `setup.sh`: installs Claude Code, Ponytail, Exa, the code font and MyClaude, and puts the rest in `~/.claude-me`
- `pack.sh`: run on the work Mac to refresh all of the above and push it
