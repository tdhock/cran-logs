HOCKING-packages.pdf: HOCKING-packages.tex figure-time-series.pdf figure-time-series-zoom.pdf
	pdflatex HOCKING-packages
figure-time-series-zoom.pdf: figure-time-series-zoom.R extract.RData
	R --no-save < $<
figure-time-series.pdf: figure-time-series.R extract.RData
	R --no-save < $<
extract.RData: extract.R
	R --no-save < $<