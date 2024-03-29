# longitudinal data format transitions

# function to setup longitudinal data for counting process
#' @export
long2cp <- function(data, id, time){

  First <- data[duplicated(data[id],fromLast = T),c(id,time)]
  Last <- data[duplicated(data[id]),]
  Else <- data[duplicated(data[id]),!names(data) %in% c(id,time),drop = FALSE]

  names(First)[names(First) == time] <- "time1"
  names(Last)[names(Last) == time] <- "time2"


  newdata1 <- First
  newdata1$time2 <- Last$time2
  newdata2 <- cbind(newdata1,Else)

  row.names(newdata2) <- 1:dim(newdata2)[1]

  return(newdata2)

}


# Functions to setup longitudinal data for count data regression
#' @export
long2count <- function(data, id, event = NULL, state = NULL, FUN, ...){

  # arg checks because we need specific criteria in event & state
  # cannot have both be null because then the function doesn't do anything
  if(is.null(event)&is.null(state)) stop("An argument needs to be supplied to either event or state.")
  if(missing(FUN)) FUN <- mean

  weights <- get.weights(d=data,i=id) # get weights
  es.counts <- es.count(d=data,i=id,e=event,s=state) # event and or state counts
  var_type_list <- track_var_change(d=data,i=id,o=c(event,state)) # split other variables into constant or non-constant category
  # arguments supplied to event and or state are excluded from the list
  consts.vars <- data[union(id,var_type_list[[1]])] # if an omit option is added then those variable names can be included here
  first.consts <- consts.vars[!duplicated(consts.vars[id],fromLast = F),,drop=FALSE] # ensure 1 row of constants taking the first row of each individual
  all.tvars <- data[union(id,var_type_list[[2]])]
  agg.tvar <- tvarfun(d = all.tvars, i = id, f = FUN, ...) # aggregate the non-constants
  # several merge steps
  m1 <- merge(es.counts,weights, by = id)
  m2 <- merge(m1, first.consts, by = id)
  m3 <- merge(m2, agg.tvar, by = id)
  # return preserving original order of columns + new cols
  output <- m3[,intersect(union(names(data),names(m3)),names(m3))]
  # ensure that column names are unique
  names(output) <- make.names(names(output), unique = TRUE)
  return(output)
}

# internal function for long2count() - 1
get.weights <- function(d,i){
  weight <- stats::aggregate(x = d[i], by = d[i], FUN = length)
  colnames(weight) <- c(i,"count.weight")
  return(weight)
}

# internal function for long2count() - 2
es.count<-function(d, i, e, s){
  if(!is.null(s)){ # count the different levels for state
    cstate <- stats::aggregate(x = d[,c(i,s)], by = list(d[[i]],d[[s]]), drop = FALSE, FUN = length)
    cstate <- cstate[,c(1,2,4)]
    colnames(cstate) <- c(i, s, paste(s,".counts", sep = ""))
    cstate[is.na(cstate)] <- 0
    if(!is.null(e)){ # counting number of events if state is also supplied
      cevent <- stats::aggregate(x = d[e], by = d[i], FUN = sum)
      colnames(cevent) <- c(i, paste(e,".counts", sep = ""))
      sne <- merge(cstate,cevent, by = i)
      return(sne)
    }
    return(cstate) # state and no event return state counts
  }
  cevent <- stats::aggregate(x = d[e], by = d[i], FUN = sum)
  colnames(cevent) <- c(i, paste(e,".counts", sep = ""))
  return(cevent) # no state but event then return event counts
}



# internal function for long2count() - 4
tvarfun <- function(d,i,f,...){
  # aggregate the non-constant variables into constant based on function
  newdata <- stats::aggregate(d[!names(d) %in% i],by=d[i], FUN = f, ...)
  return(newdata)
}

