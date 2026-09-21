# CSI Batch 3 — section embeds for Systeme.io

Eighteen copy-paste blocks, plus one optional variant, covering every section on the page plus the header,
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
| `11-client-quotes.html` | Client testimonials (filled) | `#client-testimonials` |
| `12-client-videos.html` | Client video clips (placeholders) | `#client-videos` |
| `13-testimonials.html` | Student testimonials (filled) | `#testimonials` |
| `14-video.html` | Student video testimonials (placeholders) | `#video-testimonials` |
| `15-faq.html` | FAQ (accordion) | `#faq` |
| `16-final-cta.html` | Final CTA | `#final-cta` |
| `17-sticky-cta.html` | Sticky mobile price + button bar | — |
| `18-footer.html` | Footer | — |
| `19-student-header.html` | Student testimonials, heading only (optional) | `#testimonials` |

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

The checkout link is no longer a placeholder: every button already points at
the Xendit checkout.

### What still needs filling

| Placeholder | File |
|---|---|
| `[CLIENT_YOUTUBE_ID_1..3]`, `[CLIENT_VIDEO_n_NAME_AND_BRAND]` | 12-client-videos |
| `[YOUTUBE_ID_1..3]`, `[VIDEO_n_NAME_AND_ROLE]` | 14-video |

The checkout link is **already filled in** — every button points at
`https://checkout.xendit.co/od/csi-earlybirdrate`. That link is the early bird
offer, so it needs swapping for a regular-rate link once early bird closes on
13 October 2026.

Dates are **already filled** from what you confirmed: Batch 3 runs 20–22 October
2026, early bird ends 13 October 2026. Tell me if you'd rather have those back
as placeholders.

## Notes

- Curriculum and FAQ are `<details>` accordions — they work with no JavaScript.
  Module title and one-line description show by default; lessons open on tap.
- `17-sticky-cta.html` only appears below 780px wide, and adds bottom padding so
  it never covers the footer. Add it once, anywhere on the page.
- The `<script>` in each file drives the scroll fade-ups and the footer year.
  Safe on every block; it only initialises a block once. Remove it and
  everything still displays, just without motion.
- The two video blocks are click-to-play. Nothing is requested from YouTube
  until a visitor clicks a card, and playback uses youtube-nocookie.com. A
  card whose ID is still a placeholder stays a plain link to YouTube.
- Google Fonts is the only external request.
- Reduced-motion preferences are respected automatically.
