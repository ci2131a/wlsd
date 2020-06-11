check_data <- function(data,id,time,status,baseline.date = NULL){

  if(missing(data)) stop("Missing argument to data")
  if(missing(id)) stop("Missing argument to id")
  if(missing(time)) stop("Missing argument to time")
  if(missing(status)) stop("Missing argument to status")
  #n <- length(unique(data[id]))
  newtime <- NULL
  newbase <- NULL

  if(class(time) != "Date"){
    newtime <- try(as.Date(time))

  }
  if(!is.null(baseline.date)){
    if(class(baseline.date)!= "Date"){
      newbase <- try(as.Date(baseline.date))
    }
  }



}



