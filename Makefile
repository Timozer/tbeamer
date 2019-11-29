TEX = xelatex
BIBTEX = bibtex 
OPEN = open

OBJECTS = main.pdf
target: $(OBJECTS)

fast_build: main_fast

deep_build: main_deep

build_and_show: main.pdf open

main_fast: main.tex *.sty
	$(TEX) -shell-escape $<

main_deep: main.tex *.sty
	$(TEX) -shell-escape $<
	$(BIBTEX) main.aux
	$(TEX) -shell-escape $<
	$(TEX) -shell-escape $<

main.pdf: main_deep

demo.pdf: demo.tex *.sty
	$(TEX) -shell-escape $<
	$(OPEN) $@

.PHONY: clean open

open: main.pdf
	$(OPEN) $<

clean:
	rm -f *~ *.aux *.log *.out *.toc *.bbl *.blg *.snm *.nav
	rm -rf _minted-cache *.vrb
	rm -f demo.pdf demo.tex

disclean:
	rm -f *.pdf *~ *.aux *.log *.out *.toc *.bbl *.blg *.snm *.nav
	rm -rf _minted-cache *.vrb
	rm -f demo.tex
