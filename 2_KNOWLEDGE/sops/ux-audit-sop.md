# SOP: UX Audit Execution
# UX-UI System — 2_KNOWLEDGE/sops/ux-audit-sop.md

---

## Purpose

Step-by-step execution guide for running a UX audit on any website.
Pair with `3_WORKFLOWS/pipelines/ux-audit-pipeline.md` for scoring rubric.

---

## Before You Start

```
☐ Have the website URL ready
☐ Access to Chrome DevTools
☐ PageSpeed Insights open: https://pagespeed.web.dev
☐ WebAIM Contrast Checker open: https://webaim.org/resources/contrastchecker/
☐ Create output folder: 5_MEMORY/audits/{domain}/
```

---

## Step 1: First Impression (2 min)

Open the site cold. Don't scroll yet. Answer within 10 seconds:

```
1. What does this company do? (can I tell immediately?)
2. Who is it for?
3. What is the primary action they want me to take?
4. Score first impression: ★ ★ ★ ★ ★
```

If you can't answer 1–3 within 10 seconds → **Hero section needs work.**

---

## Step 2: Performance Audit (5 min)

1. Go to [PageSpeed Insights](https://pagespeed.web.dev)
2. Test the homepage URL — run **both Mobile and Desktop**
3. Record:
   ```
   Mobile:  LCP=___  INP=___  CLS=___  Score=___
   Desktop: LCP=___  INP=___  CLS=___  Score=___
   ```
4. Flag: any metric in red or orange → add to Critical Issues

---

## Step 3: Desktop Audit (10 min)

Open DevTools → Elements. Audit at **1440px viewport**.

### 3a. Structure Check
```
☐ Single H1 on page? (DevTools → Elements search h1)
☐ H-tag hierarchy correct? (h1 → h2 → h3, no skips)
☐ Page title present and descriptive?
☐ Meta description present (< 160 chars)?
```

### 3b. Hero Section
```
☐ Headline visible without scrolling?
☐ Headline tells what the company does?
☐ Primary CTA visible above fold?
☐ CTA text is action + benefit (not "Submit" or "Click here")?
☐ Is there a sub-headline that explains the value?
```

### 3c. Visual Design
```
☐ Clear visual hierarchy (size/weight/color differences between sections)?
☐ Consistent color usage (count accent colors — should be ≤ 3)?
☐ Sufficient whitespace between sections (not claustrophobic)?
☐ Typography readable (≥ 16px body on desktop, sans-serif body)?
☐ Professional imagery (not generic stock)?
```

### 3d. Navigation
```
☐ Primary nav clear and discoverable?
☐ Current page indicated (active state)?
☐ Logo links to homepage?
☐ CTA in navigation visible?
```

### 3e. Social Proof
```
☐ Testimonials present? Are they specific (name + company + result)?
☐ Client logos visible?
☐ Stats/numbers present and credible?
```

### 3f. Conversion
```
☐ Primary CTA repeated at bottom of page?
☐ FAQ section present?
☐ Contact information visible somewhere?
☐ Trust signals (certifications, guarantees) visible near CTA?
```

---

## Step 4: Mobile Audit (8 min)

DevTools → Toggle device toolbar → Set to **iPhone 12 Pro (390px)** or **375px**.

```
☐ No horizontal overflow (page doesn't scroll sideways)?
☐ Text readable without zooming (≥ 14px)?
☐ CTA buttons large enough (min 44px height)?
☐ Touch targets not too close together?
☐ Navigation accessible (hamburger menu functional)?
☐ Hero section looks good (not broken)?
☐ Images load correctly?
```

---

## Step 5: Accessibility Quick Check (5 min)

### Contrast
1. Pick the most common body text color + background
2. Enter at [WebAIM](https://webaim.org/resources/contrastchecker/)
3. Record ratio — must be ≥ 4.5:1 for normal body text

### Keyboard Navigation
1. Click into the page
2. Press Tab key repeatedly
3. Check: can you navigate all interactive elements?
4. Check: are focus styles visible?

### Images
- Right-click 3-5 images → Inspect
- Check: does `<img>` have a meaningful `alt` attribute?

---

## Step 6: Score & Report

1. Use the scoring rubric from `3_WORKFLOWS/pipelines/ux-audit-pipeline.md`
2. Score each category honestly
3. Identify Top 3 Strengths
4. Identify Critical Issues (score < 3/5 on any item)
5. Write Action Plan (quick wins → short-term → long-term)
6. Save report to `5_MEMORY/audits/{domain}/ux-audit-{YYYY-MM-DD}.md`

---

## Common Issues & Standard Fixes

| Issue | Fix |
|---|---|
| Slow LCP | Compress hero image, use WebP, preload with `fetchpriority="high"` |
| High CLS | Add width+height to all images, avoid injecting content above fold |
| Hero unclear | Rewrite headline: [Who] + [What you do] + [For whom] |
| Low contrast | Darken text color or lighten/darken background |
| No CTA above fold | Move CTA above scroll line, increase size |
| Generic testimonials | Replace with specific result + person + company |
| Mobile tap targets small | Increase button padding to min 44px height |
| Missing focus styles | Add CSS: `:focus-visible { outline: 2px solid var(--accent); }` |
