# helpful functions to support the package/analysis


#' @export
events2state <- function(data, events, number = TRUE, drop = TRUE, ...){
  # take events and compute interaction between them
  state <- interaction(data[events], drop = drop, ...)
  # keep the levels of factor from interaction
  old.levels <- levels(state)
  if(number){ # if want numbered states, compute and print
    state <- as.numeric(state)
    message("Combination Levels: ", paste(old.levels, collapse = " "))
    message("Numbered Levels: ", paste(sort(as.numeric(as.factor(old.levels))), collapse = " "))
  }else{ # otherwise keep the default from interaction
    message("Combination Levels: ", paste(old.levels, collapse = " "))
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
takefirst <- function(data, id, criteria.column, criteria){
  sp <- split(data,data[id]) # split data by group id
  # take rows up until the first occurrence of the criteria in criteria.column
  take <- lapply(sp, function(x) if(any(x[criteria.column]==criteria)) x[1L:which.max(x[criteria.column]==criteria),] else x)
  # combine it all
  full <- do.call(rbind,take)
  # change the new row numbers
  rownames(full) <- 1L:nrow(full)
  return(full)
}

