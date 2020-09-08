
\name{cp2long}
\alias{cp2long}
\title{Counting Process to Longitudinal format}
\usage{
cp2long(data, id, time1, time2, status, msmstate = TRUE)
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
  \item{tvars}{An optional argument with a single string or a vector of strings representing the variable names for any time-dependent variables.}
  \item{msmstate}{An optional argument to determine whether to change the values of the \code{status} variable. Defaults to \code{TRUE}. The \pkg{msm} package assumes that the status variable starts at 1 rather than 0. If \code{TRUE}, the status variable will be checked if it starts at 0 and bump all states up by 1 if true. Changing the argument to \code{FALSE} will leave the variable unchanged.}
}
\examples{
# define data
toydata  <- data.frame(id = c(1,1,1,2,2,3),
                      time1 = c(0,31,64,0,33,0),
                      time2 = c(31,64,96,33,59,28),
                      state = c(0,0,1,0,0,1))
# apply function
cp2long(data = toydata,
         id = "id",
         time1 = "time1",
         time2 = "time2",
         status = "state",
         msmstate = TRUE)


}
\value{A data frame in longitudinal form.}
\details{
  For data of the form :
  \tabular{llll}{
    \code{id} \tab \code{time1} \tab \code{time2}  \tab \code{status} \cr
       1  \tab  0 \tab  31  \tab  0\cr
       1  \tab  31 \tab  64  \tab  0\cr
       1  \tab  64 \tab  96  \tab  1\cr
       2  \tab  0 \tab  33  \tab  0\cr
       2  \tab  33 \tab  59  \tab  0\cr
       3  \tab  0 \tab  28  \tab  1\cr
       }
      will yield data of the form :
      \tabular{lll}{
      \code{id} \tab \code{time} \tab \code{status} \cr
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

