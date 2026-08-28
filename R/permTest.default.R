#' @describeIn permTest Permutation test
#' @export

permTest.default <- function(
  x,
  group,
  statistic = mean,
  success = NULL,
  B = 9999,
  alternative = "two.sided",
  plot.hist = TRUE,
  plot.qq = FALSE,
  xlab = NULL,
  ylab = NULL,
  title = NULL,
  seed = NULL,
  ...
) {
  if (!is.null(seed)) {
    set.seed(seed)
  }

  stat <- match.fun(statistic)

  is_proportion <- FALSE
  if (!is.numeric(x)) {
    enc <- .encode_binary(x, success)
    x <- enc$x
    is_proportion <- TRUE
  } else if (!is.null(success)) {
    warning("'success' is ignored when x is numeric.")
  }
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
    cat("\n ", nmiss, "observations removed due to missing values.\n")
  }

  x <- x[comCases]
  group <- group[comCases]

  group1 <- x[group == levels(group)[1]]
  group2 <- x[group == levels(group)[2]]
  group1.name <- levels(group)[1]
  group2.name <- levels(group)[2]

  stat1 <- round(stat(group1), 5)
  stat2 <- round(stat(group2), 5)
  n <- length(x)
  m <- length(group1)

  observed <- stat(group1) - stat(group2)

  result <- numeric(B)
  for (i in 1:B) {
    index <- sample(n, m, replace = FALSE)
    result[i] <- stat(x[index]) - stat(x[-index])
  } #end for

  alt <- pmatch(alternative, c("less", "greater", "two.sided"), nomatch = 4)

  P.value <- .calc_pvalue(result, observed, alt)

  if (P.value > 1) {
    P.value <- 1
  }

  class(result) <- "carlperm"
  attr(result, "observed") <- observed
  attr(result, "statistic") <- if (is_proportion) "proportion" else as.character(substitute(statistic))
  attr(result, "alternative") <- alternative
  attr(result, "groups") <- levels(group)
  attr(result, "group.stats") <- c(stat(group1), stat(group2))
  attr(result, "pval") <- P.value
  attr(result, "xlab") <- xlab
  attr(result, "ylab") <- ylab
  attr(result, "title") <- title
  attr(result, "plot.hist") <- plot.hist
  attr(result, "plot.qq") <- plot.qq

  result
}
