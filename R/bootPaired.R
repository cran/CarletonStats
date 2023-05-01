#' Bootstrap paired data
#'
#' Perform a bootstrap of two paired variables.
#'
#' The command will compute the difference of \code{x} and \code{y} and
#' bootstrap the difference. The mean and standard error of the bootstrap
#' distribution will be printed as well as a bootstrap percentile interval.
#'
#' Observations with missing values are removed.
#'
#' @aliases bootPaired bootPaired.default bootPaired.formula
#' @param x a numeric vector.
#' @param y a numeric vector.
#' @param conf.level confidence level for the bootstrap percentile interval.
#' @param B number of resamples (positive integer greater than 2).
#' @param plot.hist logical. If \code{TRUE}, plot the histogram of the
#' bootstrap distribution.
#' @param plot.qq logical. If \code{TRUE}, a normal quantile-quantile plot of
#' the replicates will be created.
#' @param legend.loc location for the legend on the histogram. Options are
#' \code{"topright"} \code{"topleft"}, \code{"bottomleft"} and
#' \code{"bottomright"}.
#' @param x.name Label for variable x
#' @param y.name Label for variable y
#' @param formula a formula \code{y ~ x} where \code{x, y} are both numeric vectors
#' @param data a data frame that contains the variables given in the formula.
#' @param subset an optional expression indicating what observations to use.
#' @param \dots further arguments to be passed to or from methods.
#' @return The command invisibly returns a vector with the replicates of the
#' statistic being bootstrapped.
#' @author Laura Chihara
#' @references Tim Hesterberg's website
#' \url{https://www.timhesterberg.net/bootstrap-and-resampling}
#' @keywords bootstrap randomization resampling
#' @examples
#'
#' #Bootstrap the mean difference of fat content in vanilla and chocolate ice
#' #cream. Data are paired becaues ice cream from the same manufacturer will
#' #have similar content.
#' Icecream
#' bootPaired(ChocFat ~ VanillaFat, data = Icecream)
#' bootPaired(Icecream$VanillaFat, Icecream$ChocFat)
#'
#' @export

bootPaired <-
function(x,  ...)
{
  UseMethod("bootPaired")

}
