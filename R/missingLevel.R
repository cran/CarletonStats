#' Missing observations in factors
#'
#' In data frames with factor variables, convert any observation with "" into
#' <NA>.
#'
#' In a factor variable with the level \code{""""}, this command will convert
#' this to an \code{<NA>}.
#'
#' @param data a data frame with factor variables.
#' @return Returns the same data frame with \code{""""} replaced by \code{<NA>}
#' in factor variables.
#' @note When importing data from comma separated files (for example), missing
#' values in a categorical variable are often denoted by """. We often do not
#' want to treat this as a level of a factor variable in R.
#' @author Laura Chihara
#' @keywords missing values
#'
#' @export

missingLevel <-
function(data){
 if (!is.data.frame(data)) stop("Data must be a data frame")
 m <- dim(data)[2]
 for (i in 1:m)
 {
   if(is.factor(data[,i]))
    { if (levels(data[,i])[1]=="")
       is.na(levels(data[,i])[1]) <- TRUE
    }
 }

return(data)
}
