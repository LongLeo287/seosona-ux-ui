# Skill: Layout & Composition
# UX-UI System — 2_KNOWLEDGE/skills/layout-composition.md

---

## Grid Systems

### 12-Column Grid (Standard)
```css
.grid {
  display: grid;
  grid-template-columns: repeat(12, 1fr);
  gap: 1.5rem;
}
/* Span helpers */
.col-4  { grid-column: span 4; }   /* 1/3 width */
.col-6  { grid-column: span 6; }   /* 1/2 width */
.col-8  { grid-column: span 8; }   /* 2/3 width */
.col-12 { grid-column: span 12; }  /* full width */
```

### Auto-fit Grid (Most used for components)
```css
/* Cards grid — auto responsive, no media queries needed */
.cards-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
  gap: 1.25rem;
}
/* Content grid — 2 columns on desktop */
.content-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(360px, 1fr));
  gap: 2rem;
  align-items: center;
}
```

---

## Spacing Scale

```css
:root {
  --space-1:  0.25rem;   /*  4px */
  --space-2:  0.5rem;    /*  8px */
  --space-3:  0.75rem;   /* 12px */
  --space-4:  1rem;      /* 16px */
  --space-5:  1.25rem;   /* 20px */
  --space-6:  1.5rem;    /* 24px */
  --space-8:  2rem;      /* 32px */
  --space-10: 2.5rem;    /* 40px */
  --space-12: 3rem;      /* 48px */
  --space-16: 4rem;      /* 64px */
  --space-20: 5rem;      /* 80px */
  --space-24: 6rem;      /* 96px */
  --space-32: 8rem;      /* 128px */
}

/* Section vertical padding */
--section-py:    5rem;    /* Standard section */
--section-py-lg: 7.5rem; /* Hero / large sections */
--section-py-sm: 3.5rem; /* Compact sections */
```

---

## Visual Hierarchy Rules

### The 3-Size Rule
Every section should have exactly 3 distinct text sizes:
```
Primary (headline):    var(--text-3xl) or larger
Secondary (sub/label): var(--text-base) or var(--text-lg)  
Tertiary (body/meta):  var(--text-sm) or var(--text-base)
```

### Contrast Hierarchy (Weight)
```
900 weight → Only for hero headlines (max 1 per page)
800 weight → Section headlines
700 weight → Card titles, component headings
600 weight → UI labels, button text, strong emphasis
500 weight → Secondary nav, metadata
400 weight → Body copy (default)
300 weight → Only in luxury designs with large text
```

### Whitespace Rules
```
Between sections:     --section-py (5rem min)
Inside cards:         1.5rem–2rem padding
Between card elements:0.625rem–1rem gap
Line length max:      68ch for body text
Icon from text:       0.5rem–0.75rem gap
```

---

## Section Layout Patterns

### Pattern A: Centered (Hero, CTA)
```css
.section-centered {
  text-align: center;
  max-width: 760px;
  margin: 0 auto;
}
```

### Pattern B: Left-aligned with max-width (Features)
```css
.section-left {
  max-width: 1280px;
  margin: 0 auto;
  padding: 0 1.5rem;
}
.section-header { max-width: 600px; } /* Label + headline only */
```

### Pattern C: Split 50/50 (Problem/Solution, About)
```css
.section-split {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 4rem;
  align-items: center;
}
@media (max-width: 768px) {
  .section-split { grid-template-columns: 1fr; gap: 2rem; }
}
```

### Pattern D: Asymmetric 40/60 (Feature detail)
```css
.section-asymmetric {
  display: grid;
  grid-template-columns: 2fr 3fr;
  gap: 4rem;
  align-items: start;
}
```

---

## Z-Index Scale

```css
:root {
  --z-below:   -1;   /* Behind page content */
  --z-base:     0;   /* Default */
  --z-raised:  10;   /* Cards on hover */
  --z-dropdown:100;  /* Dropdowns, tooltips */
  --z-sticky:  200;  /* Sticky nav */
  --z-overlay: 500;  /* Modal backdrop */
  --z-modal:   600;  /* Modal content */
  --z-toast:   900;  /* Notifications */
  --z-max:    9999;  /* Page transitions */
}
```

---

## Responsive Breakpoints

```css
/* Mobile first — add styles UP from this breakpoint */
/* xs:  320px  — minimum supported */
/* sm:  640px  — large phones      */
/* md:  768px  — tablets           */
/* lg:  1024px — small laptops     */
/* xl:  1280px — standard desktop  */
/* 2xl: 1536px — wide desktop      */

@media (min-width: 640px)  { /* sm */ }
@media (min-width: 768px)  { /* md */ }
@media (min-width: 1024px) { /* lg */ }
@media (min-width: 1280px) { /* xl */ }
```

### Common Responsive Grid Pattern
```css
.grid-responsive {
  display: grid;
  grid-template-columns: 1fr;          /* 1 col mobile */
  gap: 1rem;
}
@media (min-width: 640px) {
  .grid-responsive { grid-template-columns: repeat(2, 1fr); gap: 1.25rem; }
}
@media (min-width: 1024px) {
  .grid-responsive { grid-template-columns: repeat(3, 1fr); gap: 1.5rem; }
}
```

---

## Component Sizing Standards

| Component | Min Height | Min Width | Padding |
|---|---|---|---|
| Primary button | 44px | 120px | 0.75rem 1.5rem |
| Small button | 36px | 80px | 0.5rem 1rem |
| Input field | 44px | 200px | 0.75rem 1rem |
| Card | auto | 280px | 1.5rem–2rem |
| Nav bar | 64px | full width | 0 1.5rem |
| Hero section | 100vh | full width | 5rem+ 1.5rem |
| Modal | auto | 400px | 2rem |
