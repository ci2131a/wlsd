check_data <- function(data,id,time,status,baseline.date = NULL){

  if(missing(data)) stop("Missing argument to data")
  if(missing(id)) stop("Missing argument to id")
  if(missing(time)) stop("Missing argument to time")
  if(missing(status)) stop("Missing argument to status")
  n <- length(unique(id))


  if(class(time) != "Date"){
    newtime <- NULL
    newtime <- try(as.Date(time))

  }
  if(!is.null(baseline.date)){
    if(class(baseline.date)!= "Date"){
      newbase <- NULL
      newbase <- try(as.Date(baseline.date))
    }
  }



}


ABD <- function(data, baseline.data, follow.up){

}

