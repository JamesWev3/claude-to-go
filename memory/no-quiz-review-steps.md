---
name: no-quiz-review-steps
description: "James rejects quiz/predict-first review steps as human-in-the-loop theatre; wants a standalone visual, interactive review app fed by complete payloads"
metadata:
  node_type: memory
  type: feedback
  originSessionId: d9232f55-f706-432f-8fb0-d95d61bbc74e
  modified: 2026-11-02T14:13:42.131Z
---

Don't put James "in the loop" through quizzes, predict-first questions or other gates that exist only to involve him. He finds them slow, and by then the code has run ahead of him anyway.

**Why:** He sees himself as a manager of AI coding in a new era, not someone catching up on old-style line review. He wants to learn the modern way to review, not a training exercise (said 2026-11-02, rejecting idea 1 of [[review-with-meaning-ideas]]).

**How to apply:** For review and oversight, design for a separate visual, heavily interactive app (not MyClaude, not the chat) that Claude sends complete data payloads to. The app builds the review: a map of the change, behaviour he can poke, evidence the app re-runs itself, and steering sent back to Claude. His judgement comes in when he chooses to look, never as a blocking quiz.

**2026-11-08, about everyday learning, not just review:** he says my teaching questions are either obvious, which makes them filler, or niche. When they're niche he asks for a tip and I end up answering them. Either way he then asks me to write the code, because I'm much faster. "Worked-in" learning feels like "a barrier between you and the end goal". The ask: **only ask real questions**, the ones the code can't answer for me (team rules, product intent), whose answers change the work. Learning should be a by-product he can see, not a step. His ~/dev CLAUDE.md "start with a hint or a guiding question" rule conflicts with this; I offered to swap it, and that's his call.
