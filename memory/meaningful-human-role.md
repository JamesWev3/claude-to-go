---
name: meaningful-human-role
description: "Design any AI workflow so James's part needs HIS brain and is enjoyable, never a rubber-stamp \"meat proxy\" role (2026-11-02)"
metadata:
  node_type: memory
  type: feedback
  originSessionId: d9232f55-f706-432f-8fb0-d95d61bbc74e
  modified: 2026-11-02T15:18:16.756Z
---

James asked (2026-11-02, after the fork-first trial in [[review-with-meaning-ideas]]): who writes, who reviews, how much fun is left for me, and does Blink need me specifically or "any other meat proxy"? If a workflow would let anyone do his part, he wants it redesigned so his human part is important and meaningful, not a slowdown on a bot.

**Why:** He's on the AI squad and sees himself as shaping how engineers work with AI. Clicking picks on forks felt like "just sitting there".

**How to apply:** Be honest when his part is replaceable, and then redesign it rather than defend it. Give him active, high-judgement parts:
- chasing the context nobody has written down (in #992 the PR review caught `config`, members reading via `me`, and apps being allowed to read; all 3 planners missed them);
- typing the few locked tests that define "done" himself (fits "Let me drive");
- poking the running thing live;
- shaping the method and the tools ([[myclaude]]).

Claude writes the bulk of the code. Never add quiz gates ([[no-quiz-review-steps]]).

**Live run, sc-85801 (2026-11-02): fork-first in chat alone failed him.**
- He sat idle for the whole ~3.5 min planning run.
- He then got a verdict grid (A/B/C cells) about code he hadn't seen: "less info than I normally would".

Fixes:
- Give him real work during planning, e.g. making the bug happen live.
- Show each fork pinned to the code path, with the actual user-facing reply for each option. Never bare verdicts.
- Catch-up diagrams afterwards (a layers diagram plus a "you were idle" timeline) "don't really help at all". The fix has to be in the workflow's shape, not in explaining after the fact.
