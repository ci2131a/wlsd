



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


# function to attempt to convert dates to numbers
# trys for class character to date then numeric
# or date to numeric
parse_date <- function(data, time){
  if(class(data[[time]])!="character"){
    newtime <- try(as.Date(data[[time]]))
    if(class(newtime)!="try-error"){
      data[time] <- newtime
    }else{
      stop("Could not parse date")
    }
  }
  data$Ntime <- as.numeric(as.Date(data[time]))-as.numeric(min(as.Date(data[time])))
  return(data)
}


#' @export
basedate <- function(data,id,time,event,baseline.date,tvars = NULL){
  # extract id and event columns
  cid <- data[id]
  ce <- data[event]

  # subset first observation of each person
  first <- data[!duplicated(cid),]
  # change first date to be baseline date
  first[time] <- first[baseline.date]
  # ensure the starting status is the same as the first event
  first[,event] <- min(ce)
  # change the first value of time varying variables to be NA
  first[tvars] <- NA
  # combine the stop times with the first start time
  newdata <- rbind(first,data)
  # sort the data by id and time and rename rows
  sorted <- newdata[order(newdata[id], newdata[time]),]
  rownames(sorted) <- 1:nrow(sorted)
  return(sorted)

}

#' @export
events2state <- function(data, events, number = TRUE){
  states <- interaction(data[events])
  num.levels <- as.numeric(factor(levels(states)))[factor(levels(states))]
  levels <- levels(states)
  if(number){
    num.states <- as.numeric(states)
    data$new.state <- num.states
    guide <- cbind(levels,num.levels)
  }else{
    data$new.state <- states
    guide <- cbind(levels)
  }
  return(list(newdata = data,guide = guide))
}

