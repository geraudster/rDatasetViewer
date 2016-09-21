all: container

.PHONY: container clean

clean:
	rm -f packrat/bundles/*.tar.gz

packrat/bundles/rDatasetViewer.tar.gz: ui.R server.R build.R
	Rscript build.R

container: packrat/bundles/rDatasetViewer.tar.gz
	docker build -t geraudster/rdatasetviewer .

run: container
	docker run --rm -p 3838:3838 geraudster/rdatasetviewer
