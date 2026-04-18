# Step 07 · MVP Visuals

Design the three screens that deliver the Magic Moment. Nothing else.

## Trigger phrases

"Run step 7", "MVP visuals", "three screens", "happy path", "clickable prototype", "cupcake".

## Preconditions

Step 06 complete. Unit economics survive the CFO stress test (LTV:CAC > 3 under at least 2 of 3 stresses).

## Inputs

- `03-uvp/uvp.md` — the promise the screens must keep.
- `02-persona/persona.md` — audience context for tone and density.
- `02-persona/interview-signals.md` — vocabulary to mirror in the UI copy.

## Personas

1. **Product Designer** — specifies the three screens.
2. **UX Critic** — applies the Squint Test, the 5-Second Test, the One-Thumb Test.

Both in `references/personas.md`.

## Procedure

1. **Product Designer phase.** Identify the three happy-path screens:
   - **Entry / Landing** — the user arrives, understands the value in 5 seconds, takes the first action.
   - **Magic Moment** — the screen where the core value is delivered (the forecast appears, the match is made, the report renders).
   - **Success state** — confirmation the value was delivered, plus a clear next step.
   For each screen, specify:
   - Headline (outcome-focused)
   - Primary interactive element (the ONE thing the user does here)
   - Secondary elements (max 2)
   - What data appears (placeholder or real)
   - What happens on primary interaction (where they go next)
2. Write the spec to `07-mvp-visuals/user-journey.md`.
3. **Build the screens.** If the `frontend-design` skill is available, invoke it with the user-journey.md as input and request three linked HTML files in `07-mvp-visuals/screens/`. Otherwise produce three clean single-file HTML screens directly, using the brand defaults (or step-08 tokens if step 08 has run).
4. **UX Critic phase.** For each screen, apply:
   - **Squint Test** — blur the screen mentally; is the primary CTA still the loudest thing?
   - **5-Second Test** — what would a new user say this page is for after 5 seconds?
   - **One-Thumb Test** — can the primary interaction be done one-handed on a 375px viewport?
   List every failure and propose a fix. Apply the fixes or request the frontend-design skill re-render the screens.
5. Save the criticism and fixes to `07-mvp-visuals/ux-review.md`.
6. Update state.yaml: step 07 complete.
7. Tell the user: "Step 08 builds the brand system and generates Nanobanana image prompts for heroes and features. Ready?"

## Output

In `./<idea-slug>/07-mvp-visuals/`:
- `user-journey.md` — from `assets/templates/user-journey.md`
- `screens/` — three HTML files (via `frontend-design` skill or directly)
- `ux-review.md` — criticism and fixes

## Gotchas

- **Three screens only.** Not four. Not "three plus a settings screen". If the user wants more, they're not ready for step 07 — send them back to identify the Magic Moment.
- **No real login / signup.** For the smoke-test MVP, skip auth entirely. A "Try the demo" button goes straight to the Magic Moment.
- **Copy comes from interview-signals.md.** Use phrases real users used. If the persona said "I keep missing stock-outs", the screen says "Never miss a stock-out again" — not "Optimise your inventory workflow".
- **Mobile-first, not mobile-also.** Design at 375px and scale up, not the other way round.
