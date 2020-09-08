
\name{long2cp}
\alias{long2cp}
\title{Longitudinal to Counting Process format}
\usage{
long2cp(data, id, time)
}
\description{
Transforms data from the longitudinal format (time, status) used in the msm package to the counting process format (time1, time2, status) used in the survival package.
}
\arguments{
  \item{data}{A data frame with relevant columns.}
  \item{id}{A character string of the identification variable name in \code{data}.}
  \item{time}{A character string of the time variable in \code{data}.}
}
\examples{
# define data
toydata  <- data.frame(id = c(1,1,1,1,2,2,2,3,2),
                      time1 = c(0,31,64,96,0,33,59,0,28),
                      state = c(0,0,0,1,0,0,0,0,1))
# apply function
long2cp(data = toydata,
         id = "id",
         time = "time1")


}
\value{A data frame in counting process form.}
\details{
  For data of the form :
    \tabular{lll}{
      \code{id} \tab \code{time} \tab \code{status} \cr
      1 \tab 0 \tab 0 \cr
      1 \tab 31 \tab 0 \cr
      1 \tab 64 \tab 0 \cr
      1 \tab 96 \tab 1 \cr
      2 \tab 0 \tab 0 \cr
      2 \tab 33 \tab 0 \cr
      2 \tab 59 \tab 0 \cr
      3 \tab 0 \tab 0 \cr
      3 \tab 28 \tab 1 \cr
      }
      will yield data of the form :

  \tabular{llll}{
    \code{id} \tab \code{time1} \tab \code{time2}  \tab \code{status} \cr
       1  \tab  0 \tab  31  \tab  0\cr
       1  \tab  31 \tab  64  \tab  0\cr
       1  \tab  64 \tab  96  \tab  1\cr
       2  \tab  0 \tab  33  \tab  0\cr
       2  \tab  33 \tab  59  \tab  0\cr
       3  \tab  0 \tab  28  \tab  1\cr
       }

      through the code provided in example.
}

