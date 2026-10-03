# latexmk configuration — run `latexmk` (or ./build.sh) from the repo root.
@default_files = ('main.tex');
$pdf_mode = 1;      # pdflatex
$out_dir = 'build'; # aux files + main.pdf
$max_repeat = 5;
