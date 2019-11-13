MODE = batchmode

LATEX = pdflatex -interaction=$(MODE) -synctex=1

MAIN_DEPS = $(wildcard *.tex)

.PHONY: all view clean

all : Skript.pdf

view:
	@xdg-open Skript.pdf &

clean:
	@find . -name "*.aux" -type f -delete
	@find . -name "*.log" -type f -delete
	@find . -name "*.out" -type f -delete
	@find . -name "*.pdf" ! -name sankeydiagram-cut.pdf -type f -delete
	@find . -name "*.synctex.gz" -type f -delete
	@echo "Deleted .aux .log .out .synctex.gz .pdf files."

Skript.pdf: $(MAIN_DEPS) Skript.tex
	$(LATEX) Skript.tex
