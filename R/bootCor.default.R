#' @describeIn bootCor Bootstrap the correlation of two numeric variables.
#' @export

bootCor.default <-
  function(x, y, conf.level = 0.95, B = 10000, plot.hist = TRUE, 
           xlab = NULL, ylab = NULL, title = NULL,
           plot.qq = FALSE, x.name = deparse(substitute(x)), 
           y.name = deparse(substitute(y)), seed = NULL, ...)
  {
    
    if (B %% 1  != 0 || B < 2) stop("B must be a positive integer")
    
    if(!is.null(seed)) set.seed(seed)
    
    alpha <- 1 - conf.level
    
    
    if (!is.numeric(x) || !is.numeric(y)) stop("Both variables must be numeric.")
    
    comCases <- complete.cases(x, y)
    nmiss <- length(x) - sum(comCases)
    if (nmiss > 0)
      cat("\n ", nmiss, "observation(s) removed due to missing values.\n")
    
    x2 <- x[comCases]
    y2 <- y[comCases]
    
    observed <- cor(x2, y2)
    n <- length(x2)
    #Boot
    temp <- numeric(B)
    for (i in 1:B)
    {
      index <- sample(1:n, n, replace = TRUE)
      newx <- x2[index]
      newy <- y2[index]
      temp[i] <- cor(newx, newy)
    } #end for
    bootstrap.mean <- mean(temp)
    
    # if (plot.hist){
    # 
    #  if (is.null(hist.title))
    #  hist.title <- paste("Bootstrap distribution of correlation\n", x.name," and ", y.name, sep=" ")
    #  #hist in R gives counts
    #  out <-   hist(temp, plot=FALSE)
    #  out$density <- 100*(out$counts)/sum(out$counts)
    #  plot(out, freq = FALSE, ylab = "Percent", main = hist.title, xlab = "Correlation", cex.main = .9, cex.lab = .9)
    # 
    #  points(observed, 0, pch = 2, col = "red")
    #  points(bootstrap.mean, 0, pch = 4, col = "blue")
    #      legend(legend.loc, legend = c("Observed","Bootstrap"),  pch = c(2,4),
    #       col = c("red", "blue"), cex = 0.8)
    # 
    #  } #end if plot.hist
    # 
    #  if (plot.qq){
    #     if (Sys.getenv("RSTUDIO_USER_IDENTITY") == "")
    #       grDevices::dev.new()
    #    qqnorm(temp, ylab = "Bootstrap")
    #    qqline(temp)
    # }  #end if plot.qq
    
    # invisible(temp)
    class(temp) <- "carlboot"
    attr(temp, "observed")  <- observed
    attr(temp, "statistic") <- "correlation"
    attr(temp, "groups")    <- NULL
    attr(temp, "x.name")    <- x.name
    attr(temp, "y.name")    <- y.name
    attr(temp, "level")     <- conf.level
    attr(temp, "xlab")      <- xlab
    attr(temp, "ylab")      <- ylab
    attr(temp, "title")     <- title
    attr(temp, "plot.hist") <- plot.hist
    attr(temp, "plot.qq")   <- plot.qq
    
    
    temp
    
    
  }
