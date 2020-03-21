
#' Teste de não aditividade de Tukey
#' @description Implementação do teste de não aditividade proposto por Tukey (1949) para testar o efeito de interação envolvendo delineamentos com dois fatores fixos cruzados e  uma  única replicação.
#' @aliases interTest
#' @description Realiza o teste de nao aditividade para delineamentos com dois fatores fixos cruzados.
#' @param modelo modelo ajustado (objeto deve ter classe aov ou lm)
#' @return Retorna a tabela ANOVA
#' @references  Montgomery, D. C. (2016) Design and Analysis of Experiments, 8ª. Edição, New York: Wiley.
#' @examples
#' \donttest{
#' library(planex)
#' head(impureza)
#' sapply(impureza, class)
#'impureza <- mutate(impureza,
#'                   temperatura = as.factor(temperatura),
#'                   pressao = as.factor(pressao)
#')
#'
#' mod <- aov(impureza~temperatura+pressao, data=impureza)
#' interTest(mod)
#' }
#'
interTest <- function(modelo){
  tab <- model.tables(modelo, "means")
  mf <- model.frame(modelo)
  fat1 <- mf[,2]
  fat2 <- mf[,3]
  mf$alpha <- (tab$tables[[2]] - tab$tables[[1]])[fat1]
  mf$beta <- (tab$tables[[3]] - tab$tables[[1]])[fat2]
  mf$interacao <- with(mf, alpha*beta)
  fit <- update(modelo, ~ . + interacao, data=mf)
  car::Anova(fit)
}




#' Gráfico de interações para delineamentos com 2 fatores
#' @aliases interPlot2
#' @description Gráficos de interações envolvendo delineamentos com dois fatores
#' @param modelo modelo ajustado (objeto deve ter classe aov ou lm)
#' @return Retorna o gráfico de interações
#' @examples
#' \donttest{
#' library(planex)
#' # Exemplo da impureza de um produto químico:
#' head(impureza)
#' sapply(impureza, class)
#'impureza <- mutate(impureza,
#'                   temperatura = as.factor(temperatura),
#'                   pressao = as.factor(pressao)
#')
#'
#' mod <- aov(impureza~temperatura+pressao, data=impureza)
#' interPlot(mod)
#'
#' # Exemplo do tempo de vida de baterias:
#' head(baterias)
#' sapply(baterias, class)
#' baterias <- mutate(baterias,
#'                   temperatura = as.factor(temperatura),
#'                   tipo = as.factor(tipo)
#')
#'
#' mod <- aov(tempo~temperatura+tipo, data=baterias)
#' interPlot(mod)
#'
#' }
#'
interPlot2 <- function (modelo){
  mf <- as.data.frame(model.frame(modelo))
  nomes <- names(mf)
  names(mf) <- c("resp", "fat1", "fat2")
  mf %>%
    group_by(fat1, fat2) %>%
    summarise(
      media = mean(resp)
    ) %>%
    ggplot(aes(x=fat1, y=media, color=fat2)) +
    geom_point() +
    geom_line(aes(group=fat2)) +
    xlab(nomes[2]) +
    ylab("media") +
    labs(color=nomes[3])
}




#' Gráfico de interações para delineamentos com 3 fatores
#' @aliases interPlot3
#' @description Gráficos de interações envolvendo delineamentos com dois fatores
#' @param modelo modelo ajustado (objeto deve ter classe aov ou lm)
#' @return Retorna o gráfico de interações
#' @examples
#' \donttest{
#' library(planex)
#' # Exemplo das garrafas de refrigerante:
#' head(refrigerantes)
#' sapply(refrigerantes, class)
#' mod1 <- aov(desvio~carbonatacao+pressao+velocidade, data=refrigerantes)
#' mod2 <- aov(desvio~pressao+carbonatacao+velocidade, data=refrigerantes)
#' mod3 <- aov(desvio~velocidade+carbonatacao+pressao, data=refrigerantes)
#' mod4 <- aov(desvio~velocidade+pressao+carbonatacao, data=refrigerantes)
#'
#' interPlot3(mod1)
#' interPlot3(mod2)
#' interPlot3(mod3)
#' interPlot3(mod4)
#'
#' }
#'
interPlot3 <- function (modelo){
  mf <- as.data.frame(model.frame(modelo))
  nomes <- names(mf)
  names(mf) <- c("resp", "fat1", "fat2", "fat3")
  mf %>%
    group_by(fat1, fat2, fat3) %>%
    summarise(
      media = mean(resp)
    ) %>%
    ggplot(aes(x=fat1, y=media, color=fat2)) +
    geom_point() +
    geom_line(aes(group=fat2)) +
    xlab(nomes[2]) +
    ylab("media") +
    labs(color=nomes[3]) +
    facet_wrap(~fat3)
}


#' Gráfico de interações para delineamentos com 4 fatores
#' @aliases interPlot4
#' @description Gráficos de interações envolvendo delineamentos com dois fatores
#' @param modelo modelo ajustado (objeto deve ter classe aov ou lm)
#' @return Retorna o gráfico de interações
#' @examples
#' \donttest{
#' library(planex)
#' # Exemplo das garrafas de refrigerante:
#' head(refrigerantes)
#' sapply(refrigerantes, class)
#' mod1 <- aov(filtragem ~ temperatura+pressao+concentracao+agitacao, data=filtragem)
#' mod2 <- aov(filtragem ~ pressao+temperatura+concentracao+agitacao, data=filtragem)
#' mod3 <- aov(filtragem ~ concentracao+temperatura+pressao+agitacao, data=filtragem)
#' mod4 <- aov(filtragem ~ agitacao+pressao+temperatura+concentracao, data=filtragem)
#'
#' interPlot4(mod1)
#' interPlot4(mod2)
#' interPlot4(mod3)
#' interPlot4(mod4)
#'
#' }
#'
interPlot4 <- function (modelo){
  mf <- as.data.frame(model.frame(modelo))
  nomes <- names(mf)
  names(mf) <- c("resp", "fat1", "fat2", "fat3", "fat4")
  mf %>%
    group_by(fat1, fat2, fat3, fat4) %>%
    summarise(
      media = mean(resp)
    ) %>%
    ggplot(aes(x=fat1, y=media, color=fat2)) +
    geom_point() +
    geom_line(aes(group=fat2)) +
    xlab(nomes[2]) +
    ylab("media") +
    labs(color=nomes[3]) +
    facet_grid(row=vars(fat3), col=vars(fat4))
}
