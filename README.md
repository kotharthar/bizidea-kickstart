# bizidea-kickstart

A Claude Code plugin that guides a solo founder from raw idea to investor-ready pitch in 12 sequential steps — grounded in **Customer Development**, **Lean Startup**, **The Mom Test**, **Divergent/Convergent thinking**, and the **Business Model Canvas**.

At every step, a generative persona produces work and an adversarial persona stress-tests it. No co-founder? The skill pushes back instead.

## Install

In Claude Code:

```
/plugin marketplace add kotharthar/bizidea-kickstart
/plugin install bizidea-kickstart@tharhtet-skills
```

Then, in any folder you want to host projects:

```
/bizidea-kickstart
```

The skill also activates automatically whenever you describe a startup idea, ask for a pitch deck, or name any step in the pipeline.

## What you get

**One slash command:** `/bizidea-kickstart`

- `/bizidea-kickstart` — resume the project in the current folder, or start a new one
- `/bizidea-kickstart new <idea>` — scaffold a new project and begin step 01
- `/bizidea-kickstart step 5` — jump to a specific step (preconditions enforced)
- `/bizidea-kickstart status` — show current progress
- `/bizidea-kickstart foundations` — explain the methodology grounding

**Natural-language activation:** say "I want to validate this business idea" or "run the smoke test" — the skill triggers from description matching, no slash required.

## The 12 steps

| # | Step | Foundation |
|---|---|---|
| 01 | Problem Hunt | Customer Discovery (Blank) |
| 02 | Persona & Mom Test | Customer Discovery + Mom Test (Fitzpatrick) |
| 03 | UVP & Divergent Thinking | Divergent → Convergent thinking + Value Proposition Design |
| 04 | Smoke Test | Customer Validation (Blank) + Build-Measure-Learn (Ries) |
| 05 | Business Model Canvas | BMC, 9 blocks (Osterwalder) |
| 06 | Unit Economics | BMC health check (LTV:CAC ≥ 3, payback < 12 months) |
| 07 | MVP Visuals | Build — smallest loop |
| 08 | Brand & Assets | Divergent (3 Nanobanana prompt variations per slot) |
| 09 | MVP Logic | Build-Measure-Learn with Hack-vs-Engineer discipline |
| 10 | Verification | Measure — Hello World + Naive Fresh User |
| 11 | Pitch Storyline | Learn — translate evidence into Pyramid Principle narrative |
| 12 | Pitch Deck & Demo | Bridge to Company Building — Sequoia-standard deck via pptx skill |

See `plugins/bizidea-kickstart/skills/bizidea-kickstart/references/foundations.md` for how each framework maps into the pipeline.

## The critical personas

The skill's single biggest quality control is the **generative + adversarial** pairing. Example pairings:

- Radical Ideator (20 norm-violating ideas) ↔ Cynical VC (kills 17, defends 3)
- Business Strategist (fills 9 blocks) ↔ Industry Veteran (flags founder naivety)
- Unit Economics Analyst (CAC, LTV, payback) ↔ Cynical CFO (3 leaks, stress tests)
- Product Designer (3 happy-path screens) ↔ UX Critic (Squint Test, One-Thumb Test)
- Story Architect (10-slide outline) ↔ Investor in Seat 3 (slide-by-slide reaction, killing objection)

25 personas total. See `plugins/bizidea-kickstart/skills/bizidea-kickstart/references/personas.md`.

## External tool integrations

- **Images** — produces prompts for Gemini Nanobanana (steps 08, 11); user generates images externally and drops them into the project folder.
- **Landing pages & MVP UI** — composes with the `frontend-design` skill if installed; falls back to clean single-file HTML.
- **Pitch deck** — composes with the `pptx` skill in step 12.

## Project output

Every idea lives in a folder under the current working directory:

```
./<idea-slug>/
├── state.yaml                 # progress tracker
├── 01-problem-hunt/           # bleeding-neck-report.md
├── 02-persona/                # persona.md + mom-test-transcript.md + interview-signals.md
├── 03-uvp/                    # 20-ideas.md + top-3.md + uvp.md
├── 04-smoke-test/             # survey.md + landing/ + validation-report.md
├── 05-bmc/                    # bmc.md (9 blocks with citations)
├── 06-unit-economics/         # unit-economics.md + cfo-stress-test.md
├── 07-mvp-visuals/            # 3-screen HTML prototype + user-journey.md
├── 08-brand/                  # brand-style.md + nanobanana-prompts.md
├── 09-mvp-logic/              # logic-plan.md + hack-vs-engineer.md
├── 10-verification/           # verification-checklist.md + bug-log.md
├── 11-pitch-storyline/        # pitch-outline.md + investor-reaction.md
└── 12-pitch-deck/             # pitch-deck.pptx + demo-script.md
```

## Repo structure

```
bizidea-kickstart/                                  # this repo
├── .claude-plugin/
│   └── marketplace.json                            # marketplace catalog
├── plugins/
│   └── bizidea-kickstart/
│       ├── .claude-plugin/
│       │   └── plugin.json                         # plugin manifest
│       ├── commands/
│       │   └── bizidea-kickstart.md                # /bizidea-kickstart slash command
│       └── skills/
│           └── bizidea-kickstart/                  # the skill itself
│               ├── SKILL.md
│               ├── LICENSE
│               ├── references/                     # personas, foundations, 12 step guides
│               ├── assets/                         # 21 output templates + state schema
│               └── scripts/                        # init.sh, show-state.sh, next.sh
├── LICENSE
└── README.md
```

## Develop and test locally

Clone, then run Claude Code with the local plugin loaded:

```bash
git clone https://github.com/tharhtet/bizidea-kickstart.git
cd bizidea-kickstart
claude --plugin-dir ./plugins/bizidea-kickstart
```

Or add the marketplace from a local path:

```
/plugin marketplace add ./bizidea-kickstart
/plugin install bizidea-kickstart@tharhtet-skills
```

Then validate with:

```bash
claude plugin validate ./plugins/bizidea-kickstart
```

## Compatibility

- **Claude Code** — primary target. Slash command, skill, and scripts all work natively.
- **Claude.ai & Claude API (Skills API)** — the `skills/bizidea-kickstart/` folder is a valid agentskills.io skill on its own; you can upload it directly.
- **Agentskills.io-compatible clients** — the skill is spec-compliant (name ≤ 64 chars, description ≤ 1024 chars, progressive disclosure, no hardcoded paths).

## Methodology credits

- Steve Blank & Bob Dorf, *The Startup Owner's Manual*
- Eric Ries, *The Lean Startup*
- Rob Fitzpatrick, *The Mom Test*
- Alex Osterwalder & Yves Pigneur, *Business Model Generation* / *Value Proposition Design*

Derived from 6-week business idea hackathon curriculum for undergraduate students in Myanmar (Feb–Mar 2026). This workshop series is designed as an entrepreneurial flight simulator. The goal is was merely to "use AI," but to experience the full lifecycle of a startup—from a raw spark of an idea to a validated, high-fidelity pitch—using AI as a force multiplier. By offloading 80% of the manual "grunt work" to agentic tools, students can spend their energy on high-level strategic thinking and customer empathy.

## License

MIT. See `LICENSE`.

## Contributing

Issues and pull requests welcome. Good first contributions:

- New personas (critical or generative) with proposed step placements.
- Industry-specific template variants (B2B SaaS, consumer goods, deeptech).
- Translations of `references/personas.md` and `foundations.md`.
- Evaluation tests — see [How to evaluate this skill](#) (TODO: link to EVAL.md once added).

## Versioning

Semantic versioning. See `plugins/bizidea-kickstart/.claude-plugin/plugin.json` for current version.

- PATCH (1.0.x) — template fixes, typo corrections
- MINOR (1.x.0) — new personas, new templates, new step variations
- MAJOR (x.0.0) — breaking changes to state.yaml shape, step renaming, incompatible template changes
