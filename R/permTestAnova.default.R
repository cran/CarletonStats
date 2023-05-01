#' @describeIn permTestAnova Permutation test for ANOVA F-test
#' @importFrom stats aov
#' @export

permTestAnova.default <- function(x, group, B = 9999, plot.hist = TRUE, 
                             legend.loc = "topright", plot.qq = FALSE, ...)
{
  
  if (!is.numeric(x)) stop("Variable must be numeric.")
  if (is.factor(group)) {
    group <- droplevels(group)
  } else group <- as.factor(group)
  
  comCases <- complete.cases(x, group)
  nmiss <- length(x) - sum(comCases)
  if (nmiss > 0)
    cat("\n ", nmiss, "observations removed due to missing values.\n")
  
  x <- x[comCases]
  group <- group[comCases]
  
  n <- length(x)
  observed <- summary(aov(x ~ group))[[1]][["F value"]][1]
  
  result <- numeric(B)
  for (i in 1:B)
  {
    index <- sample(n, n, replace=FALSE)
    newgroup <- group[index]
    result[i] <- summary(aov(x ~ newgroup))[[1]][["F value"]][1]
  }  #end for
  
  mean.PermDist <- round(mean(result), 5)
  sd.PermDist <- round(sd(result), 5)
  
  P.value <- (sum(result >= observed) + 1)/(B + 1)
  
  if (P.value > 1) P.value <- 1
  
  if (plot.hist){
    
    my.title <- "Permutation distribution of F statistic"
    out <- hist(result, plot = F)
    out$density <- 100*out$counts/sum(out$counts)
    xrange <- range(c(out$breaks, observed))
    plot(out, freq = FALSE, ,xlim = xrange, main = my.title, ylab = "Percent", cex.main = .9,
         xlab = "Differences", cex.lab = .9)
    
    points(observed, 0, pch = 2, col = "red")
    points(mean.PermDist, 0, pch = 8, col = "blue")
    legend(legend.loc, legend = c("Observed", "Permutation"), pch = c(2, 8), col= c("red", "blue"),
           cex = .9)
  }
  
  cat("\n\t** Permutation test **\n")
  cat(" Observed F statistic:", round(observed, 5), "\n")
  cat(" Mean of permutation distribution:", mean.PermDist, "\n")
  cat(" Standard error of permutation distribution:", sd.PermDist, "\n")
  cat(" P-value: ", round(P.value, 5),"\n")
  cat("\n\t*-------------*\n\n")
  
  invisible(result)
  
}
