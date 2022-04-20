

usethis::use_git_ignore("inst/script_development.R")
usethis::use_build_ignore("inst/script_development.R")

usethis::use_git_ignore("inst/var_teste.R")
usethis::use_build_ignore("inst/var_teste.R")

usethis::use_git_ignore("inst/script_ggcomp.R")
usethis::use_build_ignore("inst/script_ggcomp.R")

usethis::use_git_ignore("inst/dados.txt")
usethis::use_build_ignore("inst/dados.txt")


# # rodar apenas uma vez:
# usethis::use_agpl3_license()
# usethis::use_readme_rmd()
# usethis::use_pkgdown()
# usethis::use_git_config(user.name = "fndemarqui",              # seu nome
#                        user.email = "fndemarqui@gmail.com")   # seu email




devtools::document()
devtools::install()
devtools::load_all()
#devtools::check()

devtools::build_manual()
devtools::build()

usethis::use_git_ignore("inst/dados.txt")
usethis::use_git_ignore("inst/script_github.R")
usethis::use_build_ignore("inst/script_github.R")



#devtools::build_readme()
devtools::build_vignettes()
devtools::build_site()
usethis::use_github_action("pkgdown")


# usethis::use_vignette("planex", "Introdução ao pacote planex")


#tools::showNonASCIIfile("R/biblioteca.R")

vigas <- read.table("inst/dados.txt", header=TRUE)
usethis::use_data(tintas, overwrite = TRUE)

# criar função is.balanced()....


# Useful to remove notes:
# tools::showNonASCIIfile("R/biblioteca.R")
