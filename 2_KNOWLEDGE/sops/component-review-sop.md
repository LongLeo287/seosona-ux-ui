# SOP: Component Quality Review
# UX-UI System — 2_KNOWLEDGE/sops/component-review-sop.md

---

## Purpose

Checklist for reviewing any component before it is added to `4_LIBRARY/components/`.
No component ships without passing this review.

---

## Review Checklist

### 1. File Structure
```
☐ File is a single self-contained .html file
☐ Header comment block present (Component name, type, variant, version, date)
☐ Google Fonts link present (if custom fonts used)
☐ All scripts have defer attribute
☐ CDN links use specific versions (not @latest in production)
```

### 2. HTML Quality
```
☐ Valid semantic HTML (section, article, nav, etc. used correctly)
☐ No <div> used where a semantic element exists
☐ All interactive elements are <a>, <button>, <input>, <select>, <textarea>
☐ No onclick= inline handlers (use addEventListener)
☐ All form inputs have associated <label>
☐ Buttons have descriptive text or aria-label
```

### 3. CSS Quality
```
☐ All colors use CSS custom properties (var(--color-*))
☐ Zero hardcoded hex/rgb colors outside :root
☐ Mobile-first: base styles written for 375px minimum
☐ Responsive: works at 320px, 640px, 768px, 1024px, 1280px
☐ Interactive states: :hover and :focus-visible on all clickable elements
☐ No !important (except as last resort, documented with comment)
☐ No fixed px for font sizes (use rem or clamp())
```

### 4. Accessibility
```
☐ All images have alt attribute
☐ Decorative images have alt="" + aria-hidden="true"
☐ Icon-only buttons have aria-label
☐ Keyboard navigable (Tab key test passes)
☐ Focus styles visible
☐ Color is not the only differentiator
☐ Text contrast ≥ 4.5:1 (normal text), ≥ 3:1 (large text)
```

### 5. Animation (if applicable)
```
☐ prefers-reduced-motion check present
☐ Only transform/opacity animated (no width/height/top/left)
☐ Duration within acceptable range (see motion-designer.md)
☐ motionSafe() wrapper from motion.js used
```

### 6. Performance
```
☐ Images have width + height attributes
☐ Hero images use loading="eager", all others loading="lazy"
☐ No render-blocking scripts
☐ No inline styles (except for dynamic values set by JS)
```

### 7. Content
```
☐ No Lorem Ipsum anywhere
☐ Placeholder copy is realistic and relevant
☐ No broken links (href="#" is acceptable for previews)
☐ No console errors when opened in browser
```

---

## Review Sign-off

Once all checks pass, add to bottom of component file:

```html
<!-- 
  Quality Review: PASSED
  Reviewed by: [Agent name]
  Date: [YYYY-MM-DD]
  Notes: [any deviations or known limitations]
-->
```
