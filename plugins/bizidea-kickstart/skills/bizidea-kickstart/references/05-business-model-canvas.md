# Step 05 · Business Model Canvas

Fill all 9 blocks. Cite prior deliverables as the grounding for each block.

## Trigger phrases

"Run step 5", "business model canvas", "BMC", "9 blocks", "blueprint".

## Preconditions

Step 04 complete with a PERSEVERE recommendation. If the recommendation was ITERATE or PIVOT, the skill refuses step 05 and explains why.

## Inputs

- `03-uvp/uvp.md` — feeds the Value Propositions block.
- `02-persona/persona.md` — feeds Customer Segments and Channels.
- `02-persona/interview-signals.md` — feeds Customer Relationships (how they expect to be reached).
- `04-smoke-test/validation-report.md` — confirms demand and reveals channel preferences.

## Personas

1. **Business Strategist** — fills all 9 blocks with citations.
2. **Industry Veteran** — sanity-checks against domain reality.

Both in `references/personas.md`.

## Procedure

1. **Business Strategist phase.** Fill each of the 9 blocks in this order (inside-out: value first, then delivery, then creation, then money):
   1. Value Propositions — from `03-uvp/uvp.md`
   2. Customer Segments — from `02-persona/persona.md`
   3. Channels — from validation signals (where did they come from?)
   4. Customer Relationships — automated / personal / community
   5. Revenue Streams — subscription / transaction / licence / ad / freemium
   6. Key Resources — tech, data, brand, people
   7. Key Activities — what we do every day
   8. Key Partners — suppliers, platforms, distribution
   9. Cost Structure — fixed vs. variable, major buckets
   For every block, cite the source file (or mark `(assumption)` if not grounded).
2. Save the draft to `05-bmc/bmc.md` using the template.
3. **Industry Veteran phase.** Review each block. Flag any block that shows founder-naivety — partnerships that don't exist, channels that require resources we don't have, cost assumptions that understate reality. Propose a concrete correction per flagged block.
4. Apply the corrections. Keep the flagged versions in a `### Reality checks` section at the bottom of the BMC file so the user sees what changed and why.
5. Update state.yaml: step 05 complete.
6. Tell the user: "Step 06 calculates unit economics — CAC, LTV, payback. Ready?"

## Output

One file in `./<idea-slug>/05-bmc/`:
- `bmc.md` — from `assets/templates/bmc.md`

## Gotchas

- **Generic fillers fail.** "Social media marketing" is not a channel. "Instagram Reels targeting small-shop owners in Yangon" is.
- **Every block must be grounded or flagged.** If a block is a pure assumption, label it `(assumption)` so step 06 and beyond know to test it.
- **The Industry Veteran must flag at least one block.** If every block passes reality check on the first read, re-run the Veteran with a harder stance — on a first draft, something is always wrong.
- **Keep the one-page discipline.** The BMC fits on one page for a reason. If any block exceeds 6 bullet points, the founder is hedging.
