# Skill: Motion Design Principles
# UX-UI System — 2_KNOWLEDGE/skills/motion-design.md

---

## When To Use Animation

### Animate → YES
| Situation | Reason |
|---|---|
| Page/component entrance | Guide attention, create polish |
| State change (toggle, expand, switch) | Communicate what changed |
| Loading / progress | Reduce perceived wait time |
| Error feedback | Draw attention without color alone |
| Data updates (counters, charts) | Make numbers feel real |
| User achievement (success state) | Reward completion |

### Animate → NO
| Situation | Reason |
|---|---|
| Decorative background loops | Distracts, costs performance |
| Every element on page | Attention dilution |
| Long duration on frequent interactions | Annoys repeat users |
| Hover on non-interactive text | Confusing affordance signal |

---

## The 12 Principles Applied to UI

| Principle | UI Application |
|---|---|
| **Squash & Stretch** | Button press scale (0.96→1.04) |
| **Anticipation** | Hover state before click |
| **Staging** | Stagger reveals to guide focus |
| **Follow-through** | Elastic/overshoot on slide-in |
| **Ease In/Out** | All transitions (never linear) |
| **Arcs** | Floating elements path |
| **Secondary Action** | Icon animates inside button on hover |
| **Timing** | Fast = snappy/urgent, slow = premium/calm |
| **Exaggeration** | Used sparingly — success confetti |
| **Solid Drawing** | 3D transform for depth/tilt effects |
| **Appeal** | Smooth curves, not abrupt stops |

---

## Anime.js Patterns Reference

### Timeline Sequence (Hero entrance)
```javascript
import { createTimeline } from 'animejs';

const tl = createTimeline({ defaults: { easing: 'easeOutQuart' } });
tl.add('.badge',    { opacity: [0,1], translateY: [16,0], duration: 400 })
  .add('.headline', { opacity: [0,1], translateY: [24,0], duration: 600 }, 80)
  .add('.sub',      { opacity: [0,1], translateY: [16,0], duration: 500 }, 160)
  .add('.cta',      { opacity: [0,1], translateY: [12,0], duration: 400 }, 260)
  .add('.stats',    { opacity: [0,1], translateY: [8,0],  duration: 400 }, 340);
```

### Staggered List
```javascript
import { animate, stagger } from 'animejs';

animate('.card', {
  opacity: [0, 1],
  translateY: [20, 0],
  delay: stagger(80),        // 80ms between each
  duration: 500,
  easing: 'easeOutQuart'
});
```

### Counter Animation
```javascript
const obj = { value: 0 };
animate(obj, {
  value: 1250,
  duration: 1800,
  easing: 'easeOutQuart',
  update: () => el.textContent = Math.round(obj.value).toLocaleString()
});
```

### Pulsing / Breathing Loop
```javascript
animate('.indicator', {
  scale: [1, 1.15],
  opacity: [1, 0.5],
  duration: 1200,
  direction: 'alternate',
  loop: true,
  easing: 'easeInOutSine'
});
```

### Magnetic Button (Anime.js)
```javascript
btn.addEventListener('mousemove', (e) => {
  const rect = btn.getBoundingClientRect();
  const dx = (e.clientX - rect.left - rect.width/2) * 0.35;
  const dy = (e.clientY - rect.top - rect.height/2) * 0.35;
  animate(btn, { translateX: dx, translateY: dy, duration: 300, easing: 'easeOutQuart' });
});
btn.addEventListener('mouseleave', () => {
  animate(btn, { translateX: 0, translateY: 0, duration: 500, easing: 'easeOutElastic(1, 0.5)' });
});
```

---

## Easing Cheat Sheet

```
easeOutQuart      → Standard. Most entrance animations.
easeOutCubic      → Slightly less dramatic entrance.
easeOutBack       → Slight overshoot. Scale-in effects.
easeOutElastic    → Bouncy. Playful only. Consumer UI.
easeInQuart       → Exit animations (element leaves screen).
easeInOutCubic    → Panel/drawer transitions.
easeInOutSine     → Looping / breathing animations.
linear            → Progress bars, spinners.
spring(...)       → Physics-based. Natural movement.
```

---

## Duration Guidelines

| Interaction | Duration | Rule |
|---|---|---|
| Hover color/border | 150–200ms | Instant feedback |
| Button press / click | 100–150ms | Snappy |
| Card hover lift | 200–300ms | Smooth |
| Nav open/close | 250–350ms | Clear but fast |
| Scroll reveal (single) | 400–600ms | Observable |
| Hero timeline (full) | 800–1400ms total | Polished entrance |
| Page transition | 300–400ms | Never > 500ms |
| Success animation | 600–800ms | Satisfying reward |
| Looping idle | 1500–3000ms | Subtle, ambient |

---

## Motion Token System

All projects use `4_LIBRARY/tokens/motion.js`:

```javascript
import { motionSafe, EASING, DURATION } from '../../tokens/motion.js';

motionSafe(() => {
  animate(el, {
    opacity: [0, 1],
    translateY: [20, 0],
    duration: DURATION.reveal,  // 600ms
    easing: EASING.out           // 'easeOutQuart'
  });
});
```

---

## Performance Rules For Animation

```
✅ Only animate: transform, opacity
❌ Never animate: width, height, padding, margin, top, left
✅ Use will-change: transform ONLY on elements being actively animated
✅ Remove will-change after animation completes
✅ Use IntersectionObserver for scroll triggers (not scroll listener)
✅ Always test prefers-reduced-motion
✅ Test on mid-range Android (not just M1 Mac)
```
