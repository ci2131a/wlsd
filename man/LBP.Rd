
\name{LBP}
\alias{LBP}
\title{Low Back Pain Data Set}

\description{
A long format data set from a longitudinal study of low back pain (LBP) on midwestern manufacturing workers.
}

\usage{
LBP
}

\format{
A data frame on the following variables:
  \tabular{lll}{
    \strong{Variable} \tab \strong{Description} \tab \strong{Class} \cr
    \code{sid}: \tab The subject identification variable for individuals. \tab Factor \cr
    \code{Baseline.date}: \tab The date of baseline visit or enrollment of individuals into the study. \tab Date \cr
    \code{Date}: \tab The calendar time of follow-up visit. \tab Date \cr
    \code{time_to_row}: \tab The number of days between the current follow-up visit and the baseline date. \tab Integer \cr
    \code{case.lbp}: \tab A status indicator for individuals possessing any LBP (0 for no and 1 for yes). \tab Integer \cr
    \code{case.med}: \tab A status indicator determining whether indviduals are taking medication for LBP (0 for no and 1 for yes). \tab Integer \cr
    \code{case.sc}: \tab A status indicator to determine whether individuals are seeking care for LBP (0 for no and 1 for yes). \tab Integer \cr
    \code{case.ls}: \tab A status indicator to determine whether individuals have lost time from work due to LBP (0 for no and 1 for yes). \tab Integer \cr
    \code{gender}: \tab The gender of the individual (either M for Male or F for Female). \tab Factor \cr
    \code{age}: \tab The age of the individual at baseline visit in years. \tab Numeric \cr
    \code{weight}: \tab The weight of individuals in lbs. \tab Integer \cr
    \code{height}: \tab The height of individuals in inches. \tab Integer \cr
    \code{raceth}: \tab A categorical variable to determine the race/ethnicity of individuals (0 = White; 1 = Hispanic/Latino; 2 = Black; 3 = Asian; 4 = Native Hawaiian or Pacific Islander; 5 = Native American or Native Alaskan; 6 = Other/declined). \tab Factor \cr
    \code{smoking}: \tab A smoking indicator variable  (0 = Smoked less than 100 cigarettes in life; 1 = smoked in the past, but no longer, 2 = currently smoke). \tab Factor \cr
    \code{comptenure}: \tab A categorical variable to determine length of time at the current company (0 = less than 3 months; 1 = 3 months to 1 year; 2 = 1 year to 3 years; 3 = 3 years to 5 years; 4 = 5 years to 10 years; 5 = 10 or more years). \tab Factor \cr
    \code{jobtenure}: \tab A categorical variable to determine length of time in their current job 0 = less than 3 months; 1 = 3 months to 1 year; 2 = 1 year to 3 years; 3 = 3 years to 5 years; 4 = 5 years to 10 years; 5 = 10 or more years. \tab Factor \cr
    \code{control.order}: \tab  A categorical variable to determine how much control individuals have over the order in which they complete tasks (0 = "Very Much", 1 = "Much", 2="Moderate Amounts", 3="A Little", 4="Very Little"). \tab Factor \cr
    \code{control.pace}: \tab  A categorical variable to determine how much control individuals have over the pace in which they complete tasks (0 = "Very Much", 1 = "Much", 2="Moderate Amounts", 3="A Little", 4="Very Little"). \tab Factor \cr
    \code{control.breaks}: \tab  A categorical variable to determine the amount of control individuals have in taking breaks between completing tasks (0 = "Very Much", 1 = "Much", 2="Moderate Amounts", 3="A Little", 4="Very Little"). \tab Factor  \cr
    \code{supervisor.support}: \tab  A categorical variable determining how much support individuals feel they receive from their supervisor (0="Almost Always", 1="Some of the Time", 2="Hardly Ever"). \tab Factor \cr
    \code{coworker.support}: \tab A categorical variable determining how much support individuals feel they receive from their coworkers (0="Almost Always", 1="Some of the Time", 2="Hardly Ever"). \tab Factor \cr
    \code{job.satisfied}: \tab  A categorical variable to determine whether individuals feel satisfied with their current job (0="Very Satisfied", 1="Somewhat Satisfied", 2="A Little Satisfied", 3="Not at all Satisfied"). \tab Factor \cr
    \code{bmi}: \tab The calculated body mass index (BMI) of individuals based on \code{height} and \code{weight}. \tab Numeric \cr

  }
}

\details{
Data set construction was done through the consolidation of various source files pulled from the original database. The final data frame contains follow-up information for selected individuals. The case definitions assessed over time were \code{case.lbp}, \code{case.med}, \code{case.sc}, and \code{case.lt}. Column \code{time_to_row} is constructed using the \code{Baseline.date} and \code{Date} columns to calculate the number of days between observations (denoted by rows). All other columns are constant with respect to time. Categorical variables were recorded through self-assessment on the part of the subject. The \code{age} and \code{weight} variables were able to be physically measured to then be used in calculation of \code{bmi}.
}
\source{
LBP Research Consortium, University of Wisconsin-Milwaukee
}
\references{
  Garg, Arun, Kurt Hegmann, J. Moore, Jay Kapellusch, Matthew Thiese, Sruthi Boda,
  Parag Bhoyar, Donald Bloswick, Andrew Merryweather, Richard Sesek, Gwen
  Deckow-Schaefer, James Foster, Eric Wood, Xiaoming Sheng, and Richard Holubkov
  (2013). Study protocol title: A prospective cohort study of low back pain. BMC
  Musculoskeletal Disorders 14(84), 84.


  Ingulli, Charles. (2020). A Survey of Statistical Methods for Investigating Risk of Low Back Pain in a Cohort of Manufacturing Workers. (85696). [Master's Thesis, American University]

}
\examples{
LBP
}
\keyword{datasets}
