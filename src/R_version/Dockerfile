FROM rocker/r-base:4.4.1

RUN apt-get update && apt-get install -y --no-install-recommends \
    libcurl4-openssl-dev libssl-dev libxml2-dev pandoc \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY src/R_version/requirements.txt /app/requirements.txt
COPY src/R_version/main.rmd        /app/main.Rmd

RUN Rscript -e " \
  options(repos = c(CRAN = 'https://cloud.r-project.org')); \
  base_pkgs <- c('rmarkdown','knitr'); \
  to_install <- unique(c(base_pkgs, readLines('/app/requirements.txt'))); \
  to_install <- to_install[nzchar(to_install) & !startsWith(to_install, '#')]; \
  missing <- setdiff(to_install, rownames(installed.packages())); \
  if (length(missing)) install.packages(missing, Ncpus = max(1, parallel::detectCores() - 1)); \
"

ENV OUTPUT_DIR=/app/output_folder
ENV DATA_DIR=/app/data

CMD ["bash","-lc","mkdir -p \"$OUTPUT_DIR\" \"$DATA_DIR\" && Rscript -e \"rmarkdown::render('/app/main.Rmd', output_file='/app/main.rendered.html')\" && ls -l $OUTPUT_DIR"]
