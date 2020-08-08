
\name{basedate}
\alias{basedate}
\title{Combining Baseline Date}
\usage{
basedate(data,id,baseline.date,time,status,tvars = NULL)
}
\description{
Combines variable representing the baseline date with the variable representing follow-up date variable. Useful if the two variables are in different columns.
}
\arguments{
  \item{data}{A data frame with relevant columns.}
  \item{id}{A character string of the identification variable name in \code{data}.}
  \item{baseline.date}{A character string of the baseline date variable in \code{data}. This is assumed to be constant for each level of \code{id}.}
  \item{time}{A character string of the follow-up time variable in \code{data}.}
  \item{status}{The character string for the status variable name.}
  \item{tvars}{An optional argument with a single string or a vector of strings representing the variable names for any time-dependent variables.}

\examples{
# define data
basedata <- data.frame(id = c(1,1,1,2,2,3),
                     base = c(0,0,0,10,10,0),
                     time1 = c(31,64,96,33,59,28),
                     event = c(0,0,1,0,0,1),
                     age = c(46,46,46,39,39,57),
                     state = c(0,1,2,0,1,2))
# apply function
basedate(data = basedata,
         id = "id",
         baseline.date = "base",
         time = "time1",
         status = "event",
         tvars = "state")


}
\value{A data frame in longitudinal form.}
\details{
  For data of the form :
  \tabular{llll}{
    \code{id} \tab \code{base} \tab \code{time1}  \tab \code{event} \cr
       1  \tab  0 \tab  31  \tab  0\cr
       1  \tab  0 \tab  64  \tab  0\cr
       1  \tab  0 \tab  96  \tab  1\cr
       2  \tab  10 \tab  33  \tab  0\cr
       2  \tab  10 \tab  59  \tab  0\cr
       3  \tab  0 \tab  28  \tab  1\cr
       }
      will yield data of the form :
      \tabular{lll}{
      \code{id} \tab \code{time} \tab \code{status} \cr
      1 \tab 0 \tab 0 \cr
      1 \tab 31 \tab 0 \cr
      1 \tab 64 \tab 0 \cr
      1 \tab 96 \tab 1 \cr
      2 \tab 10 \tab 0 \cr
      2 \tab 33 \tab 0 \cr
      2 \tab 59 \tab 1 \cr
      3 \tab 0 \tab 0 \cr
      3 \tab 28 \tab 1 \cr
      }
      through the code provided in example.
}

