#!/usr/bin/env bash
# bizidea-kickstart: scaffold a new idea project in the current directory.
# Usage: ./init.sh <idea-slug> [idea-name]
# Example: ./init.sh forecast-coffee "Forecast for Coffee Shops"

set -euo pipefail

SLUG="${1:-}"
NAME="${2:-$SLUG}"

if [[ -z "$SLUG" ]]; then
  echo "Usage: $0 <idea-slug> [idea-name]" >&2
  echo "Example: $0 forecast-coffee \"Forecast for Coffee Shops\"" >&2
  exit 1
fi

# Validate slug: lowercase alnum and hyphens only
if ! [[ "$SLUG" =~ ^[a-z0-9]([a-z0-9-]*[a-z0-9])?$ ]]; then
  echo "Error: slug must be lowercase alphanumeric with hyphens (no leading/trailing hyphen)" >&2
  exit 2
fi

if [[ -e "$SLUG" ]]; then
  echo "Error: ./$SLUG already exists" >&2
  exit 3
fi

mkdir -p "$SLUG"/{01-problem-hunt,02-persona,03-uvp,04-smoke-test,05-bmc,06-unit-economics,07-mvp-visuals,08-brand/images,09-mvp-logic,10-verification,11-pitch-storyline,12-pitch-deck/images}

NOW="$(date -u +'%Y-%m-%dT%H:%M:%SZ')"

cat > "$SLUG/state.yaml" <<EOF
idea_name: "$NAME"
idea_slug: "$SLUG"
created_at: "$NOW"
updated_at: "$NOW"
current_step: 0
last_completed_step: 0
steps:
  "01": { name: "Problem Hunt",              status: pending, deliverables: [] }
  "02": { name: "Persona & Mom Test",        status: pending, deliverables: [] }
  "03": { name: "UVP & Divergent Thinking",  status: pending, deliverables: [] }
  "04": { name: "Smoke Test",                status: pending, deliverables: [] }
  "05": { name: "Business Model Canvas",     status: pending, deliverables: [] }
  "06": { name: "Unit Economics",            status: pending, deliverables: [] }
  "07": { name: "MVP Visuals",               status: pending, deliverables: [] }
  "08": { name: "Brand & Assets",            status: pending, deliverables: [] }
  "09": { name: "MVP Logic",                 status: pending, deliverables: [] }
  "10": { name: "Verification",              status: pending, deliverables: [] }
  "11": { name: "Pitch Storyline",           status: pending, deliverables: [] }
  "12": { name: "Pitch Deck & Demo",         status: pending, deliverables: [] }
EOF

echo "Scaffolded ./$SLUG/ with 12 step folders and state.yaml"
echo "Next: run step 01 (Problem Hunt)."
