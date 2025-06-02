

#---------------------------------------------
#' Generic S3 method cross_time
#' @aliases perm.test
#' @export
#' @param object an object of the class aov
#' @param ... further arguments passed to or from other methods
#' @return a list containing the results of a permutation test
#'
perm.test <- function(object, ...) UseMethod("perm.test")



#' Two-sample permutation test for differences in the population means
#'
#' @aliases perm.test.default
#' @rdname perm.test-methods
#' @method perm.test default
#' @export
#' @param x a (non-empty) numeric vector of data values.
#' @param y a (non-empty) numeric vector of data values.
#' @param nsim number of permutations to be simulated.
#' @param seed seed passed to the random number generator; if NULL (default), then a random seed is used.
#' @param alternative	a character string specifying the alternative hypothesis, must be one of "two.sided" (default), "greater" or "less". You can specify just the initial letter.
#' @param ... further arguments passed to or from other methods.
#' @details The permutation test implemented here is based on the difference of the sample means.
#' @return  perm.test returns an object of class perm.test containing information regarding the permutation test carried out.
#' @examples
#' \donttest{
#' library(planex)
#' library(tidyr)
#' data(catalisadores2)
#' t.test  <- t.test(catalisadores2$C1, catalisadores2$C2)
#' t.test
#' #perm <- perm.test(catalisadores2$C1, catalisadores2$C2, nsim = 1000, seed = 123)
#' #perm$pvalor
#' }
#'
perm.test.default <- function(x, y, nsim = 1000, seed = NULL,
                              alternative = c("two.sided", "less", "greater"), ...){
  alternative <- match.arg(alternative)

  nx <- length(x)
  ny <- length(y)

  df <- data.frame(
    v = c(x, y),
    group = c(rep("x", nx), rep("y", ny))
  )

  if(!is.null(seed)){
    set.seed(seed)
  }
  theta_star <- vector(length = nsim)
  for (i in 1:nsim) {
    perm_data <- df %*%
      mutate(
        group = sample(.data$group)
      )
    theta_star[i] <- diff(with(perm_data, tapply(v, group, mean)[2:1]))
  }
  theta_hat <- diff(with(df, tapply(v, group, mean)[2:1]))

  p1 <- mean(theta_star <= theta_hat)
  p2 <- mean(theta_star > theta_hat)
  pvalor <- switch(alternative,
                   "two.sided" = 2*min(p1, p2),
                   "less" = p1,
                   "greater" = p2
  )

  out <- list(
    theta_star = theta_star,
    theta_hat = theta_hat,
    pvalor=pvalor
  )
  return(out)
}

#' Two-sample permutation test for differences in the population means
#'
#' @aliases perm.test.formula
#' @rdname perm.test-methods
#' @method perm.test formula
#' @export
#' @param formula a formula of the form lhs ~ rhs where lhs is a numeric variable giving the data values and rhs either 1 for a one-sample or paired test or a factor with two levels giving the corresponding groups.
#' @param data an optional matrix or data frame containing the variables in the formula formula. By default the variables are taken from environment(formula).
#' @param nsim number of permutations to be simulated.
#' @param seed seed passed to the random number generator; if NULL (default), then a random seed is used.
#' @param alternative	a character string specifying the alternative hypothesis, must be one of "two.sided" (default), "greater" or "less". You can specify just the initial letter.
#' @param ... further arguments passed to or from other methods.
#' @details The permutation test implemented here is based on the difference of the sample means.
#' @return  perm.test returns an object of class perm.test containing information regarding the permutation test carried out.
#' @examples
#' \donttest{
#' library(planex)
#' library(tidyr)
#' data(catalisadores2)
#' #catalisadores2 <- catalisadores2 %*%
#' #  pivot_longer(
#' #     cols = 1:2,
#' #     names_to = "catalisador",
#' #     values_to = "rendimento"
#' #   )
#' # t.test  <- t.test(rendimento ~ catalisador, data=catalisadores2)
#' # t.test
#' # perm <- perm.test(rendimento ~ catalisador, data=catalisadores2, nsim = 1000, seed = 123)
#' # perm$pvalor
#' }
#'

perm.test.formula <- function(formula, data, nsim = 1000, seed = NULL,
                              alternative = c("two.sided", "less", "greater"), ...){
  alternative <- match.arg(alternative)

  mf <- model.frame(formula, data)
  Terms <- terms(mf)
  att <- attributes(Terms)
  label <- att$term.labels

  df <- data.frame(
    y = model.response(mf),
    group = mf[, label]
  )

  if(!is.null(seed)){
    set.seed(seed)
  }

  theta_star <- vector(length = nsim)
  for (i in 1:nsim) {
    perm_data <- df %*%
      mutate(
        group = sample(.data$group)
      )
    # estimates <- with(perm_data, tapply(y, group, mean))
    # theta_star[i] <- estimates[1] - estimates[2]
    theta_star[i] <- diff(with(perm_data, tapply(y, group, mean)[2:1]))
  }

  theta_hat <- diff(with(df, tapply(y, group, mean)[2:1]))
  #estimates <- with(df, tapply(y, group, mean))
  #theta_hat <- estimates[1] - estimates[2]
  p1 <- mean(theta_star <= theta_hat)
  p2 <- mean(theta_star > theta_hat)
  pvalor <- switch(alternative,
                   "two.sided" = 2*min(p1, p2),
                   "less" = p1,
                   "greater" = p2
  )

  out <- list(
    theta_star = theta_star,
    theta_hat = theta_hat,
    pvalor=pvalor
  )
  return(out)
}



#' Analysis of variance based on permutation tests
#'
#' @aliases perm.test.aov
#' @rdname perm.test-methods
#' @method perm.test aov
#' @export
#' @param object an object of class aov
#' @param nsim number of permutations to be simulated
#' @param seed seed passed to the random number generator; if NULL (default), then a random seed is used
#' @param ... further arguments passed to or from other methods.
#' @return  perm.test returns an object of class perm.test.aov containing information regarding the permutation test carried out
#' @examples
#' \donttest{
#' library(planex)
#' data(refrigerantes)
#' mod <- aov(desvio ~ carbonatacao*pressao*velocidade, data=refrigerantes)
#' summary(mod)
#' perm <- perm.test(mod)
#' summary(perm)
#' }
#'

perm.test.aov <- function(object, nsim = 1000, seed = NULL, ...){
  call <- match.call()
  mf <- model.frame(object)
  formula <- formula(object)
  att <- attributes(object$terms)
  labels <- att$term.labels
  k <- length(att$order)
  n <- nrow(mf)
  factors <- with(att, term.labels[order == 1])

  if(!is.null(seed)){
    set.seed(seed)
  }

  tb <- summary(object)
  theta_hat <- tb[[1]]$`F value`[1:k]
  names(theta_hat) <- labels

  theta_star <- matrix(nrow = nsim, ncol = k)
  for (i in 1:nsim){
    id <- sample(1:n)
    df1 <- mf %>%
      select(-all_of(factors))
    df1 <- df1[id, 1, drop = FALSE]

    df2 <- mf[, factors, drop = FALSE]
    perm_data <- dplyr::bind_cols(df1, df2)


    fit <- stats::aov(formula, data = perm_data)
    tb <- summary(fit)
    df = tb[[1]]$Df[1:k]
    theta_star[i, ] <- tb[[1]]$`F value`[1:k]
  }
  theta_star <- as.data.frame(theta_star)
  names(theta_star) <- att$term.labels

  pvalor <- vector(length = k)
  for(i in 1:k){
    pvalor[i] <- mean(theta_star[, i] > theta_hat[i])
  }
  names(pvalor) <- labels

  out <- list(
    theta_star = theta_star,
    theta_hat = theta_hat,
    pvalor=pvalor,
    call = call,
    formula = formula,
    df = df,
    mf = mf,
    nsim = nsim
  )
  class(out) <- "perm.test.aov"
  return(out)
}


#' Summary for an perm.test.aov object
#'
#' @aliases summary.perm.test.aov
#' @export
#' @param object the result of a call to summary.perm.test.aov
#' @param conf.level the confidence level required.
#' @param ... further arguments passed to or from other methods.
#' @return an object of the class summary.survstan containing a summary of the fitted model.
#'
summary.perm.test.aov <- function(object, ...){
  tb <- data.frame(
    df = object$df,
    statistic = object$theta_hat,
    p.valor = object$pvalor
  )
  rownames(tb) <- names(object$pvalor)
  res <- list(nsim = object$nsim, tb = tb)
  class(res) <- "summary.perm.test.aov"
  return(res)
}


#' Print the summary.perm.test.aov output
#'
#' @export
#' @description Produces a printed summary of an object of the class perm.test.
#' @param x an object of the class perm.test.
#' @param ... further arguments passed to or from other methods.
#' @return No return value, called for side effects.
#'
print.summary.perm.test.aov <- function(x, ...){
  cat("\n")
  n <- nrow(x$tb)
  if(n>1){
    message <- paste("Permutation tests based on", x$nsim, "replications")
  }else{
    message <- paste("Permutation test based on", x$nsim, "replications")
  }

  cat(message)
  cat("\n")
  stats::printCoefmat(x$tb, P.value=TRUE, has.Pvalue=TRUE)
}
