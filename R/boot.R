#' Bootstrap
#'
#' Bootstrap a single variable or a grouped variable
#'
#' Perform a bootstrap of a statistic applied to a single variable, or to the
#' difference of the statistic computed on two samples (using the grouping
#' variable). If \code{x} is a binary vector of 0's and 1's and the function is
#' the mean, then the statistic of interest is the proportion.
#'
#' Observations with missing values are removed.
#'
#' @aliases boot boot.default boot.formula
#' @param x a numeric, logical, factor, or character vector. Logical, factor,
#' and character vectors with exactly two unique values are converted to 0/1,
#' and \code{mean} is used to compute the proportion.
#' @param group an optional grouping variable (vector), usually a factor
#' variable. If it is a binary numeric variable, it will be coerced to a
#' factor.
#' @param statistic function that computes the statistic of interest. Default
#' is the \code{mean}.
#' @param success a character string naming the level of \code{x} to code as
#' 1 when \code{x} is a logical, factor, or character variable. Defaults to
#' \code{NULL}, which uses the second factor level (alphabetically) or
#' \code{TRUE} for logical vectors.
#' @param conf.level confidence level for the bootstrap percentile interval.
#' Default is 95\%.
#' @param B number of times to resample (positive integer greater than 2).
#' @param seed optional argument to \code{\link{set.seed}}
#' @param plot.hist logical value. If \code{TRUE}, plot the histogram of the
#' bootstrap distribution.
#' @param plot.qq Logical value. If \code{TRUE}, create a normal
#' quantile-quantile plot of the bootstrap distribution.
#' @param x.name Label for variable name
#' @param formula a formula \code{y ~ g} where \code{y} is a numeric vector and
#' \code{g} a factor variable with two levels. If \code{g} is a binary numeric
#' vector, it will be coerced to a factor variable. For a single numeric variable,
#' formula may also be \code{~ y}.
#' @param data a data frame that contains the variables given in the formula.
#' @param subset an optional expression indicating what observations to use.
#' @param xlab an optional character string for the x-axis label
#' @param ylab an optional character string for the y-axis label
#' @param title an optional character string giving the plot title
#' @param \dots further arguments to be passed to or from methods.
#' @return A vector with the resampled statistics is returned invisibly.
#' @author Laura Chihara
#' @references Tim Hesterberg's website
#' \url{https://www.timhesterberg.net/bootstrap-and-resampling}
#' @keywords bootstrap resampling randomization
#' @examples
#'
#' #ToothGrowth data (supplied by R)
#' #bootstrap mean of a single numeric variable
#' boot(ToothGrowth$len)
#'
#' #bootstrap difference in mean of tooth length for two groups.
#' boot(ToothGrowth$len, ToothGrowth$supp, B = 1000)
#'
#' #same as above using formula syntax
#' boot(len ~ supp, data = ToothGrowth, B = 1000)
#'
#' # Penguin Survival proportion
#' boot(penguin_survival$Status, data = penguin_survival, B = 1000)
#'
#' # same as above, but with the formula syntax
#' boot(~Status, data = penguin_survival, B = 1000)
#'
#' # Penguin Survival if tagged vs. untagged
#' # bootstrap difference in proportions of survival
#' boot(penguin_survival$Status, penguin_survival$TagType, B = 1000)
#'
#' # now using the formula syntax
#' boot(Status ~ TagType, data = penguin_survival, B = 1000)
#'
#' @importFrom stats complete.cases sd terms quantile
#' @importFrom graphics abline hist legend lines mtext par plot points title
#' @importFrom grDevices dev.new
#' @export

boot <-
  function(x, ...) {
    UseMethod("boot")
  }
