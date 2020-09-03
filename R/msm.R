# functions for converting data sets to the msm format


# transforms data from the counting process notation
# (i.e. times are start, stop) into the longitudinal
# format where time is one column

# a new note:
# the counting process format takes covariates
# in intervals (t1,t2] for variables measured at time t1
# survival studies individuals usually will transition
# to a death state and will not be measured for
# other variables at that time

#' @export
surv2msm <- function(data, id, time1, time2, status, tvars = NULL, msmstate = TRUE){
# all other variables should get carried over

  # input checks
  if(missing(data)) stop("Argument to data not supplied")
  if(missing(id)) stop("Argument to id not supplied")
  if(missing(time1)) stop("Argument to time1 not supplied")
  if(missing(time2)) stop("Argument to time2 not supplied")
  if(missing(status)) stop("Argument to status not supplied")



  #if(!is.numeric(data[[time1]])) stop("time inputs must be numeric")
  #if(!is.numeric(data[[time2]])) stop("time inputs must be numeric")
  if(!is.numeric(data[[status]])) stop("status variable must be numeric")


  first <- data[,!names(data) %in% c(time2,status)]
  names(first)[names(first) == time1] <- "time"
  last <- data[,!names(data) %in% c(time1,tvars)]
  names(last)[names(last) == time2] <- "time"
  newdata <- merge(first,last,all = TRUE)
  #if(0 %in% min(data[[state]], na.rm = TRUE)){
    #newdata[[state]][is.na(newdata[[state]])] <- min(data[[state]], na.rm = TRUE)
  #}else
  if(0 %in% min(data[[status]], na.rm = TRUE) & msmstate){
    newdata[status] <- newdata[status] + 1
  }
  else if(msmstate){
    warning("state values not changed in msmstate")
  }
  # returns output similar to the timeline data described in survival vignette
  # all timevarying covariates are required to be specified to avoid duplicated rows in merge
  return(newdata)


}



#' @export
msm2surv <- function(data, id, time){

  if(missing(data)) stop("Argument to data not supplied")
  if(missing(id)) stop("Argument to id not supplied")
  if(missing(time)) stop("Argument to time not supplied")


  First <- data[duplicated(data[id],fromLast = T),c(id,time)]
  Last <- data[duplicated(data[id]),]
  Else <- data[duplicated(data[id]),!names(data) %in% c(id,time)]

  names(First)[names(First) == time] <- "time1"
  names(Last)[names(Last) == time] <- "time2"


  newdata1 <- First
  newdata1$time2 <- Last$time2
  newdata2 <- cbind(newdata1,Else)

  return(newdata2)

}


