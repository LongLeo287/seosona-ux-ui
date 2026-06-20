# Skill: Color Theory For Web Design
# UX-UI System — 2_KNOWLEDGE/skills/color-theory.md

---

## Core Concepts

### Color Psychology Quick Reference

| Color Family | Psychological Effect | Common Industry Use |
|---|---|---|
| **Blue** | Trust, reliability, competence | Finance, tech, B2B, healthcare |
| **Green** | Growth, safety, money, health | Fintech, sustainability, healthcare |
| **Navy/Dark blue** | Authority, professionalism | Enterprise, consulting |
| **Orange/Red** | Energy, urgency, excitement | Consumer, eCommerce, food |
| **Purple** | Creativity, luxury, wisdom | Beauty, tech, education |
| **Gold/Yellow** | Premium, optimism, caution | Luxury, F&B, warnings |
| **Black** | Sophistication, power, luxury | Fashion, luxury, automotive |
| **White** | Cleanliness, simplicity | Healthcare, minimal, tech |
| **Gray** | Neutral, professional | Any industry (backgrounds) |

---

## Palette Construction

### 60-30-10 Rule
```
60% — Dominant (background, main canvas)
30% — Secondary (sections, cards, surfaces)
10% — Accent (CTAs, links, highlights)
```

### Palette Anatomy

Every production palette must contain:

```css
/* Required slots */
--color-bg-base:      /* page background */
--color-bg-surface:   /* card/section background */
--color-text-primary: /* headings, important text */
--color-text-body:    /* body copy */
--color-text-muted:   /* captions, placeholders */
--color-accent-primary: /* brand color, CTAs */
--color-accent-hover: /* accent hover state */
--color-border:       /* dividers, outlines */

/* Semantic slots (required) */
--color-success: /* #10B981 or similar green */
--color-warning: /* #F59E0B or similar amber */
--color-error:   /* #EF4444 or similar red */
--color-info:    /* #3B82F6 or similar blue */
```

---

## Contrast & Accessibility

### Required Ratios (WCAG 2.1 AA)
| Text Type | Min Ratio | Test Tool |
|---|---|---|
| Normal body text (< 18px) | **4.5:1** | WebAIM Contrast Checker |
| Large text (≥ 18px regular, ≥ 14px bold) | **3:1** | WebAIM Contrast Checker |
| UI components & icons | **3:1** | |

### Common Contrast Mistakes
- Gray text (#94A3B8) on white fails at < 18px
- Light blue (#60A5FA) on white fails for body text
- White text on medium-blue (#3B82F6) — check at actual font size used
- Always test the **actual** computed color, not the token value

### Contrast Calculator Formula
```
Relative luminance L = 0.2126R + 0.7152G + 0.0722B
Ratio = (L1 + 0.05) / (L2 + 0.05)  where L1 is lighter
```
(Use a tool — don't calculate manually)

---

## Color Modes

### Light Theme Pattern
```
Background:  #FFFFFF / #F8FAFC
Surface:     #F1F5F9
Text:        #04091A (near-black, not pure black)
Body text:   #64748B (slate-500)
Borders:     #E2E8F0
```

### Dark Theme Pattern
```
Background:  #0A0F1E / #0F172A
Surface:     #1E293B
Text:        #F1F5F9 (near-white, not pure white)
Body text:   #94A3B8
Borders:     rgba(148, 163, 184, 0.1)
Accent glow: rgba(accent-color, 0.15–0.2) for shadows
```

---

## Choosing Accent Colors

### For B2B / Professional
- Blue family: `#1D4ED8` (blue-700) — safe, trustworthy
- Avoid: bright colors that feel consumer-y

### For Consumer / B2C
- Orange: `#F97316` — energetic, approachable
- Coral: `#F87171` — warm, friendly
- Avoid: very dark or desaturated accents

### For Luxury / Premium
- Gold: `#C9A84C` — aspirational
- Deep navy: `#1E3A5F` — authority
- Avoid: bright saturated colors

### For Healthcare
- Blue: `#0077CC` — calming, medical
- Teal: `#00A099` — fresh, modern health
- Avoid: red (associated with danger/blood)

---

## Color Harmony Systems

| System | Formula | Best For |
|---|---|---|
| **Monochromatic** | Same hue, different lightness | Minimalist, sophisticated |
| **Analogous** | Adjacent hues on wheel | Harmonious, natural |
| **Complementary** | Opposite hues (e.g. blue + orange) | High contrast, energetic |
| **Triadic** | Three evenly spaced hues | Vibrant, playful |
| **Split-complementary** | Hue + two adjacent to complement | Balance of energy + harmony |

**Most web UIs use:** Monochromatic (grays) + one accent (complementary)

---

## Gradient Best Practices

```css
/* Do: Subtle, directional gradients */
background: linear-gradient(135deg, #1D4ED8 0%, #7C3AED 100%);

/* Do: Radial glow for dark themes */
background: radial-gradient(ellipse at 50% 0%, rgba(59, 130, 246, 0.15), transparent 70%);

/* Do: Subtle background texture */
background: linear-gradient(180deg, #F8FAFC 0%, #FFFFFF 100%);

/* Don't: Rainbow gradients on text unless decorative headline */
/* Don't: Too many gradient directions on same page */
/* Don't: Low-contrast gradient (light on light) */
```
