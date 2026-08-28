#' @describeIn permTestAnova Permutation test for ANOVA F-test
#' @importFrom stats aov
#' @export

permTestAnova.default <- function(
  x,
  group,
  B = 9999,
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

  if (!is.numeric(x)) {
    stop("Variable must be numeric.")
  }
  if (is.factor(group)) {
    group <- droplevels(group)
  } else {
    group <- as.factor(group)
  }

  comCases <- complete.cases(x, group)
  nmiss <- length(x) - sum(comCases)
  if (nmiss > 0) {
    cat("\n ", nmiss, "observations removed due to missing values.\n")
  }

  x <- x[comCases]
  group <- group[comCases]

  n <- length(x)
  observed <- summary(aov(x ~ group))[[1]][["F value"]][1]

  result <- numeric(B)
  for (i in 1:B) {
    index <- sample(n, n, replace = FALSE)
    newgroup <- group[index]
    result[i] <- summary(aov(x ~ newgroup))[[1]][["F value"]][1]
  } #end for

  P.value <- .calc_pvalue(result, observed, alt = 2)

  if (P.value > 1) {
    P.value <- 1
  }

  df1 <- length(unique(group)) - 1

  class(result) <- "carlperm"
  attr(result, "observed") <- observed
  attr(result, "statistic") <- "F"
  attr(result, "df") <- c(df1, n - df1 - 1)
  attr(result, "groups") <- levels(group)
  attr(result, "alternative") <- "greater"
  attr(result, "pval") <- P.value
  attr(result, "xlab") <- xlab
  attr(result, "ylab") <- ylab
  attr(result, "title") <- title
  attr(result, "plot.hist") <- plot.hist
  attr(result, "plot.qq") <- plot.qq

  result
}
