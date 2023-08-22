#' @title Print a summary of an \code{carlboot} object
#'
#' @description
#' Print summary statistics and confidence intervals, if desired, for an \code{lmeresamp} object.
#'
#' @param object The carlboot object to print.
#' @param ... not used
#'
#' @rdname summary
#' @export 
#' @method summary carlboot
#' @examples
#' boot_dist <- boot(ToothGrowth$len, ToothGrowth$supp, B = 1000)
#' summary(boot_dist)
summary.carlboot <- function(object, ...) {
  cat("Replications:", length(object), "\n\n")
  
  cat("Summary Statistics of Bootstrap Distribution:", "\n")
  
  print(
    data.frame(
      Observed = attr(object, "observed"),
      Mean = mean(object),
      SE = sd(object)
    )
  )
}


#' @rdname summary
#' @export 
#' @method summary carlperm
#' @examples
#' perm_dist <- permTest(states03$ViolentCrime, states03$DeathPenalty, B = 999)
#' summary(perm_dist)
summary.carlperm <- function(object, ...) {
  alt <- pmatch(attr(object, "alternative"), c("less", "greater", "two.sided"), nomatch = 4)
  
  cat("Replications:", length(object), "\n\n")
  
  cat("Summary Statistics of Permutation Distribution:", "\n\n")
  
  
  res <-  data.frame(
      Observed = attr(object, "observed"),
      Mean = mean(object),
      Alternative = attr(object, "alternative"),
      "P.value" = .calc_pvalue(object, attr(object, "observed"), alt)
    )
  
  if(attr(object, "statistic") == "F") {
    res$df1 <- attr(object, "df")[1]
    res$df2 <- attr(object, "df")[2]
    res <- res[,c("Observed", "Mean", "df1", "df2", "P.value")]
  }
  
  print(res)
}