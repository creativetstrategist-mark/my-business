# Section embeds for Systeme.io — Creative Strategy Intensive

Twelve copy-paste blocks, one per section. Each file is complete on its own.

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

## Adding one to a Systeme.io page

1. Edit the page, then **Add element → Raw HTML** (under "Advanced").
2. Open the file here, select all, copy, and paste into that element.
3. Save, then use **Preview** — the builder canvas does not run the code, so a
   block often looks plain or empty while editing. Preview shows the truth.

Add as many or as few as you like, in any order. Sections are independent.

## Two builder settings that matter

**Row padding.** Systeme.io puts padding around every row, which shows as a
white stripe between the colour bands. For each row holding a block, set
top and bottom padding to **0** (row settings → Margin & padding) so the
bands butt against each other.

**Row width.** The blocks break out of Systeme.io's centred column on their own
so the yellow and black bands reach the screen edges. You do not need a
full-width row — but if you prefer each section boxed inside the column
instead, delete these two lines near the end of the `<style>` in each file:

```
html{overflow-x:clip!important;}
.csi{width:100vw!important;max-width:100vw!important;margin-inline:calc(50% - 50vw)!important;}
```

## Why each file repeats the same CSS

Systeme.io gives every Raw HTML element its own box and shares nothing between
them, so each file carries the whole stylesheet. That is about 22 KB per block.
It means any block works alone and the order never matters.

If you would rather load the CSS once: copy the `<style>` and `<script>` from
any one file into **Settings → Custom code → Header** for the page, then delete
those two tags from all twelve blocks, leaving only the `<div class="csi">…</div>`.
Faster, at the cost of the blocks depending on that header code.

## Isolation

Everything sits inside `<div class="csi">` and every rule is scoped to it, so
these blocks cannot restyle the rest of your Systeme.io page, and your theme
cannot restyle them. Both directions were tested against a deliberately hostile
stylesheet forcing heading colours, borders, fonts and letter-spacing with
`!important`.

## Notes

- The `<script>` at the bottom drives the scroll fade-ups and the footer year.
  Safe on every block — it only initialises a block once. If Systeme.io ever
  strips it, everything still displays; you just lose the motion.
- Google Fonts is the only external request. Remove the three `<link>` tags and
  it falls back to system fonts.
- Reduced-motion preferences are respected automatically.
- The sticky header in `01-header.html` may not stick, depending on how
  Systeme.io wraps the element. If it doesn't, use Systeme.io's own menu
  element instead and drop this block.

## Before you go live

- `08-proof.html` has placeholder testimonials on dashed borders. Replace with
  real, attributable quotes, or delete the section.
- `09-pricing.html` — confirm the early bird rate, the regular rate and the
  closing date.
- Dates ("starts 6 April", "closes 23 March") appear in `02-hero.html`,
  `09-pricing.html` and `11-final-cta.html`.
- Buttons link to `#`. Point them at your Systeme.io order form URL.
