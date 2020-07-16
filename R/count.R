# Functions to setup longitudinal data for count data regression
#' @export
long2count <- function (data, id, event = NULL, state = NULL, tvars = NULL, tfun = "mean"){
  # input checks
  if(missing(data)) stop("Argument to data not supplied")
  if(missing(id)) stop("Argument to id not supplied")
  if(!is.null(event)&!is.null(state)) stop("Only one argument can be supplied in event/state")

  if(!is.null(event)){
    # for use of dplyr
    # the below DOES work
    # it will not accept vector events
    #if (requireNamespace("dplyr", quietly = TRUE)) {
    #  ge<-dplyr::group_by(data,id)
    #  sums <- dplyr::summarise_at(ge,dplyr::vars(event),sum)
    #  addweight <- dplyr::mutate(ge, weight = length(id))
    #  select <- dplyr::select(addweight,-event)
    #  filter <- dplyr::filter(select,dplyr::row_number()==1)
    #  newdata <- merge(sums,filter,by = "id")
    #  newname <- paste(event,".counts",sep = "")
    #  newdata <- dplyr::rename(newdata, !!newname := event)
    #  if(!is.null(tvars)){
    #    tframe <- tvarfun(data,id,tvars,tfun)
    #    newdata[tvars] <- tframe[tvars]
    #  }
    #  return(newdata)
    #} else {


      # using base instead
      weight <- aggregate(data[id], by = data[id], length)
      colnames(weight) <- c(id,"weight")
      tevent <- aggregate(data[event], by = data[id], sum)
      colnames(tevent) <- c(id, paste(event,".counts", sep = ""))
      tvar <- data[!duplicated(data[id]),!names(data) %in% c(event,tvars)]
      newdata1 <- merge(tevent, tvar, by = id)
      newdata <- merge(newdata1, weight, by = id)
      if(!is.null(tvars)){
        tframe <- tvarfun(data,id,tvars,tfun)
        newdata[tvars] <- tframe[tvars]
      }
      return(newdata)

    #}
  }else if(!is.null(state)){
    return("Not done yet")

  }


}



tvarfun <- function(data,id,tvars,tfun){
  tdata <- data[,names(data) %in% c(id, tvars)]
  newdata <- aggregate(tdata[,names(tdata) %in% tvars],by=list(data[,id]), tfun)
  colnames(newdata) <- c(id,tvars)
  return(newdata)

}


surv2count <- function(data, id, event = NULL, state = NULL, tvars = NULL, tfun = "mean"){


}





