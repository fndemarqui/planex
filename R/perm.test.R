

#---------------------------------------------
#' Generic S3 method cross_time
#' @aliases perm.test
#' @export
#' @param object an object of the class aov
#' @param ... further arguments passed to or from other methods
#' @return a list containing the results of a permutation test
#'
perm.test <- function(object, ...) UseMethod("perm.test")



# Confidence interval for the difference in means obtained by inverting the
# permutation distribution (assumes a location-shift model).
perm_conf_int <- function(theta_star, theta_hat, alternative, conf.level){
  a <- 1 - conf.level
  q <- function(p) unname(stats::quantile(theta_star, p))
  ci <- switch(alternative,
               "two.sided" = c(theta_hat - q(1 - a/2), theta_hat - q(a/2)),
               "less" = c(-Inf, theta_hat - q(a)),
               "greater" = c(theta_hat - q(1 - a), Inf)
  )
  attr(ci, "conf.level") <- conf.level
  ci
}

# Shared t.test-like printing for perm.test.default and perm.test.formula objects
print_perm_htest <- function(x){
  cat("\n\tPermutation two-sample test\n\n")
  cat("data:  ", x$data.name, "\n", sep = "")
  cat("difference in means = ", format(signif(x$theta_hat, 5)),
      ", p-value = ", format.pval(x$pvalor, digits = 4),
      " (", x$nsim, " permutations)\n", sep = "")
  null <- switch(x$alternative,
                 "two.sided" = "not equal to",
                 "less" = "less than",
                 "greater" = "greater than")
  cat("alternative hypothesis: true difference in means is ", null, " 0\n", sep = "")
  cat(format(100 * attr(x$conf.int, "conf.level")),
      " percent confidence interval:\n", sep = "")
  cat(" ", paste(format(x$conf.int, digits = 5), collapse = " "), "\n", sep = "")
  cat("sample estimates:\n")
  print(x$estimate)
  cat("\n")
  invisible(x)
}

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
#' @param conf.level confidence level of the interval; default is 0.95.
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
                              alternative = c("two.sided", "less", "greater"),
                              conf.level = 0.95, ...){
  alternative <- match.arg(alternative)
  dname <- paste(deparse1(substitute(x)), "and", deparse1(substitute(y)))

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
  for (i in 1:nsim){
    perm_data <- df %>%
      mutate(
        group = sample(.data$group)
      )
    theta_star[i] <- diff(with(perm_data, tapply(v, group, mean)[2:1]))
  }
  theta_hat <- diff(with(df, tapply(v, group, mean)[2:1]))

  p1 <- mean(theta_star <= theta_hat)
  p2 <- mean(theta_star > theta_hat)
  pvalor <- switch(alternative,
                   "two.sided" = min(1, 2*min(p1, p2)),
                   "less" = p1,
                   "greater" = p2
  )

  out <- list(
    theta_star = theta_star,
    theta_hat = theta_hat,
    pvalor=pvalor,
    conf.int = perm_conf_int(theta_star, theta_hat, alternative, conf.level),
    estimate = c("mean of x" = mean(x), "mean of y" = mean(y)),
    data.name = dname,
    nsim = nsim,
    alternative = alternative
  )
  class(out) <- "perm.test.default"
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
#' @param conf.level confidence level of the interval; default is 0.95.
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
                              alternative = c("two.sided", "less", "greater"),
                              conf.level = 0.95, ...){
  alternative <- match.arg(alternative)
  dname <- if (missing(data)) deparse1(formula) else
    paste0(deparse1(formula), ", data = ", deparse1(substitute(data)))

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
    perm_data <- df %>%
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
                   "two.sided" = min(1, 2*min(p1, p2)),
                   "less" = p1,
                   "greater" = p2
  )

  out <- list(
    theta_star = theta_star,
    theta_hat = theta_hat,
    pvalor=pvalor,
    conf.int = perm_conf_int(theta_star, theta_hat, alternative, conf.level),
    estimate = with(df, tapply(y, group, mean)),
    data.name = dname,
    nsim = nsim,
    alternative = alternative
  )
  names(out$estimate) <- paste("mean in group", names(out$estimate))
  class(out) <- "perm.test.formula"
  return(out)
}


#' Print a perm.test.default object
#'
#' @method print perm.test.default
#' @export
#' @description Prints the test summary (statistic, p-value, confidence interval and estimates) in the style of \code{t.test}.
#' @param x an object of class perm.test.default.
#' @param ... further arguments passed to or from other methods.
#' @return the object \code{x}, invisibly.
#'
print.perm.test.default <- function(x, ...){
  print_perm_htest(x)
  invisible(x)
}


#' Print a perm.test.formula object
#'
#' @method print perm.test.formula
#' @export
#' @description Prints the test summary (statistic, p-value, confidence interval and estimates) in the style of \code{t.test}.
#' @param x an object of class perm.test.formula.
#' @param ... further arguments passed to or from other methods.
#' @return the object \code{x}, invisibly.
#'
print.perm.test.formula <- function(x, ...){
  print_perm_htest(x)
  invisible(x)
}



#' Analysis of variance based on permutation tests
#'
#' @aliases perm.test.lm
#' @rdname perm.test-methods
#' @method perm.test lm
#' @export
#' @param object an object of class aov
#' @param type type of the test (I, II or III) to be performed; default is type I
#' @param nsim number of permutations to be simulated; default is 1000
#' @param seed seed passed to the random number generator; if NULL (default), then a random seed is used
#' @param ... further arguments passed to or from other methods.
#' @return  perm.test returns an object of class perm.test.lm containing information regarding the permutation test carried out
#' @examples
#' \donttest{
#' library(planex)
#' data(refrigerantes)
#' mod <- aov(desvio ~ carbonatacao*pressao*velocidade, data=refrigerantes)
#' summary(mod)
#' perm <- perm.test(mod, type = "III")
#' summary(perm)
#' }
#'

perm.test.lm <- function(object, type = c("I", "II", "III"), nsim = 1000, seed = NULL, ...){
  Type <- match.arg(type)
  call <- match.call()
  mf <- model.frame(object)
  formula <- formula(object)
  att <- attributes(object$terms)
  n <- nrow(mf)

  if(!is.null(seed)){
    set.seed(seed)
  }


  if(Type == "I"){
    tb <- broom::tidy(object)
  }else{
    tb <- broom::tidy(car::Anova(object, type = Type))
  }
  theta_hat <- tb$statistic
  theta_hat <- theta_hat[-length(theta_hat)]
  k <- length(theta_hat)
  labels <- tb$term[1:k]
  names(theta_hat) <- labels

  theta_star <- matrix(nrow = nsim, ncol = k)

  for (i in 1:nsim){
    id <- sample(1:n)
    perm_data <- mf
    perm_data[, 1] <- perm_data[id, 1]

    fit <- stats::update(object, data = perm_data)
    if(Type == "I"){
      df <- broom::tidy(fit)
    }else{
      df <- broom::tidy(car::Anova(fit, type = Type))
    }
    theta_star[i, ] <- df$statistic[1:k]

  }
  theta_star <- as.data.frame(theta_star)
  colnames(theta_star) <- labels
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
    df = tb$df[1:k],
    mf = mf,
    nsim = nsim
  )
  class(out) <- "perm.test.lm"
  return(out)
}


#' Summary for an perm.test.lm object
#'
#' @aliases summary.perm.test.lm
#' @export
#' @param object the result of a call to summary.perm.test.lm
#' @param conf.level the confidence level required.
#' @param ... further arguments passed to or from other methods.
#' @return an object of the class summary.survstan containing a summary of the fitted model.
#'
summary.perm.test.lm <- function(object, ...){
  tb <- data.frame(
    df = object$df,
    statistic = object$theta_hat,
    p.valor = object$pvalor
  )
  rownames(tb) <- names(object$pvalor)
  res <- list(nsim = object$nsim, tb = tb)
  class(res) <- "summary.perm.test.lm"
  return(res)
}


#' Print the summary.perm.test.lm output
#'
#' @export
#' @description Produces a printed summary of an object of the class perm.test.
#' @param x an object of the class perm.test.
#' @param ... further arguments passed to or from other methods.
#' @return No return value, called for side effects.
#'
print.summary.perm.test.lm <- function(x, ...){
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
