# SOP: Design Handoff
# UX-UI System — 2_KNOWLEDGE/sops/design-handoff-sop.md

---

## Purpose

Standardize the process of handing off completed design/code to clients or developers. Ensures nothing is forgotten.

---

## Pre-Handoff Checklist

### 1. Code Quality
```
☐ All [placeholder] text replaced with real content
☐ Zero Lorem Ipsum
☐ No broken image paths (all images local or valid URLs)
☐ No console errors when opened in browser
☐ All scripts load with defer
☐ HTML validates (no unclosed tags)
☐ Meta title + meta description written
☐ OG tags populated
☐ Favicon linked (or noted as "to be added")
```

### 2. Design Fidelity
```
☐ Component Review SOP checklist passed
☐ Responsive tested at 375px, 768px, 1280px
☐ Hover states functional
☐ Focus states visible
☐ Dark/light mode correct (if applicable)
☐ Animations working + reduced-motion fallback confirmed
```

### 3. Performance
```
☐ PageSpeed Insights run — Mobile score ≥ 70
☐ LCP image has fetchpriority="high"
☐ All images have width + height attributes
☐ No render-blocking resources in <head>
```

### 4. Accessibility
```
☐ Aria auditor checklist passed (from accessibility-auditor.md)
☐ Keyboard navigation complete
☐ Color contrast verified
```

---

## Handoff Package Contents

```
{project-slug}/
├── index.html           ← Final HTML file
├── style.css            ← Final CSS
├── main.js              ← Final JS (if applicable)
├── brand/
│   ├── palette.css      ← Color tokens used
│   └── fonts.css        ← Typography config
├── assets/              ← Images, icons (optimized)
├── design-decisions.md  ← Why choices were made
└── HANDOFF.md           ← This document (for client/developer)
```

---

## HANDOFF.md Template

```markdown
# Project Handoff — [Project Name]

**Delivered:** [YYYY-MM-DD]  
**Delivered by:** [Agent/Team]  
**For:** [Client/Developer name]

---

## How To Use

1. Open `index.html` in any modern browser
2. Edit placeholder text marked with [brackets]
3. Replace placeholder images in `assets/`
4. Set your domain in meta OG tags (`index.html` line ~8)

## Key Files

| File | Purpose |
|---|---|
| `index.html` | Main page markup |
| `style.css` | All styles |
| `brand/palette.css` | Color tokens — edit accent colors here |
| `brand/fonts.css` | Font family settings |

## Customization Guide

### Change accent color
Open `brand/palette.css`, update `--color-accent`.

### Change fonts
Open `brand/fonts.css`, replace the Google Fonts URL and update `--font-heading`/`--font-body`.

### Add a new section
Copy any `<section>` block from index.html and paste it in the correct position.
Add `data-animate="fade-up"` to any element for scroll-triggered entrance.

## Performance Notes
- Hero image: Replace with your actual hero image, keep size < 200KB (WebP preferred)
- Test with PageSpeed Insights before launch: https://pagespeed.web.dev

## Known Limitations / TODO
- [List any intentional placeholders or items left for client]
```

---

## Archive

After handoff, copy to `5_MEMORY/projects/{project-slug}/` and `5_MEMORY/exports/{project-slug}/`.
