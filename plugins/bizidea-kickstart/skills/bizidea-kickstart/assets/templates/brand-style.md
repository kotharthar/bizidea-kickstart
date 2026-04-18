# Brand Style Guide

**Product:** <n>
**Positioning adjectives:** <3 words — e.g., "warm, precise, unhurried">

## Colour palette

| Role | Name | Hex | Rationale |
|---|---|---|---|
| Primary | <name> | `#` | <why this colour for this persona and promise> |
| Secondary | <name> | `#` | <why> |
| Accent | <name> | `#` | <why — and where it's used> |

Neutrals (not counted against the 3-colour limit):
- Text: `#1A1A1A`
- Surface: `#FFFFFF`
- Border / subtle: `#E5E7EB`

## Typography

| Role | Family | Source | Rationale |
|---|---|---|---|
| Display | <e.g., Space Grotesk> | Google Fonts | <why — voice match> |
| Body | <e.g., Inter> | Google Fonts | <why — readability> |

### Type scale (rems)

| Size | Rem | Pixel equiv | Use |
|---|---|---|---|
| sm | 0.875 | 14 | meta, captions |
| base | 1 | 16 | body |
| lg | 1.5 | 24 | subheads |
| xl | 2.5 | 40 | headlines |

## Spacing scale (rems)

| Step | Rem | Pixel equiv | Use |
|---|---|---|---|
| 1 | 0.5 | 8 | tight gaps |
| 2 | 1 | 16 | default padding |
| 3 | 2 | 32 | section spacing |
| 4 | 4 | 64 | major section separation |

## CSS custom properties (copy-paste)

```css
:root {
  --color-primary: #______;
  --color-secondary: #______;
  --color-accent: #______;
  --color-text: #1A1A1A;
  --color-surface: #FFFFFF;
  --color-border: #E5E7EB;

  --font-display: '<display>', system-ui, sans-serif;
  --font-body: '<body>', system-ui, sans-serif;

  --size-sm: 0.875rem;
  --size-base: 1rem;
  --size-lg: 1.5rem;
  --size-xl: 2.5rem;

  --space-1: 0.5rem;
  --space-2: 1rem;
  --space-3: 2rem;
  --space-4: 4rem;
}
```

## Image treatment

- **Style default:** <editorial photography / flat vector illustration / cinematic>
- **Palette wash:** <none / subtle primary tint / duotone>
- **Corner radius:** <0 / 8 / 16 px>

Linked prompts: see `nanobanana-prompts.md`.
