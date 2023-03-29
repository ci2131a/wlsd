
\name{events2state}
\alias{events2state}
\title{Multiple Event Variables to One State Variable}
\usage{
events2state(data, events, number = TRUE, ...)
}
\description{
Converts one or more binary event vectors in a data frame to a single state vector whose values represent combinations of events.
}
\arguments{
  \item{data}{A data frame with relevant columns.}
  \item{events}{The names of the event variables as character strings in a vector.}
  \item{number}{A logical argument to determine whether the new state variable should be converted to a number representing the combination of events or left as is.  Defaults to \code{TRUE} which will convert combinations a numeric. If argument is set to \code{FALSE}, the  combinations will be left unchanged.}
  \item{...}{Further arguments to be passed to \code{interaction}.}
}
\examples{
# fill in with example from vignette

}
\value{A data frame with a single added vector whose values are the combination of events.}
\details{
  Data sets may have one or more variables representing the occurrence of an event of interest. These may be depicted over several columns where each column       represents the binary effect of whether the event has occurred or not. Having this information in multiple columns may prove inconvenient for analysis. The \code{events2state()} function will convert the different event vectors from a data frame into a singlular vector whose values are the event combinations.


}


