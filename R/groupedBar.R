#' Grouped bar chart
#'
#' Create a bar chart of a single categorical variable or a grouped bar chart
#' of two categorical variables.
#'
#' For a single factor variable, a bar plot. If two factor variables are given,
#' then a bar plot of \code{x} conditioned by \code{condvar}.  This command
#' uses R's \code{table} command so missing values are automatically removed.
#'
#' @aliases groupedBar groupedBar.default groupedBar.formula
#' @param resp a factor variable. If \code{resp} is numeric, it will be coerced to a
#' factor variable.
#' @param condvar a factor variable to condition on. If \code{NULL}, then a bar
#' plot of just the \code{resp} variable will be created. If \code{condvar} is
#' numeric, it will be coerced to a factor variable.
#' @param percent a logical value. Should the y-axis give percent or counts?
#' @param print a logical value. If \code{TRUE}, print out the table.
#' @param cond.name Label for variable \code{condvar}.
#' @param resp.name Label for variable \code{resp}.
#' @param formula a formula of the form \code{x ~ condvar}. If \code{x} or
#' \code{condvar} is (are) not a factor variable, then it (they) will be
#' coerced into one. Formula can also be \code{ ~ x} for a single factor variable.
#' @param data a data frame that contains the variables in the formula.
#' @param subset an optional vector specifying a subset of observations to be
#' used.
#' @param \dots further arguments to be passed to or from methods.
#' @return Returns invisibly a table of the variable(s).
#' @author Laura Chihara
#' @keywords bar plot grouped bar plot
#' @examples
#'
#'
#' groupedBar(states03$Region)
#'
#' groupedBar(states03$DeathPenalty, states03$Region, legend.loc = "topleft")
#'
#' #Using a formula syntax:
#' groupedBar(~Region, data = states03)
#' groupedBar(DeathPenalty ~ Region, data = states03, legend.loc = "topleft")
#'
#'
#' @export

groupedBar <-
function(resp, ...)
{
  UseMethod("groupedBar")

}
