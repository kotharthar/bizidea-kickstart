# Changelog

All notable changes to this plugin are documented here.
The format follows [Keep a Changelog](https://keepachangelog.com/) and this project adheres to [Semantic Versioning](https://semver.org/).

## [1.0.0] — 2026-04-18

### Added

- Initial release as Claude Code plugin with marketplace distribution.
- 12-step pipeline from raw idea to investor-ready pitch.
- 25 personas organized into generative + adversarial pairs.
- Methodological grounding in 5 established frameworks:
  - Customer Development (Blank / Dorf)
  - Lean Startup / Build-Measure-Learn (Ries)
  - The Mom Test (Fitzpatrick)
  - Divergent + Convergent thinking (design thinking)
  - Business Model Canvas + Value Proposition Design (Osterwalder / Pigneur)
- `/bizidea-kickstart` slash command with 6 dispatch cases.
- 21 output templates covering every deliverable across the 12 steps.
- 3 shell scripts: `init.sh`, `show-state.sh`, `next.sh`.
- `references/foundations.md` anchoring the pipeline to its source methodology.
- Gemini Nanobanana image-prompt workflow (steps 08, 11).
- Composition hooks for `pptx` (step 12) and `frontend-design` (steps 04, 07, 09) skills.
- agentskills.io-compliant SKILL.md (name, description, license, compatibility, metadata all within spec limits).
