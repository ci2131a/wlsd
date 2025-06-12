# longitudinal data format transitions

# function to setup longitudinal data for counting process
#' @export
long2cp <- function(data, id, time, drop = FALSE){

  # pull all rows except the last as the starts (per group)
  starts <- data[duplicated(data[id],fromLast = T),c(id,time)]
  # all rows except the first are the stops (per group)
  stops <- data[duplicated(data[id]),]
  # this data frame will have all other columns for everything except first row (added later)
  elses <- data[duplicated(data[id]),!names(data) %in% c(id,time),drop = FALSE]

  # rename the times for start and stop
  names(starts)[names(starts) == time] <- "time1"
  names(stops)[names(stops) == time] <- "time2"

  # combine everything
  newdata1 <- starts
  newdata1$time2 <- stops$time2
  newdata2 <- cbind(newdata1,elses)

  # if we drop the groups with 1 row the above code will ignore those so we can re-index and return
  if(drop){

    # change index
    row.names(newdata2) <- 1:dim(newdata2)[1]
    # make sure names are unique
    names(newdata2) <- make.names(names(newdata2), unique = TRUE)

    return(newdata2)
  }
  else{ # otherwise...

    # pull out groups which have 1 row
    one.rowers <- data[which(data[[id]] %in% newdata2[[id]] == FALSE),]
    # make new column for stop time which is the same as time1
    one.rowers["time2"] <- one.rowers[time]
    # rename the original time to be the time1
    names(one.rowers)[names(one.rowers) == time] <- "time1"
    # match order of one rows with the newdata2
    one.rowers <- one.rowers[names(newdata2)]
    # column bind the 2 data sets since columns should match
    full.data <- rbind(newdata2, one.rowers)

    # change the index
    row.names(full.data) <- 1:dim(full.data)[1]
    # change the names
    names(full.data) <- make.names(names(full.data), unique = TRUE)

    return(full.data)
  }

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


