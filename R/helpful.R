



check_data <- function(data,id,time,event,baseline.date = NULL){

  if(missing(data)) stop("Missing argument to data")
  if(missing(id)) stop("Missing argument to id")
  if(missing(time)) stop("Missing argument to time")
  if(missing(event)) stop("Missing argument to status")

  newtime <- parse_date(data,time)
  newevent <- makeevent(newtime,event)

  if(!is.null(baseline.date)){
    newbase <- basedate(newtime, id, time, event, baseline.date)
    return(newbase)
  }else{
    return(newevent)
  }

}



parse_date <- function(data, time){
  if(class(data[[time]])!="Date"){
    newtime <- NULL
    newtime <- try(as.Date(data[[time]]))
    if(!is.null(newtime)){
      data[time] <- newtime
    }else{
      warning("Could not parse date")
    }
  }
  data
}



basedate <- function(data,id,time,event,baseline.date){
  # extract id and event columns
  cid <- data[id]
  ce <- data[event]

  # subset first observation of each person
  first <- data[!duplicated(cid),]
  # change first date to be baseline date
  first[time] <- first[baseline.date]
  # ensure the starting status is the same as the first event
  first[,event] <- min(ce)
  # combine the stop times with the first start time
  newdata <- rbind(first,data)
  # sort the data by id and time
  sorted <- newdata[order(newdata[id], newdata[time]),]
  sorted

}


makeevent <- function(data, events){
  data$event <- interaction(data[events])
  data
}





