#' @describeIn boot Bootstrap a single variable or a grouped variable
#' @export
#' @importFrom patchwork wrap_plots

boot.default <-
  function(x, group = NULL, statistic = mean, conf.level = 0.95, B = 10000,
           plot.hist = TRUE, plot.qq = FALSE, x.name = deparse(substitute(x)),
           xlab = NULL, ylab = NULL, title = NULL, seed = NULL, ...)
  {
    
    if(!is.null(seed)) set.seed(seed)
    
    if (B %% 1  != 0 || B < 2) stop("B must be a positive integer")
    
    alpha <- 1 - conf.level
    
    stat <- match.fun(statistic)
    
    if (!is.numeric(x)) stop("Variable must be numeric.")
    
    #Boot for single numerical variable
    if (is.null(group))
    {
      
      comCases <- complete.cases(x)
      nmiss <- length(x) - sum(comCases)
      
      if (nmiss > 0)
        cat("\n\n", nmiss, "observation(s) removed due to missing values.","\n")
      
      xc <- x[comCases]
      temp <- numeric(B)
      
      for (i in 1:B)
      {
        w <- sample(xc, length(xc), replace = TRUE)
        temp[i] <- stat(w)
      }   #end for
      
      observed <- stat(xc)
      boot.mean <- mean(temp)
      
    } #end if for single numeric variable
    #--------------------
    #for two sample bootstrap
    else{
      
      group.name <- deparse(substitute(group))
      
      if (is.factor(group)){
        group <- droplevels(group)
      } else  group <- as.factor(group)
      
      if (length(levels(group)) != 2) stop("Grouping variable must have only two levels")
      
      comCases <- complete.cases(x, group)
      nmiss <- length(x) - sum(comCases)
      
      if (nmiss > 0)
        cat("\n\n", nmiss, "observation(s) removed due to missing values.","\n")
      
      xc  <- x[comCases]
      group <- group[comCases]
      
      group1 <- xc[group == levels(group)[1]]
      group2 <- xc[group == levels(group)[2]]
      stat1 <- stat(group1)
      stat2 <- stat(group2)
      observed <- stat1 - stat2
      temp <- numeric(B)
      
      for (i in 1:B){
        x1 <- sample(group1, length(group1), replace = T)
        x2 <- sample(group2, length(group2), replace = T)
        temp[i] <- stat(x1) - stat(x2)
        
      }#end for
      
      boot.mean <- mean(temp)
      
      group1.name <- levels(group)[1]
      group2.name <- levels(group)[2]
      
    } #end else
    
    # invisible(temp)
    class(temp) <- "carlboot"
    attr(temp, "observed")  <- observed
    attr(temp, "statistic") <- as.character(substitute(statistic))
    attr(temp, "groups")    <- levels(group)
    attr(temp, "x.name")    <- x.name
    attr(temp, "level")     <- conf.level
    attr(temp, "xlab")      <- xlab
    attr(temp, "ylab")      <- ylab
    attr(temp, "title")     <- title
    attr(temp, "plot.hist") <- plot.hist
    attr(temp, "plot.qq")   <- plot.qq
    
    
    temp
    
  }
