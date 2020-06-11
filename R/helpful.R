check_data <- function(data,id,time,status){
  if(missing(data)) stop("Missing argument to data")
  if(missing(id)) stop("Missing argument to id")
  if(missing(time)) stop("Missing argument to time")
  if(missing(status)) stop("Missing argument to status")
  n <- length(unique(id))

  if(class(time) == "Date"){

  }else{
    try(time = as.Date(time))
  }
}


