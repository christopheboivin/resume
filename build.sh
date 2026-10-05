#!/usr/bin/env bash
# Build the CV PDF. Usage: ./build.sh [variant|all|clean]   (default variant: "default")
# Env: PDF_NAME overrides the output name, PDF_SUFFIX appends " - <suffix>" to it.
# A variant is a file variants/<name>.tex; see AGENTS.md.
# Requires latexmk + pdflatex (TeX Live or MiKTeX). On Windows, run from Git Bash.
set -euo pipefail
cd "$(dirname "$0")"

build_variant() {
  local v="$1" src="variants/$1.tex"
  if [[ ! -f "$src" ]]; then
    echo "Unknown variant '$v'. Available: $(ls variants | sed 's/\.tex$//' | tr '\n' ' ')" >&2
    exit 1
  fi

  # main.tex selects variants/<jobname>.tex; one set of aux files and one PDF per variant in build/
  latexmk -interaction=nonstopmode -halt-on-error -file-line-error -jobname="$v" main.tex

  local label name
  label="$(sed -n 's/^% pdf-name: *//p' "$src" | head -n1)"
  name="${PDF_NAME:-CV Christophe BOIVIN - ${label:-$v} - $(date +%Y)}${PDF_SUFFIX:+ - ${PDF_SUFFIX}}"
  mkdir -p dist
  cp "build/$v.pdf" "dist/${name}.pdf"

  local log="build/$v.log"
  echo "--- variant: $v"
  echo "PDF: dist/${name}.pdf"
  echo "Overfull boxes:  $(grep -c '^Overfull' "$log" || true)"
  echo "Underfull boxes: $(grep -c '^Underfull' "$log" || true)"
  echo "Undefined refs:  $(grep -c 'undefined' "$log" || true)"
  echo "Placeholders:    $(grep -o '\\afaire{' "$src" | wc -l | tr -d ' ')"
}

case "${1:-default}" in
  clean)
    rm -rf build dist
    ;;
  all)
    for f in variants/*.tex; do
      build_variant "$(basename "$f" .tex)"
    done
    ;;
  *)
    build_variant "${1:-default}"
    ;;
esac
