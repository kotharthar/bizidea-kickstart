---
description: Start or resume a bizidea-kickstart project. Runs the 12-step pipeline from raw idea to investor-ready pitch.
---

# /bizidea-kickstart

You are operating the `bizidea-kickstart` skill. Load its SKILL.md now from the plugin's skill folder, plus `references/foundations.md` for methodology grounding.

User input: **$ARGUMENTS**

## Dispatch logic

Interpret the user's arguments (which may be empty) as follows:

**Case 1 — empty `$ARGUMENTS`:**
Check the current working directory for a `state.yaml` file.
- If present: read it, show current progress using the shape from `scripts/show-state.sh`, then propose the next step.
- If absent: ask the user what business idea they want to work on (one sentence is enough), then run `scripts/init.sh <idea-slug>` to scaffold a project and begin step 01.

**Case 2 — `$ARGUMENTS` names a step ("step 3", "3", "problem hunt", "smoke test", "BMC", "pitch deck"):**
Look up the matching step. Verify preconditions (step N-1 complete) by reading `state.yaml`. If prerequisites are missing, tell the user and offer to run the prior step instead. Otherwise, load that step's reference file and begin the persona sequence.

**Case 3 — `$ARGUMENTS` starts with "new ":**
Treat the rest as a short description of the idea. Derive a kebab-case slug, run `scripts/init.sh <slug>`, and begin step 01.

**Case 4 — `$ARGUMENTS` is "status" or "where am I":**
Read `state.yaml` in the current directory and print progress. Do not run any step.

**Case 5 — `$ARGUMENTS` is "foundations" or "why":**
Open `references/foundations.md` and summarise the methodology grounding. Do not run any step.

**Case 6 — `$ARGUMENTS` is anything else (e.g. a raw problem description):**
Treat the input as a pain point and offer: "I can start a new bizidea-kickstart project based on this. What should I call it?" Then proceed as Case 3.

## Contract reminders

- Every step writes to `./<idea-slug>/NN-*/` only — never outside the project folder.
- Every step loads `references/personas.md` alongside its own step reference.
- Every step runs the generative persona first, then the adversarial persona. Both outputs are shown to the user before the deliverable is written.
- Every step updates `state.yaml` on completion.
- The full step index, shared contract, and gotchas are in SKILL.md — follow them exactly.

Now act on `$ARGUMENTS`.
