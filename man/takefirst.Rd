
\name{takefirst}
\alias{takefirst}
\title{Take all observations up to first event}
\usage{
takefirst(data, id, event, value)
}
\description{
For longitudinal data sets that have repeated observations among individuals, this function will subset the data by taking all observations up to and including a specified value of some variable.
}
\arguments{
  \item{data}{A data frame with relevant columns.}
  \item{id}{A character string of the identification variable name in \code{data}.}
  \item{event}{The name of the event variables containing the cutoff criteria as a character string.}
  \item{value}{The value of the cutoff criteria for subsetting.}
}
\examples{
# example
}
\value{Returns a subset of the input data frame with rows after the cutoff criteria omitted.}
\details{
  details
}


