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
#' @param x a numeric vector
#' @param group an optional grouping variable (vector), usually a factor
#' variable. If it is a binary numeric variable, it will be coerced to a
#' factor.
#' @param statistic function that computes the statistic of interest. Default is the
#' \code{mean}.
#' @param conf.level confidence level for the bootstrap percentile interval.
#' Default is 95\%.
#' @param B number of times to resample (positive integer greater than 2).
#' @param plot.hist logical value. If \code{TRUE}, plot the histogrom of the
#' bootstrap distribution.
#' @param legend.loc where to place the legend on the histogram. Default is
#' \code{"topright"}. Other options include \code{"topleft"},
#' \code{"bottomleft"} and \code{"bottomright"}.
#' @param plot.qq Logical value. If \code{TRUE}, create a normal
#' quantile-quantile plot of the bootstrap distribution.
#' @param x.name Label for variable name
#' @param formula a formula \code{y ~ g} where \code{y} is a numeric vector and
#' \code{g} a factor variable with two levels. If \code{g} is a binary numeric
#' vector, it will be coerced to a factor variable. For a single numeric variable,
#' formula may also be \code{~ y}.
#' @param data a data frame that contains the variables given in the formula.
#' @param subset an optional expression indicating what observations to use.
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
#' @importFrom stats complete.cases sd terms quantile
#' @importFrom graphics abline hist legend lines mtext par plot points title
#' @importFrom grDevices dev.new
#' @export

boot <-
function(x,  ...)
{
  UseMethod("boot")

}
