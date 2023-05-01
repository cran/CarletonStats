#' Permutation test for ANOVA F-test
#'
#' Permutation test to see if the population mean is the same for two or more
#' populations. For instance, test \eqn{latex}{H_0: \mu_1 = \mu_2 = \mu_3} where
#' \eqn{latex}{\mu} denotes the population mean. The values of the numeric
#' variable are randomly assigned to the groups and the ANOVA F statistic is
#' calculated. The command will print the mean and
#' standard error of the distribution of the test statistic as well as a
#' P-value.
#'
#' Observations with missing values are removed.
#'
#' @aliases permTestAnova permTestAnova.default permTestAnova.formula
#' @param x a numeric vector. 
#' @param group a factor variable with two or more levels. If \code{group} is a
#' numeric vector, it will be coerced into a factor variable.
#' @param B the number of resamples (positive integer greater than 2).
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
#' @author Adam Loy, Laura Chihara
#' @references Tim Hesteberg's website:
#' \url{https://www.timhesterberg.net/bootstrap-and-resampling}
#' @keywords permutation test resampling randomization
#' @examples
#'
#' permTestAnova(states03$ViolentCrime, states03$Region, B = 499)
#'
#' #using formula syntax
#' \dontrun{
#' permTestAnova(ViolentCrime ~ Region, data = states03, B = 9999)
#' }
#' 
#' @export


permTestAnova <-
function(x, ...){

UseMethod("permTestAnova")

}
