---
name: bizidea-kickstart
description: Guides a solo founder from raw idea to investor-ready pitch in 12 sequential steps, invoking critical AI personas at each stage. Covers problem validation with the Mom Test, UVP and divergent thinking, smoke testing with a landing page, business model canvas, unit economics with CFO stress-testing, MVP prototyping, brand assets with Gemini Nanobanana image prompts, pitch storyline, and final deck generation. Trigger this skill whenever the user mentions starting a business, validating a startup idea, building an MVP, writing a pitch deck, running a hackathon, problem-hunting, finding customer pain, or any step name or number from the 12-step pipeline (for example "run step 3", "problem hunt", "smoke test", "pitch deck"). Use even when the user only describes a raw pain point without asking for a skill — pick up at step 01 and offer to scaffold a project.
license: MIT
compatibility: Works in Claude Code, Claude.ai, and any agentskills.io-compatible client. Uses web_search for market research. Composes with the pptx skill (step 12) and frontend-design skill (steps 04, 07, 09) when available; falls back to plain markdown otherwise. Produces image-generation prompts for external use with Gemini Nanobanana; does not generate images itself.
metadata:
  author: Thar Htet
  version: "1.0.0"
  steps: "12"
---

# bizidea-kickstart

Take a founder from a raw idea to an investor-ready pitch deck in 12 sequential steps. At every step, a generative persona produces work and an adversarial persona stress-tests it. No co-founder? The skill pushes back instead.

## When to invoke

- User says "start a new business idea", "validate this idea", "run the bizidea pipeline", "work on my startup idea", "hackathon prep"
- User names a specific step: "run step 3", "do the smoke test", "build the BMC", "write the pitch"
- User shares a pain point or problem description and hasn't chosen a framework — offer to start at step 01
- User opens an existing project folder (contains `state.yaml`) — read state, tell them what step is next

## Methodological foundations

The 12 steps are not arbitrary — they operationalise five established frameworks:

1. **Customer Development** (Blank/Dorf) — steps 01, 02, 04 do Customer Discovery and Validation.
2. **Lean Startup / Build-Measure-Learn** (Ries) — step 04 smoke test, step 06 stress test, step 09 Hack-vs-Engineer.
3. **The Mom Test** (Fitzpatrick) — step 02 interview and coaching.
4. **Divergent + Convergent Thinking** — step 03 separates the two modes; Radical Ideator diverges, Cynical VC converges.
5. **Business Model Canvas + Value Proposition Design** (Osterwalder) — step 05 fills the 9 blocks, step 06 runs unit economics.

Load `references/foundations.md` when a step needs its grounding explained, when the user asks *why* the pipeline works this way, or when a deliverable must cite the framework it came from.

## Project model

Every idea lives in a folder under the current working directory:

```
./<idea-slug>/
├── state.yaml                       # progress tracker; see assets/state.schema.yaml
├── 01-problem-hunt/
├── 02-persona/
├── 03-uvp/
├── 04-smoke-test/
├── 05-bmc/
├── 06-unit-economics/
├── 07-mvp-visuals/
├── 08-brand/
├── 09-mvp-logic/
├── 10-verification/
├── 11-pitch-storyline/
└── 12-pitch-deck/
```

The skill never writes outside `./<idea-slug>/`. If no project folder exists, run `scripts/init.sh <idea-slug>` to scaffold one.

## How to run any step (shared contract)

Every step follows this six-beat loop. Do not skip beats.

1. **Check state.** Read `./<idea-slug>/state.yaml`. Refuse to run step N if step N-1 has status other than `complete` — unless the user explicitly overrides.
2. **Load minimal context.** Open `references/NN-<step>.md` and `references/personas.md`. Open prior deliverables the step lists under "Inputs". Do not preload other step references.
3. **Run the persona sequence.** The step reference names the personas in order and gives a prompt pattern for each. Follow the order. Present each persona's output to the user before moving to the next.
4. **Write the deliverable.** Use the template in `assets/templates/` named by the step reference. Save to the step's folder.
5. **Update state.** Set the step's status to `complete`, append its deliverables list, bump `current_step` and `updated_at`.
6. **Hand off.** Tell the user what step N+1 needs and offer to start it.

## Step index

Each step names its foundation(s) — the methodological framework it operationalises. See `references/foundations.md` for the full treatment.

| # | Name | Reference | Key personas | Foundation |
|---|---|---|---|---|
| 01 | Problem Hunt | `references/01-problem-hunt.md` | Market Analyst → Devil's Advocate | Customer Discovery |
| 02 | Persona & Mom Test | `references/02-persona-mom-test.md` | Skeptical Target User → Mom Test Coach | Customer Discovery + Mom Test |
| 03 | UVP & Divergent Thinking | `references/03-uvp-divergent.md` | Radical Ideator → Cynical VC → Brand Strategist | Divergent → Convergent + Value Proposition Design |
| 04 | Smoke Test | `references/04-smoke-test.md` | Survey Designer → Growth Copywriter → Conversion Analyst | Customer Validation + Build-Measure-Learn |
| 05 | Business Model Canvas | `references/05-business-model-canvas.md` | Business Strategist → Industry Veteran | Business Model Canvas (9 blocks) |
| 06 | Unit Economics | `references/06-unit-economics.md` | Unit Economics Analyst → Cynical CFO | BMC health check + Riskiest Assumption |
| 07 | MVP Visuals | `references/07-mvp-visuals.md` | Product Designer → UX Critic | Build (smallest loop) |
| 08 | Brand & Assets | `references/08-brand-assets.md` | Brand Designer → Art Director | Divergent (3 variations) |
| 09 | MVP Logic | `references/09-mvp-logic.md` | Product Engineer → Tech Debt Judge | Build-Measure-Learn |
| 10 | Verification | `references/10-verification.md` | QA Tester → Naive Fresh User | Measure |
| 11 | Pitch Storyline | `references/11-pitch-storyline.md` | Story Architect → Investor in Seat 3 → Art Director | Learn (translate evidence) |
| 12 | Pitch Deck & Demo | `references/12-pitch-deck.md` | Deck Designer → Rehearsal Coach | Bridge to Company Building |

## Persona contract

- Every step names its personas; always load `references/personas.md` alongside the step reference.
- Personas are prompt-roles, not separate models. Claude plays each one in turn.
- The adversarial persona always runs **after** the generative one. Present both outputs to the user; the deliverable reflects the reconciled result.
- The user can ask to re-run any persona (e.g., "push harder as the Cynical VC"). Honor the request and update the deliverable.

## External-tool substitutions

The underlying curriculum mentioned Loveable, Midjourney, ElevenLabs. This skill substitutes:

- **Image generation** → write Gemini Nanobanana prompts in `nanobanana-prompts.md`. The user runs them in Gemini and drops results back in the project folder. See `references/nanobanana-prompting.md` for prompt construction rules.
- **Landing page / MVP UI** → delegate to the `frontend-design` skill if present; otherwise produce a single-file HTML artifact in the step folder.
- **Pitch deck** → delegate to the `pptx` skill in step 12; otherwise write a detailed outline the user can paste into slide software.

## Gotchas

- **Never skip step 02.** Founders rush past persona work. If the user wants to go from step 01 straight to step 05, refuse and explain: the BMC's Customer Segment and Channels blocks depend on persona facts. Offer a lightweight 10-question interview instead.
- **Persona outputs must reference prior deliverables by file path.** When the Business Strategist fills the BMC, they cite `03-uvp/uvp.md` for the Value Proposition block. This prevents drift.
- **Nanobanana prompts are cinematic, not generic.** "A happy shop owner" fails. "Medium close-up, warm tea-shop lighting, a Burmese shop owner in her 40s laughing at her tablet" succeeds. See `references/nanobanana-prompting.md`.
- **web_search results are raw signal, not conclusions.** Step 01 quotes sources via the citation system; the Devil's Advocate then challenges whether the complaints represent a bleeding neck or just friction.
- **The landing page in step 04 is a smoke test, not a product.** It must show a single value proposition, one CTA, one form field (email). Feature pages, pricing tables, and About sections are out of scope.
- **Unit economics in step 06 use the user's real numbers or clearly-labeled assumptions.** Never invent a $42 CAC without flagging it as placeholder.
- **Step 12 uses the pptx skill if available.** Do not write raw python-pptx code; call the skill.

## Scripts

- `scripts/init.sh <idea-slug>` — scaffolds a project folder with all 12 subfolders and a fresh `state.yaml`.
- `scripts/show-state.sh` — prints progress for the current project.
- `scripts/next.sh` — prints what step N+1 needs.

Scripts assume the current working directory contains (or is) the project folder. They are optional — Claude can perform the same operations directly.

## Output format discipline

Every step writes markdown to its folder using a template from `assets/templates/`. Do not invent new output shapes without the user's permission. If the template feels constraining for a specific idea, propose a modification and wait for the user to approve before writing.
