TEX = xelatex
BIBTEX = bibtex 
OPEN = open

OBJECTS = main.pdf
target: $(OBJECTS)

main.pdf: *.tex *.sty 
	$(TEX) -shell-escape $<
	#$(BIBTEX) main.aux
	#$(TEX) -shell-escape $<
	#$(TEX) -shell-escape $<
	$(OPEN) $@


.PHONY: clean 

clean:
	rm -f *~ *.aux *.log *.out *.toc *.bbl *.blg *.snm *.nav
	rm -rf _minted-cache *.vrb
