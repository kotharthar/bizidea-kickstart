# Step 02 · Persona & Mom Test

Build a detailed persona and interview them to get behavioural facts — not opinions, not pitches in disguise.

## Trigger phrases

"Run step 2", "Mom Test", "persona interview", "talk to a customer", "empathy engine".

## Preconditions

Step 01 complete. `01-problem-hunt/bleeding-neck-report.md` exists and names a chosen problem.

## Inputs

- `./<idea-slug>/01-problem-hunt/bleeding-neck-report.md` — the chosen problem and domain evidence.
- Optional: user's existing notes on who the customer might be.

## Personas

1. **Skeptical Target User** — roleplays the customer during a 12–15 question interview. See `references/personas.md`.
2. **Mom Test Coach** — reviews the transcript afterwards. Labels every founder question as behavioural / hypothetical / leading. Extracts signals. See `references/personas.md`.

## Procedure

1. Draft the persona. Include: name, age, role, location, daily context, current coping mechanism for the problem, budget authority, decision triggers. Ground each field in step 01's evidence or explicitly mark as assumption.
2. Save the persona to `02-persona/persona.md` using the template.
3. Present the persona to the user for correction before the interview. This is a critical gate — a wrong persona makes the interview worthless.
4. **Skeptical Target User phase.** The user plays the founder; Claude plays the persona. Claude asks nothing unprompted — only responds in character. The user asks the questions. Aim for 12–15 exchanges. Run for as long as the user wants; stop on user signal.
5. Save the transcript to `02-persona/mom-test-transcript.md`.
6. **Mom Test Coach phase.** Claude reviews the transcript. For each founder question, label it:
   - **behavioural** (asks about past action — good)
   - **hypothetical** (asks about future intent — weak)
   - **leading** (invites agreement — failed; must be rewritten)
7. Extract 3 signals about current behaviour and 3 signals about willingness to pay. If fewer than 3 of each exist, flag "insufficient signal — re-interview needed".
8. Save annotated transcript + signals summary to `02-persona/interview-signals.md`.
9. Update state.yaml: step 02 complete, three deliverables listed.
10. Tell the user: "Step 03 generates 20 radical solution ideas and filters to 3. Ready?"

## Output

Three files in `./<idea-slug>/02-persona/`:
- `persona.md` — from `assets/templates/persona.md`
- `mom-test-transcript.md` — from `assets/templates/mom-test-transcript.md`
- `interview-signals.md` — from `assets/templates/interview-signals.md`

## Gotchas

- **The user plays the founder.** Do not let Claude ask the interview questions on the user's behalf — that removes the teaching value of the Mom Test. Prompt the user to ask their next question each turn.
- **Refuse to volunteer the product.** The Skeptical Target User must never say "you should build X". That's the founder's discovery job.
- **Reinterview on thin signal.** If coach analysis shows more than half the questions were leading, ask the user to rerun the interview. Offer a rewritten question list based on the coach's annotations.
- **Persona grounding.** Every persona trait (age, role, location) must come from either (a) step 01 evidence, or (b) an explicit user assumption. No silent invention.
