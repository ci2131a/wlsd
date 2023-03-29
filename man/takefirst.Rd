
\name{takefirst}
\alias{takefirst}
\title{Subset observations for grouped data up to a single criteria value}
\usage{
takefirst(data, id, criteria.column, criteria, ...)
}
\description{
Takes all rows of a data frame up to and including the first occurrence of a supplied criteria for grouped data.
}
\arguments{
  \item{data}{A data frame with relevant columns.}
  \item{id}{A character string of the identification vector name defining groups in \code{data}.}
  \item{criteria.vector}{The name as a character string of the vector in \code{data} where the criteria is located.}
  \item{criteria}{The value of the cutoff for subsetting.}
  \item{...}{Further arguments to be supplied to internal functions and or methods.}
}
\examples{
# example
}
\value{A subsetted data frame.


Returns the data supplied subset such that all rows up to and including the first occurrence of the value supplied are retained. All rows after the first occurrence are discarded for each group.
}

\details{
  details
}


