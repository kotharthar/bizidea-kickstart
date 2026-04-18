# Verification Checklist

**Tester:** <the user>
**Device(s) used:** <phone model, browser>
**Date:** <YYYY-MM-DD>

## Hello World (universal)

- [ ] Primary CTA on screen 1 does what it says
- [ ] Primary CTA on screen 2 does what it says
- [ ] Primary CTA on screen 3 does what it says
- [ ] Page reload does not crash any screen
- [ ] Layout looks right at 375px width (mobile)
- [ ] Layout looks right at 768px width (tablet)
- [ ] Layout looks right at 1440px width (desktop)
- [ ] Page loads in < 3 seconds on 4G simulation
- [ ] No console errors in browser dev tools

## Magic Moment specific

Add items here from `09-mvp-logic/logic-plan.md`. Each Magic Moment function should have at least one pass/fail check.

- [ ] <e.g., "Forecast generates and renders within 5 seconds">
- [ ] <e.g., "Changing input values regenerates the forecast">
- [ ] <e.g., "Success screen shows the correct summary of what was just forecasted">

## Squint Test (re-run now that logic is wired)

- [ ] Screen 1 — primary CTA is still visually loudest
- [ ] Screen 2 — primary CTA is still visually loudest
- [ ] Screen 3 — primary CTA is still visually loudest

## Touch targets

- [ ] All interactive elements ≥ 44×44 px
- [ ] No hover-only interactions

## Copy review

- [ ] Every headline is outcome-focused, not feature-focused
- [ ] No placeholder text ("Lorem ipsum", "Click here") remaining
- [ ] Button labels match what happens when clicked

## Failures

If any item fails, log it in `bug-log.md` with a proposed fix.
