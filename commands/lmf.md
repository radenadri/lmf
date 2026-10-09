---
description: Let Me Finish (lmf) - Delegate code writing to guided tutorials in lmf/ so you write and own your code.
---

# /lmf Slash Command

Run this command with:
`/lmf <task or feature description>`

## Execution Rules:
1. Load the `lmf` skill instructions in `SKILL.md`.
2. **Zero-Touch Codebase**: Do not edit, create, or delete any source code files outside `lmf/`.
3. Investigate the codebase with read-only tools and determine the relevant module.
4. Create the sequential guide `lmf/<module>/<001>_<feature_name>.md` following `TEMPLATE.md`.
5. Update `lmf/README.md` with the new guide's status (`Pending`).
6. Report the path of the new guide to the user and stand down.
