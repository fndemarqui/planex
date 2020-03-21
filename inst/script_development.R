
# saquinhos <- read.table("exemplo13_1.txt", header=TRUE)
# usethis::use_data(saquinhos, overwrite = TRUE)

# teares <- read.table("exemplo13_4.txt", header=TRUE)
# usethis::use_data(teares, overwrite = TRUE)

zarcao <- read.table("inst/dados.txt", header=TRUE)
usethis::use_data(zarcao, overwrite = TRUE)

devtools::document()
devtools::install()
devtools::load_all()
devtools::build_manual()
devtools::build()
