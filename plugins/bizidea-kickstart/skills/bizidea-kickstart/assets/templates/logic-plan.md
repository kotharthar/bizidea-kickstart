# Logic Plan

**MVP context:** 3 screens from `07-mvp-visuals/user-journey.md`
**Magic Moment:** <the precise moment from the user journey>

## Function inventory

Every interaction across the 3 screens has at least one function. Each entry follows this shape:

### `functionName(args) → returnType`
- **Screen:** <1 / 2 / 3>
- **Triggered by:** <click / input change / page load>
- **Input:** <source of data — user input, state, API>
- **Process:** <what happens — plain English, 1–2 sentences>
- **Output:** <what changes in UI or state>
- **Implementation:** <local JS / fetch to <URL> / Anthropic API / pre-computed mock>

<!-- Example -->

### `generateForecast(salesHistory) → Forecast`
- **Screen:** 2
- **Triggered by:** Click on "Forecast next 7 days"
- **Input:** Last 30 days of sales from local state (seeded with mock data)
- **Process:** Send sales history + prompt to Anthropic API; parse JSON response into {date, units, confidence} array
- **Output:** Chart on screen 2 updates; success state becomes reachable
- **Implementation:** In-artifact Anthropic API call (no key needed)

<!-- Repeat for every function -->

## Data flow diagram

```
Screen 1          Screen 2                    Screen 3
[input form] ──> [generateForecast] ──> [renderChart] ──> [summary]
                        │
                        └──> (Anthropic API | mock)
```

## External dependencies

| Dependency | Why needed | Alternative if unavailable |
|---|---|---|
| Anthropic API (in-artifact) | Forecast generation | Pre-computed mock forecasts |
| <other> | <> | <> |

## State model

- What data lives in local state: <list>
- What persists across reloads: <list, or "nothing — demo is ephemeral">
- Reset behaviour: <reload clears everything / "Reset demo" button / etc>
