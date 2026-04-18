# Writing Gemini Nanobanana image prompts

This skill doesn't generate images. It writes prompts the user pastes into Gemini (where Nanobanana = the Gemini image-generation model). Quality here determines whether the landing page, brand assets, and pitch deck look professional or amateur.

Load this reference whenever a step invokes the **Art Director** persona.

## The 7-slot prompt structure

A strong Nanobanana prompt fills 7 slots in order. Skip a slot only when it genuinely doesn't apply.

1. **Subject** — who or what is in the frame. Specific: "a Burmese shop owner in her 40s", not "a person".
2. **Action** — what they are doing in this instant. "Laughing at a sales forecast on her tablet", not "using an app".
3. **Setting** — where. Concrete details: "behind the counter of a small tea shop in Yangon, jars of leaves visible in soft focus".
4. **Framing** — the camera's choice. "Medium close-up, shallow depth of field, subject slightly off-centre, 35mm lens equivalent".
5. **Lighting** — the mood-maker. "Warm late-afternoon light through a window to camera-left, soft shadows".
6. **Mood** — the emotion the viewer should feel. "Quietly optimistic, understated".
7. **Style tag** — photography vs. illustration, era, medium. "Editorial photography, natural colour grading, film grain".

## Style discipline

Pick one style and stick to it across a project. Mixing photorealism with flat illustration wrecks brand cohesion.

**Recommended defaults by asset type:**

| Asset | Default style |
|---|---|
| Hero / landing page above-the-fold | Editorial photography, natural colour |
| Feature illustrations | Flat vector illustration, 2-colour brand palette |
| Pitch-deck future-state slide | Cinematic photography, shallow depth of field |
| Social preview / OG image | Photography with brand-colour wash or flat vector |

## Three prompts per slot

Every Art Director request produces **three variations** per asset slot. This gives the user choice without overwhelming them. Vary one dimension per variation:

- V1: baseline
- V2: different framing (e.g., close-up instead of medium shot)
- V3: different lighting or mood (e.g., golden hour instead of midday)

## What to avoid

- **Generic subjects:** "a happy customer", "a business person". Always add age, culture, posture, clothing detail.
- **Abstract actions:** "using an app", "working on laptop". Always name the specific moment: "the instant she sees the forecast jump".
- **Stock-photo clichés:** handshakes over conference tables, people pointing at screens, laughing in an all-white room, lightbulb metaphors.
- **Brand name drops:** "an iPhone", "a MacBook". Use "a tablet", "a laptop".
- **Conflicting styles in one prompt:** "photorealistic illustration", "minimalist maximalism". Pick one.
- **Multiple subjects unless the pose is specified:** "a team of three people" without describing where each sits, what each is doing.

## Output format

Every Nanobanana prompt file follows this shape:

```markdown
## Asset slot: [name, e.g. "Hero image for landing page"]

**Purpose:** One sentence — why this image exists and where it lives.
**Brand cues:** Colours, mood, style pulled from 08-brand/brand-style.md.

### Variation 1 — [short label]
[full 7-slot prompt as a single paragraph]

### Variation 2 — [short label]
[full 7-slot prompt]

### Variation 3 — [short label]
[full 7-slot prompt]
```

## Worked example

**Asset slot:** Hero image for a sales-forecasting app landing page.
**Brand cues:** Palette warm neutrals with teal accent; mood quietly optimistic; photography style editorial.

**Variation 1 — The moment of relief**
> Medium close-up of a Burmese woman in her 40s behind the counter of her small tea shop, holding a tablet, smiling as she reads a line chart rising in the upper right. Jars of loose tea in soft focus behind her. Warm late-afternoon light from a window camera-left, shallow depth of field, 35mm lens. Quietly optimistic mood. Editorial photography, natural colour grading, subtle film grain.

**Variation 2 — Over-the-shoulder**
> Over-the-shoulder angle of the same shop owner, the tablet screen in sharp focus showing a rising forecast line; her face soft in the foreground. Afternoon light through wooden slats casting gentle stripes across the counter. Shallow depth of field, editorial photography, natural colour grading.

**Variation 3 — Golden-hour wide**
> Wide shot: a small tea shop at golden hour, one customer seated at a table, the owner standing behind the counter tapping a tablet; warm backlight flaring softly through the doorway. Cinematic framing, 50mm lens, editorial photography, warm palette.

## Dropping results back into the project

When the user returns with Nanobanana images, save them to the step's `images/` subfolder with filenames that match the variation label. The skill will reference these from `brand-style.md` and the pitch deck.
