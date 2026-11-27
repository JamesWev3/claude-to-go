---
name: handoff
description: Save this chat's working context to a handoff slot so the user can quit and start a fresh Claude session, then load it back in the new session with the same command. Use only when the user runs /handoff or asks to hand off, save the session for a fresh start, or pick up where the last session left off.
allowed-tools: AskUserQuestion, Read, Write, Bash(~/.claude/skills/handoff/state.sh)
---

# Handoff

!`~/.claude/skills/handoff/state.sh`

**Act at once, no thinking, no text.** Your first output is an AskUserQuestion call whose input is
`MENU_JSON` above, copied exactly. Dismissed or "Other": stop silently.

Slot file: `SLOT_FOLDER/slot-<n>.md`. Temporary state, never memory.

- **load + empty:** reply `Slot <n> is empty, nothing loaded.`
- **load + filled:** AskUserQuestion confirm (header `Confirm`, "Load slot <n>?", options
  `Yes, load` / `No, cancel`). Then Read the file and check it is the save the user means:
  - Compare its `Branch:` with `GIT` and its `Diff:` with `DIFF` above. If either differs, start the
    reply with one line saying so and the slot's age from the menu (e.g. "This slot is from 1 Oct
    (23h ago) and its diff differs from your working tree, so it may be stale."). Trust the file's
    content anyway, but treat its code state as possibly out of date and re-check the files it names.
  - Then reply: goal in one line, "Where we left off" in two or three lines, the next step, then the
    checklist last (per `~/dev/CLAUDE.md`), copied exactly from the file. Carry on from the next step,
    hints first.
- **save + filled:** confirm the same way ("Overwrite slot <n>?", `Yes, overwrite` / `No, cancel`).
- **save:** Write the file in the format below, then reply only
  `Saved to slot <n>. /exit, run claude here again, then /handoff -> load.`
- **No:** reply `Cancelled.`

Save format: for a fresh Claude with only this file, `CLAUDE.md` and memory. Facts, not narrative,
under ~150 lines; point at `CLAUDE.md`/memory instead of repeating them; code state from `GIT`.

Save from the **end** of the conversation, not its start. A long chat holds earlier versions of the
plan, the checklist and the code, and the latest one wins:

- **Checklist:** find the last checklist code block you printed in this conversation and copy it
  character for character. Never rebuild it from memory or from an earlier list, and never carry
  over items the user cleared or merged.
- **Where we left off:** the last thing you suggested (a code change goes in verbatim) and the user's
  last reply about it, including whether they said they applied it. Read the files in `GIT` that
  the suggestion touches, so the save says what the code actually looks like now.
- **Decisions:** include ones made late in the chat; they often reverse earlier ones.

```markdown
# Handoff: <short title of the work>
Saved: <ISO date and time>   Folder: <repo root, or cwd outside a repo>   Branch: <git branch>
Diff: <the DIFF line above, verbatim>

## Goal
<the ticket/task in 2-4 lines, with its ID and link>

## Decisions made (and why)
- <decision>: <one-line reason>   <- what the user chose and what they rejected

## Code state
- <file:line> - <what changed>   <- say what's uncommitted
- Tests: <last result>

## Where we left off
<the last suggestion (code verbatim) and the user's last reply; whether it is applied in the files>

## Checklist
<the LAST checklist printed in the conversation, copied character for character>

## Open questions / loose ends
## Constraints and gotchas
## Environment
- <IDs, ports, URLs, test data, helper scripts>

## Next step
<exactly what to do or ask first when resuming>
```
