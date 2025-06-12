
\name{long2cp}
\alias{long2cp}
\title{Long to Counting Process format}
\usage{
long2cp(data, id, time, drop = FALSE)
}
\description{
Transforms data from the longitudinal format (time, status) used in the msm package to the counting process format (time1, time2, status) used in the survival package.
}
\arguments{
  \item{data}{A data frame with relevant columns.}
  \item{id}{A character string of the identification variable name in \code{data}.}
  \item{time}{A character string of the time variable in \code{data}.}
  \item{drop}{Logical indicator for whether any `id` groups with insufficient rows should be dropped from the output. Default is `FALSE`.}
}
\examples{
long2cp(data = long_data, id = "id", time = "time")
}
\value{A data frame in counting process format.}
\details{
  The transition is primarily done by shifting the column supplied to the `time` argument into two new columns for a column-wise time definition and adding back any remaining columns. The `drop` argument can be used for any `id` levels that may only have one row where a two column time data set might not suit them. Since there is not any useful gained from going from one time to the same time, it may be useful to just drop those `id` levels altogether
}

