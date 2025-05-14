
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
      # order by id then state
      sorted <- sne[order(sne[[i]], sne[[s]]),,drop=FALSE]
      # reset row numbers
      rownames(sorted) <- 1:nrow(sorted)
      return(sorted)
    }
    else{
      # order by id then state
      sorted <- cstate[order(cstate[,i], cstate[,s]),,drop=FALSE]
      # reset row numbers
      rownames(sorted) <- 1:nrow(sorted)
      return(sorted) # state and no event return state counts
    }
  }
  else{
    tryCatch({
      cevent <- stats::aggregate(x = d[e], by = d[i], FUN = sum)
    }, error = function(e){
      message("Could not aggregate event -- did you mean to use the state argument?")
      #message(e)
    }, finally = {
      cevent <- stats::aggregate(x = d[e], by = d[i], FUN = sum)
      colnames(cevent) <- c(i, paste(e,".counts", sep = ""))
      return(cevent) # no state but event then return event counts
    })
  }
}



# internal function for long2count() - 3
# internal function for cp2long() - 1
track_var_change <- function(d, i, o){
  # variables to omit
  if(!is.null(o)){
    ov <- as.vector(o)
    one <- d[!names(d) %in% ov]
  }
  else{
    one <- d
  }
  # splitting by id
  two <- split(one,one[i]) # a list where each element is a dataframe of rows for the id
  # time varying columns check
  tvars <- lapply(two, function(y) y[,vapply(y, function(x) any(diff(as.numeric(as.factor(x))) != 0, na.rm = TRUE),FUN.VALUE = logical(1)),drop = FALSE]) # checks if diff is nonzero
  #tvars gives the list of time varying variables based on what changes row to row for each individual across all individuals

  # now we take the names from tvars and subset one
  tvars.names <- Reduce(union, lapply(tvars, names))
  # tvars may have nulls for 1 row individuals so take union for all combinations of variable names that are different row to row

  # after computing tvars, the constants will be the difference between the tvars and original names
  consts.names <- setdiff(names(one), tvars.names)
  # check the tvar names to see if any return character(0) (will ocurr if there are no tvars)
  if(length(tvars.names) == 0){
    # rename character 0 to null (it has length 0)
    tvars.names <- NULL
  }
  # return output
  return(list(consts.names,tvars.names))

}



# internal function for long2count() - not used now
tvarfun <- function(d,i,f,...){
  # aggregate the non-constant variables into constant based on function
  newdata <- stats::aggregate(d[!names(d) %in% i],by=d[i], FUN = f, ...)
  return(newdata)
}
