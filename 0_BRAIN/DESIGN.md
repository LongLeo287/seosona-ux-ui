# DESIGN.md — Visual Design Context
# UX-UI System — 0_BRAIN/DESIGN.md
#
# PURPOSE: This file defines the visual design language of the UX-UI system.
# Every agent MUST read this before building any UI component or template.
# Inspired by: designmd.ai — DESIGN.md for AI agents

---

## Design Philosophy

**"Professional restraint over visual noise."**

This system produces interfaces that feel:
- **Premium and polished** — not cheap or rushed
- **Confident and clear** — not cluttered or confusing  
- **Alive but not distracting** — motion serves function
- **Universally readable** — WCAG AA minimum, always

---

## Visual Personality

| Dimension | Choice | Why |
|---|---|---|
| **Density** | Spacious | Breathing room = premium signal |
| **Contrast** | High | Clarity and accessibility |
| **Animation** | Subtle, purposeful | Enhance — don't distract |
| **Typography** | Geometric sans | Modern, trustworthy, clean |
| **Shape language** | Rounded (radius-full for pills, 1rem+ for cards) | Friendly, approachable |
| **Color range** | Restrained (1 accent + neutrals) | Focus, no chaos |

---

## Typography System

**Default pairing: Poppins + Inter**

| Role | Family | Weight | Size | Tracking |
|---|---|---|---|---|
| H1 (hero) | Poppins | 900 | clamp(2.75rem, 6vw, 4.5rem) | -0.03em |
| H2 (section) | Poppins | 800 | clamp(1.75rem, 3vw, 2.5rem) | -0.02em |
| H3 (card) | Poppins | 700 | 1.0625rem–1.25rem | 0 |
| Body | Inter | 400 | 1rem (16px) | 0 |
| Label/overline | Inter | 700 | 0.75rem | +0.08em |
| Button | Inter | 600 | 0.9375rem–1rem | 0 |
| Caption | Inter | 400 | 0.8125rem | 0 |

---

## Color System

### Light Theme (default)
```
Background:  #FFFFFF / #F8FAFC (sections)
Surface:     #F1F5F9
Text:        #04091A (not pure black — softer)
Body text:   #64748B (slate-500)
Accent:      #1D4ED8 (blue-700)
Border:      #E2E8F0
```

### Dark Theme
```
Background:  #040C1B
Surface:     #071221
Elevated:    #0D1F38
Text:        #F0F6FF
Body text:   #8FAFC8
Accent:      #3B82F6
Border:      rgba(59,130,246,0.12)
```

### Accent Color Override
- Each project overrides `--color-accent` in `brand/palette.css`
- See palette selection matrix in `brand-identity-designer.md`

---

## Spacing Rhythm

Based on 4px grid:
```
Component internal:  1.5rem (24px) padding minimum
Between elements:    0.75rem (12px) minimum gap
Between cards:       1.25rem (20px)
Section padding:     5rem (80px) top + bottom
Container max:       1280px with 1.5rem horizontal padding
```

---

## Border Radius Scale

```
Inputs / small elements: 0.5rem (8px)
Buttons (standard):      9999px (pill) — modern SaaS standard
Cards:                   1rem–1.5rem (16–24px)
Large blocks/modals:     2rem (32px)
Full circle (avatars):   9999px
```

---

## Shadow System

- **Light theme:** Subtle, low opacity (never pure black)
- **Dark theme:** Glow-based (colored accent shadow preferred)
- **Hover state:** Lift shadow (translateY -4px + shadow-md)
- **Featured/CTA:** Accent glow shadow

---

## Animation Language

| Type | Easing | Duration |
|---|---|---|
| Entrance (scroll) | easeOutQuart | 400–700ms |
| Hero timeline | easeOutQuart | 80ms stagger |
| Hover lift | cubic-bezier(0.25,0.46,0.45,0.94) | 300ms |
| Counter rollup | easeOutQuart | 1800ms |
| Page transition | easeOutQuart | 350ms |
| Looping / pulse | easeInOutSine | 2000ms |

**Rule: Always check prefers-reduced-motion. No animation is required.**

---

## Component Design Defaults

```
Button shape:   Pill (border-radius: 9999px)
Button size:    min-height 44px, min-width 120px
Card shape:     1.25rem border-radius
Card hover:     translateY(-4px) + shadow
Nav height:     64px (4rem)
Section max:    1280px container
Text max:       68ch for long-form paragraphs
```

---

## What This System Does NOT Do

```
❌ Use Tailwind utilities directly in HTML (use CSS custom properties)
❌ Use jQuery or legacy DOM libraries
❌ Hardcode brand colors (always use CSS variables)
❌ Produce Lorem Ipsum placeholders
❌ Build React/Vue components (HTML+CSS+Vanilla JS only)
❌ Generate server-side code (frontend only)
❌ Lock to any single brand (brand-agnostic by design)
```

---

## Reference Workflow

Before building any UI, agents must:

1. Read `0_BRAIN/MASTER_INDEX.md` → understand system layout
2. Read `0_BRAIN/DESIGN.md` → (this file) understand visual language
3. Read `0_BRAIN/rules/` → understand code standards
4. Run `3_WORKFLOWS/workflows/design-from-brief.md` → follow the workflow
5. Pull components from `4_LIBRARY/` → never build from scratch what exists
