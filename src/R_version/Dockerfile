FROM rocker/tidyverse@sha256:1af3ecf3a6072c1426ada60fb343d6d25523b0fc6390c44a3909c510b821cce8

RUN --mount=type=cache,target=/var/cache/apt \
    --mount=type=cache,target=/var/lib/apt/lists \
    apt-get update && apt-get install -y --no-install-recommends \
      libcurl4-openssl-dev libssl-dev libxml2-dev pandoc ca-certificates \
    && update-ca-certificates \
    && rm -rf /var/lib/apt/lists/*

ENV SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt
ENV CURL_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt

WORKDIR /app

ARG SNAPSHOT_DATE=2025-10-01
RUN CODENAME=$(. /etc/os-release; echo $VERSION_CODENAME) && \
    echo "options(repos = c(CRAN = 'https://packagemanager.posit.co/cran/__linux__/${CODENAME}/${SNAPSHOT_DATE}'))" \
    >> /usr/local/lib/R/etc/Rprofile.site

RUN R -q -e "install.packages('pak', repos='https://r-lib.github.io/p/pak/stable')"

COPY src/R_version/install.R /app/install.R
RUN --mount=type=cache,target=/root/.cache/R/pak \
    R -q -e "source('/app/install.R', chdir = TRUE)"

COPY src/R_version/main.rmd  /app/main.rmd

ENV OUTPUT_DIR=/app/output_folder
ENV DATA_DIR=/app/data
ENV MAKEFLAGS="-j$(nproc)"

CMD ["bash","-lc","mkdir -p \"$OUTPUT_DIR\" \"$DATA_DIR\" \
  && R -q -e \"rmarkdown::render('/app/main.rmd', output_file='/app/main.rendered.html', quiet = TRUE)\" \
  && ls -l $OUTPUT_DIR"]
