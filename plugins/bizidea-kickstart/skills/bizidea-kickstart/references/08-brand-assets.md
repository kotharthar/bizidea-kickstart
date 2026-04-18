# Step 08 · Brand & Assets

Define the design tokens. Write Nanobanana prompts for every image the product needs.

## Trigger phrases

"Run step 8", "brand", "style guide", "design tokens", "Nanobanana prompts", "image prompts", "brand assets".

## Preconditions

Step 07 complete. Three screens exist even if rough.

## Inputs

- `03-uvp/uvp.md` — the product's promise (drives mood).
- `02-persona/persona.md` — audience (drives tone).
- `07-mvp-visuals/user-journey.md` — where assets will live.

## Personas

1. **Brand Designer** — produces the design token set.
2. **Art Director** — writes Nanobanana prompts for every image slot.

Both in `references/personas.md`. Art Director requires loading `references/nanobanana-prompting.md`.

## Procedure

1. **Brand Designer phase.** Propose:
   - **3-colour palette** with hex codes and roles (primary, secondary, accent). Justify each against persona and UVP.
   - **2 font families** (display + body) from Google Fonts. Justify readability and personality.
   - **4-size type scale** in rems (e.g., 0.875 / 1 / 1.5 / 2.5).
   - **4-step spacing scale** in rems (e.g., 0.5 / 1 / 2 / 4).
   Output as a design tokens table and a ready-to-paste CSS custom-properties block.
2. Save to `08-brand/brand-style.md` using the template.
3. **Art Director phase.** Load `references/nanobanana-prompting.md`. Identify the image slots the product needs:
   - Hero for the landing page (step 04 and step 07 entry screen)
   - Feature illustration (for the Magic Moment screen, if applicable)
   - Success-state illustration (optional)
   - Social preview / OG image (1200×630)
   For each slot, write three prompt variations using the 7-slot structure (Subject · Action · Setting · Framing · Lighting · Mood · Style tag).
4. Save to `08-brand/nanobanana-prompts.md`.
5. Tell the user: "Paste these prompts into Gemini (Nanobanana). Drop the images you like into `08-brand/images/` with filenames matching the variation label. Then we can proceed to step 09."
6. Update state.yaml: step 08 complete once prompts are written (images come later, from the user).

## Output

Two files and one folder in `./<idea-slug>/08-brand/`:
- `brand-style.md` — from `assets/templates/brand-style.md`
- `nanobanana-prompts.md` — from `assets/templates/nanobanana-prompts.md`
- `images/` — empty at first; user drops Nanobanana outputs here

## Gotchas

- **Max 3 colours, not 3-ish.** A 4-colour palette is not a brand, it's a preference. Enforce the ceiling.
- **Google Fonts only.** Licensing and delivery are solved. No Adobe Fonts, no "I'll buy a license later".
- **Every Nanobanana prompt needs 3 variations.** One variation gives the user no real choice. Three gives them enough to pick without overwhelm.
- **Link brand back to persona.** A rugged outdoor product should not end up with pastel colours just because they're trendy. Every token choice should be defended against the persona file.
- **Do not attempt to generate images.** This skill only writes prompts. Generation is the user's external step in Gemini.
