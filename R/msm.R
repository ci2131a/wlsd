# functions for converting data sets to the msm format


# transforms data from the counting process notation
# (i.e. times are start, stop) into the longitudinal
# format where time is one column

# a final concern is that counting process notation
# does not really specify baseline variable statuses?
# something to be looked into

surv2msm <- function(data, id, time1, time2, event, msmevent = TRUE){
# i guess I am just carrying over all other variables???

  # input checks
  if(missing(data)) stop("Argument to data not supplied")
  if(missing(id)) stop("Argument to id not supplied")
  if(missing(time1)) stop("Argument to time1 not supplied")
  if(missing(time2)) stop("Argument to time2 not supplied")
  if(missing(event)) stop("Argument to event not supplied")


  if(!is.numeric(data[[time1]])) stop("time inputs must be numeric")
  if(!is.numeric(data[[time2]])) stop("time inputs must be numeric")
  if(!is.numeric(data[[event]])) stop("event variable must be numeric")

# extract id and event columns
  cid <- data[id]
  ce <- data[event]

# subset first observation of each person
  first <- data[!duplicated(cid),!(names(data) %in% c(time2))]
# rename time variable
  names(first)[names(first)==time1] <- "time"
# ensure the starting status is the same as the first event
  first[,event] <- min(ce)
# drop start variable
  drop <- data[,!(names(data) %in% c(time1))]
  names(drop)[names(drop)==time2] <- "time"
# combine the stop times with the first start time
  newdata <- rbind(first,drop)
# sort the data by id and time
  sorted <- newdata[order(newdata[id], newdata["time"]),]

  if(msmevent){
    if(0 %in% min(ce)){
      sorted[event] <- sorted[event]+1
    }else{
      warning("Event values not changed")
    }
  }
# returns
  warning("Baseline values assumed to be the same as first stop time")
  sorted

}




#s2m <- function(data, id, time1, time2, event, cvars = NULL, tvars = NULL){
#  stop("This function is not done yet!")
#  if(missing(data)) stop("Argument to data not supplied")
#  if(missing(id)) stop("Argument to id not supplied")
#  if(missing(time1)) stop("Argument to time1 not supplied")
#  if(missing(time2)) stop("Argument to time2 not supplied")
#  if(missing(event)) stop("Argument to event not supplied")
#  first <- dplyr::group_by(data,{{id}})
#  first <- dplyr::slice(first,1)
#  first <- dplyr::mutate(first,time1 = {{time}})
#  first <- dplyr::select(first, -time1,-time2)
#  subdata <- dplyr::mutate(data, time2 = time)
#  subdata <- dplyr::select(subdata, -time1, -time2)
#  mdata <- dplyr::bind_rows(first,subdata)
#  mdata <- dplyr::arrange(id,time)
#  return(mdata)
#}


#if(class(event) == "numeric"){
#  if(min(event)==0){
#    event = 1 + event
#  }
#  if(min(event)<0){
#    warning("Event indexes should start at 1")
#  }
#}



