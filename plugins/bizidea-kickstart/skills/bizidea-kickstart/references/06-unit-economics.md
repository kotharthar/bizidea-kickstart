# Step 06 · Unit Economics & Stress Test

Compute the math of survival. Then break it on purpose.

## Trigger phrases

"Run step 6", "unit economics", "CAC", "LTV", "CFO stress test", "math of survival".

## Preconditions

Step 05 complete. BMC exists with Revenue Streams and Cost Structure blocks filled.

## Inputs

- `05-bmc/bmc.md` — revenue streams and cost structure.
- `02-persona/persona.md` — audience size context for CAC reasoning.
- Optional: user's real numbers (if they've run any paid acquisition).

## Personas

1. **Unit Economics Analyst** — computes CAC, LTV, payback.
2. **Cynical CFO** — finds 3 leaks and runs 3 stress tests.

Both in `references/personas.md`.

## Procedure

1. **Unit Economics Analyst phase.** Ask the user for each input before computing. For any input they cannot provide, mark `PLACEHOLDER` and suggest a benchmark range from publicly known comparables (use `web_search` if the user agrees).
   Required inputs:
   - Average revenue per user (ARPU) per month
   - Gross margin % (revenue minus variable cost of serving that user)
   - Expected customer lifetime in months (or monthly churn %)
   - Marketing spend per month (estimated)
   - New customers acquired per month (estimated)
   Compute:
   - **CAC** = marketing spend / new customers
   - **LTV** = ARPU × gross margin × lifetime in months
   - **LTV:CAC ratio** (target: >3)
   - **Payback period** = CAC / (ARPU × gross margin) in months (target: <12)
2. Save the table and assumptions to `06-unit-economics/unit-economics.md`.
3. **Cynical CFO phase.** Identify 3 leaks where costs are understated or revenue overstated. Be specific — not "market risk" but "no support cost line item; at 5 min / ticket × 0.3 tickets per user / month this is $X". Run 3 stress tests:
   - CAC doubles (ad market gets more competitive)
   - Churn triples (the hack becomes obsolete or the category saturates)
   - ARPU drops 30% (competitive pricing pressure)
   For each stress, state whether LTV:CAC still exceeds 3. If not, the business breaks under that stress — name what would have to be true for it to survive.
4. Save to `06-unit-economics/cfo-stress-test.md`.
5. Update state.yaml: step 06 complete.
6. Tell the user: "Step 07 designs the three MVP screens on the happy path. Ready?"

## Output

Two files in `./<idea-slug>/06-unit-economics/`:
- `unit-economics.md` — from `assets/templates/unit-economics.md`
- `cfo-stress-test.md` — from `assets/templates/cfo-stress-test.md`

## Gotchas

- **Never invent numbers silently.** Every number in the table is either USER-PROVIDED, COMPUTED, or PLACEHOLDER (with benchmark source). The label goes in the table.
- **LTV:CAC > 3 is the threshold, not 1.** A business that breaks even on acquisition is not yet a business — it's covering marketing only, with no room for G&A, R&D, and profit.
- **Payback matters more than LTV for early-stage.** A $500 LTV business with 36-month payback dies of cash-flow before it sees the LTV. Flag payback >18 months hard.
- **Stress tests must name the mechanism.** "CAC doubles" is not useful; "Meta ad costs rose 80% Q3 2024 for this category per public data" makes the test real. Use `web_search` to find real benchmarks where possible.
