#' @describeIn permTestPaired Permutation test for paired data.
#' @export

permTestPaired.default <-
  function(
    x,
    y,
    B = 9999,
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

    if (!is.numeric(x) || !is.numeric(y)) {
      stop("Both variables must be numeric.")
    }

    comCases <- complete.cases(x, y)
    nmiss <- length(x) - sum(comCases)
    if (nmiss > 0) {
      cat("\n ", nmiss, "observation(s) removed due to missing values.\n")
    }

    x2 <- x[comCases]
    y2 <- y[comCases]
    n <- length(x2)
    stat1 <- mean(x2)
    stat2 <- mean(y2)
    Diff <- y2 - x2
    observed <- mean(Diff)

    result <- numeric(B)

    for (i in 1:B) {
      Diff2 <- Diff
      Sign <- sample(c(-1, 1), n, replace = TRUE)
      Diff2 <- -Diff * Sign
      result[i] <- mean(Diff2)
    } #end for

    alt <- pmatch(alternative, c("less", "greater", "two.sided"), nomatch = 4)

    P.value <- .calc_pvalue(result, observed, alt)
    if (P.value > 1) {
      P.value <- 1
    }

    class(result) <- "carlperm"
    attr(result, "observed") <- observed
    attr(result, "statistic") <- "paired difference"
    attr(result, "alternative") <- alternative
    attr(result, "x.name") <- x.name
    attr(result, "y.name") <- y.name
    attr(result, "var.stats") <- c(stat1, stat2)
    attr(result, "pval") <- P.value
    attr(result, "xlab") <- xlab
    attr(result, "ylab") <- ylab
    attr(result, "title") <- title
    attr(result, "plot.hist") <- plot.hist
    attr(result, "plot.qq") <- plot.qq

    result
  }
