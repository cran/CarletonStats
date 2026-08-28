#' @describeIn boot Bootstrap a single variable or a grouped variable
#' @export
#' @importFrom patchwork wrap_plots

boot.default <-
  function(
    x,
    group = NULL,
    statistic = mean,
    success = NULL,
    conf.level = 0.95,
    B = 10000,
    plot.hist = TRUE,
    plot.qq = FALSE,
    x.name = deparse(substitute(x)),
    xlab = NULL,
    ylab = NULL,
    title = NULL,
    seed = NULL,
    ...
  ) {
    if (!is.null(seed)) {
      set.seed(seed)
    }

    if (B %% 1 != 0 || B < 2) {
      stop("B must be a positive integer")
    }

    x.name <- x.name  # force before x may be modified below

    stat <- match.fun(statistic)

    is_proportion <- FALSE
    if (!is.numeric(x)) {
      enc <- .encode_binary(x, success)
      x <- enc$x
      is_proportion <- TRUE
    } else if (!is.null(success)) {
      warning("'success' is ignored when x is numeric.")
    }

    #Boot for single numerical variable
    if (is.null(group)) {
      #end if for single numeric variable
      comCases <- complete.cases(x)
      nmiss <- length(x) - sum(comCases)

      if (nmiss > 0) {
        cat(
          "\n\n",
          nmiss,
          "observation(s) removed due to missing values.",
          "\n"
        )
      }

      xc <- x[comCases]
      temp <- numeric(B)

      for (i in 1:B) {
        w <- sample(xc, length(xc), replace = TRUE)
        temp[i] <- stat(w)
      } #end for

      observed <- stat(xc)
      boot.mean <- mean(temp)
    } else {
      #--------------------
      #for two sample bootstrap
      group.name <- deparse(substitute(group))

      if (is.factor(group)) {
        group <- droplevels(group)
      } else {
        group <- as.factor(group)
      }

      if (length(levels(group)) != 2) {
        stop("Grouping variable must have only two levels")
      }

      comCases <- complete.cases(x, group)
      nmiss <- length(x) - sum(comCases)

      if (nmiss > 0) {
        cat(
          "\n\n",
          nmiss,
          "observation(s) removed due to missing values.",
          "\n"
        )
      }

      xc <- x[comCases]
      group <- group[comCases]

      group1 <- xc[group == levels(group)[1]]
      group2 <- xc[group == levels(group)[2]]
      stat1 <- stat(group1)
      stat2 <- stat(group2)
      observed <- stat1 - stat2
      temp <- numeric(B)

      for (i in 1:B) {
        x1 <- sample(group1, length(group1), replace = T)
        x2 <- sample(group2, length(group2), replace = T)
        temp[i] <- stat(x1) - stat(x2)
      } #end for

      boot.mean <- mean(temp)
    } #end else

    class(temp) <- "carlboot"
    attr(temp, "observed") <- observed
    attr(temp, "statistic") <- if (is_proportion) "proportion" else as.character(substitute(statistic))
    attr(temp, "groups") <- levels(group)
    attr(temp, "x.name") <- x.name
    attr(temp, "level") <- conf.level
    attr(temp, "xlab") <- xlab
    attr(temp, "ylab") <- ylab
    attr(temp, "title") <- title
    attr(temp, "plot.hist") <- plot.hist
    attr(temp, "plot.qq") <- plot.qq

    temp
  }
