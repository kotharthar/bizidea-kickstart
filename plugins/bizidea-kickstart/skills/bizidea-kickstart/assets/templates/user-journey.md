# User Journey (3-Screen MVP Spec)

**Magic Moment:** <one sentence — the exact second the user gets what they came for>
**Persona:** <short descriptor from `02-persona/persona.md`>

## Screen 1 — Entry / Landing

- **URL:** `/`
- **Headline (outcome-focused):** "<5–7 words>"
- **Subhead:** "<12–20 words qualifying the audience>"
- **Primary interactive element:** <ONE button or input>
- **Secondary elements (max 2):** <bullet>
- **Data shown:** <placeholder / real>
- **On primary interaction:** goes to Screen 2

## Screen 2 — The Magic Moment

- **URL:** `/<slug>`
- **Headline:** "<the result phrased as an outcome>"
- **Primary interactive element:** <the ONE action that delivers the value>
- **Secondary elements (max 2):** <bullet>
- **Data shown:** <what appears; source: live API / mock / LLM>
- **On primary interaction:** goes to Screen 3

## Screen 3 — Success

- **URL:** `/done`
- **Headline:** "<confirmation of value delivered>"
- **Primary interactive element:** <the next step — share / save / invite / repeat>
- **Secondary elements (max 2):** <bullet>
- **Data shown:** <summary / receipt / result>

## Interaction map

```
/ ── primary CTA ──> /<slug> ── primary CTA ──> /done ── optional ──> back to /
```

## Copy source

Every headline and button label must use phrases from `02-persona/interview-signals.md`. Cite each below:

- Screen 1 headline: inspired by <transcript line>
- Screen 2 headline: inspired by <transcript line>
- Screen 3 headline: inspired by <transcript line>

## Out of scope (deliberately)

- Login / signup
- Settings / profile
- Feature tours
- Pricing page
- About page
