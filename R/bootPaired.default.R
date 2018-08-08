#' @describeIn bootPaired Perform a bootstrap of two paired variables.
#' @export

bootPaired.default <-
function(x, y, conf.level = 0.95, B = 10000,
     plot.hist = TRUE,  plot.qq = FALSE, legend.loc = "topright",
     x.name = deparse(substitute(x)), y.name=deparse(substitute(y)), ...)
    {

     if (B%%1  != 0 || B < 2) stop("B must be a positive integer")

     alpha <- 1 - conf.level

      if (!is.numeric(x)) stop("Variable 1 must be numeric.")
      if (!is.numeric(y)) stop("Variable 2 must be numeric.")

      comCases <- complete.cases(x, y)
       nmiss <- length(x) - sum(comCases)
       if (nmiss > 0)
       cat("\n ", nmiss, "observation(s) removed due to missing values.\n")

    x2 <- x[comCases]
    y2 <- y[comCases]

   Diff <- y2 - x2
   n <- length(Diff)
   observed <- mean(Diff)

 #Boot
  temp <- numeric(B)

   for (i in 1:B)
    {
      bootDiff <- sample(Diff, n, replace = TRUE)
      temp[i] <- mean(bootDiff)
      } #end for

    bootstrap.mean <- mean(temp)

   cat("\n\t**Bootstrap interval for mean of paired difference \n\n")
   cat(" Observed mean of ", y.name, "-", x.name, ":", round(observed, 5), "\n")
   cat(" Mean of bootstrap distribution:",  round(mean(temp),5),"\n")
   cat(" Standard error of bootstrap distribution:", round(sd(temp), 5),"\n\n")
   cat(" Bootstrap percentile interval\n")
   print(quantile(temp, c(alpha/2, 1-alpha/2)))
   cat("\n\t\t*--------------*\n\n")

    if (plot.hist){

     hist.title <- paste("Bootstrap distribution of mean of \n", x.name,"-", y.name, sep=" ")

     out <-   hist(temp, plot = FALSE)
     out$density <- 100*(out$counts)/sum(out$counts)
     plot(out, freq = FALSE, ylab = "Percentage", main = hist.title, xlab = "mean difference", cex.main = 0.9)

     points(observed, 0, pch = 2, col = "red")
     points(bootstrap.mean, 0, pch = 4, col = "blue")
     legend(legend.loc, legend = c("Observed","Bootstrap"),  pch = c(2,4),
          col = c("red", "blue"), cex = 0.8)

     } #end if plot.hist

     if (plot.qq){
         if (Sys.getenv("RSTUDIO_USER_IDENTITY") == "")
           grDevices::dev.new()
        qqnorm(temp, ylab="Bootstrap")
        qqline(temp)
       }  #end if plot.qq

    invisible(temp)


 }
