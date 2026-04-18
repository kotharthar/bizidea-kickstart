# Step 11 · Pitch Storyline

Write the 10-slide narrative. Pyramid-principle headlines. Customer is the hero.

## Trigger phrases

"Run step 11", "pitch storyline", "10 slides", "pitch outline", "story arc", "pyramid principle".

## Preconditions

Step 10 complete. Verified MVP exists.

## Inputs

- Every prior deliverable — step 11 synthesises across the whole project.
- Especially: `01-problem-hunt/bleeding-neck-report.md` (Problem slide), `03-uvp/uvp.md` (Solution slide), `05-bmc/bmc.md` (Model slide), `06-unit-economics/unit-economics.md` (Model slide), `07-mvp-visuals/user-journey.md` (Product slide).

## Personas

1. **Story Architect** — structures the 10-slide narrative.
2. **Investor in Seat 3** — reads the outline and reacts slide by slide.
3. **Art Director** — writes Nanobanana prompts for pitch-deck imagery.

All in `references/personas.md`. Art Director requires `references/nanobanana-prompting.md`.

## Procedure

1. **Story Architect phase.** Produce the 10-slide outline using the Sequoia standard. For each slide, write:
   - A **Pyramid-Principle headline** — the conclusion, not the topic. "Bakeries waste 18% of daily production" ✓. "The Problem" ✗.
   - **2–3 supporting bullets** — evidence, not elaboration.
   - A **casting note** — which narrative role this slide plays (Villain reveal, Hero intro, Weapon demo, Treasure vision, Proof point).
   The 10 slides:
   1. **Title** — product name, 5-word tagline, founder + date.
   2. **Problem** — the Villain. Concrete pain with evidence from step 01.
   3. **Solution** — the Weapon. The UVP in action.
   4. **Why Now** — the shift that makes this possible or necessary *today*.
   5. **Market** — TAM / SAM / SOM, cited.
   6. **Competition** — honest landscape. Show the axes on which we win.
   7. **Product** — the three MVP screens as proof of progress.
   8. **Model** — revenue, unit economics, key ratios from step 06.
   9. **Team** — who's here, why this team wins.
   10. **Ask** — specific amount, specific use of funds, specific milestone that money buys.
2. Save to `11-pitch-storyline/pitch-outline.md`.
3. **Investor in Seat 3 phase.** Roleplay reading the outline as if it were being pitched. After each slide, note:
   - Sit up or check phone?
   - What question did this slide raise?
   - Where would I interrupt?
   At the end, state the single objection most likely to kill the deal.
4. Apply revisions to the outline based on the reaction. Save the annotated reaction to `11-pitch-storyline/investor-reaction.md`.
5. **Art Director phase.** Identify the slides that benefit from imagery. Typically:
   - Title (brand hero)
   - Problem (visualise the pain — a stressed shop owner, an overflowing spreadsheet)
   - Solution / Product (future-state of the customer using the product)
   - Ask (optional: team photo or aspirational scene)
   Write three Nanobanana prompt variations per slot using the 7-slot structure. Save to `11-pitch-storyline/nanobanana-pitch-prompts.md`.
6. Update state.yaml: step 11 complete.
7. Tell the user: "Paste pitch-deck prompts into Gemini, drop images into `12-pitch-deck/images/`, then we run step 12 to render the pptx. Ready?"

## Output

Three files in `./<idea-slug>/11-pitch-storyline/`:
- `pitch-outline.md` — from `assets/templates/pitch-outline.md`
- `investor-reaction.md`
- `nanobanana-pitch-prompts.md`

## Gotchas

- **Conclusion headlines only.** Every slide headline states the takeaway. Topic headlines are the single most common pitch-deck failure.
- **No "Thank you" slide.** Slide 10 is the Ask. Ending on the Ask is intentional.
- **The Investor in Seat 3 must raise at least one killing objection.** If the reaction is entirely positive, re-run with a harder stance; first drafts always have a weakness.
- **Customer is Hero.** Slide 3 is about what the customer can now do, not what we built. "Bakeries cut waste 40%" ✓. "We built a waste-reduction platform" ✗.
- **The Ask is specific.** "$500K to reach 1,000 paying bakeries in 12 months" beats "seed round for growth".
