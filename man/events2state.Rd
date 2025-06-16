
\name{events2state}
\alias{events2state}
\title{Multiple Event Variables to One State Variable}
\usage{
events2state(data, events, number = TRUE, drop = TRUE, ...)
}
\description{
Converts one or more event columns within a data frame to a single state vector whose values represent combinations of events.
}
\arguments{
  \item{data}{A data frame with relevant columns.}
  \item{events}{The names of the event variables as character strings in a vector.}
  \item{number}{A logical argument to determine whether the new state variable should be converted to a number representing the combination of events or left as is.  Defaults to \code{TRUE} which will convert combinations a numeric. If argument is set to \code{FALSE}, the  combinations will be left unchanged.}
  \item{drop}{Passed to \code{interaction} in order to determine whether unused factors will be excluded from the defining levels. The default is \code{TRUE}.}
  \item{...}{Further arguments to be passed to \code{interaction}.}
}

\value{A data frame with an added column called \code{state}.}
\details{
For a data frame with the necessary inputs, the function will aggregate values across columns supplied to \code{events} through the \code{interaction} function. The key for the different combination levels is printed to the console.
}

\examples{
events2state(data = long_data, events = c("event", "var2"))
}
