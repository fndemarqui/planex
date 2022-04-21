
#---------------------------------------------
#' Generic S3 method z.test
#' @aliases z.test
#' @export
#' @param object a fitted model object
#' @param ... further arguments passed to or from other methods.
#' @return the z-test
#'
z.test <- function(object, ...) UseMethod("z.test")


#' @export
z.test.default <- function (x, y = NULL, alternative = c("two.sided", "less", "greater"),
                            mu = 0, sigma, conf.level = 0.95,
                            data = NULL){
  alternative <- tolower(alternative)
  alternative <- match.arg(alternative)

  if(is.null(y)){
    method <- "One-sample z-test"
    names(mu) <- "mean"
    dname <- deparse(substitute(x))
    estimates <- mean(x)
    xbar <- estimates
    names(estimates) <- paste0("mean of ", dname)
    n <- length(x)
  }else{
    method <- "Two-sample z-test"
    names(mu) <- "difference in means"
    estimates <- c(mean(x), mean(y))
    dname <- c(deparse(substitute(x)), deparse(substitute(y)))
    xbar <- estimates[1]-estimates[2]
    names(estimates) <- paste0("mean in group ", dname)
    n <- c(length(x), length(y))
  }


  V <- sum(sigma^2/n)
  z0 <- (xbar - mu)/sqrt(V)
  names(z0) <- "z"

  alpha <- 1 - conf.level
  if(alternative == "two.sided"){
    pvalue = pnorm(abs(z0), lower.tail = FALSE)
    ci <- xbar + qnorm(c(alpha/2, 1-alpha/2))*sqrt(V)
  }else{
    ztab <- qnorm(alpha, lower.tail = FALSE)
    if(alternative == "less"){
      pvalue = pnorm(z0)
      ci <- c(-Inf, xbar + ztab*sqrt(V))
    }else{
      pvalue = pnorm(z0, lower.tail = FALSE)
      ci <- c(xbar - ztab*sqrt(V), Inf)
    }
  }

  output <- list(statistic = z0, p.value = pvalue, conf.int = ci,
                 estimate = estimates, null.value = mu,
                 alternative = alternative, method = method, data.name = dname,
                 conf.level = conf.level)

  class(output) <- "z.test"
  return(output)
}

#' @export
z.test.formula <- function (formula, alternative = c("two.sided", "less", "greater"),
                            mu = 0, sigma, conf.level = 0.95,
                            data = NULL){
  alternative <- tolower(alternative)
  alternative <- match.arg(alternative)

  method <- "Two-sample z-test"
  names(mu) <- "difference in means"
  dname <- deparse(substitute(data))

  mf <- stats::model.frame(formula=formula, data=data)

  names(mf) <- c("resp", "group")

  if(length(unique(mf$group))>2){
    stop("grouping factor must have exactly 2 levels")
  }

  estimates <- with(mf, tapply(resp, group, mean))
  names(estimates) <- paste0("mean in group ", names(estimates))
  d <- estimates[1] - estimates[2]
  n <- as.numeric(table(mf$group))
  V <- sum(sigma^2/n)
  z0 <- (d - mu)/sqrt(V)
  names(z0) <- "z"

  alpha <- 1 - conf.level
  if(alternative == "two.sided"){
    pvalue = pnorm(abs(z0), lower.tail = FALSE)
    ci <- d + qnorm(c(alpha/2, 1-alpha/2))*sqrt(V)
  }else{
    ztab <- qnorm(alpha, lower.tail = FALSE)
    if(alternative == "less"){
      pvalue = pnorm(z0)
      ci <- c(-Inf, d + ztab*sqrt(V))
    }else{
      pvalue = pnorm(z0, lower.tail = FALSE)
      ci <- c(d - ztab*sqrt(V), Inf)
    }
  }


  output <- list(statistic = z0, p.value = pvalue, conf.int = ci,
               estimate = estimates, null.value = mu,
               alternative = alternative, method = method, data.name = dname,
               conf.level = conf.level)

  class(output) <- "z.test"
  return(output)
}

#' @export
print.z.test <- function (x, digits = getOption("digits"), prefix = "\t", ...){
  cat("\n")
  cat(strwrap(x$method, prefix = prefix), sep = "\n")
  cat("\n")
  if(length(x$data.name)==1){
    cat("data:  ", x$data.name, "\n", sep = "")
  }else{
    cat("data:  ", x$data.name[1], " and ", x$data.name[1], "\n", sep = "")
  }

  out <- character()
  if (!is.null(x$statistic))
    out <- c(out, paste(names(x$statistic), "=", format(signif(x$statistic,
                                                               max(1L, digits - 2L)))))
  if (!is.null(x$parameter))
    out <- c(out, paste(names(x$parameter), "=", format(signif(x$parameter,
                                                               max(1L, digits - 2L)))))
  if (!is.null(x$p.value)) {
    fp <- format.pval(x$p.value, digits = max(1L, digits -
                                                3L))
    out <- c(out, paste("p-value", if (substr(fp, 1L, 1L) ==
                                       "<") fp else paste("=", fp)))
  }
  cat(strwrap(paste(out, collapse = ", ")), sep = "\n")
  if (!is.null(x$alternative)) {
    cat("alternative hypothesis: ")
    if (!is.null(x$null.value)) {
      if (length(x$null.value) == 1L) {
        alt.char <- switch(x$alternative, two.sided = "not equal to",
                           less = "less than", greater = "greater than")
        cat("true ", names(x$null.value), " is ", alt.char,
            " ", x$null.value, "\n", sep = "")
      }
      else {
        cat(x$alternative, "\nnull values:\n", sep = "")
        print(x$null.value, digits = digits, ...)
      }
    }
    else cat(x$alternative, "\n", sep = "")
  }
  if (!is.null(x$conf.int)) {
    cat(format(100 * x$conf.level), " percent confidence interval:\n",
        " ", paste(format(c(x$conf.int[1L], x$conf.int[2L])),
                   collapse = " "), "\n", sep = "")
  }
  if (!is.null(x$estimate)) {
    cat("sample estimates:\n")
    print(x$estimate, digits = digits, ...)
  }
  if (!is.null(x$Confidence.Intervals)) {
    cat("\n")
    cat("Achieved and Interpolated Confidence Intervals: \n\n")
    print(x$Confidence.Intervals)
    cat("\n")
  }
  invisible(x)
}

