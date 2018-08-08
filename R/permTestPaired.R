#' Permutation test for paired data.
#'
#' Permutation test for paired data.
#'
#' For two paired numeric variables with n rows, randomly select k of the n
#' rows (k also is randm) and switch the entries \eqn{latex}{(a, b) \to (b, a)}
#' and then compute the mean of the difference of the two variables (\code{y-x}).
#'
#' Observations with missing values are removed.
#'
#' @aliases permTestPaired permTestPaired.default permTestPaired.formula
#' @param x a numeric vector.
#' @param y a numeric vector.
#' @param B the number of resamples.
#' @param alternative the alternative hypothesis. Options are
#' \code{"two.sided"}, \code{"less"} and \code{"greater"}.
#' @param plot.hist a logical value. If \code{TRUE}, create a histogram
#' displaying the permutation distribution of the statistic.
#' @param legend.loc a logical value. If \code{TRUE}, include a legend on the
#' histogram.
#' @param plot.qq a logical value. If \code{TRUE}, include a quantile-normal
#' plot of the permuation distribution.
#' @param x.name Label for x variable
#' @param y.name Label for y variable
#' @param formula a formula of the form \code{y ~ x}, where \code{x, y} are both numeric variables.
#' @param data an optional data frame containing the variables in the formula. By default the
#' variables are taken from environment(formula).
#' @param subset	an optional vector specifying a subset of observations to be used.
#' @param \dots further arguments to be passed to or from methods.
#' @return Returns invisibly a vector of the replicates of the test statistic
#' (ex. mean of the difference of the resampled variables).
#' @author Laura Chihara
#' @references Tim Hesterberg's website:
#' \url{http://www.timhesterberg.net/bootstrap}
#' @keywords permutation test randomization resampling paired data
#' @examples
#'
#' #Does chocolate ice cream have more calories than vanilla ice cream, on average?
#' #H0: mean number of calories is the same
#' #HA: mean number of calories is greater in chocolate ice cream
#'
#' permTestPaired(Icecream$VanillaCalories, Icecream$ChocCalories, alternative = "less")
#' permTestPaired(ChocCalories ~ VanillaCalories, data = Icecream, alternative = "greater")
#'
#' @export

permTestPaired <-
function(x,  ...)
{
  UseMethod("permTestPaired")

}
