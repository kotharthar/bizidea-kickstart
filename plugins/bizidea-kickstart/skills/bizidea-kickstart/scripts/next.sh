#!/usr/bin/env bash
# bizidea-kickstart: print what step N+1 needs.
# Usage: ./next.sh [project-folder]

set -euo pipefail

DIR="${1:-.}"
STATE="$DIR/state.yaml"

if [[ ! -f "$STATE" ]]; then
  echo "Error: no state.yaml at $STATE" >&2
  exit 1
fi

CURRENT=$(grep -E '^current_step:' "$STATE" | awk '{print $2}')
NEXT=$((CURRENT + 1))

if (( NEXT > 12 )); then
  echo "Pipeline complete. All 12 steps finished."
  echo "Your pitch deck should be at: $DIR/12-pitch-deck/pitch-deck.pptx"
  exit 0
fi

# Lookup table of what each step needs as input and what persona runs first.
case "$NEXT" in
  1)  TITLE="Problem Hunt"
      NEEDS="A domain of interest (industry, region, or audience)."
      FIRST="Market Analyst will scan digital exhaust for recurring pain."
      ;;
  2)  TITLE="Persona & Mom Test"
      NEEDS="Step 01 complete. Chosen problem from bleeding-neck-report.md."
      FIRST="Draft a detailed persona, then you roleplay the founder interviewing a Skeptical Target User."
      ;;
  3)  TITLE="UVP & Divergent Thinking"
      NEEDS="Step 02 complete. Persona + interview signals."
      FIRST="Radical Ideator will generate 20 ideas. Cynical VC will kill 17."
      ;;
  4)  TITLE="Smoke Test"
      NEEDS="Step 03 complete. UVP written."
      FIRST="Survey Designer + Growth Copywriter produce survey and landing page."
      ;;
  5)  TITLE="Business Model Canvas"
      NEEDS="Step 04 complete with PERSEVERE verdict."
      FIRST="Business Strategist fills the 9 blocks. Industry Veteran checks each for naivety."
      ;;
  6)  TITLE="Unit Economics"
      NEEDS="Step 05 complete. BMC with Revenue and Cost blocks filled."
      FIRST="Unit Economics Analyst will ask for your CAC, ARPU, churn. Cynical CFO stress-tests."
      ;;
  7)  TITLE="MVP Visuals"
      NEEDS="Step 06 complete. Unit economics survive at least 2 of 3 stresses."
      FIRST="Product Designer specs the 3 happy-path screens. Frontend-design skill renders them."
      ;;
  8)  TITLE="Brand & Assets"
      NEEDS="Step 07 complete. 3 screens exist (even rough)."
      FIRST="Brand Designer produces tokens. Art Director writes Nanobanana prompts for Gemini."
      ;;
  9)  TITLE="MVP Logic"
      NEEDS="Step 07 complete. Step 08 recommended (tokens ready)."
      FIRST="Product Engineer maps logic as Input -> Process -> Output. Tech Debt Judge decides HACK vs ENGINEER."
      ;;
  10) TITLE="Verification"
      NEEDS="Step 09 complete. Screens have wired logic."
      FIRST="QA Tester builds a checklist. Naive Fresh User narrates a 60-second cold walkthrough."
      ;;
  11) TITLE="Pitch Storyline"
      NEEDS="Step 10 complete. MVP verified."
      FIRST="Story Architect drafts the 10-slide outline. Investor in Seat 3 reacts slide by slide."
      ;;
  12) TITLE="Pitch Deck & Demo"
      NEEDS="Step 11 complete. Nanobanana images (if any) dropped into 12-pitch-deck/images/."
      FIRST="Deck Designer renders the pptx via the pptx skill. Rehearsal Coach writes speaker notes and Q&A prep."
      ;;
esac

echo "Next: Step $NEXT — $TITLE"
echo ""
echo "Prerequisites:  $NEEDS"
echo "First action:   $FIRST"
echo ""
echo "To run, ask Claude: \"run step $NEXT\" or \"$TITLE\"."
