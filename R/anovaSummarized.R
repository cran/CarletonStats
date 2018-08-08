#' Anova F test
#'
#' ANOVA F test when given summarized data (sample sizes, means and standard
#' deviations).
#'
#' Perform an ANOVA F test when presented with summarized data: sample sizes,
#' sample means and sample standard devations.
#'
#' @param N a vector with the sample sizes
#' @param mn a vector of means, one for each group in the sample
#' @param stdev a vector of standard deviations, one for each group in the
#' sample
#' @return Returns invisibly a list
#'
#' \item{Treatment SS}{The treatment sum of squares (also called the "between
#' sum of squares").} \item{Residual SS}{Residual sum of squares (also called
#' the "within sum of squares").} \item{Degrees of Freedom}{a vector with the
#' numerator and denominator degrees of freedom.} \item{Treatment Mean
#' Square}{Treatment SS/numerator DF} \item{Residual Mean Square}{Residual
#' SS/denominator DF} \item{Residual Standard Error}{Square root of Residual
#' Mean Square} \item{F}{the F statistic} \item{P-value}{p-value} ...
#' @author Laura Chihara
#' @keywords ANOVA Summarized data
#' @examples
#'
#' #use the data set chickwts from base R
#' head(chickwts)
#'
#' N <- table(chickwts$feed)
#' stdev <- tapply(chickwts$weight, chickwts$feed, sd)
#' mn <- tapply(chickwts$weight, chickwts$feed, mean)
#'
#' anovaSummarized(N, mn, stdev)
#'
#' @importFrom stats pf 
#' @export


anovaSummarized <-
function(N, mn, stdev)
{
        ##First argument must be vector of non-negative integers
       if (any(N < 0))
        stop("First argument must be vector of positive integers.")
        if (length(N) != length(mn)||length(N) != length(stdev))
            stop("All arguments must be vectors of equal length.")

        TrSS <- sum(N*mn^2) - (sum(N*mn))^2/sum(N)
        RSS <- sum((N-1)*stdev^2)
        df1 <- length(N) - 1
        TrMS <- TrSS/df1
        df2 <- sum(N)-length(N)
        RMS <- RSS/df2
        my.f <- TrMS/RMS
        p <- 1 - pf(my.f, df1, df2)
        resSE <- sqrt(RSS/df2)

       out <- data.frame(c(TrSS, RSS, df1, df2, resSE))
       names(out) <- ""
       row.names(out) <- c("Treatment SS", "Residual SS", "numerator DF",
                 "denominator DF", "Residual standard error")

       stat <- c("F-stat" = my.f, "P-value" = p)

       print(out)
       cat("\n")
       print(stat, justify = "left")

         my.list <-list("Treatment SS" = TrSS, "Residual SS" = RSS, "Degrees of Freedom" = c(df1,df2),
                  "Treatment Mean Square" = TrMS, "Residual Mean Square" = RMS ,
                  "Residual Standard Error" = resSE,
                  "F" = my.f,"P-value" = p)
         invisible(my.list)

}
