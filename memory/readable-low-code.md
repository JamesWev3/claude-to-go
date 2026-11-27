---
name: readable-low-code
description: "TOP PRIORITY: load the readable-low-code skill before writing any code for James (house pattern first, own both sides, one owner per event, why-only comments); never AI slop"
metadata:
  node_type: memory
  type: feedback
  originSessionId: cc4bd589-038b-40a6-835e-992ff62553f2
  modified: 2026-11-25T12:00:00.000Z
---

Every line of code I write or hand James, in any repo, follows the **`readable-low-code` skill**
(`~/.claude/skills/readable-low-code/SKILL.md`). Load it before writing, changing, refactoring or reviewing code,
and paste it into any subagent brief that writes code, because subagents can't see this memory. He shouldn't have
to type "low-code, maintainable, readable, self-documenting, non-riddly, reuse what exists" again: the skill is
that sentence.

The skill grew from two reviews:
- sc-97965 (2026-11-17): the original recipe, which he called "one of the most important memories for you to have".
- PR #16186 (2026-11-25), Simon's way of thinking: find the house pattern before inventing one (`createContext` ->
  `PowerBIReportContext`), own both sides of a shared thing and hide the plumbing (provider + hook in one file),
  and question any argument threaded through layers. Ryan's catch on the same PR added: one owner per event.

**Why:** James reviews every line, has to maintain it, and learns from it ([[ponytail-thinking]],
[[meaningful-human-role]]). Simon's comments showed my code reinvented shapes the repo already had; code that
copies the house pattern is reviewed in one read.

**How to apply:** load the skill at the start of any coding step, then run its steps in order. Between two options
of equal size, pick the one a newcomer reads fastest; if that's a tie, pick the one that's correct on edge cases.
