#' Demonstration of the normal qq-plot.
#'
#' Demonstrate the normal quantile-quantile plot for samples drawn from
#' different populations.
#'
#' Draw a random sample from the chosen sample and display the normal qq-plot
#' as well as the histogram of its distribution.
#'
#' @param n sample size
#' @param distribution population distribution. Options are \code{"normal"},
#' \code{"t"},\code{"exponential"}, \code{"chi.square"}, \code{"F"} or
#' \code{"beta"} (partial matches are accepted).
#' @param mu mean for the normal distribution.
#' @param sigma (positive) standard deviation for the normal distribution.
#' @param df (positive) degrees of freedom for the t-distribution.
#' @param lambda positive rate for the exponential distribution.
#' @param numdf (positive) numerator degrees of freedom for the chi-square
#' distribution.
#' @param dendf (positive) denominator degrees of freedom for the chi-square
#' distribution.
#' @param shape1 positive parameter for the beta distribution (shape1 = a).
#' @param shape2 positive parameter for the beta distribution (shape2 = b).
#' @return Returns invisibly the random sample.
#' @author Laura Chihara
#' @keywords normal quantile-quantile plot
#' @examples
#'
#' qqPlotDemo(n = 30, distr = "exponential", lambda = 1/3)
#'
#'
#' @importFrom stats rchisq rnorm rt rf rbeta qqnorm qqline
#' @export

qqPlotDemo <-
function(n = 25, distribution = "normal", mu = 0,sigma = 1, df = 10,
            lambda = 10, numdf = 10, dendf = 16, shape1 = 40, shape2 = 5)
{      #get random sample from a distribution and plot its
        #histogram and normal quantile-quantile plot

        distr <- pmatch(distribution, c("normal", "t", "exponential", "chi.square", "F", "beta"), nomatch = NA)
        if (is.na(distr))  stop("Distribution must be one of \"normal\", \"t\", \"exponential\", \"chi.square\", \"F\", or \"beta\" ")

        if (sigma <=0|| df <=0 || lambda <= 0 || numdf <= 0 || dendf <= 0 || shape1 <= 0 || shape2 <= 0) stop("Parameter must be positive.")

        x <- switch(distr,
        normal = rnorm(n, mu, sigma),
        t = rt(n, df),
        exponential = rexp(n, rate = lambda),
        chi.square = rchisq(n, df),
        F = rf(n, numdf, dendf),
        beta = rbeta(n, shape1, shape2))

        distr.expand <- char.expand(distribution, c("normal", "t", "exponential", "chi.square", "F", "beta"), nomatch = warning("No match"))

     par.old <- par(mfrow = c(2, 1), mar=c(2.1, 4.1, 2, 2), cex.main = .8, cex.axis = .8, cex.lab = .8)

      hist(x, main = "", xlab = "")
      title(paste("Sample size ", n , "; ", distr.expand, "distribution", sep=" "))
      par(mar=c(4.1,4.1,2,3))
      qqnorm(x)
      qqline(x)

     on.exit(par(par.old))
     invisible(x)

}
