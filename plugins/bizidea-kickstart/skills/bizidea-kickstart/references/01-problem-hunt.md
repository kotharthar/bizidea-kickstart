# Step 01 · Problem Hunt

Find a bleeding-neck problem worth building for.

## Trigger phrases

"Start a new idea", "problem hunt", "find a pain point", "step 1", "bleeding neck", "what problem should I solve".

## Preconditions

None. This is the entry step. If no project folder exists, run `scripts/init.sh <idea-slug>` first. The user must supply at least a **domain** (retail, logistics, education, Myanmar SMEs, coffee shops, …) before the step can run.

## Inputs

- User's domain of interest (ask if not provided).
- Optional: geographic focus, target segment, any existing hunches.

## Personas

Run in this order, presenting each output to the user before moving on:

1. **Market Analyst** — see `references/personas.md`. Scans forums, reviews, threads for recurring pain using `web_search`. Produces a long-list of candidate problems with evidence.
2. **Devil's Advocate** — see `references/personas.md`. Challenges every candidate. Scores on Urgency × Frequency × Cost of inaction (1–5 each). Recommends the problem that survives.

## Procedure

1. Ask the user for the domain if it isn't in the conversation. Do not guess.
2. **Market Analyst phase.** Run 3–6 `web_search` queries. Prefer real user voices (Reddit, niche forums, 1-star reviews, local-language news) over summary articles. For each complaint found, capture source and a paraphrased quote under 15 words with proper citation. Produce a candidate long-list of 5–10 problems.
3. Show the user the long-list. Ask if any should be ruled out before scoring.
4. **Devil's Advocate phase.** For each surviving candidate, argue the null hypothesis (this is just friction, not a bleeding neck). Score Urgency, Frequency, Cost on 1–5 each. Compute the product; anything under 45 is not a bleeding neck.
5. Write the deliverable using the template.
6. Update `state.yaml`: step 01 complete, deliverables listed, current_step = 1.
7. Tell the user: "Step 02 will run a Mom Test interview on the chosen persona. Ready to proceed?"

## Output

Write to `./<idea-slug>/01-problem-hunt/bleeding-neck-report.md` using the template `assets/templates/bleeding-neck-report.md`.

## Gotchas

- **Do not invent statistics.** If web_search didn't surface a cost figure, state "cost not quantified from public sources" rather than guessing.
- **Quotes are bounded.** One quote per source, under 15 words, cited via ``. Paraphrase otherwise.
- **The user picks the winner.** Even if the Devil's Advocate recommends a problem, present the scoring and let the user choose. Their intuition about their own domain matters.
- **Myanmar / regional context.** When the user's domain is Myanmar or Southeast Asia, search in English and acknowledge that primary-source pain may be under-represented online. Suggest the user supplement with real conversations before committing.
