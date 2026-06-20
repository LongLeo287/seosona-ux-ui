# Rule: Code Output Standards
# UX-UI System — 0_BRAIN/rules/code-output-rules.md

---

## Mandatory On Every HTML File

```html
<!-- Required <head> elements -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="[≤ 160 chars, no quotes inside]">
<title>[Page Title] — [Brand Name]</title>

<!-- Google Fonts: always preconnect first, always display=swap -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=...&display=swap" rel="stylesheet">

<!-- Scripts: always defer, never blocking -->
<script src="..." defer></script>
```

---

## CSS Rules (Non-negotiable)

```css
/* 1. All custom properties in :root */
:root {
  --color-accent: #1D4ED8; /* ONLY place to write hex values */
  /* All other CSS uses var(--*) */
}

/* 2. Zero hardcoded colors outside :root */
/* CORRECT: */
.btn { background: var(--color-accent); }
/* WRONG: */
.btn { background: #1D4ED8; } /* ← NEVER do this */

/* 3. Font sizes: rem or clamp(), never px */
/* CORRECT: */
h1 { font-size: clamp(2rem, 5vw, 4rem); }
p  { font-size: 1rem; }
/* WRONG: */
h1 { font-size: 64px; }

/* 4. Mobile-first: base styles for 375px, then add breakpoints UP */
/* Base (375px) → @media(min-width: 640px) → @media(min-width: 1024px) */

/* 5. Box model reset on every file */
*, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

/* 6. Images always block */
img, video { display: block; max-width: 100%; }
```

---

## HTML Semantic Rules

| Element | Use When |
|---|---|
| `<header>` | Site header / hero area |
| `<nav>` | Navigation (add `aria-label`) |
| `<main>` | Primary page content (ONE per page) |
| `<section>` | Thematic content group (add `aria-labelledby`) |
| `<article>` | Self-contained content (card, post, testimonial) |
| `<aside>` | Supporting content (sidebar, related links) |
| `<footer>` | Footer of page or section |
| `<h1>` | ONE per page — main page topic |
| `<h2>` | Section titles |
| `<h3>` | Card/component titles inside sections |
| `<button>` | Trigger JS actions |
| `<a>` | Navigation (has an href destination) |
| `<figure>` | Image with caption |
| `<blockquote>` | Testimonials, quotes (add `<cite>`) |

---

## File Naming Convention

```
HTML:       kebab-case.html         e.g. hero-centered.html
CSS:        kebab-case.css          e.g. style.css, b2b-dark.css
JS:         kebab-case.js           e.g. main.js, hover-effects.js
Images:     kebab-case.ext          e.g. hero-background.webp
Folders:    kebab-case              e.g. landing-page-dark/
Token vars: --category-property    e.g. --color-accent, --space-4
```

---

## Code Comment Format

### HTML file header
```html
<!--
  Template/Component: [Name]
  Type: [template | component]
  Category: [hero | forms | nav | etc]
  Version: 1.0
  Date: YYYY-MM-DD
  Description: [one sentence]
-->
```

### CSS section separator
```css
/* ─── Section Name ───────────────────────────────────────── */
```

### JS function documentation
```javascript
/**
 * functionName — What it does in one line
 * @param {type} paramName — Description
 * @returns {type} Description
 */
```

---

## Image Rules

```html
<!-- Always provide width + height → prevents CLS -->
<img src="hero.jpg" alt="Descriptive alt text" width="1280" height="720">

<!-- Hero / above-fold image: eager + high priority -->
<img src="hero.jpg" alt="..." width="1280" height="720"
     loading="eager" fetchpriority="high">

<!-- Below fold images: lazy load -->
<img src="card.jpg" alt="..." width="600" height="400" loading="lazy">

<!-- Purely decorative (no information): empty alt + aria-hidden -->
<img src="decoration.svg" alt="" aria-hidden="true" width="200" height="200">
```

---

## Interactive Element Checklist

```html
<!-- Buttons: always type, always descriptive label -->
<button type="button">Open menu</button>
<button type="submit">Send message</button>

<!-- Icon-only button: needs aria-label -->
<button type="button" aria-label="Close dialog">
  <svg aria-hidden="true">...</svg>
</button>

<!-- Links: href must go somewhere meaningful -->
<a href="/pricing">View pricing</a>
<!-- NOT: <a href="#">Learn more</a> — vague and goes nowhere -->

<!-- Form inputs: always paired with <label> -->
<label for="email-input">Email address</label>
<input type="email" id="email-input" name="email" autocomplete="email">
```

---

## Forbidden Patterns

```
❌ onclick="..." inline handlers — use addEventListener
❌ style="..." inline styles (except JS-set dynamic values)
❌ Hardcoded color hex outside :root
❌ Font sizes in px
❌ <div> for buttons/links
❌ Missing alt on images
❌ Missing width+height on images
❌ <script> without defer/async in <head>
❌ !important (unless last resort + documented with comment)
❌ Placeholder text as only label for form inputs
❌ Generic CTA text: "Click here", "Submit", "Learn more" (as primary CTA)
```
