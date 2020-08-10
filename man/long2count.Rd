
\name{long2count}
\alias{long2count}
\title{Longitudinal to Count format}
\usage{
long2count(data, id, event = NULL, state = NULL, tvars = NULL, tfun = "mean")
}
\description{
Transforms data from longitudinal format to a format suitable for count regression.
}
\arguments{
  \item{data}{A data frame with relevant columns.}
  \item{id}{A character string of the identification variable name in \code{data}.}
  \item{event}{The name(s) of the event column(s) in \code{data} to be tallied. The name(s) is required to be supplied as a string. The elements of this argument are assumed to be numeric and are summed for each identification level from \code{id}.}
  \item{state}{The name of the state variable in \code{data}. This argument is used if the event of interest is a numeric or non-numeric series of states. Each of these levels will be tallied for each level of the \code{id}.}
  \item{tvars}{Optional argument for the name(s) of any time-dependent variables included in the data set. The name(s) should be supplied as a single string or a vector of strings.}
  \item{tfun}{The summary function to be applied to all time-depentent variables listed in \code{tvars}.}
}
\examples{
# define data
toydata  <- data.frame(id = c(1,1,1,2,2,3),
                      time = c(0,31,64,0,33,0),
                      status = c(0,1,1,0,0,1),
                      var1 = c(24,24,24,18,18,39),
                      var2 = c(2.1,2.4,3.9,4.2,1.6,5.5))

# apply function for event
long2count(data = toydata,
           id = "id",
           event = "status",
           tvars = c("var2"),
           tfun = "mean")

# apply function for state
long2count(data = toydata,
           id = "id",
           state = "status",
           tvars = c("var2"),
           tfun = "mean")
}
\value{The returned value of the function is a data frame with new columns and fewer rows. The \code{event.counts} column represents the sum total of values in the \code{event} column for each level of \code{id}. The \code{count.weight} column sums the number of rows for each level of \code{id} which should represent visits.}
\details{
  For data of the form :
  \tabular{lllll}{
    \code{id} \tab \code{time} \tab \code{status}  \tab \code{var1} \tab \code{var2} \cr
       1  \tab  0 \tab  0  \tab  24 \tab 2.1 \cr
       1  \tab  31 \tab  1  \tab  24 \tab 2.4 \cr
       1  \tab  64 \tab  1  \tab  24 \tab 3.9 \cr
       2  \tab  0 \tab  0  \tab  18 \tab 4.2 \cr
       2  \tab  33 \tab  0  \tab  18 \tab 1.6\cr
       3  \tab  0 \tab  1  \tab  39 \tab 5.5\cr
       }
      will yield a data frame of the form :
      \tabular{llllll}{
    \code{id} \tab \code{status.counts} \tab \code{time}  \tab \code{var1} \tab \code{count.weight} \tab \code{var2} \cr
       1  \tab  2 \tab  0  \tab  24 \tab 3 \tab 2.8 \cr
       2  \tab  0 \tab  0  \tab  18 \tab 2 \tab 2.9 \cr
       3  \tab  1 \tab  0  \tab  39 \tab 1 \tab 5.5 \cr
       }
      through the code provided in example using the \code{event} argument.

  Similarly using the \code{state} argument, data of the form :
  \tabular{lllll}{
    \code{id} \tab \code{time} \tab \code{status}  \tab \code{var1} \tab \code{var2} \cr
       1  \tab  0 \tab  0  \tab  24 \tab 2.1 \cr
       1  \tab  31 \tab  1  \tab  24 \tab 2.4 \cr
       1  \tab  64 \tab  1  \tab  24 \tab 3.9 \cr
       2  \tab  0 \tab  0  \tab  18 \tab 4.2 \cr
       2  \tab  33 \tab  0  \tab  18 \tab 1.6\cr
       3  \tab  0 \tab  1  \tab  39 \tab 5.5\cr
       }
      will yield a data frame of the form :
      \tabular{lllllll}{
    \code{id} \tab \code{status} \tab \code{status.counts} \tab \code{time}  \tab \code{var1} \tab \code{count.weight} \tab \code{var2} \cr
       1  \tab  0 \tab 1 \tab  0  \tab  24 \tab 3 \tab 2.8 \cr
       1  \tab  1 \tab 2 \tab  0  \tab  24 \tab 3 \tab 2.8 \cr
       2  \tab  0 \tab 2 \tab  0  \tab  18 \tab 2 \tab 5.5 \cr
       2  \tab  1 \tab 0 \tab  0  \tab  18 \tab 2 \tab 2.8 \cr
       3  \tab  0 \tab 0 \tab  0  \tab  39 \tab 1 \tab 2.9 \cr
       3  \tab  1 \tab 1 \tab  0  \tab  39 \tab 1 \tab 5.5 \cr
       }
      through the code provided in example.

Note that the variable \code{time} is technically a time-dependent variable since its values change by rows. Since it was not supplied to the \code{tvars} argument, the first value for each individual was carried over.

}


