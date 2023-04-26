

#' @export
cp2long <- function(data, id, time1, time2, status, fill = FALSE, msmstate = FALSE){

  if (fill){
    # split constant and time varying variables
    var_list <- track_var_change(d = data, i = id, o = NULL)
    const_var <- var_list[[1]]
    t_var <- var_list[[2]]

    first <- data[,names(subdata) %in% union(c(id,time1),names(const_var))]
    names(first)[names(first) == time1] <- "time"
    last <- subdata[,(!names(subdata) %in% union(time1,names(const_var))) & id]
    names(last)[names(last) == time2] <- "time"
    newdata <- merge(first,last,by = c(id,"time"), all = TRUE)
  }
  else {
    first <- data[,names(data) %in% c(id,time1)]
    names(first)[names(first) == time1] <- "time"
    last <- data[,!names(data) %in% c(time1)]
    names(last)[names(last) == time2] <- "time"
    newdata <- merge(first,last,by = c(id,"time"), all = TRUE)
  }

  if(0 %in% min(data[[status]], na.rm = TRUE) & msmstate){
    newdata[status] <- newdata[status] + 1
  }
  else if(msmstate){
    warning("state values not changed in msmstate")
  }
  # returns output similar to the timeline data described in survival vignette
  # all timevarying covariates are required to be specified to avoid duplicated rows in merge
  return(newdata)
}






