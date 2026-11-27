---
name: exact-edit-pointers
description: "When James is to make a change, give exact file:line and the exact characters to type (diff), never a rough outline"
metadata:
  node_type: memory
  type: feedback
  originSessionId: 666e2651-2c81-4ae2-95ed-2cb629440be9
  modified: 2026-10-19T12:55:40.090Z
---

When a step is James's to do, hand it over ready to type. For each change, give:
- the exact file and line
- a `diff` block, or a before/after pair, showing the precise characters to remove and add
- one short line on why

Then he types it, and Claude checks his diff afterwards. Never hand over a vague outline that leaves him to search, guess, and come back to have it checked.

**Why:** James learns by typing the characters himself. Digging around for where the change goes, then guessing at it, wastes his time and teaches him little.

**How to apply:** use judgment on who does each change.
- James: changes with learning value, and small or medium edits. Give him precise diffs.
- Claude, saying so: huge, repetitive or mechanical text (bulk renames, long boilerplate, generated config), where typing it out would take long and teach little.

Open the file at the line too ([[open-files-proactively]]). Pair this with creative visuals ([[creative-diagrams]]).

**Every reply, every pending edit (2026-11-10):** while his edits are open, show EVERY outstanding diff in full in each reply, with file:line. Never "same as last message" or "from my last message"; he got angry ("WHY AREN'T YOU SHOWING ME DIFFS ANYMORE") when a reply showed one diff and only described the other two.

**In MyClaude, put the diffs AFTER the last tool call (2026-11-10):** replies whose diffs sat between tool calls (diagram -> diffs -> todo) apparently never reached him; he only saw the text after the final call and asked "have you broken?". Call todo/diagram first, then write all diffs in the final text block.
