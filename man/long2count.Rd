
\name{long2count}
\alias{long2count}
\title{Longitudinal to Count format}
\usage{
use
}
\description{
Transforms data from longitudinal format to a format suitable for count regression.
}
\arguments{
  \item{data}{A data frame with relevant columns.}
  \item{id}{A character string of the identification variable name in \code{data}. Variable can be of type numeric or character.}
  \item{event}{The name of the column in \code{data} to be tallied. The name is required to be supplied as a string.}
}
\examples{
# example
}
\value{The returned value of the function is a data frame with new columns. The \code{event.counts} column represents the sum total of values in the \code{event} column. }
\details{
  details
}


