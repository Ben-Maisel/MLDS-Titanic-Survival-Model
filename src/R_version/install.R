# /app/install.R
pkgs <- c(
  "fs",
  "tidyverse",
  "caret",
  "glmnet",
  "VIM",
  "recipes",
  "rmarkdown"
)

if (!requireNamespace("pak", quietly = TRUE)) {
  install.packages("pak", repos = "https://r-lib.github.io/p/pak/stable")
}

pak::pkg_install(pkgs, upgrade = FALSE)

print(as.data.frame(installed.packages()[pkgs, c("Package", "Version")]))
