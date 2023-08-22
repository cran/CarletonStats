#' @title Plot the bootstrap distribution in \code{carlboot} object
#'
#' @description
#' Plot the bootstrap distribution returned as a \code{carlboot} object.
#'
#' @param x The carlboot object to print.
#' @param bins number of bins in histogram.
#' @param size size of points.
#' @param xlab an optional character string for the x-axis label
#' @param ylab an optional character string for the y-axis label
#' @param title an optional character string giving the plot title
#' @param ... not used
#'
#' @rdname plot
#' @export 
#' @method plot carlboot
#' @importFrom scales label_percent
#' @importFrom stats density
#' @examples
#'
#' boot_dist <- boot(ToothGrowth$len, ToothGrowth$supp, B = 1000)
#' plot(boot_dist)
plot.carlboot <- function(x, bins = 15, size = 5, xlab = NULL, ylab = NULL, 
                          title = NULL, ...) {
  boot_stats <- as.numeric(x)
  width <- NULL
  p <- ggplot2::ggplot(data = NULL, ggplot2::aes(x = boot_stats)) +
    ggplot2::geom_histogram(aes(y = after_stat(width*density)), bins = bins) +
    ggplot2::geom_point(aes(x = mean(x), y = 0, color = "Bootstrap", shape = "Bootstrap"), size = size) +
    ggplot2::geom_point(aes(x = attr(x, "observed"), color = "Observed", shape = "Observed", y = 0), size = size) +
    ggplot2::scale_y_continuous(labels = scales::label_percent(), expand = expansion(mult = c(0.05, .05))) +
    ggplot2::labs(
      title = "Bootstrap distribution",
      x = "statistics",
      y = "Percentage",
      shape = "",
      color = ""
    ) +
    ggplot2::scale_shape_manual(values = c(16, 4)) + 
    ggplot2::scale_color_manual(values = c("darkorange", "skyblue")) + 
    ggplot2::theme_classic()
  
  if (!is.null(ylab)) {
    p <- p + ggplot2::ylab(ylab)
  }
  
  if (!is.null(xlab)) {
    p <- p + ggplot2::xlab(xlab)
  }
  
  if (!is.null(title)) {
    p <- p + ggplot2::labs(title = title)
  }
  
  p
}


#' @export 
#' @method plot carlperm
#' @rdname plot
#' @examples
#'
#' perm_dist <- permTest(states03$ViolentCrime, states03$DeathPenalty, B = 999)
#' plot(perm_dist)
plot.carlperm <- function(x, bins = 15, size = 5, xlab = NULL, ylab = NULL, 
                          title = NULL, ...) {
  boot_stats <- as.numeric(x)
  width <- NULL
  p <- ggplot2::ggplot(data = NULL, ggplot2::aes(x = boot_stats)) +
    ggplot2::geom_histogram(aes(y = after_stat(width*density)), bins = bins) +
    ggplot2::geom_point(aes(x = mean(x), y = 0, color = "Permutation", shape = "Permutation"), size = size) +
    ggplot2::geom_point(aes(x = attr(x, "observed"), color = "Observed", shape = "Observed", y = 0), size = size) +
    ggplot2::scale_y_continuous(labels = scales::label_percent(), expand = expansion(mult = c(0.05, .05))) +
    ggplot2::labs(
      title = "Permutation distribution",
      x = "Statistics",
      y = "Percentage",
      shape = "",
      color = ""
    ) +
    ggplot2::scale_shape_manual(values = c(16, 4)) + 
    ggplot2::scale_color_manual(values = c("darkorange", "skyblue")) + 
    ggplot2::theme_classic()
  
  if (!is.null(ylab)) {
    p <- p + ggplot2::ylab(ylab)
  }
  
  if (!is.null(xlab)) {
    p <- p + ggplot2::xlab(xlab)
  }
  
  if (!is.null(title)) {
    p <- p + ggplot2::labs(title = title)
  }
  
  p
}
