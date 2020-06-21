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



table1 <- mydata <- data.frame(sid = c(1,1,1,2,2,3),
                              start = c(0,31,64,0,33,0),
                              stop = c(31,64,126,33,59,28),
                              status = c(0,0,1,0,0,1))


table2 <- mydata <- data.frame(sid = c(1,1,1,2,2,3),
                              start = c(0,31,64,0,33,0),
                              stop = c(31,64,96,33,59,28),
                              status = c(0,0,1,0,0,1),
                              sex = c(0,0,0,1,1,0),
                              age = c(46,79,0,8766,8799,0))

table3 <- mydata <- data.frame(sid = c(1,2,3),
                              start = c(0,0,0),
                              stop = c(126,33,28),
                              status = c(1,0,1))
