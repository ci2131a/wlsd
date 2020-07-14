# Functions to setup longitudinal data for count data regression

long2count <- function (data, id, event = NULL, state = NULL, tvars = NULL, tfun = "mean"){
  # input checks
  if(missing(data)) stop("Argument to data not supplied")
  if(missing(id)) stop("Argument to id not supplied")
  if(!is.null(event)&!is.null(state)) stop("Only one argument can be supplied in event/state")

  if(!is.null(event)){
    if (requireNamespace("dplyr", quietly = TRUE)) {
      ge<-dplyr::group_by(data,id)
      sums <- dplyr::summarise_at(ge,dplyr::vars(event),sum)
      addweight <- dplyr::mutate(ge, weight = length(id))
      select <- dplyr::select(addweight,-event)
      filter <- dplyr::filter(select,dplyr::row_number()==1)
      newdata <- merge(sums,filter,by = "id")
      newname = paste(event,".counts",sep = "")
      newdata <- dplyr::rename(newdata, !!newname := event)
      return(newdata)
    } else {
      # using base
      return("Not done yet")

    }
  }else if(!is.null(state)){
    return("Not done yet")

  }


}



newdata <- aggregate(table0[,names(table0) %in% "meds"],by=list(table0[,"id"]), "sum")


tvarfun <- function(data,id,tvars,tfun){
  tdata <- data[,names(data) %in% c(id, tvars)]
  newdata <- aggregate(tdata[,names(tdata) %in% tvars],by=list(data[,id]), tfun)
  colnames(newdata)[1] <- id
  return(newdata)

}
# code for dplyr
#ge<-dplyr::group_by(table0,"id")
#sums <- dplyr::summarise_at(ge,dplyr::vars(event1,event2),sum)
#addweight <- dplyr::mutate(ge, weight = length(id))
#select <- dplyr::select(addweight,-event1,-event2)
#filter <- dplyr::filter(select,dplyr::row_number()==1)
#newdata <- merge(sums,filter,by = "id")







#%>% <- magrittr::`%>%`


#library(dplyr)
#table0 `pipe`
#  group_by(id) `pipe`
#  summarise_at(vars(event1,event2),sum)


a<-dplyr::group_by(table0,id)
dplyr::summarise_at(a,dplyr::vars(event1,event2),sum)


#table0 %>%
#  group_by(id) %>%
#  summarise_at(vars(event1,event2),sum)





#colSums(c(table0$event1,table0$event2))
#summarise(sum(event1,event2))

