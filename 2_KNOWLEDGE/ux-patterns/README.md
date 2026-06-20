# Knowledge Base: UX Patterns
# UX-UI System — 2_KNOWLEDGE/ux-patterns/README.md
# Reference: uxpatterns.dev | designspells.com | mobbin.com patterns

---

## What Is This?

This directory documents proven UX interaction patterns — micro-decisions that make interfaces feel intuitive, polished, and trustworthy. Every pattern includes: what it is, when to use it, how to implement it, and a code snippet.

---

## Pattern Index

| Category | Patterns |
|---|---|
| Navigation | Sticky nav, Scroll-aware nav, Breadcrumbs, Back to top |
| Forms | Inline validation, Multi-step, Auto-save, Error recovery |
| Feedback | Loading states, Empty states, Success states, Error states |
| Interaction | Hover reveals, Progressive disclosure, Tooltips, Skeleton screens |
| Trust | Social proof inline, Real-time counters, Security badges |
| Performance | Lazy loading, Optimistic UI, Content placeholders |

---

## Pattern 1: Scroll-Aware Navigation

**What:** Nav changes style/color as user scrolls past hero.  
**When:** Any page with full-screen hero section.  
**Effect:** Saves space, feels polished.

```javascript
const nav = document.getElementById('nav');
window.addEventListener('scroll', () => {
  nav.classList.toggle('scrolled', window.scrollY > 10);
}, { passive: true });
```
```css
.nav { background: transparent; transition: background 0.3s, box-shadow 0.3s; }
.nav.scrolled { background: rgba(255,255,255,0.9); backdrop-filter: blur(12px); box-shadow: 0 1px 16px rgb(0 0 0 / 0.08); }
```

---

## Pattern 2: Inline Form Validation

**What:** Validate field immediately after blur, not just on submit.  
**When:** Any form with email, phone, required fields.  
**Effect:** Reduces friction, catches errors early.

```javascript
document.querySelectorAll('input[required], input[type="email"]').forEach(input => {
  input.addEventListener('blur', () => validateField(input));
});

function validateField(input) {
  const isValid = input.checkValidity();
  input.closest('.form-group')?.classList.toggle('error', !isValid);
  const msg = input.closest('.form-group')?.querySelector('.error-msg');
  if (msg) msg.textContent = isValid ? '' : input.validationMessage;
}
```
```css
.form-group.error input { border-color: var(--color-error); box-shadow: 0 0 0 3px rgb(239 68 68 / 0.1); }
.error-msg { font-size: 0.8125rem; color: var(--color-error); margin-top: 0.25rem; min-height: 1.1em; }
```

---

## Pattern 3: Skeleton Loading Screen

**What:** Grey placeholder shapes replace content while it loads.  
**When:** Dynamic content (API data, images, cards).  
**Effect:** Feels faster than spinner, reduces perceived wait time.

```html
<div class="skeleton-card" aria-busy="true" aria-label="Loading...">
  <div class="skeleton skeleton-img"></div>
  <div class="skeleton skeleton-title"></div>
  <div class="skeleton skeleton-text"></div>
  <div class="skeleton skeleton-text skeleton-text--short"></div>
</div>
```
```css
.skeleton { background: linear-gradient(90deg, #E2E8F0 25%, #F1F5F9 50%, #E2E8F0 75%); background-size: 200% 100%; animation: shimmer 1.5s infinite; border-radius: 0.375rem; }
@keyframes shimmer { 0% { background-position: 200% 0; } 100% { background-position: -200% 0; } }
.skeleton-img   { height: 200px; border-radius: 0.75rem; margin-bottom: 1rem; }
.skeleton-title { height: 20px; width: 70%; margin-bottom: 0.75rem; }
.skeleton-text  { height: 14px; width: 100%; margin-bottom: 0.5rem; }
.skeleton-text--short { width: 50%; }
@media (prefers-reduced-motion: reduce) {
  .skeleton { animation: none; background: #E2E8F0; }
}
```

---

## Pattern 4: Optimistic UI

**What:** Update UI immediately before server confirms, then revert if error.  
**When:** Like buttons, follow/unfollow, quick actions.  
**Effect:** Feels instant, massively improves perceived performance.

```javascript
likeBtn.addEventListener('click', async () => {
  // 1. Update UI immediately (optimistic)
  const isLiked = likeBtn.classList.toggle('liked');
  likeCount.textContent = isLiked ? count + 1 : count - 1;

  try {
    // 2. Confirm with server
    await fetch('/api/like', { method: 'POST', body: JSON.stringify({ id }) });
    count = isLiked ? count + 1 : count - 1;
  } catch {
    // 3. Revert if failed
    likeBtn.classList.toggle('liked', !isLiked);
    likeCount.textContent = count;
    showToast('Failed to save. Try again.');
  }
});
```

---

## Pattern 5: Empty State

**What:** Helpful UI when a list/section has no content.  
**When:** Search results, filtered lists, first-time user views.  
**Effect:** Guides user instead of leaving them confused.

```html
<div class="empty-state" role="status">
  <div class="empty-state__icon" aria-hidden="true">🔍</div>
  <h3 class="empty-state__title">No results found</h3>
  <p class="empty-state__sub">Try different keywords or clear your filters.</p>
  <button class="btn-outline" type="button">Clear filters</button>
</div>
```
```css
.empty-state { text-align: center; padding: 4rem 2rem; }
.empty-state__icon { font-size: 2.5rem; margin-bottom: 1rem; }
.empty-state__title { font-family: var(--font-heading); font-size: 1.125rem; font-weight: 700; color: var(--color-text-primary); margin-bottom: 0.5rem; }
.empty-state__sub { font-size: 0.9375rem; color: var(--color-text-muted); margin-bottom: 1.5rem; }
```

---

## Pattern 6: Toast Notifications

**What:** Non-blocking status messages that auto-dismiss.  
**When:** After actions: saved, copied, error, sent.  
**Effect:** Confirms action without blocking the interface.

```javascript
function showToast(message, type = 'success', duration = 3000) {
  const toast = document.createElement('div');
  toast.className = `toast toast--${type}`;
  toast.setAttribute('role', 'status');
  toast.setAttribute('aria-live', 'polite');
  toast.innerHTML = `<span>${type === 'success' ? '✓' : '⚠'}</span> ${message}`;
  document.body.appendChild(toast);
  requestAnimationFrame(() => toast.classList.add('toast--show'));
  setTimeout(() => {
    toast.classList.remove('toast--show');
    setTimeout(() => toast.remove(), 400);
  }, duration);
}
```
```css
.toast { position: fixed; bottom: 1.5rem; right: 1.5rem; z-index: 9999; display: flex; align-items: center; gap: 0.5rem; padding: 0.875rem 1.25rem; background: var(--color-text-primary); color: #FFFFFF; font-size: 0.9375rem; font-weight: 500; border-radius: 0.75rem; box-shadow: 0 8px 24px rgb(0 0 0 / 0.2); transform: translateY(calc(100% + 1.5rem)); opacity: 0; transition: transform 0.4s cubic-bezier(0.34, 1.56, 0.64, 1), opacity 0.3s; }
.toast--show { transform: translateY(0); opacity: 1; }
.toast--error { background: var(--color-error); }
@media (prefers-reduced-motion: reduce) { .toast { transition: opacity 0.2s; transform: none; } }
```

---

## Pattern 7: Progressive Disclosure

**What:** Show only the most essential content; reveal more on interaction.  
**When:** FAQs, long forms, comparison tables, "Read more".  
**Effect:** Reduces cognitive load without hiding important content.

```html
<details class="faq-item">
  <summary class="faq-question">
    [Question here]
    <span class="faq-icon" aria-hidden="true">+</span>
  </summary>
  <div class="faq-answer">
    <p>[Answer here]</p>
  </div>
</details>
```
```css
.faq-item { border-bottom: 1px solid var(--color-border); }
.faq-question { display: flex; justify-content: space-between; align-items: center; padding: 1.25rem 0; cursor: pointer; list-style: none; font-weight: 600; color: var(--color-text-primary); gap: 1rem; }
.faq-question::-webkit-details-marker { display: none; }
.faq-icon { flex-shrink: 0; transition: transform 0.3s; font-size: 1.25rem; color: var(--color-accent); }
details[open] .faq-icon { transform: rotate(45deg); }
.faq-answer { padding: 0 0 1.25rem; font-size: 0.9375rem; line-height: 1.7; }
```

---

## Pattern 8: Hover Reveal (Card Actions)

**What:** Action buttons (edit, delete, share) only appear on card hover.  
**When:** Card grids, list items with secondary actions.  
**Effect:** Keeps UI clean; actions available when needed.

```html
<div class="hoverable-card">
  <div class="card-content">...</div>
  <div class="card-actions">
    <button type="button" aria-label="Edit item">Edit</button>
    <button type="button" aria-label="Delete item">Delete</button>
  </div>
</div>
```
```css
.hoverable-card { position: relative; }
.card-actions { position: absolute; top: 1rem; right: 1rem; display: flex; gap: 0.5rem; opacity: 0; transform: translateY(-4px); transition: opacity 0.2s, transform 0.2s; }
.hoverable-card:hover .card-actions, .hoverable-card:focus-within .card-actions { opacity: 1; transform: translateY(0); }
```

---

## Pattern 9: Back to Top

**What:** Floating button appears after user scrolls past viewport height.  
**When:** Long-form pages, articles, tables.

```html
<button id="back-to-top" class="back-to-top" aria-label="Back to top" hidden>↑</button>
```
```javascript
const btn = document.getElementById('back-to-top');
window.addEventListener('scroll', () => { btn.hidden = window.scrollY < window.innerHeight; }, { passive: true });
btn?.addEventListener('click', () => window.scrollTo({ top: 0, behavior: 'smooth' }));
```
```css
.back-to-top { position: fixed; bottom: 1.5rem; right: 1.5rem; z-index: 500; width: 44px; height: 44px; border-radius: 50%; background: var(--color-text-primary); color: #FFFFFF; font-size: 1.125rem; display: flex; align-items: center; justify-content: center; box-shadow: var(--shadow-lg); transition: transform 0.2s, background 0.2s; }
.back-to-top:hover { background: var(--color-accent); transform: translateY(-3px); }
```

---

## Pattern 10: Scroll Progress Indicator

**What:** Thin bar at top of page showing reading/scroll progress.  
**When:** Long articles, landing pages, documentation.

```html
<div id="scroll-indicator" aria-hidden="true" style="position:fixed;top:0;left:0;height:3px;width:0%;background:var(--color-accent);z-index:9999;transition:width 0.1s linear;"></div>
```
```javascript
const indicator = document.getElementById('scroll-indicator');
window.addEventListener('scroll', () => {
  const max = document.documentElement.scrollHeight - window.innerHeight;
  indicator.style.width = `${Math.min((window.scrollY / max) * 100, 100)}%`;
}, { passive: true });
```
