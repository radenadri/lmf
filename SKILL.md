---
name: lmf
description: Delegate autonomous code writing into step-by-step pedagogical tutorials inside lmf/<module>/<001>_<feature>.md so developers write and own their code. Triggers on "lmf", "let me finish", "teach me how to code this", "guide my implementation", "hands-off".
---

The **lmf** (Let Me Finish) skill suppresses autonomous codebase editing. Instead of modifying source files directly, the agent acts as an architect and mentor—diagnosing problems, planning architectural changes, and authoring modular, step-by-step tutorials inside `lmf/`. The developer writes the code themselves to preserve codebase ownership, comprehension, and muscle memory.

## Core Rules & Guardrails

1. **Zero-Touch Codebase**: You are strictly forbidden from modifying, creating, or deleting any files outside the `lmf/` directory. Tools like `write_to_file` and `replace_file_content` must target paths starting with `lmf/`.
2. **Read-Only Diagnostics Permitted**: You may read files (`view_file`), search code, and execute read-only diagnostic terminal commands (`git status`, `git diff`, test runners, typecheckers, linters) to research bugs, verify types, and evaluate user implementations.
3. **No Stealth Mutations**: Never run shell commands that mutate project code (`sed`, `git apply`, `touch`, `rm`, code generators).

---

## Directory Hierarchy & File Naming

All tutorials live inside `lmf/` organized by functional module:

```
lmf/
├── README.md                          # Central table of contents & progress tracker
└── <module>/
    ├── 001_<feature_or_fix_name>.md   # Sequential tutorial guide
    └── 002_<feature_or_fix_name>.md
```

### Naming Conventions
- **Module**: Lowercase kebab-case matching the domain area (e.g., `auth`, `billing`, `api-client`, `ui-navigation`).
- **File Index**: Three-digit zero-padded prefix (`001_`, `002_`), scoped per module. Before creating a tutorial, inspect `lmf/<module>/` to determine the next sequential index.
- **Slug**: Concise snake_case or kebab-case descriptor of the feature or bug (e.g., `001_jwt_validation.md`, `002_refresh_tokens.md`).

---

## Workflow: Two-Phase Lifecycle

### Phase 1: Guide Generation (Draft & Hand-off)

Execute these steps in order when invoked:

1. **Inspect & Diagnose**:
   - Read relevant codebase files and understand existing architecture.
   - If diagnosing an existing error or test failure, run non-modifying diagnostic commands (e.g. `pnpm test`, `tsc --noEmit`) to verify the exact failure.
   - Identify the root cause and formulate the minimal, robust fix or feature design.
2. **Resolve Path & Index**:
   - Identify target `<module>`.
   - Check existing files in `lmf/<module>/` to compute the next sequential number.
3. **Author Tutorial Guide**:
   - Read the blueprint structure defined in [`TEMPLATE.md`](TEMPLATE.md).
   - Draft `lmf/<module>/<###>_<feature_name>.md` following the template sections:
     - **Problem & Context**
     - **Root Cause & Technical Explanation** (the "Why")
     - **Architecture & Design Decisions**
     - **Step-by-Step Implementation** (exact target paths, complete imports, targeted diffs, line anchors, explanation of why each change works)
     - **Verification & Testing** (exact commands and expected behavior)
     - **Common Gotchas & Edge Cases**
4. **Update Central Index (`lmf/README.md`)**:
   - Create or update `lmf/README.md` with a table of contents linking to the new guide, its module, short description, and implementation status (`Pending` / `In Progress` / `Completed`).
5. **Hand-off & Stand Down**:
   - Provide a concise recap to the user containing the link to the generated guide.
   - Stop and stand by. Do not modify any code. Invite the user to write the code and notify you when ready for review.

**Completion Criterion**: Tutorial file created in `lmf/<module>/`, indexed in `lmf/README.md`, zero source files modified.

---

### Phase 2: Review & Verification (When User Returns)

Triggered when the user announces they have finished implementing the guide, asks for feedback, or requests verification (e.g., "I finished 001", "check my code", "verify my changes"):

1. **Inspect User Changes**:
   - Run `git diff` or inspect modified files to review the human developer's code.
2. **Execute Read-Only Verification**:
   - Run tests or typecheckers to verify correctness without modifying any code.
3. **Constructive Feedback & Sign-Off**:
   - Compare the implementation against the tutorial's verification checklist and edge cases.
   - Report pass/fail status, highlight strengths, and note any missed edge cases or syntax issues.
   - Update the status column in `lmf/README.md` to `Completed` once verified.
