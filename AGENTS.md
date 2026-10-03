# AGENTS.md

Instructions for AI coding agents (any vendor) and humans working on this repository.

## Project

A single-file LaTeX CV (in French) built with the `moderncv` class.

| Path | Role | Editable? |
|------|------|-----------|
| `main.tex` | The CV source (preamble + content) | Yes |
| `moderncv.cls`, `moderncv*.sty`, `collection.sty`, `tweaklist.sty` | Vendored moderncv **v1.3.0 (2013)** | **No** — see `docs/plans/unvendor-moderncv.md` |
| `latexmkrc` | latexmk config (pdflatex, output in `build/`) | Yes |
| `build.sh` | Build entry point, copies a named PDF to `dist/` | Yes |
| `.github/workflows/build.yml` | CI: builds the PDF, uploads it as artifact `cv-pdf` | Yes |
| `docs/plans/` | Reusable plans for future work | Yes |

## Build

Requirements: a TeX distribution with `pdflatex`, `latexmk` and scalable T1 fonts (`cm-super`; microtype font expansion fails without it) — TeX Live or MiKTeX. Debian/Ubuntu: see the apt packages in `.github/workflows/build.yml`. On Windows, run commands from Git Bash.

```bash
./build.sh          # -> build/main.pdf and dist/<PDF_NAME>.pdf
./build.sh clean    # remove build/ and dist/
PDF_NAME="My CV" ./build.sh   # override the output file name
```

Fallback without latexmk: `pdflatex main.tex` (run twice; writes artifacts in the repo root, which are gitignored).

## Conventions

- Encoding UTF-8, line endings LF (enforced by `.gitattributes` / `.editorconfig`).
- Content is French; keep accents as UTF-8 characters (`inputenc` utf8 is loaded).
- Use only the **moderncv 1.3 API** (`\cventry`, `\cvitem`, `\cvitemwithcomment`, `\cvlistitem`, …). Do not use macros introduced in moderncv 2.x (e.g. `\cvskill` from newer styles, fontawesome icons) unless the class is unvendored first.
- Do not edit the vendored class/style files.
- Do not change CV wording/content unless explicitly asked; tooling tasks touch tooling only.
- Never commit PDFs or build artifacts (`build/`, `dist/`, `*.aux`, `*.log`, …).

## Git workflow

- Every change goes on a **new branch**; the **user chooses the branch name** — ask for it. Never commit directly to `master`.
- Small, focused commits with conventional prefixes (`build:`, `ci:`, `docs:`, `chore:`, `doc:` for CV content).
- Batch pushes: commit locally, push once per completed set of changes — every push triggers a CI build. Do not push after each commit.

## Verification checklist

1. `./build.sh` exits 0 (it uses `-halt-on-error`).
2. The summary prints `Overfull boxes: 0` and `Undefined refs: 0`. Underfull boxes (currently ~13, from `itemize` inside `\cvitem`) are known and cosmetic; do not increase them.
3. Page count unchanged unless intended: `pdfinfo build/main.pdf | grep Pages` (currently 3).
4. CI workflow "Build CV" passes on the pushed branch/PR.
