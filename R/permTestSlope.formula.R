#' @describeIn permTestSlope Permutation test for the slope
#' @export

permTestSlope.formula <-
  function(formula, data, subset, ...) {
    if (
      missing(formula) ||
        (length(formula) != 3L) ||
        (length(attr(terms(formula[-2L]), "term.labels")) != 1L)
    ) {
      stop("'formula' missing or incorrect")
    }

    parsed <- .parse_formula_two_var(
      match.call(expand.dots = FALSE),
      parent.frame()
    )
    do.call(
      "permTestSlope",
      c(
        list(
          parsed$x,
          parsed$y,
          x.name = parsed$x.name,
          y.name = parsed$y.name
        ),
        list(...)
      )
    )
  }
