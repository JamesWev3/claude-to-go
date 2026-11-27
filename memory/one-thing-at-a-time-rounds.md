---
name: one-thing-at-a-time-rounds
description: "James got overwhelmed by the big MyClaude round (Maestro, layout C, pad, side quests) and asked to strip back to 0.27.2 on 2026-11-01; keep rounds small"
metadata:
  node_type: memory
  type: feedback
  originSessionId: 54609832-b11f-4e7e-a494-b8105554647e
  modified: 2026-11-01T21:49:34.732Z
---

On 2026-11-01, after 0.28.0–0.28.3 (Maestro lead, the new "layout C" left panel, the notes pad, side quests) plus plan-name and Ultra weekly-limit work, James said the app was "in shambles": the left panel didn't fit the side-quest text. He said "I think I asked you to do too much before… it's stressing me out" and chose to go back to 0.27.2, keeping only the hover fix and the Neovim links (shipped as 0.29.0). Everything else is saved on git branch `round-0.28` (9b597f0) in ~/dev/myclaude.

**Why:** many features landing at once, each only partly polished, made the app feel broken and out of his control, even though each piece had a finish review.

**How to apply:**
- One feature per release, polished and fitting the existing layout before the next starts.
- Push back when he queues a big multi-feature round; suggest the one to do first.
- Bring things back from `round-0.28` only one at a time, and only when he asks.
- Check that new text fits its panel (pictures at real sizes) before the finish review.

See [[myclaude-builder-roadmap]], [[maestro-token-budget]].
