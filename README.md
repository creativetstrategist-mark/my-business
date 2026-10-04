# my-business

Static website for my business. Plain HTML, CSS and JavaScript — no build step,
no dependencies. Open a file, edit it, refresh the browser.

## Structure

```
index.html            Home
masterclass.html      Workshop landing page (15 Oct 2026) — see below
register.html         Registration step: name + email, then on to payment
services.html         Services
about.html            About
contact.html          Contact (form is not wired up yet — see below)
404.html              Not-found page
assets/css/styles.css All styling; design tokens live at the top
assets/js/main.js     Footer year, mobile nav, form handling
assets/img/           Put images here
.nojekyll             Tells GitHub Pages to serve files as-is
.github/workflows/    Auto-deploy to GitHub Pages on push to main
```

## The masterclass landing page

`masterclass.html` is the landing page for **The Meta Ads Creative Strategy
Workshop**, one evening live on 15 October 2026 (₱999). The hero is centred and
has no nav header; an announcement bar sits in its place.

It shares the CSI layout system but **not** the CSI palette: the accent here is
purple (`--volt: #a78bfa`), not yellow. The token is still called `--volt` from
when the page started on yellow — every rule reads the token, so the name is
historical only. It is self-contained — all styling and script are
inline — and reuses the layout system from `index.html`. Images are referenced from `assets/`, not inlined.

The funnel is two pages. Every button on `masterclass.html` goes to
`register.html`, which takes a name and email and then sends people on to
payment. Nothing links to the checkout directly.

**`register.html` needs two values before it works.** A static page cannot
store a lead by itself: the form posts to a service, which saves the row and
then forwards to the checkout URL in its hidden `_next` field.

```bash
sed -i 's|PASTE_FORM_ENDPOINT_HERE|https://your-form-service/f/xxxx|g;
        s|PASTE_CHECKOUT_URL_HERE|https://checkout.xendit.co/od/your-link|g' register.html
```

Until both are filled the page shows a magenta "Not connected yet" panel and
refuses to submit, so it cannot be put in front of traffic half-wired. Any
service that accepts a plain POST works — Systeme.io, Formspree, Basin.

The Systeme.io blocks in `embeds-masterclass/` carry
`PASTE_REGISTRATION_URL_HERE` instead of linking to `register.html`, because
there the registration page lives at a URL rather than next door.

Once pushed, the page is live at
`https://creativetstrategist-mark.github.io/my-business/masterclass.html`.

## Running it locally

Just open `index.html` in a browser. For a proper local server (needed if you
later add fetch calls):

```bash
python3 -m http.server 8000
# then visit http://localhost:8000
```

## Making it yours

1. **Text** — search the HTML files for placeholder copy and replace it.
2. **Name** — replace every `My Business` and `hello@example.com`.
3. **Colors and fonts** — edit the `:root` block at the top of
   `assets/css/styles.css`. Dark mode values are in the
   `prefers-color-scheme: dark` block just below it.
4. **Pages** — copy an existing HTML file, rename it, and add a link in both the
   header `<nav>` and the footer of every page.

## Wiring up the contact form

The form currently posts nowhere and shows a message telling visitors to email
instead. To make it send:

- Sign up for a form service (Formspree, Basin, Netlify Forms are all free to
  start), then set the form's `action` to the URL they give you.
- `assets/js/main.js` automatically stops intercepting the submit as soon as
  `action` is something other than `#`.

## Publishing

This repo is public, so GitHub Pages works on a free account. To turn it on:
repository **Settings → Pages → Source → GitHub Actions**. After that, every
push to `main` redeploys automatically — the workflow is in
`.github/workflows/pages.yml`.

Your site will be live at `https://creativetstrategist-mark.github.io/my-business/`.
To use your own domain instead, add it under Settings → Pages → Custom domain,
then point a CNAME record at `creativetstrategist-mark.github.io` with your
domain registrar.

## A note on the repo being public

Anyone can read every file here, including the full commit history. Deleting a
secret in a later commit does **not** remove it — it stays in the history.

So never commit: API keys, form-service secret keys, passwords, `.env` files,
or private customer data. `.gitignore` already excludes `.env` files as a
safety net. Anything a form needs to stay secret belongs in the form service's
own dashboard, not in this code.

The `LICENSE` file keeps all rights reserved. Public visibility only means
people can *read* the code — it does not give them permission to reuse it.
