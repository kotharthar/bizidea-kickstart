# Step 10 · Verification

Test on a phone. Watch a stranger use it.

## Trigger phrases

"Run step 10", "verify", "Hello World moment", "QA", "fresh user test", "does it work".

## Preconditions

Step 09 complete. Screens have working logic.

## Inputs

- `07-mvp-visuals/screens/` — the deployed or deployable MVP.
- `09-mvp-logic/logic-plan.md` — what should work.
- `02-persona/persona.md` — to inform the Naive Fresh User's characterisation.

## Personas

1. **QA Tester** — produces a Hello World checklist.
2. **Naive Fresh User** — roleplays a stranger's first 60 seconds with the app.

Both in `references/personas.md`.

## Procedure

1. **QA Tester phase.** Produce a checklist of verifiable pass/fail items:
   - Does the primary button do what it says on every screen?
   - Does state persist across a page reload (or is the "reset" behaviour intentional)?
   - Does the layout look right at 375px, 768px, and 1440px?
   - Does the page load in under 3 seconds on 4G simulation?
   - Does each screen pass its own Squint Test now that logic is wired?
   - Does the Magic Moment actually deliver the promise?
   Add MVP-specific checks based on `09-mvp-logic/logic-plan.md` (e.g., for a forecasting MVP: does the forecast update when the inputs change?).
2. Save to `10-verification/verification-checklist.md`.
3. Ask the user to walk through the checklist themselves, on their own phone. Ticks go in the checklist. Record any fails in a bug log.
4. **Naive Fresh User phase.** Roleplay a stranger matching the persona. They have been handed the phone with no explanation. Narrate everything second by second — what they see, what they think the app does, where they tap first, what confuses them. Run for 60 simulated seconds.
5. Save the transcript to `10-verification/fresh-user-walkthrough.md`.
6. Extract the top 3 friction points from the walkthrough. For each, propose a fix.
7. Save the bug log + proposed fixes to `10-verification/bug-log.md`.
8. Let the user decide which fixes to apply before the pitch. Update the MVP screens accordingly.
9. Update state.yaml: step 10 complete.
10. Tell the user: "Step 11 writes the 10-slide pitch storyline and the hero-image prompts. Ready?"

## Output

Three files in `./<idea-slug>/10-verification/`:
- `verification-checklist.md` — from `assets/templates/verification-checklist.md`
- `fresh-user-walkthrough.md`
- `bug-log.md` — from `assets/templates/bug-log.md`

## Gotchas

- **A checklist the user doesn't run is worthless.** Do not tick items on the user's behalf. If they haven't walked the checklist yet, block progress to step 11.
- **The Naive Fresh User is a performance, not a report.** It should read like a transcript — "Hmm, what does this button do? Oh, I see, it's a signup. Wait, why do I need to sign up just to see the demo?" — not a summary.
- **Ship-quality is not the goal. Pitch-quality is.** The MVP needs to survive a 2-minute live demo, not a production workload. Fix ugly-on-mobile before you fix database connection pooling.
- **Record the bugs you won't fix.** Every "known issue deferred for after the pitch" goes in bug-log.md explicitly. This becomes the v1.1 roadmap.
