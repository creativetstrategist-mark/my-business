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

## One value still to fill: the registration page

Every button goes to the registration page first, and on to payment from
there. None of them points at the Xendit checkout directly, so the page never
asks for money before you have the name and email.

Fill it in all fifteen files at once, then paste:

```bash
sed -i 's|PASTE_REGISTRATION_URL_HERE|https://your-funnel/register|g' *.html
```

It appears once each in four blocks: `02-hero`, `11-details`, `13-final-cta`
and `14-sticky-cta`. Until it is filled, the buttons go nowhere.

The registration step collects name and email, then sends people on to the
₱999 payment. Set that up as two steps of one Systeme.io funnel: the
registration page, with the order form as the step after it.

The seat cap is no longer a number anywhere on the page — the bar and the band
both say "limited seats" — so nothing here commits you to a count.

## The registration page block

`registration.html` is **not** part of the fifteen above and does not go on the
landing page. It is the whole registration step, for a second Systeme.io page
that the landing page's buttons point at.

It needs two values of its own, neither of which is the registration URL:

```bash
sed -i 's|PASTE_FORM_ENDPOINT_HERE|https://your-form-service/f/xxxx|g;
        s|PASTE_CHECKOUT_URL_HERE|https://checkout.xendit.co/od/your-link|g' registration.html
```

The form posts the name and email to the endpoint, which saves the row and then
forwards to the checkout URL in its hidden `_next` field. While either value is
still a placeholder the block shows a magenta "Not connected yet" panel and
refuses to submit, so it cannot go in front of traffic half-wired.

**For Systeme.io specifically, consider its own opt-in element instead.** A raw
HTML form posts wherever you point it, but it will not create a Systeme.io
contact unless the endpoint is Systeme.io's own. If these people need to get
the Zoom link and the CSI follow-up from Systeme.io, the native opt-in element
is the one that puts them on the list. This block is the right answer when the
registration page is hosted anywhere else.

## The CTA-free hero block

`hero-no-cta.html` is the landing page's hero — badge, title, the line under it
and the date — with no button. It is for a page that already has its own
action, such as sitting above the registration form, where a second call to
action would compete with the one that matters.

It is scoped to `.csi-hero` rather than `.csi`, so it can sit on the same page
as `registration.html` without either block's rules reaching into the other.

Nothing to fill in: there is no link in it.

If you use it above `registration.html`, both carry the date line. Delete the
`<p class="when">...</p>` from whichever one you want rid of.

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
