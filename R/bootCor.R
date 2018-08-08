#' Bootstrap the correlation
#'
#' Bootstrap the correlation of two numeric variables.
#'
#' Bootstrap the correlation of two numeric variables. The bootstrap mean and
#' standard error are printed as well as a bootstrap percentile confidence
#' interval.
#'
#' Observations with missing values are removed.
#'
#' @aliases bootCor bootCor.default bootCor.formula
#' @param x a numeric vector.
#' @param y a numeric vector.
#' @param conf.level confidence level for the bootstrap ercentile interval.
#' @param B number of times to resample (positive integer greater than 2).
#' @param plot.hist a logical value. If \code{TRUE}, plot the bootstrap
#' distribution of the resampled correlation.
#' @param hist.title a user supplied title for the histogram.
#' @param plot.qq a logical value. If \code{TRUE} a normal quantile-quantile
#' plot of the bootstraped values is created.
#' @param legend.loc location to place the legend. Options include
#' \code{"topright"}, \code{"topleft"}, \code{"bottomright"},
#' \code{"bottomleft"}.
#' @param x.name Label for variable x
#' @param y.name Label for variable y
#' @param formula a formula of the form lhs ~ rhs where lhs is a numeric variable giving the data values and rhs a factor with two levels giving the corresponding groups.
#' @param data an optional data frame containing the variables in the formula formula.
#' By default the variables are taken from environment(formula).
#' @param subset an optional vector specifying a subset of observations to be used.
#' @param \dots further arguments to be passed to or from methods.
#' @return The command invisibly returns the correlations of the resampled
#' observations.
#' @author Laura Chihara
#' @references Tim Hesterberg's website
#' \url{http://www.timhesterberg.net/bootstrap}
#' @keywords resampling randomiziation
#' @examples
#'
#'
#' plot(states03$ColGrad, states03$InfMortality)
#' bootCor(InfMortality ~ ColGrad, data = states03)
#' bootCor(states03$ColGrad, states03$InfMortality)
#'
#' @importFrom stats cor 
#' @export

bootCor <-
function(x,  ...)
{
  UseMethod("bootCor")

}
