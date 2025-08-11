
#' @export
cp2long <- function(data, id, time1, time2, status = NULL, fill = FALSE){

  # take everything except the stop and status -- base data frame
  starts <- data[, ! names(data) %in% c(time2, status), drop = FALSE]
  # preserve the location of the first time column (used for order preservation later)
  col_order <- data[0L, setdiff(names(data), time2)]
  names(col_order)[names(col_order) == time1] <- "time"
  # rename time1 for preparation for merge
  names(starts)[names(starts) == time1] <- "time"

  # to try to keep constants everywhere
  if(fill){
    tryCatch({
      # determine what is constant
      var_list <- track_var_change(d = data, i = id, o = NULL)
      const_var <- var_list[[1]] # pull out constants

      # include the constant column names in the lasts so everything is filled in merge
      lasts <- data[, c(const_var, time2, status), drop = FALSE]
      names(lasts)[names(lasts) == time2] <- "time"
      newdata <- merge(starts, lasts, by = c(id,"time", const_var), all = TRUE)
    },error = function(e){
      # if we error just skip
      warning(e,"\nError in filling columns -- leaving values as is.")
      lasts <- data[, c(id, time2, status), drop = FALSE]
      names(lasts)[names(lasts) == time2] <- "time"
      newdata <- merge(starts, lasts, by = c(id,"time"), all = TRUE)
    })
  }
  else{
    # if not filling then leave without columns
    lasts <- data[, c(id, time2, status), drop = FALSE]
    names(lasts)[names(lasts) == time2] <- "time"
    newdata <- merge(starts, lasts, by = c(id,"time"), all = TRUE)
  }

  # return preserving original order of columns + new cols
  newdata <- newdata[,names(col_order)]
  # make columns unique
  names(newdata) <- make.names(names(newdata), unique = TRUE)
  # change rownames
  rownames(newdata) <- 1L:nrow(newdata)
  return(newdata)
}
