# Step 09 · MVP Logic

Make the Magic Moment actually work. Decide what to hack and what to engineer.

## Trigger phrases

"Run step 9", "MVP logic", "make it work", "Magic Moment logic", "wire up the prototype".

## Preconditions

Step 07 complete. Step 08 recommended but not required (the logic can run before brand assets drop in).

## Inputs

- `07-mvp-visuals/user-journey.md` — the three screens and their interactions.
- `07-mvp-visuals/screens/` — existing HTML.
- `03-uvp/uvp.md` — the promise the logic must fulfil.
- `06-unit-economics/unit-economics.md` — informs what costs to avoid baking in (don't wire up a $0.50-per-call LLM for a demo).

## Personas

1. **Product Engineer** — plans the logic function by function.
2. **Tech Debt Judge** — classifies each function as HACK or ENGINEER.

Both in `references/personas.md`.

## Procedure

1. **Product Engineer phase.** For each of the three screens, identify the logic at each interaction point. Think Input → Process → Output:
   - What data comes in (user input, fake-data file, API response)?
   - What processing happens (calculation, transformation, LLM call, API lookup)?
   - What goes out (new screen state, displayed result, stored value)?
   For each processing step, name the specific implementation: local JavaScript function, `fetch()` to a public API, a prompt to the Anthropic API (see the in-artifact API notes), or a Wizard-of-Oz pre-computed result.
2. Save the plan to `09-mvp-logic/logic-plan.md`.
3. **Tech Debt Judge phase.** For every function in the plan, classify:
   - **HACK** — use local state, hardcoded data, or Wizard-of-Oz. Acceptable if this function is not the Magic Moment and the hack won't embarrass the demo.
   - **ENGINEER** — real API, real persistence. Required only for the Magic Moment itself.
   Justify each call. Note what tech debt is being taken on — what breaks if we ship this hack beyond the demo.
4. Save to `09-mvp-logic/hack-vs-engineer.md`.
5. **Wire the screens.** Using the plan and the judge's verdicts, update `07-mvp-visuals/screens/` with working interactivity. If the `frontend-design` skill is available, invoke it with the logic plan; otherwise edit the HTML directly with inline JavaScript.
6. Update state.yaml: step 09 complete.
7. Tell the user: "Step 10 verifies the MVP works on a phone and runs a fresh-user walkthrough. Ready?"

## Output

Two new files in `./<idea-slug>/09-mvp-logic/`:
- `logic-plan.md` — from `assets/templates/logic-plan.md`
- `hack-vs-engineer.md`

Plus updated files in `./<idea-slug>/07-mvp-visuals/screens/` with wired logic.

## Gotchas

- **Hack everything except the Magic Moment.** A fake "login" button that just sets a local variable is fine. A fake forecast for a forecasting app is not — that's the thing being demoed.
- **Avoid API keys in the demo.** If the Magic Moment needs an LLM, use the in-artifact Anthropic API pattern (no key required inside artifacts) or pre-compute a handful of example outputs.
- **No backend unless truly needed.** Local storage, in-memory state, and pre-computed JSON go a long way. A demo that requires deploying a database is a demo that won't ship in time.
- **Named functions, not blobs.** Each function in the plan has a name, signature, and one-line purpose. "Magic code happens here" is not a plan.
- **Mobile-first still applies.** Touch targets min 44px, no hover-only interactions.
