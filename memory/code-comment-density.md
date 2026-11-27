---
name: code-comment-density
description: "Code Claude writes for James gets a few signpost comments per block (the general idea), never line-by-line explainers"
metadata:
  node_type: memory
  type: feedback
  originSessionId: 1c6fc4f8-25a9-4a39-a92e-4c745f1e8c83
  modified: 2026-11-03T15:49:25.907Z
---

When James asks for comments so he can follow code Claude wrote, add **a couple of signpost comments**: a
file header plus one line above each block saying what it's for. Don't annotate every line or explain the
language syntax (2026-11-03, Concierge `groupConversations.ts`: a line-by-line TS-to-Java comment thread was
"too far in the other direction").

**Why:** he wants the general idea of the code below at a glance, not a tutorial woven through it. Syntax
questions he can ask in chat.

**How to apply:** a short header, one comment per block, and the non-obvious "why" ones. Those also fit the
web repo's AGENTS.md rule (keep only the non-obvious why), so they rarely need trimming before a PR. TS
explanations for a Java reader belong in the chat, grafted onto his Java (see [[plain-english-over-maths]]).

**CSS gets a plain-words line per rule (2026-11-18).** CSS doesn't say what it's for, so he asked for more
comments in `ChatWelcome.module.css` so someone who rarely reads CSS can see the buttons make rows of 3 and 2. What
he liked: one line above the first rule saying the overall layout ("the five prompts sit centred in two rows, 3
above 2"), then one line above each trick rule saying what it achieves ("an invisible item as wide as the whole
box ends the first row"), never what the properties mean.
