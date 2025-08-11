
\name{cp2long}
\alias{cp2long}
\title{Counting Process Format to Long format}
\usage{
cp2long(data, id, time1, time2, status = NULL, fill = FALSE)
}
\description{
Transforms data from counting process format to the long format.
}
\arguments{
  \item{data}{A data frame with relevant columns.}
  \item{id}{A character string of the identification variable name in \code{data}.}
  \item{time1}{A character string of the first time point variable in \code{data}. Represents the left endpoint of the time interval.}
  \item{time2}{A character string of the second time point variable in \code{data}. Represents the right endpoint of the time interval.}
  \item{status}{A character string of the status column name in \code{data} to be treated as either an event or state.}
  \item{fill}{An optional argument that attempts to fill any \code{NA} values in the output for columns that might be constant within \code{id} levels.}
}
\examples{
cp2long(data = cp_data, id = "id", time1 = "time1", time2 = "time2")
}
\value{A data frame in long format.}
\details{
The data transition consolitdates information from the \code{time1} and \code{time2} argument into a single time column. All other columns are assumed to correspond to the \code{time2} point. Thus, the first row generally consists of \code{NA} values. The \code{fill} argument will attempt to discern any constant columns within \code{id} groups in order to populate that first row.
}

