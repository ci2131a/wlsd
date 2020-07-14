
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
  \item{id}{A character string of the identification variable name in \code{data}. Variable can be of type numeric or character.}
  \item{time1}{A character string of the first time point variable in \code{data}. Represents the left endpoint of the time interval.}
  \item{time2}{A character string of the second time point variable in \code{data}. Represents the right endpoint of the time interval.}
  \item{event}{The character string for the \code{event} variable. These are assumed to be numeric (Ex: 0,1 or 1,2).}
  \item{tvars}{An optional argument with a single string or a vector of strings representing the variable names for any time-dependent variables.}
  \item{msmevent}{An optional argument to determine whether to change the values of the \code{event} variable. Defaults to \code{TRUE}. The \pkg{msm} package assumes that the event variable starts at 1 rather than 0. If \code{TRUE}, the event variable will be checked if it starts at 0 and bump all events up by 1. Changing the argument to \code{FALSE} will leave the variable unchanged.}
}
\examples{
# define data from Table 1 of the vignette
table1  <- data.frame(id = c(1,1,1,2,2,3),
                      time1 = c(0,31,64,0,33,0),
                      time2 = c(31,64,96,33,59,28),
                      event = c(0,0,1,0,0,1))
# apply function
surv2msm(data = table1,
         id = "id",
         time1 = "time1",
         time2 = "time2",
         event = "event",
         msmevent = TRUE)


}
\value{A data frame in longitudinal form.}
\details{
  For a data frame of the form :
  \tabular{llll}{
    \code{id} \tab \code{time1} \tab \code{time2}  \tab \code{event} \cr
       1  \tab  0 \tab  31  \tab  0\cr
       1  \tab  31 \tab  64  \tab  0\cr
       1  \tab  64 \tab  96  \tab  1\cr
       2  \tab  0 \tab  33  \tab  0\cr
       2  \tab  33 \tab  59  \tab  0\cr
       3  \tab  0 \tab  28  \tab  1\cr
       }
      will yield a data frame of the form :
      \tabular{lll}{
      \code{id} \tab \code{time} \tab \code{event} \cr
      1 \tab 0 \tab 1 \cr
      1 \tab 31 \tab 1 \cr
      1 \tab 64 \tab 1 \cr
      1 \tab 96 \tab 2 \cr
      2 \tab 0 \tab 1 \cr
      2 \tab 33 \tab 1 \cr
      2 \tab 59 \tab 1 \cr
      3 \tab 0 \tab 1 \cr
      3 \tab 28 \tab 2 \cr
      }
      through the code provided in example.
}

