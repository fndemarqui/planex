
#' Teste de não aditividade de Tukey
#' @export
#' @description Implementação do teste de não aditividade proposto por Tukey (1949) para testar o efeito de interação envolvendo delineamentos com dois fatores fixos cruzados e  uma  única replicação.
#' @aliases interactionTest
#' @description Realiza o teste de nao aditividade para delineamentos com dois fatores fixos cruzados.
#' @param object object ajustado (objeto deve ter classe aov ou lm)
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
#' interactionTest(mod)
#' }
#'
interactionTest <- function(object){
  tab <- stats::model.tables(object, "means")
  mf <- stats::model.frame(object)
  fat1 <- mf[,2]
  fat2 <- mf[,3]
  mf$alpha <- (tab$tables[[2]] - tab$tables[[1]])[fat1]
  mf$beta <- (tab$tables[[3]] - tab$tables[[1]])[fat2]
  mf$interacao <- with(mf, alpha*beta)
  fit <- update(object, ~ . + interacao, data=mf)
  car::Anova(fit)
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
    class(y) <- "factor2k"
    return(y)
  }
}


# for internal usage
interPlot2 <- function(object){
  mf <- as.data.frame(stats::model.frame(object))
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

# for internal usage
interPlot3 <- function(object){
  mf <- as.data.frame(stats::model.frame(object))
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

# for internal usage
interPlot4 <- function(object){
  mf <- as.data.frame(stats::model.frame(object))
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


#' Interaction plot for factorial designs with up to 4 factors.
#' @export
#' @aliases interactionPlot
#' @description This function draws the interaction plot for factorial designs with up to 4 factors using ggplot2 package. The display of the plots depends on the order of factors entering in the model.
#' @param object fitted model of class aov or lm
#' @return the desired interaction plot
#' @examples
#'
#' library(planex)
#' library(tidyverse)
#'
#' # Exemplo da impureza de um produto químico:
#' head(impureza)
#' sapply(impureza, class)
#'impureza <- mutate(impureza,
#'                   temperatura = as.factor(temperatura),
#'                   pressao = as.factor(pressao)
#')
#'
#' mod <- aov(impureza~temperatura+pressao, data=impureza)
#' interactionPlot(mod)
#'
#' # Exemplo do tempo de vida de baterias:
#'
#' head(baterias)
#' sapply(baterias, class)
#' baterias <- mutate(baterias,
#'                   temperatura = as.factor(temperatura),
#'                   tipo = as.factor(tipo)
#')
#'
#' mod <- aov(tempo~temperatura+tipo, data=baterias)
#' interactionPlot(mod)
#'
#' # Exemplo das garrafas de refrigerante:
#'
#' head(refrigerantes)
#' sapply(refrigerantes, class)
#' mod1 <- aov(desvio~carbonatacao+pressao+velocidade, data=refrigerantes)
#' mod2 <- aov(desvio~pressao+carbonatacao+velocidade, data=refrigerantes)
#' mod3 <- aov(desvio~velocidade+carbonatacao+pressao, data=refrigerantes)
#' mod4 <- aov(desvio~velocidade+pressao+carbonatacao, data=refrigerantes)
#'
#' interactionPlot(mod1)
#' interactionPlot(mod2)
#' interactionPlot(mod3)
#' interactionPlot(mod4)
#'
#' # Exemplo das garrafas de refrigerante:
#'
#' head(refrigerantes)
#' sapply(refrigerantes, class)
#' mod1 <- aov(filtragem ~ temperatura+pressao+concentracao+agitacao, data=filtragem)
#' mod2 <- aov(filtragem ~ pressao+temperatura+concentracao+agitacao, data=filtragem)
#' mod3 <- aov(filtragem ~ concentracao+temperatura+pressao+agitacao, data=filtragem)
#' mod4 <- aov(filtragem ~ agitacao+pressao+temperatura+concentracao, data=filtragem)
#'
#' interactionPlot(mod1)
#' interactionPlot(mod2)
#' interactionPlot(mod3)
#' interactionPlot(mod4)
#'

interactionPlot <- function(object){
  term.ord <- attr(stats::terms(object), "order")
  nfats <- length(which(term.ord == 1)) # main effects
  if(nfats < 2){
    warning("Function only available for factorial with 2 up to 4 factors.")
  }else{
    if(nfats == 2){
      interPlot2(object)
    }else if(nfats == 3){
      interPlot3(object)
    }else if(nfats == 4){
      interPlot4(object)
    }else{
      warning("Function not available for factorial designs with more than 2 factors.")
    }
  }
}



#' Power function for F tests involving one-way and two-way ANOVA
#'
#' @aliases Fpower
#' @export
#' @description Implementation of the power function for F tests involving one-way and two-way ANOVA using the conservative method based on a single specified difference between any two treatment means, and an standard deviation of the experimental error. The Fpower function has been adapted from the Fpower1 and Fpower2 functions provided in the package daewr.
#' @param alpha the significance level of the test (default value is alpha = 0.05).
#' @param nlev vector containing the number of levels of the factors.
#' @param nreps the number of replicates in each combination of factor levels.
#' @param Delta the size of a practical difference in two means.
#' @param sigma the standard deviation of the experimental error.
#' @return a data.frame containing the sample size (nreps), the total number of runs of the experiment (ntotal), the residual's degrees of freedom (df2), and the calculated power associated with the effects in the design.
#' @examples
#' # one-way ANOVA:
#' Fpower(alpha=.05, nlev=3, nreps=2:10, Delta=40, sigma=25)
#'
#' # two-way ANOVA:
#' Fpower(alpha=.05, nlev=c(3, 3), nreps=2:10, Delta=40, sigma=25)
#'
#' # tree-way ANOVA:
#' Fpower(alpha=.05, nlev=c(3, 3, 3), nreps=2:10, Delta=40, sigma=25)
#'
Fpower <- function(alpha = 0.05,  nlev = NULL, nreps = NULL, Delta = NULL, sigma = NULL){
  if (is.null(nlev)|is.null(nreps)|is.null(Delta)|is.null(sigma))
    stop("you must supply alpha, nlev, nreps, Delta and sigma")

  k <- length(nlev)
  if(k == 1){
    a <- nlev[1]
    css <- (Delta^2)/2
    ncA <- (nreps*css)/(sigma^2)
    dfA <- a-1
    df2 <- (nreps-1)*a
    ntotal <- a*nreps
    powerA <- pf(qf(alpha, dfA, df2, lower.tail = FALSE), dfA, df2, ncA, lower.tail = FALSE)
    result <- data.frame(nreps, ntotal , df2, "power" = powerA)
    return(result)
  }else if(k == 2){
    a <- nlev[1]
    b <- nlev[2]
    css <- (Delta^2)/2
    ncA <- b*(nreps*css)/(sigma^2)
    ncB <- a*(nreps*css)/(sigma^2)
    ncAB <- (nreps*css)/( (sigma^2)*( (a-1)*(b-1)+1) )
    dfA <- a-1
    dfB <- b-1
    dfAB <- (a-1)*(b-1)
    df2 <- (nreps-1)*b*a
    ntotal <- a*b*nreps
    powerA <- pf(qf(alpha, dfA, df2, lower.tail = FALSE), dfA, df2, ncA, lower.tail = FALSE)
    powerB <- pf(qf(alpha, dfB, df2, lower.tail = FALSE), dfA, df2, ncB, lower.tail = FALSE)
    powerAB <- pf(qf(alpha, dfAB, df2, lower.tail = FALSE), dfAB, df2, ncAB, lower.tail = FALSE)
    result <- data.frame(nreps, ntotal, df2, "powerA" = powerA, "powerB" = powerB, "powerAB" = powerAB)
    return(result)
  }else{
    warning("This function cannot handle designs with more than two factors!!!")
  }
}






#' Treatment combinations to canonical format
#' @aliases treatcomb2factors
#' @export
#' @description This function uses treatment combinations in standard (Yates') order to generate factors canonical format for factorial designs with only two levels.
#' @param data n x 2 data frame containing the experimental data.
#' @return the updated data with factors in the canonical format
#' @examples
#' library(planex)
#' data(refrigerantes2k)
#' head(refrigerantes2k)
#' refrigerantes2k <- treatcomb2factors(refrigerantes2k)
#' refrigerantes2k
#'
treatcomb2factors <- function(data){
  n <- nrow(data)
  aux <- sapply(data, class)
  if(aux[1] == "character" | aux[1] == "factor"){
    code <- data[,1]
  }else{
    code <- data[,2]
  }

  k <- max(stringi::stri_length(code))
  df <- matrix(nrow = n, ncol = k)
  for(i in 1:k){
    df[,i]   <- ifelse(stringr::str_detect(code, letters[i]), 1, -1)
  }
  df <- as.data.frame(df, k)
  names(df) <- LETTERS[1:k]
  data <- cbind(data, df)
  return(data)
}



#' Summary table for unreplicated/fractional 2^k designs.
#' @aliases table2kunrep
#' @export
#' @description This function is aimed to provide a summary suitable for unreplicated/fractional designs.
#' @param object fitted model of class aov or lm.
#' @return a data.frame containing the estimated effects, the sum of squares (SS), the sum o squares percentual contribution (SSPC), the effects' relative difference with respect to the overal mean (PRD).
#'
#' @examples
#' library(planex)
#' data(semicondutores1rep)
#' semicondutores1rep <- treatcomb2factors(semicondutores1rep)
#' fit <- lm(rendimento ~ A*B*C*D*E, data = semicondutores1rep)
#' table2kunrep(fit)
#'
table2kunrep <- function(object){
  effects <- 2*coef(object)[-1]
  rd <- round(100*(effects/coef(object)[1]), 2)
  tab <- suppressWarnings(stats::anova(object))
  SS <- as.vector(tab["Sum Sq"])[1:length(effects),]
  pc <- round(100*(SS/sum(SS)), 2)
  df <- data.frame(effects = effects, SS = SS, SSPC = pc, PRD = rd)
  return(df)
}


#' Residuals' plots for ANOVA models
#' @aliases plotResiduals
#' @export
#' @description This function is only suitable to analyze residuals of ANOVA models. It must not be used to analyze residuals from regression or ANCOVA models.
#' @param model an object of the class lm or aov.
#' @return residual plots suitable for residual analysis of data from design experiments.
#'
#' @examples
#' library(planex)
#' library(tidyverse)
#' data(saquinhos)
#' saquinhos <- mutate(saquinhos,
#'   concentracao = as.factor(concentracao)
#' )
#' mod <- aov(resistencia ~ concentracao, data = saquinhos)
#' plotResiduals(mod)
#'
plotResiduals <- function(model){

  k <- ceiling(1 + log(length(residuals(model)),2))

  p0 <- ggplot(model, aes(x=1:length(.resid), y=.resid)) +
    geom_point() +
    geom_line() +
    geom_line(aes(y=0), color="blue") +
    xlab("Order of observations") +
    ylab("Residuals")
  plot(p0)

  p1 <- ggplot(model, aes(x = .resid)) +
   geom_histogram(bins = k, color="white") +
   xlab("Residuals") +
   ylab("Frequency")
  plot(p1)

  p2 <- ggplot(model, aes(sample = .resid)) +
    stat_qq() + stat_qq_line(color="blue") +
    ggtitle("Normal Q-Q plot")
  plot(p2)


  p3 <- ggplot(model, aes(.fitted, .resid)) +
    geom_point() +
    geom_line(aes(y=0), color="blue") +
    #stat_smooth(method="loess", se = TRUE) +
    xlab("Fitted values") +
    ylab("Residuals")
  suppressWarnings(plot(p3))


  mf <- as.data.frame(stats::model.frame(model))
  variable <- names(mf)
  for(i in 2:ncol(mf)){
    p <- ggplot(model, aes(x = mf[,i] , y = .resid)) +
      geom_jitter(position=position_jitter(0.1)) +
      #geom_line(aes(y=0), color="blue") +
      geom_hline(yintercept = 0, color = "blue") +
      xlab(variable[i]) +
      ylab("residuals")
    plot(p)
  }
  plots <- list(p1, p2, p3)

}




#' Residual's formal tests for ANOVA models
#' @aliases testResiduals
#' @export
#' @description This function is only suitable to analyze residuals of ANOVA models. It must not be used to analyze residuals from regression or ANCOVA models.
#' @param model an object of the class lm or aov.
#' @param normality.test type of normality test; currently Shapiro-Wilk (SW) and Anderson-Darling (AD) tests are available
#' @param var.test type of homogeneity test of variances; currently Bartlett and Levene tests are available
#' @return residuals' normality test and residuals' homoneity test of variances.
#'
#' @examples
#' library(planex)
#' library(tidyverse)
#' baterias <- mutate(baterias,
#'   temperatura = as.factor(temperatura),
#'   tipo = as.factor(tipo)
#' )
#'
#' mod <- aov(tempo ~ temperatura*tipo, data=baterias)
#' testResiduals(mod)
#'
testResiduals <- function(model, normality.test = c("sw", "ad"),
                          var.test = c("bartlett", "levene")){

  resid <- residuals(model)
  normality.test <- tolower(normality.test)
  var.test <- tolower(var.test)
  test1 <- match.arg(normality.test)
  test2 <- match.arg(var.test)

  switch(test1,
         "sw" = print(stats::shapiro.test(resid)),
         "ad" = print(nortest::ad.test(resid))
  )

  #--------------------------------------------------------------

  tabBartlett <- function(aux){
    tab <- data.frame(aux$statistic, aux$parameter, aux$p.value)
    names(tab) <- c("Bartlett's K-squared", "df", "p.value")
    return(tab)
  }

  tabLevene <- function(aux){
    tab <- data.frame(aux$'F value', aux$Df, aux$'Pr(>F)')
    names(tab) <- c("F value", "df", "p.value")
    return(tab)
  }

  mf <- as.data.frame(stats::model.frame(model)) %>%
    dplyr::select(which(sapply(.,is.factor)), which(sapply(.,is.factor2k)))
  variable <- names(mf)
  k <- ncol(mf)

  if(test2 == "bartlett"){
    aux <- stats::bartlett.test(resid~mf[,1])
    tab <- tabBartlett(aux)
  }else{
    aux <- car::leveneTest(resid~mf[,1])[1,]
    tab <- tabLevene(aux)
  }

  if(k > 1){

    if(test2 == "bartlett"){
      for(i in 2:k){
        aux1 <- bartlett.test(resid~mf[,i])
        aux2 <- tabBartlett(aux1)
        tab <- rbind(tab, aux2)
      }
    }else{
      for(i in 2:k){
        aux1 <- car::leveneTest(resid~mf[,i])[1,]
        aux2 <- tabLevene(aux1)
        tab <- rbind(tab, aux2)
      }
    }

  }
  #rownames(tab) <- variable[-1]
  rownames(tab) <- names(mf)

  cat("------------------------------------------", "\n")
  if(test2 == "Bartlett"){
    cat("Bartlett test of Homogeneity of Variances:", "\n")
  }else{
    cat("Levene test of Homogeneity of Variances:", "\n")
  }
  print(tab)

  cat("\n")
  cat("-----------------------------------------------", "\n")
  cat("Durbin-Watson Test for Autocorrelated Errors:", "\n")
  print(car::durbinWatsonTest(model))
}


is.factor2k <- function(x){
  return(class(x) == "factor2k")
}
