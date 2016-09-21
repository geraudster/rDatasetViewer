FROM rocker/shiny

COPY packrat/bundles/rDatasetViewer.tar.gz /srv/shiny-server/

RUN Rscript -e "install.packages('packrat'); \
  packrat::unbundle('/srv/shiny-server/rDatasetViewer.tar.gz', '/srv/shiny-server/'); \
  setwd('/srv/shiny-server/rDatasetViewer'); \
  packrat::on()"

