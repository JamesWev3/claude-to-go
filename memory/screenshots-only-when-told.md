---
name: screenshots-only-when-told
description: "Claude may screenshot James's screen (watch-mixpanel-screens.sh) ONLY after he says to switch it on, each time"
metadata:
  node_type: memory
  type: feedback
  originSessionId: b9255795-a64d-45ff-b436-d4d66b1b4287
  modified: 2026-11-24T17:12:30.229Z
---

On 2026-11-24 James OK'd screenshots of his Vivaldi window at each Concierge Mixpanel event, so Claude can react to what his screen shows during a walk-through instead of giving him a fixed script. His condition: "you are only allowed to turn on this functionality when I say."

**Why:** a fixed list of clicks can't adapt (an answer with no card, a link that isn't there), but his screen is private; he decides when it's watched.

**How to apply:** never start `~/dev/local-overrides/web/narnia/watch-mixpanel-screens.sh` (or any screencapture) until he says to switch it on in that session; an earlier OK doesn't carry over. Stop it when he says stop or the walk ends. Shots go to /private/tmp/claude-502/concierge-screens. Builds on [[local-mixpanel-extension]].
