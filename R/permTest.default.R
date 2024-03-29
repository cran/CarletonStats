#' @describeIn permTest Permutation test
#' @export

permTest.default <- function(x, group, statistic = mean,   B = 9999,
                             alternative = "two.sided", plot.hist = TRUE,
                             plot.qq = FALSE, xlab = NULL, ylab = NULL, title = NULL, 
                             seed = NULL,...)
{
  
  if(!is.null(seed)) set.seed(seed)
  
  stat <- match.fun(statistic)
  
  if (!is.numeric(x)) stop("Variable must be numeric.")
  if (is.factor(group)) {
    group <- droplevels(group)
  } else group <- as.factor(group)
  if (length(levels(group)) != 2) stop("Grouping variable must have only two levels")
  
  comCases <- complete.cases(x, group)
  nmiss <- length(x) - sum(comCases)
  if (nmiss > 0)
    cat("\n ", nmiss, "observations removed due to missing values.\n")
  
  x <- x[comCases]
  group <- group[comCases]
  
  group1 <- x[group==levels(group)[1]]
  group2 <- x[group==levels(group)[2]]
  group1.name <- levels(group)[1]
  group2.name <- levels(group)[2]
  
  stat1 <- round(stat(group1), 5)
  stat2 <- round(stat(group2), 5)
  n <-length(x)
  m <- length(group1)
  
  observed <- stat(group1) - stat(group2)
  
  result <- numeric(B)
  for (i in 1:B)
  {
    index <- sample(n, m, replace = FALSE)
    result[i] <- stat(x[index]) - stat(x[-index])
  }  #end for
  
  mean.PermDist <- round(mean(result), 5)
  sd.PermDist <- round(sd(result), 5)
  
  alt <- pmatch(alternative, c("less", "greater", "two.sided"), nomatch = 4)
  
  P.value <- .calc_pvalue(result, observed, alt)
  
  if (P.value > 1) P.value <- 1
  
  # if (plot.hist){
  #   
  #   my.title <- paste("Permutation distribution of statistic:\n" ,group1.name, "-", group2.name, sep= " ")
  #   out <- hist(result, plot = F)
  #   out$density <- 100*out$counts/sum(out$counts)
  #   xrange <- range(c(out$breaks, observed))
  #   plot(out, freq = FALSE, ,xlim = xrange, main = my.title, ylab = "Percent", cex.main = .9,
  #        xlab = "Differences", cex.lab = .9)
  #   
  #   points(observed, 0, pch = 2, col = "red")
  #   points(mean.PermDist, 0, pch = 8, col = "blue")
  #   legend(legend.loc, legend = c("Observed", "Permutation"), pch = c(2, 8), col= c("red", "blue"),
  #          cex = .9)
  # }
  
  # cat("\n\t** Permutation test **\n")
  # cat("\n Permutation test with alternative:", alternative,"\n")
  # cat(" Observed statistic\n")
  # cat(" ", group1.name, ": ",stat1, "\t", group2.name,": ", stat2,"\n")
  # cat(" Observed difference:", round(observed, 5), "\n\n")
  # cat(" Mean of permutation distribution:", mean.PermDist, "\n")
  # cat(" Standard error of permutation distribution:", sd.PermDist, "\n")
  # cat(" P-value: ", round(P.value, 5),"\n")
  # cat("\n\t*-------------*\n\n")
  
  class(result) <- "carlperm"
  attr(result, "observed")  <- observed
  attr(result, "statistic") <- as.character(substitute(statistic))
  attr(result, "alternative") <- alternative
  attr(result, "groups")    <- levels(group)
  attr(result, "group.stats") <- c(stat(group1), stat(group2))
  attr(result, "pval")      <- P.value
  attr(result, "xlab")      <- xlab
  attr(result, "ylab")      <- ylab
  attr(result, "title")     <- title
  attr(result, "plot.hist") <- plot.hist
  attr(result, "plot.qq")   <- plot.qq
  
  result
  
}
