# Unit Economics

**Date:** <YYYY-MM-DD>
**Currency:** <USD / MMK / THB>

## Inputs

Every input is labelled: **USER-PROVIDED**, **BENCHMARK** (with source), or **PLACEHOLDER**.

| Input | Value | Label | Source / note |
|---|---|---|---|
| ARPU (revenue per user / month) | | | |
| Gross margin % | | | |
| Expected lifetime (months) | | | |
| Monthly churn % (alternative to lifetime) | | | |
| Marketing spend per month | | | |
| New customers per month | | | |

## Computed metrics

| Metric | Formula | Value |
|---|---|---|
| **CAC** | marketing spend ÷ new customers | <$X> |
| **LTV** | ARPU × gross margin × lifetime | <$X> |
| **LTV : CAC ratio** | LTV ÷ CAC | <X.X> |
| **Payback period (months)** | CAC ÷ (ARPU × gross margin) | <X.X> |

## Health check

- [ ] LTV : CAC ≥ 3 (viable unit economics)
- [ ] Payback < 12 months (cash-flow healthy for a startup)
- [ ] Gross margin ≥ 50% (software-like; adjust if hardware or services)

## Sensitivity

Show the numbers at ±20% on the two most-uncertain inputs:

| Scenario | CAC | LTV | LTV:CAC | Payback |
|---|---|---|---|---|
| Base | | | | |
| ARPU −20% | | | | |
| ARPU +20% | | | | |
| Churn ×1.5 | | | | |
| Churn ÷1.5 | | | | |

## Notes and caveats

<Anything the analyst wants the user to remember — e.g., "lifetime assumes 18 months; if real churn is 8%/month, lifetime drops to 12 months and the unit economics stop working">
