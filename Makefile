compile:
	xelatex main
	biber main
	xelatex main
	xelatex main
	rm -f *.aux *.out *.blg *.toc *.bbl *.bcf

clean:
	rm -f main.pdf main.run.xml main.log

zip:
	zip nkthesis.zip *.tex *.bbx *.bib *.cbx *.sty fonts/* figures/*
