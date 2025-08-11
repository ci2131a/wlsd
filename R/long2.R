# longitudinal data format transitions

# function to setup longitudinal data for counting process
#' @export
long2cp <- function(data, id, time, status = NULL, drop = FALSE){

  if(drop){
    # if dropping then let the subsetting get rid of ids with only one row

    # pull all rows except the last as the starts (per group) for all columns
    starts <- data[duplicated(data[id],fromLast = TRUE),, drop = FALSE]
    # all rows except the first are the stops (per group) for id and time columns
    stops <- data[duplicated(data[id]),c(id,time,status), drop = FALSE]
  }
  # if not dropping then dont drop
  else{
    # get first row for everyone in case there are any 1 row ID
    firsts <- data[!duplicated(data[id]),, drop = FALSE]
    # get the rest of the start times for those with more than 1 row
    starts <- data[duplicated(data[id],fromLast = TRUE),, drop = FALSE]
    # merge the 1 row together with the more than 1 row ids
    starts <- merge(firsts,starts, all = TRUE)


    # get the last row for 1 row ids
    lasts <- data[!duplicated(data[id], fromLast = TRUE), c(id,time,status), drop = FALSE]
    # grab the stop times for individuals
    stops <- data[duplicated(data[id]), c(id,time,status), drop = FALSE]
    # merge the lasts with the stops
    stops <- merge(stops,lasts, all = TRUE)
  }

  # add in the time2
  starts[["time2"]] <- stops[[time]]
  # add in the adjusted event column
  for(item in status){
    starts[[item]] <- stops[[item]]
  }
  # reorder columns to put time2 next to the starts time and preserve the rest of the order
  starts <- starts[,c(1:which(colnames(starts) == time), which(colnames(starts) == "time2"),which(colnames(starts) %in% setdiff(colnames(starts),colnames(starts[c(1:which(colnames(starts) == time), which(colnames(starts) == "time2"))]))))]
  # rename the times for start
  names(starts)[names(starts) == time] <- "time1"
  # make sure names are unique
  names(starts) <- make.names(names(starts), unique = TRUE)
  # ensure rownumbers are ordered
  rownames(starts) <- 1L:nrow(starts)

  return(starts)

}

# Functions to setup longitudinal data for count data regression
#' @export
long2count <- function(data, id, event = NULL, state = NULL, FUN = mean, ...){

  # arg checks because we need specific criteria in event & state
  # cannot have both be null because then the function doesn't do anything
  if(is.null(event)&is.null(state)) stop("An argument needs to be supplied to either event or state.")
  if(!is.function(FUN)) stop("FUN must be a function")
  if(length(state)>1) stop("Multiple arguments supplied to state but only needs one")

  weights <- get.weights(d=data,i=id) # get weights
  es.counts <- es.count(d=data,i=id,e=event,s=state) # event and or state counts
  # merge 1
  m1 <- merge(es.counts,weights, by = id)

  # test if there are other columns to split
  if(length(setdiff(names(data),c(id, event, state))) == 0){
    # do something for only the id and event/state columns that need to be counted
    return(m1) # presumably return m1
  }
  # else: try to split columns into constant and time-varying
  tryCatch({
    # split other variables into constant or non-constant category
    # arguments supplied to event and or state are excluded from the list
    var_type_list <- track_var_change(d=data,i=id,o=c(event,state))

    # for any constants, take the first row for aggregated data frame (all constant means all rows are the same)
    consts.vars <- data[union(id,var_type_list[[1]])] # if an omit option is added then those variable names can be included here
    first.consts <- consts.vars[!duplicated(consts.vars[id],fromLast = F),,drop=FALSE] # ensure 1 row of constants taking the first row of each individual

    # time varying handling
    # rename list element for use in for loop
    time_names <- var_type_list[[2]]
    all.tvars <- data[union(id,time_names)]
    agg.tvar <- stats::aggregate(all.tvars[!names(all.tvars) %in% id], by = all.tvars[id], FUN = FUN, ...)

    m2 <- merge(m1, first.consts, by = id)
    m3 <- merge(m2, agg.tvar, by = id)

  }, error = function(e){
    warning(e,"\nError in splitting columns -- treating all columns as constant.")
    noncoerced.vars <- data[!duplicated(data[id], fromLast = F),!names(data) %in% c(event, state),drop=FALSE]
    m3 <- merge(m1, noncoerced.vars, by = id)
  }, finally = {
    # return preserving original order of columns + new cols
    output <- m3[,intersect(union(names(data),names(m3)),names(m3))]
    # ensure that column names are unique
    names(output) <- make.names(names(output), unique = TRUE)
    sorted <- output[order(output[[id]]),, drop = FALSE]
    return(sorted)
  })

}


