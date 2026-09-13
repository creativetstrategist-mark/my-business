# Section embeds — Creative Strategy Intensive

Twelve copy-paste blocks, one per section of the page. Each file is complete on
its own: paste the whole contents into any "Custom HTML" / "Embed code" block in
a page builder (Systeme.io, Webflow, Squarespace, WordPress, Kajabi, Framer).

| File | Section |
|---|---|
| `01-header.html` | Sticky header + nav |
| `02-hero.html` | Hero + hook-rate panel |
| `03-problem.html` | "Sound familiar?" — three pain cards |
| `04-shift.html` | "Creative strategy isn't taste" (dark band) |
| `05-outcomes.html` | What you'll walk away with |
| `06-curriculum.html` | Three days, in order |
| `07-fit.html` | Good fit / not a fit |
| `08-proof.html` | Testimonials — **placeholder copy** |
| `09-pricing.html` | Early bird pricing |
| `10-faq.html` | FAQ accordion |
| `11-final-cta.html` | Closing call to action |
| `12-footer.html` | Footer |

## How to use

1. Open a file, select all, copy.
2. In your builder, add a Custom HTML / Embed element.
3. Paste. Save. Done.

Use as many or as few as you like, **in any order**. Skipping sections is fine.

## Why each file repeats the same CSS

A page builder gives each embed its own box and does not share styles between
them, so every file carries the full stylesheet. That costs about 20 KB per
block, but it means any single block works alone and the order you add them in
never matters. Browsers parse the duplicates once each; it does not slow the
page down meaningfully.

If your builder lets you paste code into the page `<head>`, you can instead put
one copy of the `<style>` and `<script>` there and strip them from the
individual blocks.

## How they stay isolated from your theme

Everything is wrapped in `<div class="csi">` and every rule is scoped to it, so
these blocks cannot restyle the rest of your page. The rules also carry
`!important` so your theme cannot restyle *them* — this was tested against a
deliberately hostile stylesheet that forced heading colours, borders, fonts and
letter-spacing with `!important`, and nothing leaked in either direction.

## Notes

- The `<script>` at the bottom of each file drives the scroll fade-ups and the
  footer year. It is safe to have on every block — it only ever initialises a
  block once. Delete it and everything still displays, just without motion.
- Google Fonts is the only external request. Remove the three `<link>` tags and
  the page falls back to system fonts.
- Reduced-motion preferences are respected automatically.

## Before you go live

- `08-proof.html` contains placeholder testimonials on dashed borders. Replace
  with real, attributable quotes or delete the section.
- `09-pricing.html` — confirm the early bird rate, the regular rate and the
  closing date.
- Dates ("starts 6 April", "closes 23 March") appear in `02-hero.html`,
  `09-pricing.html` and `11-final-cta.html`.
- Buttons currently link to `#` — point them at your checkout.
