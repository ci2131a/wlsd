
\name{cp2long}
\alias{cp2long}
\title{Counting Process to Longitudinal format}
\usage{
cp2long(data, id, time1, time2, status, fill = FALSE, msmstate = FALSE)
}
\description{
Transforms data from counting process format (time1, time2, status) to the longitudinal format (time, status).
}
\arguments{
  \item{data}{A data frame with relevant columns.}
  \item{id}{A character string of the identification variable name in \code{data}.}
  \item{time1}{A character string of the first time point variable in \code{data}. Represents the left endpoint of the time interval.}
  \item{time2}{A character string of the second time point variable in \code{data}. Represents the right endpoint of the time interval.}
  \item{status}{The character string for the status variable name. These are assumed to be numeric (Ex: 0,1 or 1,2).}
  \item{fill}{An optional argument to fill any constant covariates with values based on the value for the group created by \code{id}.}
  \item{msmstate}{An optional argument to determine whether to incremenet values of the \code{status} variable if the minimum is 0. Defaults to \code{FALSE} but if \code{TRUE} will try to add 1 to status such that the minimum is 1.}
}
\examples{


}
\value{A data frame in longitudinal form.}
\details{

}

