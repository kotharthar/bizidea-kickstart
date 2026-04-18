#!/usr/bin/env bash
# Structural validation for the bizidea-kickstart repo.
# Checks plugin manifest, marketplace manifest, SKILL.md frontmatter, file layout.
# Run from repo root before pushing.

set -u  # but not -e — we want to collect all failures

FAIL=0
PASS=0

pass() { printf "  \033[32m✓\033[0m %s\n" "$1"; PASS=$((PASS+1)); }
fail() { printf "  \033[31m✗\033[0m %s\n" "$1"; FAIL=$((FAIL+1)); }

header() { printf "\n\033[1m%s\033[0m\n" "$1"; }

header "Repo layout"

[[ -f .claude-plugin/marketplace.json ]] && pass "marketplace.json at repo root" || fail ".claude-plugin/marketplace.json missing"
[[ -f plugins/bizidea-kickstart/.claude-plugin/plugin.json ]] && pass "plugin.json at plugin root" || fail "plugins/bizidea-kickstart/.claude-plugin/plugin.json missing"
[[ -f plugins/bizidea-kickstart/skills/bizidea-kickstart/SKILL.md ]] && pass "SKILL.md at skill root" || fail "plugins/bizidea-kickstart/skills/bizidea-kickstart/SKILL.md missing"
[[ -f plugins/bizidea-kickstart/commands/bizidea-kickstart.md ]] && pass "/bizidea-kickstart slash command exists" || fail "plugins/bizidea-kickstart/commands/bizidea-kickstart.md missing"
[[ -f README.md ]] && pass "README.md present" || fail "README.md missing"
[[ -f LICENSE ]] && pass "LICENSE present" || fail "LICENSE missing"

header "plugin.json validity"

if command -v python3 >/dev/null 2>&1; then
  python3 - <<'PY'
import json, sys
with open("plugins/bizidea-kickstart/.claude-plugin/plugin.json") as f:
    try:
        data = json.load(f)
    except json.JSONDecodeError as e:
        print(f"  \033[31m✗\033[0m plugin.json is not valid JSON: {e}")
        sys.exit(1)

ok = True
for field in ("name", "description", "version"):
    if field not in data:
        print(f"  \033[31m✗\033[0m plugin.json missing required field: {field}")
        ok = False
    else:
        print(f"  \033[32m✓\033[0m plugin.json has {field}: {data[field] if field != 'description' else data[field][:60] + '...'}")

name = data.get("name", "")
import re
if not re.fullmatch(r'[a-z0-9]([a-z0-9-]*[a-z0-9])?', name):
    print(f"  \033[31m✗\033[0m plugin.json name must be kebab-case (lowercase alnum and hyphens): '{name}'")
    ok = False
else:
    print(f"  \033[32m✓\033[0m plugin.json name is valid kebab-case")

sys.exit(0 if ok else 1)
PY
  [[ $? -eq 0 ]] && PASS=$((PASS+1)) || FAIL=$((FAIL+1))
else
  fail "python3 not found — cannot validate plugin.json"
fi

header "marketplace.json validity"

if command -v python3 >/dev/null 2>&1; then
  python3 - <<'PY'
import json, sys
with open(".claude-plugin/marketplace.json") as f:
    try:
        data = json.load(f)
    except json.JSONDecodeError as e:
        print(f"  \033[31m✗\033[0m marketplace.json is not valid JSON: {e}")
        sys.exit(1)

ok = True
for field in ("name", "owner", "plugins"):
    if field not in data:
        print(f"  \033[31m✗\033[0m marketplace.json missing required field: {field}")
        ok = False
    else:
        print(f"  \033[32m✓\033[0m marketplace.json has {field}")

reserved = {"claude-code-marketplace", "claude-code-plugins", "claude-plugins-official",
            "anthropic-marketplace", "anthropic-plugins", "agent-skills",
            "knowledge-work-plugins", "life-sciences"}
if data.get("name") in reserved:
    print(f"  \033[31m✗\033[0m marketplace.json name '{data['name']}' is RESERVED by Anthropic")
    ok = False
else:
    print(f"  \033[32m✓\033[0m marketplace.json name is not reserved")

plugins = data.get("plugins", [])
if len(plugins) == 0:
    print(f"  \033[31m✗\033[0m marketplace.json has no plugins listed")
    ok = False
else:
    print(f"  \033[32m✓\033[0m marketplace.json lists {len(plugins)} plugin(s)")
    for p in plugins:
        if "name" not in p or "source" not in p:
            print(f"  \033[31m✗\033[0m plugin entry missing 'name' or 'source': {p}")
            ok = False

sys.exit(0 if ok else 1)
PY
  [[ $? -eq 0 ]] && PASS=$((PASS+1)) || FAIL=$((FAIL+1))
else
  fail "python3 not found — cannot validate marketplace.json"
fi

header "SKILL.md frontmatter"

SKILL="plugins/bizidea-kickstart/skills/bizidea-kickstart/SKILL.md"
if [[ -f "$SKILL" ]]; then
  # Extract frontmatter between the first pair of --- lines
  FM=$(awk '/^---$/{c++; next} c==1' "$SKILL")
  if echo "$FM" | grep -q '^name:'; then pass "SKILL.md has name"; else fail "SKILL.md missing name"; fi
  if echo "$FM" | grep -q '^description:'; then pass "SKILL.md has description"; else fail "SKILL.md missing description"; fi

  # Description length check (spec: 1-1024 chars)
  DESC=$(echo "$FM" | awk '/^description:/{flag=1; sub(/^description:[ ]*/,""); print; next} flag && /^  /{sub(/^  /,""); print; next} flag{exit}' | tr '\n' ' ')
  DLEN=${#DESC}
  if [[ $DLEN -ge 1 && $DLEN -le 1024 ]]; then
    pass "description length $DLEN chars (within 1-1024)"
  else
    fail "description length $DLEN chars (spec requires 1-1024)"
  fi

  # SKILL.md line count (spec recommends <500)
  LINES=$(wc -l < "$SKILL")
  if [[ $LINES -lt 500 ]]; then
    pass "SKILL.md is $LINES lines (under 500-line guideline)"
  else
    fail "SKILL.md is $LINES lines (spec recommends <500; consider moving content to references/)"
  fi
else
  fail "SKILL.md not found at $SKILL"
fi

header "Slash command frontmatter"

CMD="plugins/bizidea-kickstart/commands/bizidea-kickstart.md"
if [[ -f "$CMD" ]]; then
  FM=$(awk '/^---$/{c++; next} c==1' "$CMD")
  if echo "$FM" | grep -q '^description:'; then
    pass "command has description frontmatter"
  else
    fail "command missing description frontmatter"
  fi
fi

header "Hardcoded paths"

# Should not reference absolute paths that only exist on the author's machine
if grep -rEq '(/Users/|/home/[a-z]+/|C:\\\\)' plugins/bizidea-kickstart/ 2>/dev/null; then
  fail "hardcoded absolute paths found in plugin"
  grep -rEn '(/Users/|/home/[a-z]+/|C:\\\\)' plugins/bizidea-kickstart/ | head -5
else
  pass "no hardcoded absolute paths"
fi

header "Parent-dir references"

if grep -rEq '\.\./\.\.' plugins/bizidea-kickstart/ 2>/dev/null; then
  fail "found '../..' references — plugins are copied to cache and these break"
else
  pass "no parent-dir references outside plugin"
fi

echo ""
echo "============================================================"
printf "  Passed: \033[32m%d\033[0m   Failed: \033[31m%d\033[0m\n" "$PASS" "$FAIL"
echo "============================================================"
echo ""

if [[ $FAIL -gt 0 ]]; then
  echo "Fix the failures above, then re-run ./validate.sh"
  exit 1
fi

echo "All structural checks passed. You can now:"
echo "  1. Test locally:  claude --plugin-dir ./plugins/bizidea-kickstart"
echo "  2. Validate with Claude Code:  claude plugin validate ./plugins/bizidea-kickstart"
echo "  3. Push to GitHub and install:"
echo "       /plugin marketplace add <your-username>/bizidea-kickstart"
echo "       /plugin install bizidea-kickstart@tharhtet-skills"
