# UX Audit Pipeline
# Input: Website URL → Output: Scored UX audit report

---

## Pipeline Metadata

- **Agents:** `ux-researcher` + `accessibility-auditor`
- **Output:** `5_MEMORY/audits/{domain}/ux-audit-{YYYY-MM-DD}.md`
- **Duration:** 30–60 minutes per audit
- **Trigger:** "audit UX of [URL]", "score UX/UI of [URL]", "review website [URL]"

---

## Stage 1: Setup

```
1.1 Extract domain from URL → set output path: 5_MEMORY/audits/{domain}/
1.2 Create audit document from template below
1.3 Define audit scope:
    - Desktop viewport: 1440px
    - Mobile viewport: 375px
    - Target: homepage + 1 key landing page (if specified)
```

---

## Stage 2: Data Collection

```
2.1 PERFORMANCE — Run PageSpeed Insights (both mobile + desktop)
    Capture: LCP, INP, CLS, FCP, TTFB, Performance Score

2.2 VISUAL INSPECTION — Manual review at:
    a) 1440px desktop
    b) 768px tablet
    c) 375px mobile

2.3 TECHNICAL — Check:
    a) Page title + meta description present?
    b) OG tags present?
    c) H1 exists and is unique?
    d) H-tag hierarchy correct (no skipped levels)?
    e) Images have alt attributes?
    f) Forms have labels (not just placeholders)?
    g) All links have descriptive text (no "click here")?

2.4 ACCESSIBILITY QUICK CHECK:
    a) Color contrast (primary text on background) — calc ratio
    b) Focus states visible?
    c) Touch targets ≥ 44px on mobile?
```

---

## Stage 3: Scoring (100 points total)

### Category 1: Visual Design (20 pts)
| Check | Max | Score |
|---|---|---|
| Clear visual hierarchy (heading size progression) | 5 | |
| Consistent color usage (≤ 3 accent colors) | 4 | |
| Sufficient whitespace (not cluttered) | 4 | |
| Typography readable (size, contrast, line-height) | 4 | |
| Professional imagery / icons | 3 | |

### Category 2: Navigation & IA (15 pts)
| Check | Max | Score |
|---|---|---|
| Primary navigation clear and discoverable | 4 | |
| User can find key info in ≤ 3 clicks | 4 | |
| Active state / current page indicated | 3 | |
| Mobile navigation accessible | 4 | |

### Category 3: Mobile Experience (20 pts)
| Check | Max | Score |
|---|---|---|
| No horizontal overflow at 375px | 5 | |
| Touch targets ≥ 44×44px | 5 | |
| Text readable without zooming | 5 | |
| CTA accessible in thumb zone | 5 | |

### Category 4: Performance (15 pts)
| Check | Max | Score |
|---|---|---|
| LCP < 2.5s | 5 | |
| CLS < 0.1 | 5 | |
| INP < 200ms | 5 | |

### Category 5: Conversion (15 pts)
| Check | Max | Score |
|---|---|---|
| Primary CTA visible above fold | 4 | |
| CTA text clear (action + benefit) | 3 | |
| Social proof present | 4 | |
| Trust signals present | 4 | |

### Category 6: Accessibility (10 pts)
| Check | Max | Score |
|---|---|---|
| Text contrast ≥ 4.5:1 | 4 | |
| Alt text on images | 3 | |
| Focus states visible | 3 | |

### Category 7: Content Quality (5 pts)
| Check | Max | Score |
|---|---|---|
| Headlines benefit-driven (not feature-driven) | 3 | |
| No typos or broken copy | 2 | |

---

## Stage 4: Report Generation

Use this template:

```markdown
# UX Audit Report
**Site:** {URL}
**Date:** {YYYY-MM-DD}
**Audited by:** ux-researcher + accessibility-auditor

---

## Score: {X}/100 — Grade {A+/A/B/C/D}

| Category | Score | Max |
|---|---|---|
| Visual Design | | 20 |
| Navigation & IA | | 15 |
| Mobile Experience | | 20 |
| Performance | | 15 |
| Conversion | | 15 |
| Accessibility | | 10 |
| Content Quality | | 5 |
| **TOTAL** | | **100** |

---

## Top 3 Strengths
1. 
2. 
3. 

## Critical Issues (fix immediately)
- [ ] 
- [ ] 

## Action Plan

### Quick Wins (< 1 day)
- 

### Short-term (1 week)
-

### Long-term (1 month+)
-
```

---

## Grading Scale

| Score | Grade | Meaning |
|---|---|---|
| 90–100 | A+ | Excellent — industry benchmark |
| 80–89 | A | Good — above average |
| 70–79 | B | Fair — notable issues |
| 60–69 | C | Poor — many problems |
| < 60 | D/F | Critical — needs redesign |
