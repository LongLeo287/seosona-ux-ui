# Component Build Pipeline
# Input: Component specification → Output: Reusable HTML/CSS/JS component

---

## Pipeline Metadata

- **Agents:** `ui-ux-designer` + `frontend-motion-designer`
- **Output:** `4_LIBRARY/components/{type}/{name}.html`
- **Duration:** 30–90 minutes per component
- **Trigger:** "build component", "create [nav/hero/card/form/footer] component"

---

## Stage 1: Spec & Lookup

```
1.1 Identify component type: navigation | hero | features | cards | forms | social-proof | cta | footer
1.2 CHECK FIRST: Does this component already exist in 4_LIBRARY/components/{type}/?
    → If yes: customize existing, do not rebuild from scratch
    → If no: proceed to Stage 2
1.3 Define variants needed (e.g. hero: centered | split | video-bg)
1.4 Define states needed: default | hover | focus | active | disabled | loading
```

---

## Stage 2: Structure (HTML)

```
2.1 Write semantic HTML structure
    - Use correct semantic element (section, nav, article, etc.)
    - Add ARIA where needed
    - Add data-animate hooks for scroll animations
    - Add unique IDs on interactive elements
    - Add data-counter on stat numbers

2.2 Naming convention:
    Block: .component-name
    Element: .component-name__element
    Modifier: .component-name--variant

2.3 Include in HTML file:
    - Standalone HTML (self-contained for preview)
    - Google Fonts import at top
    - Inline CSS custom properties (no external palette dependency)
    - Anime.js CDN if animated
    - Lucide Icons CDN if using icons
```

---

## Stage 3: Style (CSS)

```
3.1 Only CSS custom properties for colors (var(--color-*))
3.2 Mobile-first: base styles at 375px, then min-width media queries
3.3 All interactive states: :hover, :focus-visible, :active
3.4 Transitions using: transition: var(--transition) or specific properties
3.5 No absolute units for font sizes — use rem
3.6 Test at: 320px, 375px, 640px, 768px, 1024px, 1280px, 1440px
```

---

## Stage 4: Animate (optional — frontend-motion-designer)

```
4.1 Only add animation if it serves a purpose (entrance reveal, feedback, hierarchy)
4.2 Use tokens from 4_LIBRARY/tokens/motion.js
4.3 Always wrap in: if (!PREFERS_REDUCED) { ... }
4.4 For scroll-triggered: use entrance-animations.js patterns
4.5 For hover: CSS transitions preferred over JS for simple effects
```

---

## Stage 5: Quality Checklist

```
☐ Works standalone (open in browser without dependencies)
☐ No hardcoded colors (all use CSS custom properties)
☐ Mobile responsive at 320px minimum
☐ All interactive elements have :hover and :focus-visible styles
☐ All images have alt attributes
☐ Decorative icons have aria-hidden="true"
☐ Meaningful icons have aria-label
☐ No Lorem Ipsum
☐ Animation respects prefers-reduced-motion
```

---

## Output File Structure

Each component is a single self-contained `.html` file:

```html
<!--
  Component: {ComponentName}
  Type: {navigation|hero|features|cards|forms|social-proof|cta|footer}
  Variant: {variant name}
  Version: 1.0
  Last updated: {date}
-->
<!DOCTYPE html>
<html lang="en">
<head>
  <!-- fonts, styles -->
</head>
<body>
  <!-- component markup only (no full page wrapper) -->
  <!-- scripts -->
</body>
</html>
```
