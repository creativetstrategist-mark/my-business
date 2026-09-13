# my-business

Static website for my business. Plain HTML, CSS and JavaScript — no build step,
no dependencies. Open a file, edit it, refresh the browser.

## Structure

```
index.html            Home
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
