
\name{events2state}
\alias{events2state}
\title{Multiple Event Variables to One State Variable}
\usage{
events2state(data, events, number = TRUE)
}
\description{
Creates a new variable in a given data frame which includes all possible combinations of other supplied variables.
}
\arguments{
  \item{data}{A data frame with relevant columns.}
  \item{events}{The names of the event variables as character strings in a vector.}
  \item{number}{An logical argument to determine whether the new state variable should be left as a factor of combinations or a numer. Defaults to \code{TRUE}.}
}
\examples{
# example
}
\value{Returns a list containing a data frame and a matrix/array. The new data frame is \code{data} with a new variable \code{new.state}. The matrix/array provides a legend for the event variables and new numbered states.}
\details{
  details
}


