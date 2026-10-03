# Plan: unvendor moderncv

Status: **not started**. Self-contained; can be executed in a fresh session by any agent. Read `AGENTS.md` first.

## Goal

Remove the vendored moderncv **v1.3.0 (2013)** files and use the moderncv shipped by the TeX distribution (2.x), while keeping the PDF visually equivalent.

Files to remove: `moderncv.cls`, `moderncvcolor{black,blue,green,grey,orange,purple,red}.sty`, `moderncvcompatibility.sty`, `moderncvicons{letters,marvosym}.sty`, `moderncvstyle{banking,casual,classic,empty,oldstyle}.sty`, `collection.sty`, `tweaklist.sty`.

## Steps

1. New branch (name chosen by the user).
2. Baseline: `./build.sh`, keep `build/main.pdf` as `baseline.pdf` (outside the repo), and render pages: `pdftoppm -r 80 -png baseline.pdf base`.
3. `git rm` the files listed above. Check `kpsewhich moderncv.cls` now resolves to the distribution copy (MiKTeX may install packages on the fly; TeX Live needs `texlive-latex-extra`).
4. `./build.sh` and fix breakages in `main.tex` preamble only. Known 1.3 → 2.x differences to check:
   - `\address{street}{city}{country}` — 3 args in both, OK; but `\title` / `\name` rendering may differ.
   - `\cvitemwithcomment` still exists; verify output.
   - Icons: 2.x defaults to `\moderncvicons{awesome}` (fontawesome5); keep `marvosym` / `letters` if layout shifts.
   - `\usepackage[utf8]{inputenc}` is redundant on LaTeX ≥ 2018 (harmless; may remove).
   - Lengths: `\hintscolumnwidth` and the classic-style name width computation changed; may need `\setlength{\hintscolumnwidth}{…}`.
5. Compare: `pdftoppm -r 80 -png build/main.pdf new`, then visually diff (e.g. ImageMagick `compare base-1.png new-1.png diff-1.png`). Page count must stay 3 unless agreed.
6. Update `AGENTS.md` (remove "vendored / do not edit" row, update the moderncv API note to 2.x), `README.md`, and CI apt packages if needed (`texlive-fonts-extra` for fontawesome5; `cm-super` is already required for scalable T1 fonts with microtype).
7. Commit, push, check the CI "Build CV" run.

## Risks / rollback

- Layout shift (spacing, icons, header). Mitigate by pinning style options; if unacceptable, abandon the branch — `master` is untouched.
- CI Ubuntu TeX Live version may differ from local MiKTeX; compare the CI artifact too.

## Verification

- `./build.sh` exit 0, `Overfull boxes: 0`, page count 3.
- Visual diff reviewed by the user.
- CI green.
