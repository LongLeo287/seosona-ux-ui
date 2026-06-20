# SEOSONA Design Tokens
# Single Source of Truth — Sao chép giá trị này vào mọi dự án web

---

## COLOR TOKENS

### Backgrounds
| Token Name | Value | Tailwind | Mô tả |
|---|---|---|---|
| `color-canvas-base` | `#FFFFFF` | `bg-white` | Nền trang chính |
| `color-canvas-surface` | `#F8FAFC` | `bg-slate-50` | Nền nâng cao (sections) |
| `color-canvas-elevated` | `#F1F5F9` | `bg-slate-100` | Nền card/element nổi |

### Typography
| Token Name | Value | Tailwind | Mô tả |
|---|---|---|---|
| `color-text-headers` | `#04091A` | — | Heading, text đậm |
| `color-text-body` | `#64748B` | `text-slate-500` | Body text |
| `color-text-muted` | `#94A3B8` | `text-slate-400` | Caption, placeholder |

### Accents
| Token Name | Value | Tailwind | Mô tả |
|---|---|---|---|
| `color-primary` | `#1D4ED8` | `text-blue-700` | Primary action, CTA |
| `color-primary-hover` | `#2563EB` | `text-blue-600` | Hover state |
| `color-button-dark` | `#04091A` | — | Dark button background |
| `color-accent-indigo` | `#6366F1` | `text-indigo-500` | Secondary icon accent |
| `color-accent-amber` | `#F59E0B` | `text-amber-500` | Warning/highlight accent |

### Borders
| Token Name | Value | Tailwind |
|---|---|---|
| `color-border-default` | `#E2E8F0` | `border-slate-200` |
| `color-border-subtle` | `#F1F5F9` | `border-slate-100` |

---

## TYPOGRAPHY TOKENS

```css
/* Import vào đầu mọi file CSS */
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@700;800;900&family=Inter:wght@400;500;600&family=JetBrains+Mono:wght@400;500&display=swap');

:root {
  --font-heading: 'Poppins', sans-serif;
  --font-body: 'Inter', sans-serif;
  --font-code: 'JetBrains Mono', monospace;
}
```

| Token | Size | Weight | Line Height | Dùng cho |
|---|---|---|---|---|
| `text-display` | 60px / 3.75rem | 900 | 1.1 | Hero headline lớn |
| `text-h1` | 48px / 3rem | 800 | 1.15 | Page title |
| `text-h2` | 36px / 2.25rem | 700 | 1.2 | Section title |
| `text-h3` | 28px / 1.75rem | 700 | 1.3 | Sub-section |
| `text-h4` | 22px / 1.375rem | 600 | 1.4 | Card title |
| `text-body` | 16px / 1rem | 400 | 1.6 | Body text |
| `text-small` | 14px / 0.875rem | 400 | 1.5 | Caption, meta |
| `text-caption` | 12px / 0.75rem | 500 | 1.4 | Badge, tag |

---

## SPACING TOKENS

```css
:root {
  --space-xs:   4px;
  --space-sm:   8px;
  --space-md:   16px;
  --space-lg:   24px;
  --space-xl:   32px;
  --space-2xl:  48px;
  --space-3xl:  64px;
  --space-4xl:  96px;
  --space-5xl:  128px;

  /* Section spacing */
  --section-py:  80px;       /* padding-y cho sections */
  --section-py-lg: 120px;   /* padding-y lớn cho hero */
  --container-max: 1280px;  /* max-width container */
  --container-px: 24px;     /* padding ngang */
}
```

---

## BORDER RADIUS TOKENS

```css
:root {
  --radius-sm:   8px;   /* Badge, Tag */
  --radius-md:   12px;  /* Input, small card */
  --radius-lg:   16px;  /* Card */
  --radius-xl:   20px;  /* Large card */
  --radius-2xl:  28px;  /* Feature block */
  --radius-full: 9999px; /* Button, pill, avatar */
}
```

---

## SHADOW TOKENS

```css
:root {
  --shadow-xs:  0 1px 2px 0 rgb(0 0 0 / 0.05);
  --shadow-sm:  0 1px 3px 0 rgb(0 0 0 / 0.1), 0 1px 2px -1px rgb(0 0 0 / 0.1);
  --shadow-md:  0 4px 6px -1px rgb(0 0 0 / 0.1), 0 2px 4px -2px rgb(0 0 0 / 0.1);
  --shadow-lg:  0 10px 15px -3px rgb(0 0 0 / 0.1), 0 4px 6px -4px rgb(0 0 0 / 0.1);
  --shadow-xl:  0 20px 25px -5px rgb(0 0 0 / 0.1), 0 8px 10px -6px rgb(0 0 0 / 0.1);
  --shadow-hover: 0 20px 40px -10px rgb(29 78 216 / 0.15);
}
```

---

## MOTION TOKENS (Anime.js)

```javascript
// Dùng trong mọi Anime.js animation
const MOTION = {
  easing: {
    default:   'easeOutQuart',   // UI transitions
    bounce:    'easeOutBack',    // Playful interactions (dùng hạn chế)
    smooth:    'easeInOutQuart', // Page transitions
    spring:    'spring(1, 80, 10, 0)', // Micro-interactions
  },
  duration: {
    micro:   150,  // hover, focus ring
    short:   250,  // button press, icon swap
    default: 400,  // element entrance
    medium:  600,  // card animation
    long:    800,  // hero entrance
    page:    1200, // page-level transition
  },
  delay: {
    stagger: 80,   // stagger giữa các items
  }
}
```

---

## CSS CUSTOM PROPERTIES — BOILERPLATE

```css
/* Paste vào đầu file style.css của mọi dự án SEOSONA */
:root {
  /* Colors */
  --color-canvas-base: #FFFFFF;
  --color-canvas-surface: #F8FAFC;
  --color-canvas-elevated: #F1F5F9;
  --color-text-headers: #04091A;
  --color-text-body: #64748B;
  --color-text-muted: #94A3B8;
  --color-primary: #1D4ED8;
  --color-primary-hover: #2563EB;
  --color-button-dark: #04091A;
  --color-border: #E2E8F0;

  /* Fonts */
  --font-heading: 'Poppins', sans-serif;
  --font-body: 'Inter', sans-serif;

  /* Spacing */
  --container-max: 1280px;
  --container-px: 1.5rem;
  --section-py: 5rem;

  /* Radius */
  --radius-card: 1.25rem;
  --radius-button: 9999px;

  /* Shadows */
  --shadow-card: 0 1px 3px 0 rgb(0 0 0 / 0.1);
  --shadow-hover: 0 20px 40px -10px rgb(29 78 216 / 0.15);

  /* Motion */
  --transition-default: all 300ms cubic-bezier(0.25, 0.46, 0.45, 0.94);
  --transition-hover: transform 300ms ease, box-shadow 300ms ease;
}
```
