all: container

packrat/bundles/rDatasetViewer.tar.gz: ui.R server.R build.R
	Rscript build.R

.PHONY: container

container: packrat/bundles/rDatasetViewer.tar.gz
	docker build -t geraudster/rdatasetviewer .

run: container
	docker run --rm -p 3838:3838 geraudster/rdatasetviewer
