# My Resume

LaTeX CV built with a vendored copy of [moderncv](https://ctan.org/pkg/moderncv) v1.3.0.

## Build

Prerequisites: a TeX distribution providing `pdflatex` and `latexmk` ([TeX Live](https://tug.org/texlive/) or [MiKTeX](https://miktex.org/)). On Windows, use Git Bash.

```bash
./build.sh
```

Outputs `build/main.pdf` and a named copy in `dist/`. `./build.sh clean` removes both directories.

Without latexmk: `pdflatex main.tex` (outputs `main.pdf` in the repo root).

## CI

Every push to `master` and every pull request builds the PDF on GitHub Actions; download it from the run's **cv-pdf** artifact.

## Editing

Edit `main.tex` with any editor (vim, TeXstudio, VS Code + LaTeX Workshop…). Contributor and AI-agent guidelines are in [AGENTS.md](AGENTS.md).
