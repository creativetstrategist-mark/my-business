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

Until they are here, `masterclass.html` shows a magenta dashed circle in each
slot — the repo's marker for a value that is not filled in yet. That is
deliberate: it cannot go in front of traffic without someone noticing.

To wire them up once the three files are in place:

```bash
scripts/fill-client-photos.sh
```

That swaps each `<span class="av">` for the matching `<img class="av-img">`,
which is the same markup the student quotes already use.
