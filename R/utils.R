# helpful functions to support the package/analysis


#' @export
events2state <- function(data, events, number = TRUE, drop = TRUE, ...){
  # take events and compute interaction between them
  state <- interaction(data[events], drop = drop, ...)
  # keep the levels of factor from interaction
  old.levels <- levels(state)
  if(number){ # if want numbered states, compute and print
    state <- as.numeric(state)
    cat("Combination Levels:", old.levels,"\n")
    cat("Numbered Levels:", sort(as.numeric(as.factor(old.levels))),"\n")
  }else{ # otherwise keep the default from interaction
    cat("Combination Levels:", old.levels, "\n")
  }
  output <- cbind(data,state)
  names(output) <- make.names(names(output), unique = TRUE)
  return(output)
}



#' @export
basedate <- function(data, id){
  # determine constants and time varying
  var_change <- track_var_change(d = data, i = id, o = NULL)
  consts <- data[union(id,var_change[[1]])]
  # take 1 row of constants
  consts.1row <- consts[!duplicated(consts[id]),,drop = FALSE]
  # take 1 row of time varying
  tvar.1row <- data[union(id,var_change[[2]])][!duplicated(consts[id]),,drop = FALSE]
  # set the 1 row to na
  tvar.1row[!names(tvar.1row) %in% id] <- NA
  # merge with 1 row of constants to give a new row with all columns from original data
  m1 <- merge(consts.1row, tvar.1row, by = id)
  # row bind merge 1 (m1) with original data giving a new row where time varying are NA
  m2 <- rbind(m1,data)
  # sort the data by id and time and rename rows
  sorted <- m2[order(m2[[id]]),]
  rownames(sorted) <- 1:nrow(sorted)
  return(sorted[,names(data)]) # return preserving original order of columns
}

#' @export
takefirst <- function(data, id, criteria.column, criteria, ...){
  sp <- split(data,data[id],...) # split data by group id
  # take rows up until the first occurrence of the criteria in criteria.column
  take <- lapply(sp, function(x) if(any(x[criteria.column]==criteria)) x[1L:which.max(x[criteria.column]==criteria),] else x, ...)
  # combine it all
  full <- do.call(rbind,take)
  # change the new row numbers
  rownames(full) <- 1L:nrow(full)
  return(full)
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
  tvars <- lapply(two, function(y) y[,vapply(y, function(x) any(diff(x) != 0),FUN.VALUE = logical(1)),drop = FALSE]) # checks if diff is nonzero
  #tvars gives the list of time varying variables based on what changes row to row for each individual across all individuals

  # now we take the names from tvars and subset one
  tvars.names <- Reduce(union, lapply(tvars, names))
  # tvars may have nulls for 1 row individuals so take union for all combinations of variable names that are different row to row

  # constant columns
  consts <- lapply(two, function(y) y[,vapply(y, function(x) all(diff(x) == 0),FUN.VALUE = logical(1)),drop = FALSE])
  # checks rows between each individual to make sure there is no difference in rows
  consts.names <- Reduce(intersect, lapply(consts, names)) # constants will always have ID as constant so take intersect
  return(list(consts.names,tvars.names))
}
