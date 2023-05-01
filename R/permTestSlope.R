#' Permutation test for the Slope
#'
#' Hypothesis test for a slope of a simple linear regression model. 
#' The null hypothesis is that the population slope is 0.
#'
#' Perform a permutation test to test \eqn{latex}{H_0: \beta = 0}, where
#' \eqn{latex}{\beta}is the population slope. The rows of the second
#' variable are permuted and the slope is re-computed.
#'
#' The mean and standard error of the permutation distribution is printed as
#' well as a P-value.
#'
#' Observations with missing values are removed.
#'
#' @aliases permTestSlope permTestSlope.default permTestSlope.formula
#' @param x a numeric vector.
#' @param y a numeric vector.
#' @param B the number of resamples to draw (positive integer greater than 2).
#' @param alternative alternative hypothesis. Options are \code{"two.sided"},
#' \code{"less"} or \code{"greater"}.
#' @param plot.hist a logical value. If \code{TRUE}, plot the distribution of
#' the slopes obtained from each resample.
#' @param legend.loc location of the legend on the histogram. Options are
#' \code{"topright"}, \code{"topleft"}, \code{"bottomleft"} and
#' \code{"bottomright"}.
#' @param plot.qq a logical value. If \code{TRUE}, plot the normal
#' quantile-quantile plot of the slopes obtained from each resample.
#' @param x.name Label for variable x
#' @param y.name Label for variable y
#' @param formula a formula \code{y ~ x} where \code{x, y} are numeric vectors.
#' @param data a data frame that contains the variables given in the formula.
#' @param subset an optional expression indicating what observations to use.
#' @param \dots further arguments to be passed to or from methods.
#' @return Returns invisibly a vector of the slopes obtained by the
#' randomization.
#' @author Adam Loy, Laura Chihara
#' @references Tim Hesterberg's website:
#' \url{https://www.timhesterberg.net/bootstrap-and-resampling}
#' @keywords permutation test randomization resampling correlation
#' @examples
#'
#' plot(states03$HSGrad, states03$TeenBirths)
#' lm(HSGrad ~ TeenBirths, data = states03)
#'
#' permTestSlope(states03$HSGrad, states03$TeenBirths)
#' permTestSlope(TeenBirths ~ HSGrad, data = states03)
#'
#' @export

permTestSlope <-
function(x,  ...)
{
  UseMethod("permTestSlope")

}
