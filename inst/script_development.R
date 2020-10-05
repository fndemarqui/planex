


# capacidade <- read.table("inst/dados.txt", header=TRUE)
# usethis::use_data(capacidade, overwrite = TRUE)

forca <- read.table("inst/dados.txt", header=TRUE)
usethis::use_data(forca, overwrite = TRUE)

devtools::document()
devtools::install()
devtools::load_all()
#devtools::check()

devtools::build_manual()
devtools::build()

usethis::use_git_ignore("inst/dados.txt")
usethis::use_git_ignore("inst/script_github.R")

#televisores <- read.table("inst/dados.txt", header=TRUE)
#usethis::use_data(filtragemFrac, overwrite = TRUE)

# criar função is.balanced()....


# Useful to remove notes:
# tools::showNonASCIIfile("R/biblioteca.R")
