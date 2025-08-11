
\name{takefirst}
\alias{takefirst}
\title{Subset observations for grouped data based on first occurrence of a criteria value}
\usage{
takefirst(data, id, criteria.column, criteria)
}
\description{
Takes all rows of a data frame up to and including the first occurrence of a supplied criteria for grouped data.
}
\arguments{
  \item{data}{A data frame with relevant columns.}
  \item{id}{A character string of the identification vector name defining groups in \code{data}.}
  \item{criteria.column}{The name as a character string of the column in \code{data} where the criteria is located.}
  \item{criteria}{The value of the cutoff for subsetting.}
}
\examples{
takefirst(long_data, "id", criteria.column = "var1", criteria = 10.4)
}
\value{A data frame subset up to and including the first row matching \code{criteria} in \code{cirteria.column} for each level of \code{id}.
}

\details{
  Returns a data frame that takes all rows within the groups supplied by \code{id} up to and including the first occurrence of the value of \code{criteria} in \code{criteria.column}.
}


