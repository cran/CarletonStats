#' Bootstrap the slope of a simple linear regression line
#'
#' Bootstrap theslope of a simple linear regression line. The bootstrap mean and
#' standard error are printed as well as a bootstrap percentile confidence
#' interval.
#'
#' Observations with missing values are removed.
#'
#' @aliases bootSlope bootSlope.default bootSlope.formula
#' @param x a numeric vector.
#' @param y a numeric vector.
#' @param conf.level confidence level for the bootstrap percentile interval.
#' @param B number of times to resample (positive integer greater than 2).
#' @param plot.hist a logical value. If \code{TRUE}, plot the bootstrap
#' distribution of the resampled slope.
#' @param hist.title a user supplied title for the histogram.
#' @param plot.qq a logical value. If \code{TRUE} a normal quantile-quantile
#' plot of the bootstraped values is created.
#' @param legend.loc location to place the legend. Options include
#' \code{"topright"}, \code{"topleft"}, \code{"bottomright"},
#' \code{"bottomleft"}.
#' @param x.name Label for variable x
#' @param y.name Label for variable y
#' @param formula a formula of the form lhs ~ rhs where lhs is a numeric variable 
#' giving the data values and rhs a factor with two levels giving the corresponding groups.
#' @param data an optional data frame containing the variables in the formula formula.
#' By default the variables are taken from environment(formula).
#' @param subset an optional vector specifying a subset of observations to be used.
#' @param \dots further arguments to be passed to or from methods.
#' @return The command invisibly returns the slopes of the resampled
#' observations.
#' @author Adam Loy, Laura Chihara
#' @references Tim Hesterberg's website
#' \url{https://www.timhesterberg.net/bootstrap-and-resampling}
#' @keywords resampling randomiziation
#' @examples
#'
#'
#' plot(states03$ColGrad, states03$InfMortality)
#' bootSlope(InfMortality ~ ColGrad, data = states03, B = 1000)
#' bootSlope(states03$ColGrad, states03$InfMortality, B = 1000)
#'
#' @importFrom stats cor 
#' @export
bootSlope <-
  function(x,  ...)
  {
    UseMethod("bootSlope")
    
  }
