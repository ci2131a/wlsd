# toy data sets
# to use to test the functions


table1 <- data.frame(sid = c(1,1,1,2,2,3),
                              start = c(0,31,64,0,33,0),
                              stop = c(31,64,96,33,59,28),
                              status = c(0,0,1,0,0,1))


table2 <- data.frame(sid = c(1,1,1,2,2,3),
                              start = c(0,31,64,0,33,0),
                              stop = c(31,64,96,33,59,28),
                              status = c(0,0,1,0,0,1),
                              age = c(46,46,46,39,39,57),
                              meds = c(0,1,2,0,1,2))

table3 <- data.frame(sid = c(1,2,3),
                              time = c(96,33,28),
                              status = c(1,0,1))
