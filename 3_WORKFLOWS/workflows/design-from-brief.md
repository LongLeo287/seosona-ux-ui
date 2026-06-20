# Workflow: Design From Brief
# UX-UI System — 3_WORKFLOWS/workflows/design-from-brief.md

---

## Trigger

User provides: URL, client brief, description, or says "build a page for [X]"

---

## Step 1 — Intake (UX Researcher)

```
Input received → route to ux-researcher agent
1. Identify brief completeness (WHO + WHAT + USP?)
2. If incomplete → ask 3 clarifying questions
3. Research 2 top competitors
4. Produce Content Map (see ux-researcher.md)
```

**Output:** `6_WORKSPACE/{slug}/brief.md`

---

## Step 2 — Brand Selection (Brand Identity Designer)

```
Read brief.md → route to brand-identity-designer agent
1. Select palette from matrix (see brand-identity-designer.md)
2. Select font pair
3. Customize accent color if needed
4. Output brand kit
```

**Output:** `6_WORKSPACE/{slug}/brand/palette.css` + `fonts.css`

---

## Step 3 — Layout Build (UI/UX Designer)

```
Read brief.md + brand/ → route to ui-ux-designer agent
1. Map sections using Content Map
2. Copy closest template from 4_LIBRARY/templates/
3. Fill all [placeholder] content from Content Map
4. Apply palette + fonts
5. Build/customize components as needed
6. Test responsive at 375 / 768 / 1280
```

**Output:** `6_WORKSPACE/{slug}/index.html` + `style.css`

---

## Step 4 — Animate (Frontend Motion Designer)

```
Read index.html → route to frontend-motion-designer agent
1. Add data-animate attributes on scroll elements
2. Add hero timeline sequence
3. Add data-counter on stats
4. Add hover effects if needed (data-magnetic, data-tilt)
5. Verify prefers-reduced-motion works
```

**Output:** Updated `index.html` + `main.js`

---

## Step 5 — Quality Audit (Accessibility Auditor)

```
Run full checklist from accessibility-auditor.md
→ Fix all Critical and High severity issues
→ Document Medium/Low in design-decisions.md
```

**Output:** Sign-off comment in HTML file

---

## Step 6 — Handoff Package

```
1. Run design-handoff-sop.md checklist
2. Write HANDOFF.md
3. Copy to 5_MEMORY/projects/{slug}/
4. Mark project complete
```

**Output:** Complete handoff package in `6_WORKSPACE/{slug}/`

---

## Agent Flow Diagram

```
Brief/URL
    │
    ▼
UX Researcher ─── brief.md ──────────────────────────────┐
    │                                                     │
    ▼                                                     │
Brand Designer ─── palette.css + fonts.css ──────────────┤
    │                                                     │
    ▼                                                     │
UI/UX Designer ─── index.html + style.css ───────────────┤
    │                                                     │
    ▼                                                     │
Motion Designer ─── main.js + data-animate attrs ────────┤
    │                                                     │
    ▼                                                     │
Accessibility Auditor ─── sign-off ──────────────────────┤
    │                                                     │
    ▼                                                     ▼
Handoff Package ─────────────── 5_MEMORY/projects/{slug}/
```
