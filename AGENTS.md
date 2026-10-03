# AGENTS.md

Instructions for AI coding agents (any vendor) and humans working on this repository.

## Project

A single-file LaTeX CV (in French) built with the `moderncv` class.

| Path | Role | Editable? |
|------|------|-----------|
| `main.tex` | The CV source: preamble + content shared by all variants | Yes |
| `variants/*.tex` | Targeted content per position/company (title, profile, skills, current role) | Yes |
| `moderncv.cls`, `moderncv*.sty`, `collection.sty`, `tweaklist.sty` | Vendored moderncv **v1.3.0 (2013)** | **No** — see `docs/plans/unvendor-moderncv.md` |
| `latexmkrc` | latexmk config (pdflatex, output in `build/`) | Yes |
| `build.sh` | Build entry point, copies a named PDF per variant to `dist/` | Yes |
| `.github/workflows/build.yml` | CI: builds the PDF, uploads it as artifact `cv-pdf` | Yes |
| `docs/plans/` | Reusable plans for future work | Yes |

## Build

Requirements: a TeX distribution with `pdflatex`, `latexmk` and scalable T1 fonts (`cm-super`; microtype font expansion fails without it) — TeX Live or MiKTeX. Debian/Ubuntu: see the apt packages in `.github/workflows/build.yml`. On Windows, run commands from Git Bash.

```bash
./build.sh              # variant "default" -> build/default.pdf and dist/<PDF name>.pdf
./build.sh tech-lead    # variant variants/tech-lead.tex -> build/tech-lead.pdf
./build.sh all          # every variant
./build.sh clean        # remove build/ and dist/
PDF_NAME="My CV" ./build.sh tech-lead   # override the output file name (single variant)
```

Fallback without latexmk: `pdflatex main.tex` builds the `default` variant; `pdflatex -jobname=tech-lead main.tex` builds another one (run twice; writes artifacts in the repo root, which are gitignored).

## Variants

`main.tex` loads `variants/<jobname>.tex` (falls back to `default`). A variant defines `\cvtitle`, `\cvprofile` (empty = no "Profil" section), `\cvskills`, `\cvcurrentrole`, `\cvcurrentintro` and `\cvkeypoints`. Its first line `% pdf-name: <label>` gives the PDF name `CV Christophe BOIVIN - <label> - <year>.pdf`.

To tailor the CV for a company: `cp variants/tech-lead.tex variants/<company>.tex`, edit it, `./build.sh <company>`. Content shared by all variants (previous jobs, education, header) stays in `main.tex`.

`\afaire{...}` marks a placeholder, printed in red; `build.sh` reports how many remain. A CV sent to a company must have `Placeholders: 0`.

The positioning analysis behind the variants is in `docs/cv-review/README.md`.

## Conventions

- Encoding UTF-8, line endings LF (enforced by `.gitattributes` / `.editorconfig`).
- Content is French; keep accents as UTF-8 characters (`inputenc` utf8 is loaded).
- moderncv **2.x** comes from the TeX distribution (`texlive-latex-extra` / MiKTeX). The `main.tex` preamble pins the former 1.3 "classic" look (colors, marvosym icons, header spacing, `\section` / `\subsection`, patches on `\cventry` / `\cvitemwithcomment`); keep it unless a visual change is intended. A failed patch stops the build with "Cannot patch …, moderncv changed".
- Do not change CV wording/content unless explicitly asked; tooling tasks touch tooling only.
- Never commit PDFs or build artifacts (`build/`, `dist/`, `*.aux`, `*.log`, …).

## Git workflow

- Every change goes on a **new branch**; the **user chooses the branch name** — ask for it. Never commit directly to `master`.
- Small, focused commits with conventional prefixes (`build:`, `ci:`, `docs:`, `chore:`, `doc:` for CV content).
- Batch pushes: commit locally, push once per completed set of changes — every push triggers a CI build. Do not push after each commit.

## Verification checklist

1. `./build.sh all` exits 0 (it uses `-halt-on-error`).
2. For each variant the summary prints `Overfull boxes: 0` and `Undefined refs: 0`. Underfull boxes (currently 8–9 per variant, from `itemize` inside `\cventry`) are known and cosmetic; do not increase them.
3. Page count unchanged unless intended: `pdfinfo build/<variant>.pdf | grep Pages` (currently 3 for every variant). The current-position `\cventry` cannot break across pages, so a few extra lines can push content to a 4th page.
4. CI workflow "Build CV" passes on the pushed branch/PR.
