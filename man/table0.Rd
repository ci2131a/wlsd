
\name{table0}
\alias{table0}
\title{Toy Data Set for Package}
\usage{
table0
}
\description{
This is a toy data set generated to explore functionality of the package with a simple example.
}
\format{
  \tabular{ll}{
    id: \tab Identification variable for groups. \cr
    time1: \tab The left endpoint of each time interval. \cr
    time2: \tab The right endpoint of each time interval. \cr
    event1: \tab The first event indicator variable. 0 for no event in the time interval and 1 for yes event in the time interval.  \cr
    event2: \tab The second event indicator variable. 0 for no event in the time interval and 1 for yes event in the time interval. \cr
    state: \tab The state of the individual based on both indicator variables (\code{event1}, \code{event2}). \cr
    age: \tab The age of individual at baseline in years. \cr
    meds: \tab The level of medication received by an individual within the time interval (0 is for low, 1 is for medium, and 2 is for high.) \cr
  }
}

