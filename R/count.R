# Functions to setup longitudinal data for count data regression

count_data <- function (data, id, event = NULL, state = NULL, tvars = NULL, tfun = "mean"){
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





tvarfun <- function(data,tvars,tfun){
  aggregate(vframe[,names(vframe) %in% c("meds","state")],by=list(vframe[,"id"]), median)

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

