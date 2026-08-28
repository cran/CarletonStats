#' @describeIn permTestCor Permutation test for the correlation of two variables.
#' @export

permTestCor.default <-
  function(
    x,
    y,
    B = 999,
    alternative = "two.sided",
    plot.hist = TRUE,
    plot.qq = FALSE,
    x.name = deparse(substitute(x)),
    y.name = deparse(substitute(y)),
    xlab = NULL,
    ylab = NULL,
    title = NULL,
    seed = NULL,
    ...
  ) {
    if (!is.null(seed)) {
      set.seed(seed)
    }

    if (!is.numeric(x)) {
      stop("Variable 1 must be numeric")
    }
    if (!is.numeric(y)) {
      stop("Variable 2 must be numeric")
    }

    comCases <- complete.cases(x, y)
    nmiss <- length(x) - sum(comCases)
    if (nmiss > 0) {
      cat("\n ", nmiss, "observation(s) removed due to missing values.\n")
    }

    x2 <- x[comCases]
    y2 <- y[comCases]

    n <- length(x2)
    observed <- round(cor(x2, y2), 4)

    result <- numeric(B)
    for (i in 1:B) {
      index <- sample(n, n, replace = FALSE)
      newy <- y2[index]
      result[i] <- cor(x2, newy)
    } #end for

    alt <- pmatch(alternative, c("less", "greater", "two.sided"), nomatch = 4)

    P.value <- .calc_pvalue(result, observed, alt)
    if (P.value > 1) {
      P.value <- 1
    }

    class(result) <- "carlperm"
    attr(result, "observed") <- observed
    attr(result, "statistic") <- "correlation"
    attr(result, "alternative") <- alternative
    attr(result, "x.name") <- x.name
    attr(result, "y.name") <- y.name
    attr(result, "pval") <- P.value
    attr(result, "xlab") <- xlab
    attr(result, "ylab") <- ylab
    attr(result, "title") <- title
    attr(result, "plot.hist") <- plot.hist
    attr(result, "plot.qq") <- plot.qq

    result
  }
