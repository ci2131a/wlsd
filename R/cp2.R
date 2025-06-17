
#' @export
cp2long <- function(data, id, time1, time2, fill = FALSE){


  if(fill){
    tryCatch({
      # split constant and time varying variables
      var_list <- track_var_change(d = data, i = id, o = NULL)
      const_var <- var_list[[1]] # pull out constants
      t_var <- var_list[[2]] # pull out time

      # select first with time to add on top
      first.row <- data[!duplicated(data[id]),]
      names(first.row)[names(first.row) == time1] <- "time"
      first.row <- first.row[,!names(first.row) %in% time2]
      first.row[,setdiff(t_var,c(time1, time2))] <- NA

      # select the data except time1 to be used as the bottom portion of long form
      last <- data[,!names(data) %in% time1]
      # rename time to match with other
      names(last)[names(last) == time2] <- "time"

      # merge together
      newdata <- merge(first.row,last, all = TRUE)


    }, error = function(e){
      warning(e,"\nError in filling columns -- leaving values as is.")
      first <- data[,names(data) %in% c(id,time1)]
      names(first)[names(first) == time1] <- "time"
      last <- data[,!names(data) %in% c(time1)]
      names(last)[names(last) == time2] <- "time"
      newdata <- merge(first,last,by = c(id,"time"), all = TRUE)
    })

  }
  else {
    first <- data[,names(data) %in% c(id,time1)]
    names(first)[names(first) == time1] <- "time"
    last <- data[,!names(data) %in% c(time1)]
    names(last)[names(last) == time2] <- "time"
    newdata <- merge(first,last,by = c(id,"time"), all = TRUE)
  }
  # make the names unique if time exists
  names(newdata) <- make.names(names(newdata), unique = TRUE)

  return(newdata)
}
