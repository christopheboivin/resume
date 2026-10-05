# My Resume

LaTeX CV built with [moderncv](https://ctan.org/pkg/moderncv) 2.x from the TeX distribution, styled to match the former 1.3 look.

## Build

Prerequisites: a TeX distribution providing `pdflatex` and `latexmk` ([TeX Live](https://tug.org/texlive/) or [MiKTeX](https://miktex.org/)). On Windows, use Git Bash.

```bash
./build.sh
```

Outputs `build/main.pdf` and a named copy in `dist/`. `./build.sh clean` removes both directories.

Without latexmk: `pdflatex main.tex` (outputs `main.pdf` in the repo root).

## CI

The **Build CV** workflow builds the PDF on every pull request and on demand (Actions → Build CV → Run workflow). With the occasion left empty, it only builds; download the PDF from the run's **cv-pdf** artifact.

To publish the CV for an occasion, enter the occasion when running the workflow. It also creates a GitHub Release with `<name> - <occasion>.pdf` attached and a changelog generated from the commits since the previous release.

Commit messages and PR titles must follow [Conventional Commits](https://www.conventionalcommits.org/) (`cv:` for CV content). CI checks them; see [AGENTS.md](AGENTS.md#git-workflow).

## Editing

Edit `main.tex` with any editor (vim, TeXstudio, VS Code + LaTeX Workshop…). Contributor and AI-agent guidelines are in [AGENTS.md](AGENTS.md).
