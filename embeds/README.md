# CSI Batch 3 — section embeds for Systeme.io

Fifteen copy-paste blocks covering the twelve spec sections plus the header,
sticky mobile CTA and footer. Each file is complete on its own.

| File | Section | Spec ID |
|---|---|---|
| `01-header.html` | Sticky header + nav | — |
| `02-hero.html` | Hero | `#hero` |
| `03-shift.html` | The Shift | `#shift` |
| `04-for-you.html` | Who It's For | `#for-you` |
| `05-outcomes.html` | Outcomes | `#outcomes` |
| `06-format.html` | How It's Different | `#format` |
| `07-curriculum.html` | Curriculum (accordion) | `#curriculum` |
| `08-last-live.html` | Last Live Batch (dark band) | `#last-live` |
| `09-pricing.html` | Pricing | `#pricing` |
| `10-about.html` | About the Coach | `#about` |
| `11-testimonials.html` | Testimonials (placeholders) | `#testimonials` |
| `12-faq.html` | FAQ (accordion) | `#faq` |
| `13-final-cta.html` | Final CTA | `#final-cta` |
| `14-sticky-cta.html` | Sticky mobile price + button bar | — |
| `15-footer.html` | Footer | — |

Add them in this order. Sections are independent — skipping one is fine.

## Adding one to a Systeme.io page

1. Edit the page, then **Add element → Raw HTML** (under "Advanced").
2. Open the file, select all, copy, paste into that element.
3. Save, then **Preview** — the builder canvas does not run the code, so a
   block often looks plain while you are editing. Preview shows the truth.

**Set each row's top and bottom padding to 0.** Systeme.io's default row padding
shows as a white stripe between the colour bands.

The blocks break out of Systeme.io's centred column on their own, so the bands
reach the screen edges. To keep a section boxed inside the column instead,
delete these two lines near the end of its `<style>`:

```
html{overflow-x:clip!important;}
.csi{width:100vw!important;max-width:100vw!important;margin-inline:calc(50% - 50vw)!important;}
```

## Placeholders

Every unfilled value is wrapped in a **magenta chip or dashed box**. The brand
ground is already yellow, so a yellow highlight would disappear on the hero,
outcomes, pricing and final CTA bands — magenta sits outside the palette and
stays findable everywhere. Search the files for `[` to list them.

`[CHECKOUT_URL]` is the exception: it sits in `href="[CHECKOUT_URL]"` and cannot
be styled. **Find and replace it across every file before publishing** — until
you do, the buttons lead nowhere.

### What still needs filling

| Placeholder | File |
|---|---|
| `[CHECKOUT_URL]` | 01, 02, 09, 13, 14 — every button |
| `[NUMBER]` live sessions / seats | 09-pricing |
| `[PLATFORM]`, `[ACCESS_DURATION]` | 09-pricing |
| `[SESSION_REPLAYS]`, `[COMMUNITY_ACCESS_OR_BONUS]` — confirm or remove | 09-pricing |
| `[MARK_PHOTO]`, `[ADD_CREDIBILITY]` | 10-about |
| Testimonials ×3 with `[NAME]`, `[ROLE]` | 11-testimonials |
| `[REPLAY_POLICY]`, `[LIVE_HOURS_AND_WEEKLY_WORKSHEET_TIME]` | 12-faq |
| `[PAYMENT_OPTIONS]`, `[REFUND_POLICY]` | 12-faq |

Dates are **already filled** from what you confirmed: Batch 3 runs 20–22 October
2026, early bird ends 13 October 2026. Tell me if you'd rather have those back
as placeholders.

## Notes

- Curriculum and FAQ are `<details>` accordions — they work with no JavaScript.
  Module title and one-line description show by default; lessons open on tap.
- `14-sticky-cta.html` only appears below 780px wide, and adds bottom padding so
  it never covers the footer. Add it once, anywhere on the page.
- The `<script>` in each file drives the scroll fade-ups and the footer year.
  Safe on every block; it only initialises a block once. Remove it and
  everything still displays, just without motion.
- Google Fonts is the only external request.
- Reduced-motion preferences are respected automatically.
