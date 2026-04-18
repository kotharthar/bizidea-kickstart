#!/usr/bin/env bash
# bizidea-kickstart: show progress for the current project.
# Usage: run from inside a project folder (containing state.yaml), or pass folder as arg.
# Example: ./show-state.sh           # uses $PWD
#          ./show-state.sh forecast-coffee

set -euo pipefail

DIR="${1:-.}"
STATE="$DIR/state.yaml"

if [[ ! -f "$STATE" ]]; then
  echo "Error: no state.yaml at $STATE" >&2
  echo "Hint: run init.sh first, or cd into a project folder." >&2
  exit 1
fi

# Parse without requiring yq — grep the fields we need.
NAME=$(grep -E '^idea_name:' "$STATE" | sed -E 's/idea_name:\s*"?([^"]+)"?/\1/')
SLUG=$(grep -E '^idea_slug:' "$STATE" | sed -E 's/idea_slug:\s*"?([^"]+)"?/\1/')
CURRENT=$(grep -E '^current_step:' "$STATE" | awk '{print $2}')

echo "============================================================"
echo "  $NAME  ($SLUG)"
echo "  Current step: $CURRENT / 12"
echo "============================================================"
echo ""

# Print each step line. POSIX-portable: grep the step lines, sed the fields.
grep -E '^  "[0-9]+": \{' "$STATE" | while IFS= read -r line; do
  num=$(printf '%s\n' "$line" | sed -nE 's/^  "([0-9]+)":.*/\1/p')
  nm=$(printf '%s\n'  "$line" | sed -nE 's/.*name: "([^"]*)".*/\1/p')
  st=$(printf '%s\n'  "$line" | sed -nE 's/.*status: ([a-z_]+).*/\1/p')
  case "$st" in
    complete)    icon="[x]" ;;
    in_progress) icon="[~]" ;;
    skipped)     icon="[-]" ;;
    *)           icon="[ ]" ;;
  esac
  printf "  %s %s  %-28s  %s\n" "$icon" "$num" "$nm" "$st"
done

echo ""
echo "Legend:  [x] complete   [~] in progress   [ ] pending   [-] skipped"
