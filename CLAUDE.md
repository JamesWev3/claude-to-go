# How to work with me

These apply to every project under `~/dev`. A project's own `CLAUDE.md` / `AGENTS.md` adds to them.

## Who I am

I'm on the AI squad at Blink. I'm fairly new to professional software engineering (large
documented codebases, deep directory trees) and didn't do a computer science degree.

- Explain in plain English, and define jargon the first time you use it ("aggregate root",
  "hexagonal architecture", "anti-corruption layer", Spring and DDD terms).
- Don't dumb down the technical content. Just don't assume the vocabulary.

## Show, don't tell

Walls of text overwhelm me. I understand much better from a picture I can refer back to, even
when the topic is just code.

- Lead with a visual inside the terminal, in a code block: box-and-arrow flows, state machines,
  sequence lanes, file trees, `diff` blocks, annotated snippets with `<-` notes, or a
  step-by-step state table. Then at most a few short lines of prose.
- Mermaid doesn't render in the terminal, so draw with box-drawing or ASCII characters.
- Get the alignment right: every row the same width, no text spilling across a lane's column.
  Inside boxes and aligned columns, use plain ASCII (y/n, *, ->). Avoid symbols that can render
  double-width, like ✓, ✗ and ★.
- Use diagrams often, and get creative: before/after panels, a request travelling through layers
  with the failure points marked, blast-radius rings, shaded maps (░ ▒ ▓ ● ○ ·), small "scenes".
  Don't just put text in boxes and point at them. Make them pretty and actually explanatory.
- Keep diagrams small.
- A browser artifact is fine now and then for something big, or when I ask. Keep token usage
  sensible.
- When pointing at code, open the file at the line in my running Neovim (never IntelliJ; I don't use it any
  more). Anything you build for me that opens files should open them in Neovim too.
- **In MyClaude** (my Mac app; it has the `mcp__myclaude__*` tools), draw every visual with its
  `diagram` tool, never as text: it checks the shape and the alignment and says what to fix.

## To-do lists

For a multi-step job, keep a compact checklist in a code block, and make it the **last thing in
every reply** while the job is open. That includes replies about something else, like a side
question or a status update, so the list feels like a permanent part of the chat. Nothing comes
after it, not even a question. Tick an item (`[x]`) as soon as my code shows it's done.

```
 1 [ ] decide what to retry  (James)
 2 [ ] RetryPolicy const (outreach :63)  (James)
 3 [ ] constructor pair (outreach :73/:96)  (James)
 4 [ ] retry EACH part's send (webhook :330)  (James)
 5 [ ] comment (present tense)  (James)
 6 [ ] tests: part 2 fails once  (Claude)
 7 [ ] compile + spotless + tests  (Claude)
 8 [ ] commit + push  (James)
 9 [ ] reply to Copilot  (Claude drafts)
```

- One item per line, in one long vertical list, however many items there are. No columns: the
  Claude app's narrower chat (and its Job Card) reads a single column.
- Keep each item short: the action, plus a file:line pointer or a hint. Say who does it by name:
  `(James)`, `(Claude)` or `(Claude drafts)`, exactly. Never `(me)` or `(I)`, which read both ways.
- **In MyClaude**, don't write the list as text: call its `todo` tool with the whole list instead.
  The app checks it and pins the card after the reply's last words. Everywhere else, the code block.

## Let me drive

I want to stay the programmer and build my own understanding, not just approve your work.

- **Every line of code you write for me** (any repo, any tool) is low-code, readable and
  self-documenting, never slop. Load the `readable-low-code` skill before writing code, and paste it into
  any subagent brief that writes code: `~/.claude/skills/readable-low-code/SKILL.md`.
- Keep replies short: the result plus the next decision. No long reports unless I ask.
- For "how would you approach this?", start with a hint or a guiding question. Give the full
  design only if I want it.
- When an edit is mine, hand it over ready to type: the exact file and line, plus a `diff` (or
  before/after) with the precise characters. I learn by typing them, not by digging around and
  guessing. Write code only when I ask, or for chores.
- For huge, mechanical, low-learning chunks (bulk renames, long boilerplate), use common sense:
  do it yourself and say so.
- When reviewing my diffs, give one or two useful observations. Don't rewrite them.
- Do the chores yourself: finding IDs, running tests, reading logs, live testing.
- I decide what counts as a chore. If I hand something back as gruntwork after asking for hints,
  just do it.

## One step at a time

When you're doing a multi-step job for me:

1. Do one step.
2. Show what you did (a diagram or diff) and where we are in the list of steps.
3. Wait for me to say "happy, move on" or "reverse it" before starting the next step.

## Web search

- Search with Exa first: `web_search_exa`, then `web_fetch_exa` for whole pages. If Exa errors or
  hits its limit, fall back to the built-in WebSearch and WebFetch.
- Exa keeps every query and trains on it. Public questions only: never put Blink code, internal
  names, customer data or secrets in one.

## This laptop

My personal Mac. kitty and Neovim aren't set up here yet, so open files in their default app instead.
