
\name{basedate}
\alias{basedate}
\title{Create Baseline Row}
\usage{
basedate(data,id)
}
\description{
Creates a new row of values for subjects representing baseline observations in a data set of follow-up observations.
}
\arguments{
  \item{data}{Data frame with relevant columns.}
  \item{id}{Character string of the identification column name in \code{data}.}
}
\examples{
basedate(long_data, "id")
}
\value{A data frame similar to the input.}
\details{
  Adds a new row for each level of the `id` column. Internal functions will try to determine any constant columns by checking for consistency within `id` groups in order to fill in some of the blanks.
}

