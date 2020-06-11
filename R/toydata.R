# toy data sets
# to use to test the functions

mydata <- data.frame(sid = c(1,1,1,2,2,3),
                     start = c(0,63,128,0,32,0),
                     stop = c(63,128,156,32,59,28),
                     status = c(0,0,1,0,0,1),
                     var1 = c(10,10,10,6,6,3),
                     var2 = c(1,2,3,1,2,1))



eventdata <- data.frame(event1 = c(0,0,0,1,1),
                        event2 = c(0,0,1,0,1),
                        event3 = c(0,2,1,0,1))



lbp <- data.frame(sid = c(1,1,1,2,2,3),
                  base = c(0,0,0,10,10,15),
                  follow = c(63,128,156,32,59,28),
                  status = c(0,0,1,0,0,1),
                  var1 = c(10,10,10,6,6,3),
                  var2 = c(1,2,3,1,2,1))



N   <- 5
vec <- c(-1, 1)
lst <- lapply(numeric(N), function(x) vec)
expand.grid(lst)
as.matrix(expand.grid(lst))
