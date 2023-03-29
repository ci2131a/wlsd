# helpful functions to support the package/analysis


#' @export
events2state <- function(data, events, number = TRUE, ...){
  # take events and compute interaction between them
  state <- interaction(data[events], ...)
  # keep the levels of factor from interaction
  old.levels <- levels(state)
  if(number){ # if want numbered states, compute and print
    num.state <- (as.numeric(state))
    print(c("Combination Levels:", old.levels))
    print(paste0(c("Numbered Levels:",levels(ordered(num.state)))))
    return(cbind(data,state=num.state))
  }else{ # otherwise keep the default from interaction
    print(c("Combination Levels:", old.levels))
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
takefirst <- function(data,id,criteria.vector,criteria,...){
  sp <- split(data,data[id],...) # split data by group id
  # take rows up until the first occurrence of the criteria in criteria.vector
  take <- lapply(sp, function(x) if(any(x[criteria.vector]==criteria)) x[1L:which.max(x[criteria.vector]==criteria),] else x, ...)
  # combine it all
  full <- do.call(rbind,take)
  # change the new row numbers
  rownames(full) <- 1L:nrow(full)
  return(full)
}
