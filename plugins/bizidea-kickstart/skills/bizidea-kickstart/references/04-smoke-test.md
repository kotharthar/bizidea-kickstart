# Step 04 · Smoke Test

Test demand before building. A survey and a landing page, no product.

## Trigger phrases

"Run step 4", "smoke test", "landing page", "validate demand", "survey", "pre-sell".

## Preconditions

Step 03 complete. UVP exists.

## Inputs

- `03-uvp/uvp.md` — the single-sentence value proposition.
- `02-persona/persona.md` — audience details.
- `02-persona/interview-signals.md` — phrasing cues from real speech.

## Personas

1. **Survey Designer** — builds 7 exploratory questions.
2. **Growth Copywriter** — writes the landing page copy.
3. **Conversion Analyst** — reads results after the user runs the test, recommends Persevere / Iterate / Pivot.

All three in `references/personas.md`.

## Procedure

### Part A — design (runs now)

1. **Survey Designer phase.** Produce 7 questions. No "would you use this?". No Likert scales on intent. Every question must be exploratory or behavioural. Include one open-ended question inviting the respondent to describe their current workaround. Save to `04-smoke-test/survey.md`.
2. **Growth Copywriter phase.** Produce the landing page copy package:
   - 5-word headline (outcome-focused)
   - 12–20 word subhead (qualifies the audience)
   - 3 bullet points describing the transformation
   - CTA button label (2–3 words)
   - One-line email capture context
   Save to `04-smoke-test/landing-copy.md`.
3. **Build the landing page.** If the `frontend-design` skill is available, invoke it with the landing-copy.md as input and request a single-file HTML landing page in `04-smoke-test/landing/`. If not available, produce a clean single-file HTML landing page directly using the brand defaults below.
4. Prepare the `validation-report.md` template with empty metrics, ready for the user to fill after they distribute the survey and landing page.

### Part B — analysis (runs later, when the user returns with data)

5. **Conversion Analyst phase.** When the user returns with survey responses and landing-page metrics, compute:
   - Signup conversion rate (signups / unique visitors).
   - Top 3 recurring phrases in open answers.
   - Sentiment split: angry / indifferent / excited.
6. Recommend one of:
   - **PERSEVERE** — high conversion (>10% for B2C, >20% for B2B), concentrated excited responses. Proceed to step 05.
   - **ITERATE** — mixed signal. Adjust the UVP or CTA and re-test. Do not proceed yet.
   - **PIVOT** — low conversion, indifferent or confused responses. Return to step 02 or 03 with a changed persona or problem.
7. Fill `04-smoke-test/validation-report.md`.
8. Update state.yaml: step 04 complete only after part B is done.

## Output

In `./<idea-slug>/04-smoke-test/`:
- `survey.md` — from `assets/templates/survey.md`
- `landing-copy.md`
- `landing/` — single-file HTML (via `frontend-design` skill or directly)
- `validation-report.md` — from `assets/templates/validation-report.md` (part B only)

## Brand defaults (when no step-08 tokens exist yet)

Steps 04 runs before step 08, so use these placeholders:
- Primary colour: `#0B3A53` (deep teal-blue)
- Accent: `#E8A74A` (warm amber)
- Body text: `#1A1A1A` on `#FFFFFF`
- Font: Inter for body, Space Grotesk for headlines (Google Fonts)

## Gotchas

- **One CTA. One.** Email waitlist is the default. No "Learn more" competing buttons. The conversion analyst cannot read mixed signal from a page with two CTAs.
- **No pricing table.** Pricing belongs after you know demand. A smoke test with prices tests the price, not the problem.
- **Survey is standalone, not inside the landing page.** Landing page measures "do they care?" Survey measures "what do they actually do?". Keep them separate so metrics don't confound.
- **Small sample ≠ no signal.** If the user returns with 12 responses, analyse them anyway and label the sample-size caveat. Do not refuse to analyse small samples.
