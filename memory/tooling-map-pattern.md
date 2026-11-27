---
name: tooling-map-pattern
description: personal tooling Claude builds and maintains gets a README map, one entry point, one file per part, and a memory pointing at the map
metadata:
  type: feedback
---

For multi-part personal tooling that Claude builds and keeps up over time (sync systems, persona plumbing, shell
glue in dotfiles), lay it out the way zsh/cld/ is (see [[two-claude-accounts]]):

- a README.md map: the files, what each does, what's deliberately left out and why, state it keeps, gotchas
- one entry point to run it all, with each part in its own file, picked up by name (no registry to update)
- a memory that says "read the map first and keep it current"

**Why:** James asked for this on 2026-10-24 so Claude stays un-confused across sessions and keeps an accurate bank
of knowledge. Of the pieces, the map plus the memory pointer is what pays off most, because a new session only knows
what it reads. The file split mainly helps James review small diffs. A stale map is worse than none.

**How to apply:** when a piece of personal tooling grows past one small file, or picks up a non-obvious trap, give it
this shape and update its README in the same change as the code. Don't impose it on Blink repos, which follow their own
conventions, or on one-file tools, where a header comment is enough.
