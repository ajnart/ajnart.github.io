# CV — Thomas Camlong

Minimal ATS-friendly CV. Deploys to GitHub Pages at https://ajnart.github.io/.

## Project layout

- `index.html` — single-file CV (inline CSS, self-hosted Inter font). The source of truth for both the website and the PDF.
- `assets/cv-thomas-camlong.pdf` — generated PDF, rebuilt with `npm run pdf`.
- `fonts/inter/` — self-hosted Inter variable font (WOFF2), no external font CDN.

## Regenerate the PDF

Requires Chrome/Chromium on your machine (any of `google-chrome`, `google-chrome-stable`, `chromium`).

```sh
npm run pdf
# or: bash scripts/generate-pdf.sh
# or: CHROME=/path/to/chrome npm run pdf
```

## Why it's ATS-friendly

- Text-based PDF (not an image), single column, A4, 2 pages, no page headers/footers.
- Standard section names: `Experience`, `Skills`, `Education`.
- Roles, companies, locations, dates, and employment types are semantically separated.
- Skills are comma-separated so parsers tokenize them correctly.
- Dates use `MMM YYYY` ranges; contact info lives in the body (not a page header).
