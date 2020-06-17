check_data <- function(data,id,time,event,baseline.date = NULL){

  if(missing(data)) stop("Missing argument to data")
  if(missing(id)) stop("Missing argument to id")
  if(missing(time)) stop("Missing argument to time")
  if(missing(event)) stop("Missing argument to status")
  #n <- length(unique(data[id]))
  newtime <- NULL
  newbase <- NULL

  #if(class(time) != "Date"){
  #  newtime <- try(as.Date(time))
  #}
  if(!is.null(baseline.date)){
    basedate(data, id, time, event, baseline.date)

  }
  print(sorted)
}


#if(class(baseline.date)!= "Date"){
#  newbase <- try(as.Date(baseline.date))
#}

#check_data(data = lbp, id = "sid", baseline.date = "base", time = "follow", event = "status")


parse_date <- function(data, time){
  tv <- data[time]
  if(class(tv)!="Date"){
    newtime <- NULL
    newtime <- try(as.Date(tv))
    if(!is.null(newtime)){
      data[time] <- newtime
    }
  }
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


}

v <- c("event1", "event2", "event3")
newlist <- list(NULL)
i <- 1
for (element in v){
  newlist[i] <- eventdata[element]
  i <- i+1
}

makeevent <- function(data, events){
  newlist <- list(NULL)
  i <- 1
  for (element in events){
    newlist[i] <- data[element]
    i <- i+1
  }
  sapply(newlist, interaction())


}

makeevent <- function(data, event, ...){
  interaction(data[[event]], data[[...]])
}

makeevent(eventdata,v)
mapply(interaction, newlist)
