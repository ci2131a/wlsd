
\name{surv2msm}
\alias{surv2msm}
\title{Survival to msm format}
\usage{
surv2msm(data, id, time1, time2, event, msmevent = TRUE)
}
\description{
Transforms data from counting process format (time1, time2, event) to the longitudinal format (time, event).
}
\arguments{
  \item{data}{A data frame with relevant columns.}
  \item{id}{A character string of the identification variable name in data. Can be a numeric or character variable.}
  \item{time1}{A character string of the first time point variable in data. Represents the left endpoint of the time interval.}
  \item{time2}{A character string of the second time point variable in data. Represents the right endpoint of the time interval.}
  \item{event}{The character string for the event variable. These are assumed to be numeric (Ex: 0,1 or 1,2).}
  \item{msmevent}{An optional argument to determine whether to change the values of the `event` variable. Defaults to TRUE. The `msm` package assumes that the event variable starts at 1 rather than 0. If TRUE, the event variable will be checked if it starts at 0 and bump all events up by 1. Change argument to FALSE to leave events as is.}
}
\examples{
surv2msm()
}
\value{}
\details{}

