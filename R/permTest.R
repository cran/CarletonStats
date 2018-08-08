#' Permutation test
#'
#' Permutation test to test a hypothesis involving two samples.
#'
#' Permutation test to see if a population parameter is the same for two
#' populations. For instance, test \eqn{latex}{H_0: \mu_M = \mu_F} where
#' \eqn{latex}{\mu} denotes the population mean. The values of the numeric
#' variable are randomly assigned to the two groups and the difference of the
#' statistic for each group is calculated. The command will print the mean and
#' standard error of the distribution of the test statistic as well as a
#' P-value.
#'
#' Observations with missing values are removed.
#'
#' @aliases permTest permTest.default permTest.formula
#' @param x a numeric vector. If the function is the mean (\code{fun = mean})
#' and \code{x} is a binary numeric vector of 0's and 1's, then the test is
#' between proportions.
#' @param group a factor variable with two levels. If \code{group} is a binary
#' numeric vector, it will be coerced into a factor variable.
#' @param statistic the statistic of interest.
#' @param B the number of resamples (positive integer greater than 2).
#' @param alternative the alternative hypothesis. Options are
#' \code{"two.sided"}, \code{"less"} or \code{"greater"}.
#' @param plot.hist a logical value. If \code{TRUE}, the permutation
#' distribution of the statistic is plotted.
#' @param legend.loc location of the legend for the histogram. Options are
#' \code{"topleft"}, \code{"topright"}, \code{"bottomleft"} or
#' \code{"bottomright"}.
#' @param plot.qq a logical value. If \code{TRUE}, then a normal
#' quantile-quantile plot of the resampled test statistic is created.
#' @param formula a formula of the form \code{y ~ group} where \code{y} is
#' numeric and \code{group} is a factor variable.
#' @param data a data frame with the variables in the formula.
#' @param subset an optional expression specifying which observations to keep.
#' @param \dots further arguments to be passed to or from methods.
#' @return Returns invisibly a vector of the replicates of the test statistic.
#' @author Laura Chihara
#' @references Tim Hesteberg's website:
#' \url{http://www.timhesterberg.net/bootstrap}
#' @keywords permutation test resampling randomization
#' @examples
#'
#' permTest(states03$ViolentCrime, states03$DeathPenalty)
#'
#' #using formula syntax
#' permTest(ViolentCrime ~ DeathPenalty, data = states03, alt = "less")
#'
#' @export


permTest <-
function(x, ...){

UseMethod("permTest")

}
