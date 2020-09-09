


capacidade <- read.table("inst/dados.txt", header=TRUE)
usethis::use_data(capacidade, overwrite = TRUE)

# rugosidade <- read.table("inst/dados.txt", header=TRUE)
# usethis::use_data(rugosidade, overwrite = TRUE)

devtools::document()
devtools::install()
devtools::load_all()
#devtools::check()

devtools::build_manual()
devtools::build()



#televisores <- read.table("inst/dados.txt", header=TRUE)
#usethis::use_data(filtragemFrac, overwrite = TRUE)

# criar função is.balanced()....


# Useful to remove notes:
# tools::showNonASCIIfile("R/biblioteca.R")
