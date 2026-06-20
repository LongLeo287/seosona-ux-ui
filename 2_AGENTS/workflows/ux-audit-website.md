# Workflow: UX Audit Website
# Quy trình kiểm tra và đánh giá UX/UI của bất kỳ website nào

---

## Trigger
Kích hoạt khi nhận được lệnh dạng:
- "Audit UX/UI của website [URL]"
- "Chấm điểm giao diện website [tên]"
- "Phân tích trải nghiệm người dùng của [URL]"

## Input Required
- `url`: URL website cần audit
- `context` (optional): Mục tiêu kinh doanh, đối tượng người dùng

## Output
- File Markdown báo cáo tại: `4_MEMORY/audits/{domain}/ux-audit-{date}.md`
- Điểm tổng (0–100) với phân tích chi tiết từng hạng mục

---

## Các Bước Thực Thi

### Bước 1: Thu Thập Dữ Liệu (Data Collection)

```
1a. Chụp ảnh màn hình desktop (1440px) và mobile (375px)
1b. Đo Core Web Vitals qua PageSpeed Insights API
    - LCP (Largest Contentful Paint) — target: < 2.5s
    - INP (Interaction to Next Paint) — target: < 200ms
    - CLS (Cumulative Layout Shift) — target: < 0.1
1c. Crawl cấu trúc: H1-H6, navigation, CTA buttons, forms
1d. Kiểm tra mobile responsiveness
1e. Kiểm tra accessibility cơ bản (alt text, color contrast, focus states)
```

### Bước 2: Phân Tích 7 Hạng Mục (Analysis)

#### 🎨 Hạng Mục 1: Visual Design (20 điểm)
- Hierarchy có rõ ràng không? (Headlines vs body text)
- Color palette có nhất quán không?
- Whitespace có đủ không? (Tránh cluttered)
- Typography có readable không?

#### 🧭 Hạng Mục 2: Navigation & Information Architecture (15 điểm)
- User có tìm thấy thông tin trong 3 clicks không?
- Menu có rõ ràng, predictable không?
- Breadcrumb, sitemap có không?
- Search functionality (nếu cần)?

#### 📱 Hạng Mục 3: Mobile Experience (20 điểm)
- Layout có adapt tốt không? (không bị vỡ, overflow)
- Touch targets tối thiểu 44x44px?
- Text có readable không khi không zoom?
- CTA buttons có accessible trên thumb zone không?

#### ⚡ Hạng Mục 4: Performance (15 điểm)
- LCP score
- CLS score
- INP score
- Unoptimized images?

#### 🎯 Hạng Mục 5: Conversion Optimization (15 điểm)
- CTA có rõ ràng, nổi bật không?
- Forms có tối giản không? (chỉ hỏi thông tin cần thiết)
- Social proof có không? (testimonials, logos)
- Trust signals có không? (cert, guarantee, reviews)

#### ♿ Hạng Mục 6: Accessibility (10 điểm)
- Color contrast ratio ≥ 4.5:1
- Alt text cho images
- Keyboard navigable
- ARIA labels cho interactive elements

#### 🔤 Hạng Mục 7: Content Quality (5 điểm)
- Headlines có benefit-driven không? (không phải feature-driven)
- Copy có clear, concise không?
- Tiếng Việt có dấu đúng không?

### Bước 3: Xuất Báo Cáo (Report Generation)

```markdown
# UX Audit Report: {domain}
Date: {date}

## Tổng Điểm: {score}/100 — {grade}

## Điểm Nổi Bật (Top 3 Strengths)
...

## Vấn Đề Nghiêm Trọng (Critical Issues)
...

## Chi Tiết Từng Hạng Mục
...

## Action Plan (Ưu tiên cao → thấp)
1. [Quick wins — dưới 1 ngày]
2. [Short-term — 1 tuần]
3. [Long-term — 1 tháng+]
```

---

## Grading Scale
| Điểm | Grade | Đánh Giá |
|---|---|---|
| 90-100 | A+ | Xuất sắc — Benchmark cho ngành |
| 80-89 | A | Tốt — Trên mức trung bình |
| 70-79 | B | Khá — Cần cải thiện một số điểm |
| 60-69 | C | Trung bình — Nhiều vấn đề cần sửa |
| < 60 | D/F | Kém — Cần redesign nghiêm túc |
