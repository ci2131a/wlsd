
\name{cp2long}
\alias{cp2long}
\title{Counting Process to Longitudinal format}
\usage{
cp2long(data, id, time1, time2, fill = FALSE)
}
\description{
Transforms data from counting process format (time1, time2, status) to the longitudinal format (time, status).
}
\arguments{
  \item{data}{A data frame with relevant columns.}
  \item{id}{A character string of the identification variable name in \code{data}.}
  \item{time1}{A character string of the first time point variable in \code{data}. Represents the left endpoint of the time interval.}
  \item{time2}{A character string of the second time point variable in \code{data}. Represents the right endpoint of the time interval.}
  \item{fill}{An optional argument that attempts to fill any NA values created for constant covariates by \code{id} during data set construction.}
}
\examples{


}
\value{A data frame in longitudinal form.}
\details{

}

