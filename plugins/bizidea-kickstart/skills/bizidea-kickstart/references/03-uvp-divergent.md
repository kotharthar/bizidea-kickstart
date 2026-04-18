# Step 03 · UVP & Divergent Thinking

Generate 20 radical ideas, kill 17, sharpen the winner into a Unique Value Proposition.

## Trigger phrases

"Run step 3", "generate ideas", "UVP", "Purple Cow", "divergent thinking", "VC filter".

## Preconditions

Step 02 complete. Persona and interview signals exist.

## Inputs

- `02-persona/persona.md` — who we're building for.
- `02-persona/interview-signals.md` — behavioural and willingness-to-pay signals.
- `01-problem-hunt/bleeding-neck-report.md` — the pain being solved.

## Personas

1. **Radical Ideator** — produces 20 distinct solution ideas, deliberately norm-violating.
2. **Cynical VC** — kills 17, defends 3 with bull/bear framing.
3. **Brand Strategist** — writes the UVP for the chosen winner.

All three defined in `references/personas.md`.

## Procedure

1. **Radical Ideator phase.** Generate exactly 20 ideas. Each idea gets: a one-line name and a one-line mechanism ("How it works: …"). Mix at least 3 unrelated trend pairings (AI + gig economy, subscriptions + hardware, etc.). Include at least 3 ideas that feel uncomfortable. Save to `03-uvp/20-ideas.md`.
2. Show the 20 to the user. Ask if they want to add or replace any before filtering. No veto — the point is divergence.
3. **Cynical VC phase.** Kill 17. For each killed idea, give a specific reason (not "won't work" — name the market, defensibility, or capital issue). Defend 3 survivors: bull case in one sentence, strongest risk in one sentence, proposed first test. Save to `03-uvp/top-3.md`.
4. Present the top 3 to the user and ask which one to pursue. If the user chooses one that was killed, re-run the Cynical VC specifically on that idea for a steelman defence.
5. **Brand Strategist phase.** Write the UVP using the exact template:

   > For [target customer] who [need], our product is a [category] that [benefit]. Unlike [competitor], we [unfair advantage].

   Fill every bracket with a concrete noun from prior deliverables. Then produce two alternate phrasings. Flag every cliché and hedge.
6. Save the UVP to `03-uvp/uvp.md`.
7. Update state.yaml: step 03 complete, three deliverables listed.
8. Tell the user: "Step 04 designs the smoke test — a survey and a landing page to check if real people care. Ready?"

## Output

Three files in `./<idea-slug>/03-uvp/`:
- `20-ideas.md` — from `assets/templates/20-ideas.md`
- `top-3.md` — from `assets/templates/top-3.md`
- `uvp.md` — from `assets/templates/uvp.md`

## Gotchas

- **Exactly 20 ideas.** Not 15, not 25. The discipline matters. If fewer than 20 feel distinct, the Ideator is not trying hard enough — force another round.
- **Kill 17, not "some".** The Cynical VC's constraint forces real prioritisation.
- **UVP is one sentence.** If it runs to two, it's not a UVP yet. The two alternate phrasings can be longer; the canonical form stays tight.
- **"Unique" doesn't mean "only we do it."** It means "we have a specific unfair advantage in doing it." Name the advantage — proprietary data, regulatory licence, distribution, network, speed.
