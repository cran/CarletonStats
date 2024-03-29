% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/permTestPaired.R, R/permTestPaired.default.R,
%   R/permTestPaired.formula.R
\name{permTestPaired}
\alias{permTestPaired}
\alias{permTestPaired.default}
\alias{permTestPaired.formula}
\title{Permutation test for paired data.}
\usage{
permTestPaired(x, ...)

\method{permTestPaired}{default}(
  x,
  y,
  B = 9999,
  alternative = "two.sided",
  plot.hist = TRUE,
  plot.qq = FALSE,
  x.name = deparse(substitute(x)),
  y.name = deparse(substitute(y)),
  xlab = NULL,
  ylab = NULL,
  title = NULL,
  seed = NULL,
  ...
)

\method{permTestPaired}{formula}(formula, data, subset, ...)
}
\arguments{
\item{x}{a numeric vector.}

\item{\dots}{further arguments to be passed to or from methods.}

\item{y}{a numeric vector.}

\item{B}{the number of resamples.}

\item{alternative}{the alternative hypothesis. Options are
\code{"two.sided"}, \code{"less"} and \code{"greater"}.}

\item{plot.hist}{a logical value. If \code{TRUE}, create a histogram
displaying the permutation distribution of the statistic.}

\item{plot.qq}{a logical value. If \code{TRUE}, include a quantile-normal
plot of the permuation distribution.}

\item{x.name}{Label for x variable}

\item{y.name}{Label for y variable}

\item{xlab}{an optional character string for the x-axis label}

\item{ylab}{an optional character string for the y-axis label}

\item{title}{an optional character string giving the plot title}

\item{seed}{optional argument to \code{\link{set.seed}}}

\item{formula}{a formula of the form \code{y ~ x}, where \code{x, y} are both numeric variables.}

\item{data}{an optional data frame containing the variables in the formula. By default the
variables are taken from environment(formula).}

\item{subset}{an optional vector specifying a subset of observations to be used.}
}
\value{
Returns invisibly a vector of the replicates of the test statistic
(ex. mean of the difference of the resampled variables).
}
\description{
Permutation test for paired data.
}
\details{
For two paired numeric variables with n rows, randomly select k of the n
rows (k also is randm) and switch the entries \eqn{latex}{(a, b) \to (b, a)}
and then compute the mean of the difference of the two variables (\code{y-x}).

Observations with missing values are removed.
}
\section{Methods (by class)}{
\itemize{
\item \code{permTestPaired(default)}: Permutation test for paired data.

\item \code{permTestPaired(formula)}: Permutation test for paired data.

}}
\examples{

#Does chocolate ice cream have more calories than vanilla ice cream, on average?
#H0: mean number of calories is the same
#HA: mean number of calories is greater in chocolate ice cream

permTestPaired(Icecream$VanillaCalories, Icecream$ChocCalories, alternative = "less")
permTestPaired(ChocCalories ~ VanillaCalories, data = Icecream, alternative = "greater")

}
\references{
Tim Hesterberg's website:
\url{https://www.timhesterberg.net/bootstrap-and-resampling}
}
\author{
Laura Chihara
}
\keyword{data}
\keyword{paired}
\keyword{permutation}
\keyword{randomization}
\keyword{resampling}
\keyword{test}
