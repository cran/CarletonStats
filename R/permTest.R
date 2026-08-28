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
#' @param x a numeric, logical, factor, or character vector. Logical, factor,
#' and character vectors with exactly two unique values are converted to 0/1,
#' and \code{mean} is used to compute the proportion.
#' @param group a factor variable with two levels. If \code{group} is a binary
#' numeric vector, it will be coerced into a factor variable.
#' @param statistic the statistic of interest.
#' @param success a character string naming the level of \code{x} to code as
#' 1 when \code{x} is a logical, factor, or character variable. Defaults to
#' \code{NULL}, which uses the second factor level (alphabetically) or
#' \code{TRUE} for logical vectors.
#' @param B the number of resamples (positive integer greater than 2).
#' @param seed optional argument to \code{\link{set.seed}}
#' @param alternative the alternative hypothesis. Options are
#' \code{"two.sided"}, \code{"less"} or \code{"greater"}.
#' @param plot.hist a logical value. If \code{TRUE}, the permutation
#' distribution of the statistic is plotted.
#' @param plot.qq a logical value. If \code{TRUE}, then a normal
#' quantile-quantile plot of the resampled test statistic is created.
#' @param formula a formula of the form \code{y ~ group} where \code{y} is
#' numeric and \code{group} is a factor variable.
#' @param data a data frame with the variables in the formula.
#' @param subset an optional expression specifying which observations to keep.
#' @param xlab an optional character string for the x-axis label
#' @param ylab an optional character string for the y-axis label
#' @param title an optional character string giving the plot title
#' @param \dots further arguments to be passed to or from methods.
#' @return Returns invisibly a vector of the replicates of the test statistic.
#' @author Laura Chihara
#' @references Tim Hesteberg's website:
#' \url{https://www.timhesterberg.net/bootstrap-and-resampling}
#' @keywords permutation test resampling randomization
#' @examples
#'
#' # Testing the difference in means
#' permTest(states03$ViolentCrime, states03$DeathPenalty)
#'
#' #using formula syntax
#' permTest(ViolentCrime ~ DeathPenalty, data = states03, alt = "less")
#'
#' # Testing the difference in proportions
#' permTest(penguin_survival$Status, penguin_survival$TagType, B = 999)
#'
#' #using formula syntax
#' permTest(Status ~ TagType, data = penguin_survival, B = 999)
#'
#' @export

permTest <-
  function(x, ...) {
    UseMethod("permTest")
  }
