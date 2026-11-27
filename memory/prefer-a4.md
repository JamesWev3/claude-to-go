---
name: prefer-a4
description: Make PDFs and printable docs in A4 unless James says otherwise
metadata:
  node_type: memory
  type: feedback
  originSessionId: c58db057-f02b-4db1-a022-7dabe1d20771
  modified: 2026-10-25T23:43:59.058Z
---

Make any PDF or printable page in A4 unless he names another size. Portrait or landscape is my choice.

**Why:** He asked for it on 2026-10-25, after the who-does-what.pdf cheat sheet, which was A4 landscape. He's UK-based, so A4 is his paper size and US Letter would be the odd one out.

**How to apply:**
- With WeasyPrint, use `@page { size: A4 }` or `A4 landscape`.
- With reportlab, use `A4` from `reportlab.lib.pagesizes`, not `letter`.
- See [[plain-english-over-maths]] for the content side of the same cheat sheet.
