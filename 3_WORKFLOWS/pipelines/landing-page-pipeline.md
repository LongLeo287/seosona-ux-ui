# Landing Page Build Pipeline
# Input: Project brief → Output: Complete HTML/CSS/JS page

---

## Pipeline Metadata

- **Agents:** `ux-researcher` → `ui-ux-designer` → `frontend-motion-designer` → `accessibility-auditor`
- **Output:** `6_WORKSPACE/{project-slug}/index.html` + `style.css` + `main.js`
- **Duration:** 2–4 hours per page
- **Trigger:** "build landing page for [X]", "create page for [campaign]", "make website for [service]"

---

## Required Inputs

```yaml
project_slug: string          # e.g. "acme-google-ads-2026"
service: string               # What is being sold/promoted
target_audience: string       # Who is the user
primary_goal: string          # form-lead | call | purchase | signup
primary_keyword: string       # Main SEO keyword (optional)
brand_palette: string         # Which palette from 4_LIBRARY/tokens/palettes/
language: string              # Page language (default: en)
```

---

## Stage 1: Brief Analysis (ux-researcher)

```
1.1 Identify user pain points (what problem does the service solve?)
1.2 Identify USP (why choose this vs. competitor?)
1.3 Identify trust signals needed (certifications, testimonials, stats)
1.4 Competitor research: find 2-3 top-ranking competitors, note:
    - Their headline formula
    - Their CTA text
    - Their social proof type
    - What to do differently
1.5 Output: brief.md in 6_WORKSPACE/{slug}/
```

---

## Stage 2: Content Architecture (ui-ux-designer)

```
Map page sections using AIDA + PAS formula:

Section 1: HERO
  - Headline: Benefit-driven, ≤ 10 words, contains primary keyword
  - Sub: Expands headline, ≤ 25 words
  - CTA: Action verb + benefit (e.g. "Get Free Audit")
  - Trust hook: 1 stat or badge (optional)

Section 2: PROBLEM (Agitate)
  - 3 pain points the user recognizes
  - Emotional, not technical language

Section 3: SOLUTION (Features → Benefits)
  - 3-6 features, each framed as user benefit
  - Use feature-card component from 4_LIBRARY/components/cards/

Section 4: SOCIAL PROOF
  - Testimonials: minimum 2 (with photo, name, company, result)
  - Logo grid: 3-6 client logos
  - Stats: 2-3 quantified results

Section 5: HOW IT WORKS
  - 3-step process (numbered)
  - Remove friction, set expectation

Section 6: FAQ
  - 5-7 questions that address real objections
  - Honest, specific answers

Section 7: FINAL CTA
  - Repeat primary CTA
  - Remove risk (money-back, free trial, no contract)
  - Contact info visible
```

---

## Stage 3: Build (ui-ux-designer)

```
3.1 Copy template: cp 4_LIBRARY/templates/static/landing-page-light/ to 6_WORKSPACE/{slug}/
3.2 Select palette: cp 4_LIBRARY/tokens/palettes/{palette}.css to 6_WORKSPACE/{slug}/brand/palette.css
3.3 Import palette in style.css (@import './brand/palette.css')
3.4 Fill all [placeholder] content with real copy
3.5 Replace placeholder images with real assets (or realistic description)
3.6 Customize components as needed
3.7 Apply responsive styles — test at 375px, 768px, 1280px
```

---

## Stage 4: Animate (frontend-motion-designer)

```
4.1 Add data-animate attributes to scroll-triggered elements
4.2 Hero entrance: use createTimeline() sequence
4.3 Counter animation on stats (if any)
4.4 Feature card hover effect
4.5 CTA button pulse animation
4.6 Verify prefers-reduced-motion respected
```

---

## Stage 5: Validate (accessibility-auditor)

Run full checklist from 0_BRAIN/rules/accessibility-rules.md:

```
☐ Valid HTML (W3C validator pass)
☐ Single H1 on page
☐ No skipped H-levels
☐ All images have alt attributes
☐ All form inputs have <label>
☐ Keyboard navigation works end-to-end
☐ Focus styles visible on all interactive elements
☐ Color contrast ≥ 4.5:1 for body text
☐ Touch targets ≥ 44px on mobile
☐ prefers-reduced-motion respected
☐ No Lorem Ipsum anywhere
☐ Page title and meta description written
☐ OG tags complete
☐ Scripts loaded with defer
☐ Images have width + height attributes
```

---

## Stage 6: Output & Document

```
6.1 Final files in 6_WORKSPACE/{slug}/
6.2 Write design-decisions.md:
    - Why this palette was chosen
    - Headline formula used
    - Any deviations from template and why
    - Known limitations
6.3 Copy to 5_MEMORY/exports/{slug}/ for archiving
```
