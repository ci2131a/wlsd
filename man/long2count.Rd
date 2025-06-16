
\name{long2count}
\alias{long2count}
\title{Longitudinal to Count format}
\usage{
long2count(data, id, event = NULL, state = NULL, FUN, ...)
}
\description{
Aggregates longitudinal data into a count format data set.
}
\arguments{
  \item{data}{A data frame with relevant columns.}
  \item{id}{A character string of the identification variable name in \code{data}.}
  \item{event}{The name(s) of the event column(s) in \code{data} to be tallied. The name(s) is required to be supplied as a string. The elements of this argument are assumed to be numeric and are summed for each identification level from \code{id}.}
  \item{state}{The name of the state variable in \code{data}. This argument is used if the event of interest is a numeric or non-numeric series of states. Each of these levels will be tallied for each level of the \code{id}.}
  \item{FUN}{The summary function to be applied to all time-depentent columns (wrapper for argument in \code{stats::aggregate}). If nothing is supplied, then \code{mean} will be used.}
  \item{...}{Additional arguments supplied to \code{stats::aggregate}.}
}
\examples{
# if the "event" column should be summed
long2count(long_data, id = "id", event = "event")
# if the "event" column contains levels that should be summed separately
long2count(long_data, id = "id", state = "event")
}
\details{
The returned data frame aggregates any time-depended values based on row-wise changes within \code{id} groups. New columns include \code{event.counts} which represents the sum total of values in the \code{event} column for each level of \code{id} or the sum total of levels of the \code{state} column if supplied as well as the \code{count.weight} column which sums the number of rows for each level of \code{id}.
}
\value{
A data frame aggregated into count format.
}


