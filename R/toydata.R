# toy data sets
# use to test the functions

table1 <- data.frame(id = c(1,1,1,1,2,2,2,3,3),
                     time = c(0,31,64,96,0,33,59,0,28),
                     event = c(0,0,0,1,0,0,1,0,1))


table2 <- data.frame(id = c(1,1,1,2,2,3),
                              time1 = c(0,31,64,0,33,0),
                              time2 = c(31,64,96,33,59,28),
                              event = c(0,0,1,0,0,1))


table3 <- data.frame(id = c(1,1,1,2,2,3),
                     time1 = c(0,31,64,0,33,0),
                     time2 = c(31,64,96,33,59,28),
                     event = c(0,0,1,0,0,1),
                     age = c(46,46,46,39,39,57),
                     meds = c(0,1,2,0,1,2))


table4 <- data.frame(sid = c(1,2,3),
                     time1 = c(0,0,0),
                     time2 = c(96,33,28),
                     status = c(1,0,1))


table0 <- data.frame(id = c(1,1,1,2,2,3),
                    time1 = c(0,31,64,0,33,0),
                    time2 = c(31,64,96,33,59,28),
                    event1 = c(0,0,1,0,0,1),
                    event2 = c(0,1,1,0,1,1),
                    state = c(0,1,2,0,1,2),
                    age = c(46,46,46,39,39,57),
                    meds = c(0,1,2,0,1,2))
