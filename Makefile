MAIN := main

.PHONY: compile compile-legacy tidy clean zip

compile:
	latexmk -xelatex -interaction=nonstopmode -halt-on-error $(MAIN).tex
	latexmk -c $(MAIN).tex
	$(MAKE) tidy

compile-legacy:
	xelatex $(MAIN)
	biber $(MAIN)
	xelatex $(MAIN)
	xelatex $(MAIN)
	$(MAKE) tidy

tidy:
	rm -f *.aux *.out *.blg *.toc *.bbl *.bcf *.log *.run.xml *.fls *.fdb_latexmk *.synctex.gz

clean:
	$(MAKE) tidy
	rm -f $(MAIN).pdf

zip:
	zip nkthesis.zip *.tex *.bbx *.bib *.cbx *.sty fonts/* figures/*
