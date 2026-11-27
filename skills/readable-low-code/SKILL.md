---
name: readable-low-code
description: James's code style, for every line of code written or handed to him in any repo. Low-code, hyper maintainable, readable, self-documenting, non-riddly; reuse what the codebase already has instead of reinventing it. Load it before writing, changing, refactoring or reviewing code, before handing James a diff to type, and whenever he asks for "low-code", "readable", "maintainable", "self-documenting", "not riddly" or "house style" code. Paste it into any subagent brief that writes code.
---

# Readable low-code

Code James can read in one pass, maintain without me, and learn from. AI slop nobody can review is the thing
this exists to stop. Run the steps in order on every change, big or small.

## Before writing

1. **Does it need to exist?** Make the smallest change that fully does the job. Name what you skip in one line.
2. **Find the house pattern first.** Before inventing a shape, grep for a sibling that already solves it and
   copy how it's done: `createContext` finds `PowerBIReportContext.tsx`; a button finds Bamboo `Button`; a test
   finds the existing harness (`renderChat`, MSW handlers). Read the repo's AGENTS.md and guideline pages.
3. **Copy a pattern's intent, not its accidents.** If the sibling has a line that can't do anything in your
   case (a `throw` behind a context default that is never null), leave it out and say why in one line.
4. **List every place the change must reach** (callers, tests, fixtures, stories, translations) and finish all
   of them. Lazy about the solution, never about the change.

## Shape

5. **Own both sides, hide the plumbing.** Something many components share (a context, a store slice, a
   tracking helper) lives in one file that exports a provider and a hook (`ConciergeSessionProvider` +
   `useConciergeSession`, like Formik's `useFormikContext`). Consumers never touch the raw `Context` or `useRef`.
6. **One owner per event or piece of state.** Exactly one place sends an event or changes a state; anything
   else that triggers it passes its details in (data, not a second copy of the logic). Two senders of the same
   event drift apart, and one of them misses a field.
7. **Make impossible states unrepresentable instead of guarding them.** Prefer one field that can't disagree
   with itself (`openedFrom: X | null`, where null means closed) over two that must stay in step (`isOpen` plus
   `openedFrom`). A guard for a state the types allow but the flow rules out is a smell.
8. **Question every argument threaded through layers.** Passing a value down two or three calls is only worth
   it when you can name what it guarantees ("every send goes through here, so no path can skip tracking").
   Otherwise do the work at the call site, where the value is known.

## While writing

9. **Names do the documenting.** A function is named for its one job (`send`, `submit`), a boolean for what it
   decides (`showWelcome`), a constant for what it is. If something needs a comment to say *what* it does,
   rename it instead.
10. **Split by job, never by line count.** Each function reads top to bottom with no jumping around.
11. **Question every method and assertion you reach for.** Does it say exactly what you mean, and is it what
    this repo prefers? `toBeVisible()` says "the user can see it"; `toBeInTheDocument()` doesn't (absence checks
    stay `queryBy… .not.toBeInTheDocument()`). A group of buttons gets `role={'group'}` plus an `aria-label`.
12. **Plain control flow:** early `return`, one condition per `if`, no clever one-liners, no nested ternaries,
    no wrapper, option, abstraction or config "for later".
13. **Comments say only the why**, in one plain lowercase present-tense line. Never narrate the code, never
    write anything that stops making sense after merge ("new", "now", "used to", "step 2"). A few signposts per
    block at most. Write them as a teammate would, not in a Claude voice: "because", not "as"; no "e.g." or
    "as when" examples tacked on; no riddles that need a second read ("to the next of either").
    When a reviewer asks "is this intentional?", the code was unclear: answer them, and add the one-line why.
14. **Deleting beats adding.** Remove dead conditions, unused props and exports, and code your change
    replaced. Remove a guard only when you can say in one sentence why its state can't happen.
15. **Keep the diff against master small.** Put master's code back word for word when the design allows it. No
    reformatting, renames or refactors outside the task.

## Proving it

16. **One test per behaviour, named as a sentence a person would say.** Drive it the way a user would
    (`getByRole('button', { name })`) through the real harness and MSW, not mocked hooks.
17. **Mutation check every new guard or branch:** break it, watch its test fail, put it back.
18. **Run the repo's checks and show the output.** Blink web: `oxlint --type-aware` on changed files,
    stylelint, Prettier, `pnpm typecheck`, the affected Jest suites.
19. **Review your own diff as the person paged when it breaks:** bugs, risks, missing tests, then anything
    that isn't lean. Fix what you find before handing it over.

## Slop to never ship

- a try/catch that swallows errors
- a guard for an impossible state, with no reason given
- a helper file or function used once
- an option nobody sets
- a comment that repeats the code
- a generic name (`data`, `handle`, `utils`, `doThing`)
- a copy-pasted near-duplicate, or a second sender of the same event
- raw plumbing (`Context`, refs, store shape) leaking into consumers
- a big diff that buries the real change
- code written "for later"

## Where these came from

- Steps 1, 9–19: the sc-97965 concierge welcome (2026-11-17), and Simon's `toBeVisible` catch.
- Steps 2, 3, 5, 8: Simon's review of PR #16186 (sc-98413, 2026-11-25). He asked for the session context to be
  its own provider file "so you can own both sides and hide it from consumers", pointing at
  `PowerBIReportContext` as the house example, and asked whether `promptSource` really needed threading down
  to `sendMessage`.
- Steps 6, 7: Ryan's review of the same PR. Hub search sent its own `CONCIERGE_OPENED` and missed the session
  id; the fix is concierge sending every opened event, with openers passing where they opened it from.
- Step 13's voice rule: Simon's "claudism spotted" on the same PR (2026-11-26), about
  `// busy is the server's 429 or 503, e.g. when too many turns run at once`.
