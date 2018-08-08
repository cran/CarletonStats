#' Correlation demonstration
#'
#' For a given \code{r}, create a scatterplot of two variables with that
#' correlation.
#'
#' Demonstrate the concept of correlation by inputting a number between -1 and
#' 1 and seeing a scatter plot of two variables with that correlation. Once you
#' invoke this command, you can continue to enter values for r. Type any number
#' \eqn{latex}{abs(r)> 1 }) to exit.
#'
#' @param r a number between -1 and 1. Enter any number r, \eqn{latex}{abs(r)>
#' 1 }, to exit the interactive session[
#' @author Laura Chihara
#' @keywords Correlation
#' @examples
#'
#' \dontrun{
#' corDemo()
#' }
#'
#' @export
#'


corDemo <-
function(r = 0)
{
    if (requireNamespace("MASS", quietly = TRUE)){
    cat("Input r. To quit, type r = 9\n")
     while(abs(r) <= 1)
       {
        sigma <- cbind(c(1,r), c(r, 1))

        temp <- MASS::mvrnorm(100, mu = c(0,0),Sigma = sigma)

         plot(temp, xlab = "x", ylab = "y", main = paste(
            "Correlation =", round(r, 2)), xlim = c(-3, 3), ylim = c(-3, 3))

        r <- readline("r = ")
        r <- eval(parse(text=r))


        }

    invisible()
}

else {stop("Install the package MASS")}
}
