MAIN := main

.PHONY: compile compile-legacy tidy clean zip

compile:
	powershell -NoProfile -ExecutionPolicy Bypass -File ./compile.ps1 -Main $(MAIN)

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
	zip nkthesis.zip *.tex sections/*.tex *.bbx *.bib *.cbx *.sty fonts/* figures/*
