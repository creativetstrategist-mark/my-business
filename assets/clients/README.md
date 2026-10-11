# Client photos

Three photos go here, named exactly:

| File | Person | Quote on the page |
|---|---|---|
| `luka.jpg` | Luka Maric | Co-Founder at Dog Friendly Co. |
| `paige.jpg` | Paige Decker | Fractional CMO, ex-Meta / AG1 / True Classic |
| `andy.jpg` | Andy Reymond | Scaling DTC brands |

Square, 160×160 or larger. They are rendered at 48px in a circle and
cropped with `object-fit:cover`, so a square crop centred on the face works
best; a wide photo will have its sides cut off.

These three are filled, taken from the live CSI page (claude.ai artifact
KxrEFtkFfmstafAn6uumzV), which carries them inlined as base64. They are
LinkedIn profile photos, already cropped square, and two still carry LinkedIn's
ring overlay — a purple "#HIRING" ring on Luka and a green one on Andy. At
48px those read as a coloured rim rather than text.

If a photo ever needs replacing, drop the new file in and re-run:

```bash
scripts/fill-client-photos.sh
```

That swaps each `<span class="av">` for the matching `<img class="av-img">`,
which is the same markup the student quotes already use.
