
.PHONY: build check document install vignettes

build: document
	cd work && R CMD build ../

check: build
	cd work && R CMD check --as-cran `ls datapackage.fst*.tar.gz | sort | tail -n 1`

document:
	R -e "roxygen2::roxygenise()"

vignettes: build
	cd work && tar -xzf `ls datapackage.fst*.tar.gz | sort | tail -n 1` && \
	  rm -r -f ../inst/doc && \
	  mkdir -p ../inst && \
	  cp -r datapackage.fst/inst/doc ../inst

install: build
	R CMD INSTALL `ls work/datapackage.fst*.tar.gz | sort | tail -n 1` 


readme:
	Rscript -e 'simplermarkdown::mdweave("vignettes/introduction.md", "work/tmp.md")' && \
	  pandoc "work/tmp.md" -t gfm -o README.md
