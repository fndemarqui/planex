
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
#' library(tidyverse)
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
  tab <- stats::model.tables(modelo, "means")
  mf <- stats::model.frame(modelo)
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
#' library(tidyverse)
#' # Exemplo da impureza de um produto químico:
#' head(impureza)
#' sapply(impureza, class)
#'impureza <- mutate(impureza,
#'                   temperatura = as.factor(temperatura),
#'                   pressao = as.factor(pressao)
#')
#'
#' mod <- aov(impureza~temperatura+pressao, data=impureza)
#' interPlot2(mod)
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
#' interPlot2(mod)
#'
#' }
#'
interPlot2 <- function(modelo){
  mf <- as.data.frame(stats::model.frame(modelo))
  nomes <- names(mf)
  names(mf) <- c("resp", "fat1", "fat2")
  mf %>%
    mutate(
      fat1 = as.factor(.data$fat1),
      fat2 = as.factor(.data$fat2)
    ) %>%
    group_by(.data$fat1, .data$fat2) %>%
    summarise(
      media = mean(.data$resp)
    ) %>%
    ggplot(aes(x = .data$fat1, y = .data$media, color = .data$fat2)) +
    geom_point() +
    geom_line(aes(group = .data$fat2)) +
    xlab(nomes[2]) +
    ylab("media") +
    labs(color = nomes[3])
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
interPlot3 <- function(modelo){
  mf <- as.data.frame(stats::model.frame(modelo))
  nomes <- names(mf)
  names(mf) <- c("resp", "fat1", "fat2", "fat3")
  mf %>%
    mutate(
      fat1 = as.factor(.data$fat1),
      fat2 = as.factor(.data$fat2),
      fat3 = as.factor(.data$fat3)
    ) %>%
    group_by(.data$fat1, .data$fat2, .data$fat3) %>%
    summarise(
      media = mean(.data$resp)
    ) %>%
    ggplot(aes(x = .data$fat1, y = .data$media, color = .data$fat2)) +
    geom_point() +
    geom_line(aes(group = .data$fat2)) +
    xlab(nomes[2]) +
    ylab("media") +
    labs(color = nomes[3]) +
    facet_wrap(~ .data$fat3)
}


#' Gráfico de interações para delineamentos com 4 fatores
#' @aliases interPlot4
#' @description Gráficos de interações envolvendo delineamentos com 4 fatores
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
interPlot4 <- function(modelo){
  mf <- as.data.frame(stats::model.frame(modelo))
  nomes <- names(mf)
  names(mf) <- c("resp", "fat1", "fat2", "fat3", "fat4")
  mf %>%
    mutate(
      fat1 = as.factor(.data$fat1),
      fat2 = as.factor(.data$fat2),
      fat3 = as.factor(.data$fat3),
      fat4 = as.factor(.data$fat4)
    ) %>%
    group_by(.data$fat1, .data$fat2, .data$fat3, .data$fat4) %>%
    summarise(
      media = mean(.data$resp)
    ) %>%
    ggplot(aes(x = .data$fat1, y = .data$media, color = .data$fat2)) +
    geom_point() +
    geom_line(aes(group = .data$fat2)) +
    xlab(nomes[2]) +
    ylab("media") +
    labs(color = nomes[3]) +
    facet_grid(rows = vars(.data$fat3), cols = vars(.data$fat4))
}


#' Codificação de variáveis para delineamentos $2^k$ fatoriais
#'
#' @aliases as.factor2k
#' @export
#' @description Função para codificar os níveis baixos e altos de fatores de interesse em um delinemanto $2^K$ tal que -1 representa o nível baixo e 1 representa o nível alto do fator.
#' @param x fator que se deseja codificar.
#' @return o fator codificado em termos dos níveis baixo (-1) e alto (+1).
#' @examples
#' library(planex)
#' library(tidyverse)
#' data(rugosidade)
#' head(rugosidade)
#' rugosidade <- mutate(rugosidade,
#'   alimentacao = as.factor2k(alimentacao),
#'   profundidade = as.factor2k(profundidade),
#'   angulo = as.factor2k(angulo)
#' )
#' rugosidade
#'
#'
as.factor2k <- function(x){
  x <- as.numeric(x)
  z <- unique(x)
  if(length(z) != 2){
    warning("essa função deve ser usada apenas para fatores com 2 níveis!!!")
  }else{
    y <- as.numeric((x - mean(z))/(diff(z)/2))
    return(y)
  }
}


#' Gráfico de interações para delineamentos com 2 a 4 fatores
#' @aliases interactionPlot
#' @description Gráficos de interações envolvendo delineamentos com dois a quatro fatores
#' @param modelo modelo ajustado (objeto deve ter classe aov ou lm)
#' @return Retorna o gráfico de interações

interactionPlot <- function(modelo){
  term.ord <- attr(terms(modelo), "order")
  nfats <- length(which(term.ord == 1)) # main effects
  if(nfats < 2){
    warning("Function only available for factorial with 2 up to 4 factors.")
  }else{
    if(nfats == 2){
      interPlot2(modelo)
    }else if(nfats == 3){
      interPlot3(modelo)
    }else if(nfats == 4){
      interPlot4(modelo)
    }else{
      warning("Function not available for factorial designs with more than 4 factors.")
    }
  }
}
