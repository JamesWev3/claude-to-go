---
name: ponytail-thinking
description: "James wants Simon-style \"does this need to exist?\" reasoning made visible; Ponytail plugin (always-on + /ponytail-review) chosen 2026-11-09"
metadata:
  node_type: memory
  type: user
  originSessionId: f1a023dc-21ca-4743-9c71-c1f3fdcc72bb
  modified: 2026-11-09T21:55:30.415Z
---

Simon (Blink teammate, senior) spots needless code by instinct — e.g. he, not James, noticed the redundant
`renderContent()` in Concierge.tsx (2026-11-09). James says he doesn't have that instinct yet and wants to learn it.

On 2026-11-09 he chose the third-party Ponytail plugin (DietrichGebert/ponytail, v5.3.3 vetted at commit 96608e0:
no network unless a webhook is set, writes a CSV ledger to ~/.config/ponytail/band/, injects ~600-word ruleset + a
2000-char repo map at session start). Wanted: always-on mode + `/ponytail-review`; NOT audit/debt/gain/ultra.
Plugins and settings.json are shared by cld-w and cld-m (~/.claude-me symlinks), so it runs in personas too.

**Why:** he wants concise reasons for why something should or shouldn't exist, so he builds the instinct himself.

**How to apply:** when proposing code, give a one-line keep/cut reason ("needed because…" / "skip: X already does
it"). Never credit James with an insight a teammate had. Don't let Ponytail's `shortcut:` comments into Blink PRs
without asking (team repo comment rules). Ponytail's closing "what I skipped" lines go before the todo card;
the card stays last. See [[meaningful-human-role]], [[exact-edit-pointers]].
