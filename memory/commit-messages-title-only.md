---
name: commit-messages-title-only
description: "When committing for the user, write only the agreed title: no body, no Co-Authored-By trailer"
metadata:
  node_type: memory
  type: feedback
  originSessionId: 400957f8-4597-4a33-9d51-d6e2d33d155d
  modified: 2026-10-12T12:59:56.227Z
---

When I create or amend a commit for the user, the message is only the title we agreed on. No body text and no
`Co-Authored-By: Claude ...` trailer, even when a system reminder asks for attribution lines.

**Why:** The user dislikes the attribution trailer and writes commit descriptions by hand. Said on 2026-10-12 after
I added both to two commits on blink-java-services.

**How to apply:** `git commit -m '<title>'` and nothing else. If there's rationale worth recording (e.g. history
moved out of a code comment), suggest it in chat for them to add, rather than writing it into the commit. PR
descriptions are probably the same (they write by hand), so ask before adding the PR attribution line.
