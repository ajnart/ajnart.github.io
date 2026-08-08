#!/usr/bin/env bash
# Regenerates assets/cv-thomas-camlong.pdf from index.html using headless Chrome.
# Usage: npm run pdf   (or)   bash scripts/generate-pdf.sh
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
OUT="$ROOT/assets/cv-thomas-camlong.pdf"
mkdir -p "$ROOT/assets"

CHROME="${CHROME:-}"
if [[ -z "$CHROME" ]]; then
  for candidate in google-chrome google-chrome-stable chromium chromium-browser; do
    if command -v "$candidate" >/dev/null 2>&1; then
      CHROME="$(command -v "$candidate")"
      break
    fi
  done
fi

if [[ -z "$CHROME" ]]; then
  echo "error: no Chrome/Chromium found. Install one or set CHROME=/path/to/chrome" >&2
  exit 1
fi

"$CHROME" \
  --headless=new \
  --disable-gpu \
  --no-sandbox \
  --hide-scrollbars \
  --virtual-time-budget=5000 \
  --no-pdf-header-footer \
  --generate-pdf-document-structure \
  --print-to-pdf="$OUT" \
  "file://$ROOT/index.html" >/dev/null

size="$(du -h "$OUT" | cut -f1)"
echo "ok: $OUT ($size)"