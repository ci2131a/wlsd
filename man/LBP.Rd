
\name{LBP}
\alias{LBP}
\title{Low Back Pain Data Set}
\usage{
LBP
}
\description{
This is used to investigate the risk of low back pain (LBP) in a cohort of manufaturing workers collected by the LBP Research Consortium.
}
\format{
  \tabular{lll}{
    \strong{Variable} \tab \strong{Description} \tab \strong{Class} \cr
    sid: \tab The subject identification variable for individuals. \tab Factor \cr
    Baseline.date: \tab The date of baseline visit or enrollment of individuals into the study. \tab Date \cr
    Date: \tab The calendar time of follow-up visit. \tab Date \cr
    time_to_row: \tab The number of days between the current follow-up visit and the baseline date. \tab Integer \cr
    case.lbp: \tab A status indicator for individuals possessing any LBP (0 for no and 1 for yes). \tab Integer \cr
    case.med: \tab A status indicator determining whether indviduals are taking medication for LBP (0 for no and 1 for yes). \tab Integer \cr
    case.sc: \tab A status indicator to determine whether individuals are seeking care for LBP (0 for no and 1 for yes). \tab Integer \cr
    case.ls: \tab A status indicator to determine whether individuals have lost time from work due to LBP (0 for no and 1 for yes). \tab Integer \cr
    gender: \tab The assigned sex of the individual (either M for Male or F for Female). \tab Factor \cr
    age: \tab The age of the individual at baseline visit in years. \tab Numeric \cr
    weight: \tab The weight of individuals in lbs. \tab Integer \cr
    height: \tab The height of individuals in inches. \tab Integer \cr
    raceth: \tab A categorical variable to determine the race/ethnicity of individuals (0 = White; 1 = Hispanic/Latino; 2 = Black; 3 = Asian; 4 = Native Hawaiian or Pacific Islander; 5 = Native American or Native Alaskan; 6 = Other/declined). \tab Factor \cr
    smoking: \tab A smoking indicator variable  (0 = Smoked less than 100 cigarettes in life; 1 = smoked in the past, but no longer, 2 = currently smoke). \tab Factor \cr
    comptenure: \tab A categorical variable to determine length of time at the current company (0 = less than 3 months; 1 = 3 months to 1 year; 2 = 1 year to 3 years; 3 = 3 years to 5 years; 4 = 5 years to 10 years; 5 = 10 or more years). \tab Factor \cr
    jobtenure: \tab A categorical variable to determine length of time in their current job 0 = less than 3 months; 1 = 3 months to 1 year; 2 = 1 year to 3 years; 3 = 3 years to 5 years; 4 = 5 years to 10 years; 5 = 10 or more years. \tab Factor \cr
    control.order: \tab  A categorical variable to determine how much control individuals have over the order in which they complete tasks (0 = "Very Much", 1 = "Much", 2="Moderate Amounts", 3="A Little", 4="Very Little"). \tab Factor \cr
    control.pace: \tab  A categorical variable to determine how much control individuals have over the pace in which they complete tasks (0 = "Very Much", 1 = "Much", 2="Moderate Amounts", 3="A Little", 4="Very Little"). \tab Factor \cr
    control.breaks: \tab  A categorical variable to determine the amount of control individuals have in taking breaks between completing tasks (0 = "Very Much", 1 = "Much", 2="Moderate Amounts", 3="A Little", 4="Very Little"). \tab Factor  \cr
    supervisor.support: \tab  A categorical variable determining how much support individuals feel they receive from their supervisor (0="Almost Always", 1="Some of the Time", 2="Hardly Ever"). \tab Factor \cr
    coworker.support: \tab A categorical variable determining how much support individuals feel they receive from their coworkers (0="Almost Always", 1="Some of the Time", 2="Hardly Ever"). \tab Factor \cr
    job.satisfied: \tab  A categorical variable to determine whether individuals feel satisfied with their current job (0="Very Satisfied", 1="Somewhat Satisfied", 2="A Little Satisfied", 3="Not at all Satisfied"). \tab Factor \cr
    bmi: \tab The calculated body mass index (BMI) of individuals based on \code{height} and \code{weight}. \tab Numeric \cr

  }
}

