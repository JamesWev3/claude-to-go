---
name: creative-diagrams
description: "Use more diagrams and make them creative and genuinely explanatory, not just text in boxes; artifacts OK sparingly"
metadata:
  node_type: memory
  type: feedback
  originSessionId: 666e2651-2c81-4ae2-95ed-2cb629440be9
  modified: 2026-10-30T09:53:20.726Z
---

James wants more diagrams in replies, and better ones. Don't just put text in boxes with arrows pointing at them. Make them pretty and actually explanatory. Some forms to use:
- before/after panels
- a request travelling through layers, with the failure points marked
- blast-radius rings
- sequence lanes
- annotated code with `<-` notes
- shaded maps (░ ▒ ▓ ● ○ ·)
- small "scenes" that show what really happens

Pick the shape that makes the idea click, and invent new ones.

**Why:** He told me (2026-10-19) "you're good at them, utilise your ability to make things visual more... get creative with it", and said pictures are how he understands best.

**How to apply:**
- Lead most replies with a visual. Keep the alignment rules from ~/dev/CLAUDE.md: same-width rows, and single-width symbols only.
- A browser artifact is fine now and then, for something big or interactive. Don't blow up token usage: terminal diagrams are the default.

**Swimlanes are his favourite (2026-10-27).** About the coloured `lanes` sketches, he said: "I LOVE these coloured swimlane graphs... they are so so so clear, and I just think they are doing wonders for my brain. Lean into them more when you can". He also praised the other sketches, the file `tree` especially: "keep it up". So:
- Reach for a `lanes` sketch whenever something moves between parties: requests, checks, who asks whom, what a caller can learn. Colour the moves with `is` (good / bad / new) so the outcome reads at a glance.
- Use `tree`, `steps`, `compare` and `flow` freely for everything else.
- Where ```sketch isn't drawn (a plain terminal with no Sketchbook), draw the swimlanes by hand with box-drawing.

**State and rings landed too (2026-10-30).** He called the `state` diagram "How a problem leaves the list" "INCREDIBLE, because it's so clean", and the blast-radius `rings` "so so so good". Use `state` whenever something has statuses and moves between them, and `rings` for how far a change reaches. Pick the kind from the question being answered (who talks to whom, what moves it on, how far it reaches), not by browsing the list. Where kinds overlap (flow, steps, lanes), choose the simpler one.

**Code and trace landed too (2026-11-03).** In a TypeScript job (a language he doesn't know), the `code` diagram (real lines, short notes pinned to them, a plain-English tip behind each) and a `trace` table (steps as rows, values as columns, changed values lit) let him see exactly what changed without opening a file. He wants it kept in Bridge as a diff viewer (logged in its README for 0.7). Reach for `code` whenever a change touches a language or file he hasn't read.

See [[exact-edit-pointers]], [[myclaude]], [[bridge-app]].
