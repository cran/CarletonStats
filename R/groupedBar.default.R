#' @describeIn groupedBar Grouped bar chart
#' @export

groupedBar.default <-
function(resp, condvar = NULL, percent = TRUE,  print = TRUE,
         cond.name = deparse(substitute(condvar)), resp.name = deparse(substitute(resp)),
         ...)
{

  cond.name <- cond.name
  resp.name <- resp.name
  if (!requireNamespace("ggplot2", quietly = TRUE)) {stop("ggplot2 packaged needed for this function to work.")}

  if (!is.factor(resp))
      {resp <- as.factor(resp)
      } else resp <- droplevels(resp)

   #single variable
    if (is.null(condvar))
     {
      m <- length(levels(resp))
      gnames <- levels(resp)

      nmiss <- length(resp) - sum(complete.cases(resp))
      if (nmiss > 0)
        cat("\n ", nmiss, "observation(s) removed due to missing values.\n")

       if (percent)
        {temp3 <- prop.table(table(resp))*100
          ylabel <- "Percent (%)"}
        else
         {
           temp3 <- table(resp)
            ylabel = "Count"
         }

       out.df <- as.data.frame(temp3)

       p <- ggplot2::ggplot(out.df) + ggplot2::geom_bar(ggplot2::aes_string(x = 'resp', y = 'Freq'), stat = "identity", fill = "steelblue") +
             ggplot2::labs(x = resp.name, y = ylabel)

      print(p)

      temp4 <- c(as.vector(temp3), sum(temp3))
      names(temp4) <- c(gnames, ylabel)

    }   #end 1 categorical variable
    else { #Two categorical variables

    if (!is.factor(condvar))
        {condvar <- as.factor(condvar)
        } else condvar <- droplevels(condvar)

    lenres <- length(resp)
    comCases <- complete.cases(resp, condvar)
    nmiss <- lenres - sum(comCases)

   if (nmiss > 0)
    cat("\n ", nmiss, "observation(s) removed due to missing values.\n")

    temp2 <- table(condvar, resp)
    n <- dim(temp2)[1] #conditioning variable
    #number of conditioning levels
     m <- dim(temp2)[2]
      condnames <- dimnames(temp2)[[1]]
      respnames <- dimnames(temp2)[[2]]

    if (percent)
     {
      temp3 <- round(100*prop.table(table(condvar, resp), 1), 3)
      data <- as.data.frame(temp3)
     } else {
         data <- as.data.frame(temp2)
      }

     p <- ggplot2::ggplot(data, ggplot2::aes_string(x = 'condvar', y = 'Freq', fill = 'resp')) + ggplot2::geom_bar(position = "dodge", stat = "identity") +
           ggplot2::labs(x = cond.name, y = "Percent", fill = resp.name)

    print(p)

    if (percent){
    temp4 <- cbind(temp3, rowSums(temp3))
    dimnames(temp4)[[2]][m+1] <- "Sum (%)"
    }
    else { temp4 <- cbind(temp2, rowSums(temp2))
     dimnames(temp4)[[2]][m+1] <- "Sum"
    }

   } #end else

if (print) print(temp4)

 invisible(temp3)

}
