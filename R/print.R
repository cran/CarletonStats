#' @title Print a summary of an \code{carlboot} object
#'
#' @description
#' Print summary statistics and confidence intervals for an \code{carlboot} object.
#'
#' @param x The carlboot object to print.
#' @param ... not used
#'
#' @rdname print
#' @export 
#' @method print carlboot
print.carlboot <- function(x, ...) {
  if(is.null(attr(x, "groups"))) {
    if(attr(x, "statistic") %in% c("correlation", "slope")) {
      cat("\n\t** Bootstrap interval of", attr(x, "statistic"), "\n\n")
      cat(" Observed", attr(x, "statistic"), "between", attr(x, "x.name"), "and", attr(x, "y.name"), ":", round(attr(x, "observed"), 5), "\n")
    } else {
      cat("\n\t** Bootstrap interval for", attr(x, "statistic"), "\n\n")
      cat(" Observed ", attr(x, "x.name"), ":", round(attr(x, "observed"), 5), "\n")
    }
  } else {
    if(length(attr(x, "groups")) > 1) {
      cat("\n\t** Bootstrap interval for difference of", attr(x, "statistic"), "\n\n")
      cat(" Observed difference of", attr(x, "statistic"), ":", paste(attr(x, "groups"), collapse = " - "), "=", round(attr(x, "observed"), 5), "\n")
    } else {
      cat("\n\t**Bootstrap interval for mean of paired difference \n\n")
      cat(" Observed mean of ", attr(x, "y.name"), "-", attr(x, "x.name"), ":", round(attr(x, "observed"), 5), "\n")
    } 
  }
  cat(" Mean of bootstrap distribution:",  round(mean(x), 5),"\n")
  cat(" Standard error of bootstrap distribution:", round(sd(x), 5),"\n\n")
  cat(" Bootstrap percentile interval\n")
  print(confint(x, level = attr(x, "level")))
  cat("\n\t\t*--------------*\n")
  
  if (attr(x, "plot.hist")) {
    if(is.null(title)) {
      title <- "Bootstrap distribution"
    }
    
    phist <- plot(x, xlab = attr(x, "xlab"), 
                  ylab = attr(x, "ylab"), title = attr(x, "title"))
  }
  
  if(attr(x, "plot.qq")) {
    pqq <- ggplot(data = NULL, aes(sample = as.numeric(x))) +
      geom_qq() + 
      geom_qq_line() +
      theme_classic() +
      labs(x = "N(0, 1) Quantiles", y = "Bootstrap Statistics")
  }
  
  which_plot <- c(phist = attr(x, "plot.hist"), pqq = attr(x, "plot.qq"))
  
  if(sum(which_plot) == 1) {
    print(get(names(which(which_plot))))
  }
  
  if(sum(which_plot) == 2) {
    print(patchwork::wrap_plots(phist, pqq, ncol = 2))
  }
}


#' @export 
#' @method print carlperm
#' @rdname print
print.carlperm <- function(x, ...) {
  cat("\n\t** Permutation test **\n")
  cat("\n Permutation test with alternative:", attr(x, "alternative"),"\n")
  if(attr(x, "statistic") == "F") {
    cat(" Observed F statistic:", round(attr(x, "observed"), 5), "\n")
    if(is.null(attr(x, "xlab"))) attr(x, "xlab") <- "F statistics"
  } else{
    if(attr(x, "statistic") == "correlation") {
      cat(" Observed correlation between", attr(x, "x.name"), ", ", attr(x, "y.name"), ":", round(attr(x, "observed"), 5), "\n")
      if(is.null(attr(x, "xlab"))) attr(x, "xlab") <- "Correlation"
    } else{
      if(attr(x, "statistic") == "slope") {
        cat(" Observed slope between", attr(x, "x.name"), ", ", attr(x, "y.name"), ": ", attr(x, "observed"), "\n")
        if(is.null(attr(x, "xlab"))) attr(x, "xlab") <- "Slope"
      } else{
        if(attr(x, "statistic") == "paired difference") {
          cat(" Observed mean\n")
          cat(" ", attr(x, "y.name"), ": ", round(attr(x, "var.stats")[1], 5), "\t", attr(x, "x.name"),": ", round(attr(x, "var.stats")[2], 5),"\n")
          if(is.null(attr(x, "xlab"))) attr(x, "xlab") <- "Paired differences"
        } else{
          cat(" Observed statistic\n")
          cat(" ", attr(x, "groups")[1], ": ", attr(x, "group.stats")[1], "\t", attr(x, "groups")[2],": ", attr(x, "group.stats")[2],"\n")
        }
        cat(" Observed difference:", round(attr(x, "observed"), 5), "\n\n") 
      }
    }
  }
  cat(" Mean of permutation distribution:", round(mean(x), 5), "\n")
  cat(" Standard error of permutation distribution:", round(sd(x), 5), "\n")
  cat(" P-value: ", round(attr(x, "pval"), 5),"\n")
  cat("\n\t*-------------*\n\n")
  
  if (attr(x, "plot.hist")) {
    if(is.null(title)) {
      title <- "Permutation distribution"
    }
    
    phist <- plot(x, xlab = attr(x, "xlab"), 
                  ylab = attr(x, "ylab"), title = attr(x, "title"))
  }
  
  if(attr(x, "plot.qq")) {
    pqq <- ggplot(data = NULL, aes(sample = as.numeric(x))) +
      geom_qq() + 
      geom_qq_line() +
      theme_classic() +
      labs(x = "N(0, 1) Quantiles", y = "Permutation Statistics")
  }
  
  which_plot <- c(phist = attr(x, "plot.hist"), pqq = attr(x, "plot.qq"))
  
  if(sum(which_plot) == 1) {
    print(get(names(which(which_plot))))
  }
  
  if(sum(which_plot) == 2) {
    print(patchwork::wrap_plots(phist, pqq, ncol = 2))
  }
}
