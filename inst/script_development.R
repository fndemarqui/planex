
# saquinhos <- read.table("exemplo13_1.txt", header=TRUE)
# usethis::use_data(saquinhos, overwrite = TRUE)

# teares <- read.table("exemplo13_4.txt", header=TRUE)
# usethis::use_data(teares, overwrite = TRUE)

montagem <- read.table("inst/dados.txt", header=TRUE)
usethis::use_data(montagem, overwrite = TRUE)

devtools::install()
devtools::document()
devtools::build_manual()
