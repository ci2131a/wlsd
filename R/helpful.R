# helpful functions to support the package/analysis


#' @export
events2state <- function(data, events, number = TRUE, ...){
  # take events and compute interaction between them
  state <- interaction(data[events], ...)
  # keep the levels of factor from interaction
  old.levels <- levels(state)
  if(number){ # if want numbered states, compute and print
    num.state <- (as.numeric(state))
    print(c("Old Levels:", old.levels))
    print(c("New Levels:",levels(ordered(num.state))))
    return(cbind(data,state=num.state))
  }else{ # otherwise keep the default from interaction
    print(old.levels)
    return(cbind(data,state))
  }
}



#' @export
basedate <- function(data,id,baseline.date,time,status,tvars = NULL){

  # input checks
  if(missing(data)) stop("Argument to data not supplied")
  if(missing(id)) stop("Argument to id not supplied")
  if(missing(baseline.date)) stop("Argument to baseline.date not supplied")
  if(missing(time)) stop("Argument to time not supplied")
  #if(missing(status)) stop("Argument to status not supplied")

  # extract id and event columns
  cid <- data[id]
  #ce <- data[event]

  # subset first observation of each person
  first <- data[!duplicated(cid),]
  # change first date to be baseline date
  first[time] <- first[baseline.date]
  # ensure the starting status is the same as the first event
  #first[,event] <- min(ce)
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
takefirst <- function(data, id, event, value){

  if(missing(data)) stop("Missing argument to data")
  if(missing(id)) stop("Missing argument to id")
  if(missing(event)) stop("Missing argument to event")
  if(missing(value)) stop("Missing argument to value")

  res <- by(data,data[id],
            function(x)
              if(any(x[event]==value)) x[1:which.max(x[event]==value),] else x)
  df <- do.call(rbind, res)
  rownames(df) <- 1:nrow(df)
  return(df)

}
