# Functions to setup longitudinal data for count data regression

long2count <- function (data, id, event = NULL, state = NULL, tvars = NULL, tfun = "mean"){
  # input checks
  if(missing(data)) stop("Argument to data not supplied")
  if(missing(id)) stop("Argument to id not supplied")
  if(missing(event)) stop("Argument to event not supplied")
  if(!is.null(event)&!is.null(state)) stop("Only one argument can be given to event/state")

  if(!is.null(event)){
    if (requireNamespace("dplyr", quietly = TRUE)) {
      ge<-dplyr::group_by(data,id)
      sums <- dplyr::summarise_at(ge,dplyr::vars(event),sum)
      addweight <- dplyr::mutate(ge, weight = length(id))
      select <- dplyr::select(addweight,-event)
      filter <- dplyr::filter(select,dplyr::row_number()==1)
      newdata <- merge(sums,filter,by = "id")
    } else {
      # using base

    }
  }else if(!is.null(state)){

  }


}



newdata <- aggregate(table0[,names(table0) %in% "meds"],by=list(table0[,"id"]), "sum")


tvarfun <- function(data,id,tvars,tfun){
  tdata <- data[,names(data) %in% c(id, tvars)]
  newdata <- aggregate(tdata[,names(tdata) %in% tvars],by=list(data[,id]), tfun)

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

