
# saquinhos <- read.table("exemplo13_1.txt", header=TRUE)
# usethis::use_data(saquinhos, overwrite = TRUE)

# teares <- read.table("exemplo13_4.txt", header=TRUE)
# usethis::use_data(teares, overwrite = TRUE)

chocolate <- read.table("dados.txt", header=TRUE)
usethis::use_data(chocolate, overwrite = TRUE)

devtools::install()
devtools::document()
devtools::build_manual()
?saquinhos
?teares
?baterias
?refrigerantes
?fibras
?propulsores
?catalisadores
