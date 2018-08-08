#' Stem and leaf plot
#'
#' Stem and leaf plot. Will accept a factor variable as a second argument to
#' create stem plots for each of the levels.
#'
#' This command is just an enhanced version of R's \code{stem} command. It
#' allows the user to create the stem plot for a numeric variable grouped by
#' the levels of a factor variable.
#'
#' @aliases stemPlot stemPlot.default stemPlot.formula
#' @param x a numeric variable.
#' @param grpvar a factor variable. A stem plot of \code{x} will be created for
#' each level of the factor variable.
#' @param varname name of the numeric variable. This is for printing the output
#' only. Change if you want to print out a name different from the actual
#' variable name.
#' @param grpvarname name of the factor variable.  This is for printing the
#' output only. Change if you want to print out a name different from the
#' actual variable name.
#' @param formula a formula of the form \code{x ~ grpvar} where \code{x} is
#' numeric and \code{grpvar} is a factor variable.
#' @param data a data frame with the variables in the formula.
#' @param subset an optional expression specifying which observations to keep.
#' @param \dots further arguments to be passed to or from methods.
#' @author Laura Chihara
#' @keywords stem plot
#' @examples
#'
#'
#' stemPlot(states03$Births, states03$Region)
#'
#' stemPlot(Births ~ Region, data = states03)
#'
#' @importFrom graphics stem 
#' @export

stemPlot <-
function(x, ...)
{
  UseMethod("stemPlot")

}
