
\name{long2cp}
\alias{long2cp}
\title{Long Format to Counting Process format}
\usage{
long2cp(data, id, time, status = NULL, drop = FALSE)
}
\description{
Transforms data from long format to counting process format.
}
\arguments{
  \item{data}{A data frame with relevant columns.}
  \item{id}{A character string of the identification column name in \code{data}.}
  \item{time}{A character string of the time column name in \code{data}.}
  \item{status}{A character string of the status column in \code{data} either event or state.}
  \item{drop}{Logical indicator for whether any \code{id} groups with insufficient rows should be dropped from the output. Default is \code{FALSE}.}
}
\examples{
long2cp(data = long_data, id = "id", time = "time", status = "event")
}
\value{A data frame in counting process format.}
\details{
  The transition is primarily done by shifting the column supplied to the \code{time} argument into two new columns for a column-wise time definition and adjusting rows accordingly. Column names supplied to the \code{status} arguement are assumed to ocurr at the right endpoint so the first value for each \code{id} of the input is dropped. All other time-varying columns are assumed to ocurr at the left endpoint so the last value for each \code{id} of the input is dropped. The \code{drop} argument can be used for any \code{id} levels that may only have one row where a two column time data set might not suit them. Since there is not any useful gained from going from one time to the same time, it may be useful to just drop those \code{id} levels altogether.
}

