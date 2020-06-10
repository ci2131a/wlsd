mydata <- data.frame(sid = c(1,1,1,2,2,3),
                       start = c(0,63,128,0,32,0),
                       stop = c(63,128,156,32,59,28),
                       status = c(0,0,1,0,0,1),
                       var1 = c(10,10,10,6,6,3),
                       var2 = c(1,2,3,1,2,1))



surv2msm <- function(data, id, time1, time2, event, cvars = NULL, tvars = NULL){
  if(missing(data)) stop("Argument to data not supplied")
  if(missing(id)) stop("Argument to id not supplied")
  if(missing(time1)) stop("Argument to time1 not supplied")
  if(missing(time2)) stop("Argument to time2 not supplied")
  if(missing(event)) stop("Argument to event not supplied")

  print(data)
  print(id)
  #print(time1)
  #print(time2)
  #print(event)

  first <- data[!duplicated(id),]
  #first
  #drop <- subset(first,select = -c(time2))
  #drop <- first[,-first$time2]
  return(first)
}



first <- mydata[!duplicated(mydata$sid),]
drop <- subset(first, select = -stop)
names(drop)[names(drop) == "start"] <- "end"

surv2msm(data = mydata, id = mydata$sid, time1 = "start", time2 = "stop", event = "status")


mydata[[sid]]
mydata$sid





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

