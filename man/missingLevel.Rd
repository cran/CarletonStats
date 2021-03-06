% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/missingLevel.R
\name{missingLevel}
\alias{missingLevel}
\title{Missing observations in factors}
\usage{
missingLevel(data)
}
\arguments{
\item{data}{a data frame with factor variables.}
}
\value{
Returns the same data frame with \code{""""} replaced by \code{<NA>}
in factor variables.
}
\description{
In data frames with factor variables, convert any observation with "" into
<NA>.
}
\details{
In a factor variable with the level \code{""""}, this command will convert
this to an \code{<NA>}.
}
\note{
When importing data from comma separated files (for example), missing
values in a categorical variable are often denoted by """. We often do not
want to treat this as a level of a factor variable in R.
}
\author{
Laura Chihara
}
\keyword{missing}
\keyword{values}
