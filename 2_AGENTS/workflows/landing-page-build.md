# Workflow: Landing Page Build (Autonomous)
# Quy trình tự động xây dựng landing page hoàn chỉnh từ brief đến HTML

---

## Trigger
Kích hoạt khi nhận được lệnh:
- "Build landing page cho [dịch vụ/sản phẩm]"
- "Tạo trang đích cho chiến dịch [Google Ads / SEO]"
- "Làm landing page [mục tiêu chuyển đổi]"

## Input Required
- `service`: Dịch vụ/sản phẩm cần quảng bá
- `target_audience`: Đối tượng khách hàng
- `goal`: Mục tiêu chuyển đổi (form lead / gọi điện / mua hàng)
- `keywords` (optional): Từ khóa SEO cần nhắm tới

## Output
- `4_MEMORY/projects/{project-name}/index.html`
- `4_MEMORY/projects/{project-name}/style.css`
- `4_MEMORY/projects/{project-name}/main.js`
- `4_MEMORY/projects/{project-name}/README.md` (hướng dẫn deploy)

---

## Pipeline 8 Bước

### Bước 1: Brief Analysis
```
- Xác định: Pain points của target audience
- Xác định: USP (Unique Selling Proposition) của dịch vụ
- Xác định: Primary CTA (1 action duy nhất — không có 2 CTA cùng lúc)
- Xác định: Trust signals cần có (số liệu, logo khách hàng, chứng chỉ)
```

### Bước 2: Competitor Research
```
- Tìm 3 landing page trong ngành tương tự (Google Search)
- Phân tích: Cấu trúc, CTA, copy, social proof
- Lấy cảm hứng (không copy) những điểm mạnh
```

### Bước 3: Content Architecture
```
Xác định cấu trúc page theo công thức AIDA + PAS:
  Section 1: Hero — Attention (Headline + Sub + CTA)
  Section 2: Problem — Agitate (Pain points)
  Section 3: Solution — Solution (Features/Benefits)
  Section 4: Social Proof — Credibility (Testimonials, Logos)
  Section 5: How It Works — Process (3 steps)
  Section 6: FAQ — Objection Handling
  Section 7: Final CTA — Action (Form/Contact)
```

### Bước 4: Copywriting
```
- Viết Headline: Benefit-driven, < 10 từ, có từ khóa SEO chính
- Viết Sub-headline: Expand on headline, < 20 từ
- Viết body copy: Problem → Agitate → Solve
- Viết CTA text: Action verb + Benefit (VD: "Nhận Báo Giá Miễn Phí")
- Viết FAQ: 5-7 câu hỏi objection thường gặp nhất
```

### Bước 5: HTML Structure
```html
<!-- Skeleton chuẩn SEOSONA -->
<!DOCTYPE html>
<html lang="vi">
<head>
  <!-- SEO meta tags -->
  <!-- Open Graph -->
  <!-- Google Fonts: Poppins + Inter -->
  <!-- Anime.js CDN -->
  <!-- style.css -->
</head>
<body>
  <header><!-- Sticky nav --></header>
  <main>
    <section id="hero">...</section>
    <section id="problem">...</section>
    <section id="solution">...</section>
    <section id="social-proof">...</section>
    <section id="how-it-works">...</section>
    <section id="faq">...</section>
    <section id="cta">...</section>
  </main>
  <footer>...</footer>
  <!-- main.js -->
</body>
</html>
```

### Bước 6: CSS Styling
```
- Import design tokens từ 1_LIBRARY/tokens/design-tokens.md
- Mobile-first (375px → 768px → 1024px → 1440px)
- Áp dụng đúng color system từ SOUL.md
- Component styles từ 1_LIBRARY/components/
```

### Bước 7: Motion & Interactions (Anime.js)
```javascript
// Áp dụng các patterns từ 1_LIBRARY/motion/
// Mandatory animations:
// - Hero entrance (fade + slide up, 600ms)
// - Scroll-triggered section reveals
// - CTA button hover pulse
// - Counter animation (số liệu/stats)
// - Form input focus states
```

### Bước 8: Validation Checklist
```
☐ Mobile responsive (375px, 768px, 1440px)
☐ All images have alt text
☐ Color contrast ≥ 4.5:1
☐ CTA button visible above the fold
☐ Form có validation
☐ Page title và meta description đã viết
☐ Open Graph tags đầy đủ
☐ prefers-reduced-motion được respect
☐ Không có Lorem Ipsum
☐ Mọi màu sắc đều từ design-tokens.md
```

---

## Template Starter

> Sau khi hoàn thành workflow, output file vào `4_MEMORY/projects/{slug}/`
> Ghi lại design decisions vào `README.md` trong cùng thư mục.
