# Creative Strategy Masterclass — section embeds for Systeme.io

Twelve copy-paste blocks covering every section of the masterclass landing
page (15 October 2026, ₱999), plus the sticky mobile CTA and footer. Each file
is complete on its own.

There is no header block and no curriculum block: both were cut from the page
on review. The accordion CSS is still in every block, so the curriculum can be
put back as markup alone if you change your mind.

These are the Systeme.io version of `../masterclass.html`. The two are the same
page — edit whichever one you actually publish, not both.

| File | Section | Spec ID |
|---|---|---|
| `01-hero.html` | Hero | `#hero` |
| `02-problem.html` | You can read the dashboard | `#problem` |
| `03-shift.html` | The shift (dark band) | `#shift` |
| `04-outcomes.html` | What you leave with | `#outcomes` |
| `05-for-you.html` | Who it's for | `#for-you` |
| `06-host.html` | Your host | `#about` |
| `07-testimonials.html` | Student testimonials (filled) | `#testimonials` |
| `08-details.html` | The details + price | `#details` |
| `09-faq.html` | FAQ (accordion) | `#faq` |
| `10-final-cta.html` | Final CTA | `#final-cta` |
| `11-sticky-cta.html` | Sticky mobile price + button bar | — |
| `12-footer.html` | Footer + disclaimer | — |

Add them in this order. Sections are independent — skipping one is fine.

## Before you paste anything: the checkout link

Every button points at `PASTE_XENDIT_CHECKOUT_URL_HERE`. Fill it in all
twelve files at once, then paste:

```bash
sed -i 's|PASTE_XENDIT_CHECKOUT_URL_HERE|https://checkout.xendit.co/od/your-link|g' *.html
```

It appears once each in four blocks: `01-hero`, `08-details`, `10-final-cta`
and `11-sticky-cta`. Until it is filled, the buttons go nowhere.

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
- **Replay** is stated as included for 7 days, in both `08-details` and the FAQ.
- **The FAQ** names CSI honestly and promises no attendee-only offer.
- **No run time is stated**, so the evening can be tightened on the night
  without the page contradicting you.

Dates and price are filled throughout: Thursday 15 October 2026, 7:00 PM PHT,
₱999.

## Notes

- Curriculum and FAQ are `<details>` accordions — they work with no JavaScript.
- `11-sticky-cta.html` only appears below 780px wide. Add it once, anywhere on
  the page.
- The `<script>` in each file drives the scroll fade-ups and the footer year.
  Safe on every block; it only initialises a block once. Remove it and
  everything still displays, just without motion.
- Google Fonts is the only external request. Every image is inlined, which is
  why `06-host.html` is large (~285K) — that is expected, and it still pastes.
- Reduced-motion preferences are respected automatically.

## One difference from `../embeds`

The CSI blocks reserve room for the sticky bar with
`.csi{padding-bottom:104px}` inside the `max-width:780px` media query. Because
that rule lands on *every* block's wrapper, a page built from a dozen blocks gets a dozen gaps — about 1,400px of empty space on a phone. These blocks put the same
reservation on `body` instead, so it is counted once.

If the CSI page ever looks oddly long on mobile, that rule is why, and the same
one-line change fixes it there.
