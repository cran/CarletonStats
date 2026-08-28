#' @param call the result of `match.call(expand.dots = FALSE)` from the caller
#' @param parent_env the caller's `parent.frame()`
#' @return A list with elements `x`, `y`, `x.name`, `y.name`
#' @noRd
.parse_formula_two_var <- function(call, parent_env) {
  m <- call
  if (is.matrix(eval(m$data, parent_env))) {
    m$data <- as.data.frame(eval(m$data, parent_env))
  }
  m[[1L]] <- as.name("model.frame")
  m$... <- NULL
  mf <- eval(m, parent_env)

  if (length(mf) != 2L) {
    stop("Invalid formula")
  }

  nmiss <- length(attr(mf, "na.action"))
  if (nmiss > 0) {
    cat("\n ", nmiss, "observation(s) removed due to missing values.\n")
  }

  varnames <- names(mf)
  response <- attr(attr(mf, "terms"), "response")
  y <- mf[[response]]
  x <- mf[[-response]]

  list(x = x, y = y, x.name = varnames[2], y.name = varnames[1])
}

.encode_binary <- function(x, success = NULL) {
  if (is.character(x)) {
    x <- factor(x)
  }

  if (is.logical(x)) {
    success_label <- if (is.null(success)) "TRUE" else as.character(success)
    if (!success_label %in% c("FALSE", "TRUE")) {
      stop("'success' must be \"TRUE\" or \"FALSE\" for logical variables")
    }
    x <- as.integer(x == (success_label == "TRUE"))
  } else if (is.factor(x)) {
    x <- droplevels(x)
    lvls <- levels(x)
    if (length(lvls) != 2L) {
      stop("Categorical variable must have exactly 2 levels")
    }
    success_label <- if (is.null(success)) lvls[2] else as.character(success)
    if (!success_label %in% lvls) {
      stop(paste0(
        "'success' (\"",
        success_label,
        "\") is not a level of x. ",
        "Valid levels: ",
        paste(lvls, collapse = ", ")
      ))
    }
    x <- as.integer(x == success_label)
  } else {
    stop("Variable must be numeric, logical, factor, or character.")
  }

  message("Note: \"", success_label, "\" coded as the success (1).")
  list(x = x, success = success_label)
}
