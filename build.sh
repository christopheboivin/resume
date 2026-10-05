#!/usr/bin/env bash
# Build the CV PDF. Usage: ./build.sh [clean]
# Env: PDF_NAME overrides the output name, PDF_SUFFIX appends " - <suffix>" to it.
# Requires latexmk + pdflatex (TeX Live or MiKTeX). On Windows, run from Git Bash.
set -euo pipefail
cd "$(dirname "$0")"

PDF_NAME="${PDF_NAME:-CV Christophe BOIVIN - Technical Leader Fullstack - DevOps - $(date +%Y)}"
PDF_NAME="${PDF_NAME}${PDF_SUFFIX:+ - ${PDF_SUFFIX}}"

if [[ "${1:-}" == "clean" ]]; then
  latexmk -C
  rm -rf build dist
  exit 0
fi

latexmk -interaction=nonstopmode -halt-on-error -file-line-error

mkdir -p dist
cp build/main.pdf "dist/${PDF_NAME}.pdf"

log=build/main.log
echo "---"
echo "PDF: dist/${PDF_NAME}.pdf"
echo "Overfull boxes:  $(grep -c '^Overfull' "$log" || true)"
echo "Underfull boxes: $(grep -c '^Underfull' "$log" || true)"
echo "Undefined refs:  $(grep -c 'undefined' "$log" || true)"
