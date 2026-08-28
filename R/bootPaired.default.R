#' @describeIn bootPaired Perform a bootstrap of two paired variables.
#' @export

bootPaired.default <-
  function(
    x,
    y,
    conf.level = 0.95,
    B = 10000,
    plot.hist = TRUE,
    xlab = NULL,
    ylab = NULL,
    title = NULL,
    plot.qq = FALSE,
    x.name = deparse(substitute(x)),
    y.name = deparse(substitute(y)),
    seed = NULL,
    ...
  ) {
    if (B %% 1 != 0 || B < 2) {
      stop("B must be a positive integer")
    }

    if (!is.null(seed)) {
      set.seed(seed)
    }

    if (!is.numeric(x)) {
      stop("Variable 1 must be numeric.")
    }
    if (!is.numeric(y)) {
      stop("Variable 2 must be numeric.")
    }

    comCases <- complete.cases(x, y)
    nmiss <- length(x) - sum(comCases)
    if (nmiss > 0) {
      cat("\n ", nmiss, "observation(s) removed due to missing values.\n")
    }

    x2 <- x[comCases]
    y2 <- y[comCases]

    Diff <- y2 - x2
    n <- length(Diff)
    observed <- mean(Diff)

    #Boot
    temp <- numeric(B)

    for (i in 1:B) {
      bootDiff <- sample(Diff, n, replace = TRUE)
      temp[i] <- mean(bootDiff)
    } #end for

    class(temp) <- "carlboot"
    attr(temp, "observed") <- observed
    attr(temp, "statistic") <- "mean"
    attr(temp, "groups") <- "paired"
    attr(temp, "x.name") <- x.name
    attr(temp, "y.name") <- y.name
    attr(temp, "level") <- conf.level
    attr(temp, "xlab") <- xlab
    attr(temp, "ylab") <- ylab
    attr(temp, "title") <- title
    attr(temp, "plot.hist") <- plot.hist
    attr(temp, "plot.qq") <- plot.qq

    temp
  }
