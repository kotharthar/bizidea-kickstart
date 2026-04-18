# Step 12 · Pitch Deck & Demo

Render the deck via the `pptx` skill. Produce a demo script and rehearsal plan.

## Trigger phrases

"Run step 12", "pitch deck", "build the pptx", "final deck", "rehearse", "demo script".

## Preconditions

Step 11 complete. Nanobanana images (if any) have been dropped into `12-pitch-deck/images/` or `08-brand/images/`.

## Inputs

- `11-pitch-storyline/pitch-outline.md` — the 10 slides.
- `08-brand/brand-style.md` — design tokens for consistent styling.
- `12-pitch-deck/images/` or `08-brand/images/` — user-supplied Nanobanana outputs.
- `09-mvp-logic/` and `07-mvp-visuals/screens/` — source for the live-demo section.

## Personas

1. **Deck Designer** — renders the pptx via the `pptx` skill.
2. **Rehearsal Coach** — produces speaker notes, Q&A prep, performance cues.

Both in `references/personas.md`.

## Procedure

1. **Deck Designer phase.** This step MUST use the `pptx` skill. Load `/mnt/skills/public/pptx/SKILL.md` if available. Do not write raw python-pptx code from scratch.
   - Pass the pitch-outline.md and the brand tokens to the pptx skill.
   - Rules to enforce: one headline per slide, max 3 supporting bullets, headline 36–44pt, body 20–24pt, at least 40% whitespace per slide, brand palette only.
   - Place Nanobanana images with intent — hero on slide 1, pain visualisation on slide 2, future-state on slide 3. Not decorative.
2. Save the rendered deck to `12-pitch-deck/pitch-deck.pptx`.
3. **Rehearsal Coach phase.** Produce:
   - **Per-slide speaker notes** — 1–2 sentences each. Conversational, not read-aloud scripts. What you *say* is always shorter than what's on the slide.
   - **Top 8 hardest investor questions** — with 3-sentence answers grounded in prior deliverables. Expect questions like: "What's your CAC channel assumption?" (answer from step 06), "Why won't a bigger competitor just do this?" (answer from step 05 Key Resources / defensibility), "Why hasn't this been built before?" (answer from step 11 Why Now).
   - **Performance cues** — 3 specific moments: where to pause for effect, where to make eye contact with a specific investor, where the live demo goes live and when the presenter switches back to the deck.
4. Save to `12-pitch-deck/demo-script.md`.
5. Update state.yaml: step 12 complete. Pipeline finished.
6. Present the user with the pptx and the demo script. Suggest 3 full rehearsals — one alone, one with a friend as the Investor in Seat 3, one timed against a 5-minute clock.

## Output

In `./<idea-slug>/12-pitch-deck/`:
- `pitch-deck.pptx` — the final deck
- `demo-script.md` — from `assets/templates/demo-script.md`

## Gotchas

- **Compose with the pptx skill, don't reimplement it.** This skill produces the outline and calls pptx. If pptx is unavailable, produce a detailed slide-by-slide layout markdown the user can paste into Keynote or Google Slides — do not fake a pptx with python-pptx.
- **Font sizes are firm.** 20pt body, 36pt headline minimums. If content doesn't fit, cut content, not font size.
- **Live demo timing.** A 5-minute pitch has 60 seconds for the demo at most. If the demo needs more than 60 seconds to show the Magic Moment, record a 30-second video demo instead and cue it from the deck.
- **Q&A prep is not optional.** The deck is for the 5 minutes on stage. The Q&A is for the 5 minutes that decide the deal. Treat it with equal weight.
- **"Thank you" is a slide that can go. The Ask is the last slide.** Don't soften the close.
