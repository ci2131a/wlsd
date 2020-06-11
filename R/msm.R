# functions for converting data sets to the msm format


# transforms data from the counting process notation
# (i.e. times are start, stop) into the longitudinal
# format where time is one column

# a final concern is that counting process notation
# does not really specify baseline variable statuses?
# something to be looked into

surv2msm <- function(data, id, time1, time2, event, cvars = NULL, tvars = NULL){
# i guess I am just carrying over all other variables???

  # input checks
  if(missing(data)) stop("Argument to data not supplied")
  if(missing(id)) stop("Argument to id not supplied")
  if(missing(time1)) stop("Argument to time1 not supplied")
  if(missing(time2)) stop("Argument to time2 not supplied")
  if(missing(event)) stop("Argument to event not supplied")


  cid <- data[id]
  ce <- data[event]

  first <- data[!duplicated(cid),!(names(data) %in% c(time2))]
  names(first)[names(first)==time1] <- "time"
  first[,event] <- min(ce)

  drop <- data[,!(names(data) %in% c(time1))]
  names(drop)[names(drop)==time2] <- "time"
  newdata <- rbind(first,drop)

  sorted <- newdata[order(newdata[id], newdata["time"]),]

  print(first)
  print(drop)
  print(newdata)
  print(sorted)
}

surv2msm(data = mydata, id = "sid", time1 = "start", time2 = "stop", event = "status")




s2m <- function(data, id, time1, time2, event, cvars = NULL, tvars = NULL){

  if(missing(data)) stop("Argument to data not supplied")
  if(missing(id)) stop("Argument to id not supplied")
  if(missing(time1)) stop("Argument to time1 not supplied")
  if(missing(time2)) stop("Argument to time2 not supplied")
  if(missing(event)) stop("Argument to event not supplied")

  first <- dplyr::group_by(data,{{id}})
  first <- dplyr::slice(first,1)
  first <- dplyr::mutate(first,time1 = {{time}})
  first <- dplyr::select(first, -time1,-time2)

  subdata <- dplyr::mutate(data, time2 = time)
  subdata <- dplyr::select(subdata, -time1, -time2)


  mdata <- dplyr::bind_rows(first,subdata)
  mdata <- dplyr::arrange(id,time)

  return(mdata)

}


if(class(event) == "numeric"){
  if(min(event)==0){
    event = 1 + event
  }
  if(min(event)<0){
    warning("Event indexes should start at 1")
  }

}

