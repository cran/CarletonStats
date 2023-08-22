#' @title Calculate a CI from a \code{carlboot} object
#'
#' @description
#' Calculate percentile confidence intervals for a \code{carlboot} object.
#'
#' @param object The carlboot object to print.
#' @param parm not used in CarletonStats, just for generic consistency
#' @param level the confidence level
#' @param ... not used
#'
#' @rdname confint
#' @export 
#' @method confint carlboot
#' @importFrom stats confint
#' @import ggplot2
confint.carlboot <- function(object, parm = NULL, level = 0.95, ...) {
  quantile(object, probs = (1 + c(-level, level)) / 2)
}
