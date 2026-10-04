# Creative Strategy Masterclass — section embeds for Systeme.io

Fifteen copy-paste blocks covering every section of the masterclass landing
page (15 October 2026, ₱999), plus the announcement bar, sticky mobile CTA and
footer. Each file is complete on its own.

There is no nav header: it was cut on review, and the announcement bar took its
place above the hero. The curriculum is back as a grid of six cards rather than
the accordion it started as, and the cards are phrased as what you learn rather
than numbered modules.

The accent is **purple** (`#a78bfa`), not the CSI yellow. The CSS variable is
still named `--volt` from the yellow the page started on; every rule reads the
token, so the name is historical. To re-colour, change `--volt` and
`--volt-deep` in each block, plus the `#342151` literal used for secondary text
on accent bands.

These are the Systeme.io version of `../masterclass.html`. The two are the same
page — edit whichever one you actually publish, not both.

| File | Section | Spec ID |
|---|---|---|
| `01-announce.html` | Announcement bar | — |
| `02-hero.html` | Hero | `#hero` |
| `03-problem.html` | You can read the dashboard | `#problem` |
| `04-shift.html` | The shift (dark band) | `#shift` |
| `05-curriculum.html` | What you'll learn (cards) | `#curriculum` |
| `06-outcomes.html` | What you leave with | `#outcomes` |
| `07-for-you.html` | Who it's for | `#for-you` |
| `08-host.html` | Your host | `#about` |
| `09-testimonials.html` | Student testimonials (filled) | `#testimonials` |
| `10-seats.html` | Limited seats band | `#seats` |
| `11-details.html` | The details + price | `#details` |
| `12-faq.html` | FAQ (accordion) | `#faq` |
| `13-final-cta.html` | Final CTA | `#final-cta` |
| `14-sticky-cta.html` | Sticky mobile price + button bar | — |
| `15-footer.html` | Footer + disclaimer | — |

Add them in this order. Sections are independent — skipping one is fine.

## Two values still to fill

### 1. The seat count

`01-announce.html` and `10-seats.html` both say `[SEAT_COUNT]`, shown as a
magenta chip so it cannot be missed. Set it to the real cap:

```bash
sed -i 's|\[SEAT_COUNT\]|25|g' *.html
```

Nothing else on the page claims scarcity — no countdown, no "price rises
soon" — so this number is the only limit stated, and it should be true.

### 2. The checkout link

Every button points at `PASTE_XENDIT_CHECKOUT_URL_HERE`. Fill it in all
fifteen files at once, then paste:

```bash
sed -i 's|PASTE_XENDIT_CHECKOUT_URL_HERE|https://checkout.xendit.co/od/your-link|g' *.html
```

It appears once each in four blocks: `02-hero`, `11-details`, `13-final-cta`
and `14-sticky-cta`. Until it is filled, the buttons go nowhere.

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

## What is already filled

Everything except the checkout link. In particular:

- **The hero** is centred and its button reads just "Save my seat". The price
  is shown in the details card, the sticky bar and the final CTA.

- **Testimonials** are four real student quotes with their photos, carried over
  from the CSI page.
- **The host block** has Mark's portrait and both "as featured in" covers
  inlined, so nothing is loaded from this repo at runtime.
- **Replay** is stated as included for 7 days, in both `11-details` and the FAQ.
- **The FAQ** names CSI honestly and promises no attendee-only offer.
- **No run time is stated**, so the evening can be tightened on the night
  without the page contradicting you.

Dates and price are filled throughout: Thursday 15 October 2026, 7:00 PM PHT,
₱999.

## Notes

- Curriculum and FAQ are `<details>` accordions — they work with no JavaScript.
- `14-sticky-cta.html` only appears below 780px wide. Add it once, anywhere on
  the page.
- The `<script>` in each file drives the scroll fade-ups and the footer year.
  Safe on every block; it only initialises a block once. Remove it and
  everything still displays, just without motion.
- Google Fonts is the only external request. Every image is inlined, which is
  why `08-host.html` is large (~285K) — that is expected, and it still pastes.
- Reduced-motion preferences are respected automatically.

## One difference from `../embeds`

The CSI blocks reserve room for the sticky bar with
`.csi{padding-bottom:104px}` inside the `max-width:780px` media query. Because
that rule lands on *every* block's wrapper, a page built from a dozen blocks gets a dozen gaps — about 1,400px of empty space on a phone. These blocks put the same
reservation on `body` instead, so it is counted once.

If the CSI page ever looks oddly long on mobile, that rule is why, and the same
one-line change fixes it there.
