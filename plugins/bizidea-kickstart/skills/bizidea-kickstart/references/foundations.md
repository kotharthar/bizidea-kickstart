# Methodological Foundations

This skill is an operating layer over five established frameworks from entrepreneurship, innovation, and design. Every step invokes one or more of them. Load this file when a step reference names a framework — or when a user asks *why* the pipeline is shaped this way.

The five foundations:

1. **Customer Development** — Blank / Dorf
2. **The Lean Startup / Build-Measure-Learn** — Ries
3. **The Mom Test** — Fitzpatrick
4. **Divergent + Convergent Thinking** — classic design thinking
5. **Business Model Canvas + Value Proposition Design** — Osterwalder / Pigneur

---

## 1. Customer Development (Blank)

A startup has two jobs: search for a business model, then execute it. Most failures come from trying to execute before the search is done.

**The four phases:**

1. **Customer Discovery** — do we understand the customer's problem? (Steps 01, 02)
2. **Customer Validation** — will customers buy? (Steps 03, 04)
3. **Customer Creation** — how do we generate demand at scale? (Steps 05, 06)
4. **Company Building** — how do we scale the organisation? (Out of scope for this skill — the pitch in step 12 is the bridge to this phase.)

**Key rule:** Get out of the building. Founders cannot discover the real problem sitting at a desk. This skill substitutes AI roleplay (Skeptical Target User in step 02) as preparation for real interviews — it does not replace them.

**Where this skill applies it:**
- Step 01's Market Analyst scrapes digital exhaust because real pain leaves real traces outside the office.
- Step 02 forces a Mom Test interview before any BMC or unit economics work.
- Step 04's smoke test is the Customer Validation gate — if it fails, the skill refuses to proceed to step 05.

---

## 2. Lean Startup — Build-Measure-Learn (Ries)

Every assumption is a hypothesis. Every hypothesis gets tested with the smallest possible experiment. Learn faster than your runway burns.

**The loop:**

```
Ideas ──Build──> Product ──Measure──> Data ──Learn──> Ideas
```

**The Riskiest Assumption Test:** the hypothesis that, if false, kills the business. Test this one first.

**Where this skill applies it:**
- Step 03 treats the top-3 ideas as hypotheses, not plans. Each survivor gets a "first test" rather than a roadmap.
- Step 04's smoke test *is* a Build-Measure-Learn cycle: build a landing page (smallest possible artefact), measure conversion, learn whether to persevere / iterate / pivot.
- Step 06's CFO stress test finds the riskiest number in the unit economics — the one that would kill the business if reality diverges from assumption.
- Step 09's Hack vs Engineer judgement keeps the MVP cheap enough to throw away.

**Pivot vs persevere:** A pivot is a change in strategy without a change in vision. The skill explicitly names this at the end of step 04. Persevere if signal is strong; iterate if mixed; pivot if absent.

---

## 3. The Mom Test (Fitzpatrick)

Even your mother will lie to you about whether your idea is good. Opinions are worthless; behavioural facts are gold.

**The three rules:**

1. Talk about their life, not your idea.
2. Ask about specifics in the past, not generics or opinions about the future.
3. Talk less, listen more.

**Question types:**

| Type | Shape | Value |
|---|---|---|
| Behavioural | "When was the last time you…?" | High — describes real past action |
| Hypothetical | "Would you use…?" | Low — intent is cheap |
| Leading | "Wouldn't it be great if…?" | Negative — produces false positives |

**Where this skill applies it:**
- Step 02's Skeptical Target User persona never volunteers a product opinion, forcing the interviewer into behavioural territory.
- Step 02's Mom Test Coach persona reviews the transcript and flags every leading question, rewriting them to behavioural form.
- Step 04's survey applies the same rules to written research — no Likert scales on intent, no "would you use this".

---

## 4. Divergent + Convergent Thinking

Creativity has two modes that must not be mixed. Mixing them kills both.

**Divergent** — generate widely, without filter. Quantity over quality. Norm violations welcome. Rule of thumb: if you haven't produced at least one idea that feels ridiculous, you haven't diverged enough.

**Convergent** — filter ruthlessly against explicit criteria. Kill your darlings. Quality over quantity.

```
  Divergent (open)                    Convergent (close)
  ↑                                   ↑
  20 ideas                            3 ideas
  absurd welcome                      criteria enforced
  no critique allowed                 critique required
```

**Where this skill applies it:**
- Step 03 makes the modes explicit and sequential: Radical Ideator (divergent, 20 ideas, no filtering) → Cynical VC (convergent, kill 17, defend 3).
- The two personas never run in the same phase. Divergent output is shown to the user before convergence begins.
- Step 08's Art Director produces 3 prompt variations per asset (divergent) before the user picks one (convergent).
- Step 11's Story Architect proposes, Investor in Seat 3 converges.

**Common failure:** compressing both modes into one conversation. The result is self-censored ideas filtered before they're spoken. The skill prevents this by requiring exactly 20 ideas before any critique is permitted.

---

## 5. Business Model Canvas + Value Proposition Design (Osterwalder)

A product is a feature. A business is an engine. The BMC maps the whole engine on one page across nine blocks:

**Right side (value, revenue-facing):**
- **Customer Segments** — for whom are we creating value?
- **Value Propositions** — what pain do we relieve or gain do we create?
- **Channels** — how do we reach them?
- **Customer Relationships** — what type of relationship do we maintain?
- **Revenue Streams** — what are customers willing to pay for?

**Left side (cost, operations-facing):**
- **Key Resources** — what assets are essential?
- **Key Activities** — what must we do well?
- **Key Partners** — who helps us?
- **Cost Structure** — what's the money going out?

**The Value Proposition Canvas zooms into one block** — the fit between Customer Segment and Value Proposition. Jobs, Pains, Gains on one side; Products & Services, Pain Relievers, Gain Creators on the other.

**Unit economics are the health check:**
- **LTV : CAC ≥ 3** — lifetime value must be at least 3× acquisition cost.
- **Payback < 12 months** — the business must recoup acquisition cost quickly enough to survive.

**Where this skill applies it:**
- Step 05's Business Strategist fills all 9 blocks, citing prior deliverables (UVP → Value Propositions, persona → Customer Segments, validation → Channels).
- Step 05's Industry Veteran sanity-checks each block against domain reality.
- Step 06 runs the unit-economics health check and the Cynical CFO's stress tests.
- Step 11 pulls from the BMC: Slide 5 Market, Slide 6 Competition, Slide 8 Model.

---

## How the foundations sequence across 12 steps

```
Steps 01–02 : Customer Discovery (Blank) + Mom Test (Fitzpatrick)
Steps 03    : Divergent → Convergent (design thinking)
Step  04    : Customer Validation (Blank) + Build-Measure-Learn (Ries)
Steps 05–06 : Business Model Canvas (Osterwalder) + unit economics
Steps 07–10 : MVP = smallest Build-Measure-Learn loop (Ries)
Steps 11–12 : Translate evidence into an investor narrative
```

Every deliverable in `./<idea-slug>/` is an artefact of one of these foundations. If a step's output has no foundation behind it, something's wrong — flag it to the user rather than shipping the deliverable.

---

## Attribution

- Steve Blank & Bob Dorf, *The Startup Owner's Manual* (2012).
- Eric Ries, *The Lean Startup* (2011).
- Rob Fitzpatrick, *The Mom Test* (2013).
- Alex Osterwalder & Yves Pigneur, *Business Model Generation* (2010); *Value Proposition Design* (2014).
- Classical divergent/convergent thinking: J.P. Guilford (1950s) and Graham Wallas's creative process; popularised in modern design thinking by IDEO and the Stanford d.school.

Full references available in the Strategyzer library: https://www.strategyzer.com/library
