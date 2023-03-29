# toy data sets
# use to test the functions

simple_long <- data.frame(id = c(1,1,1,1,2,2,2,3,3),
                          time = c(0,31,64,96,0,33,59,0,28),
                          state = c(0,0,0,1,0,0,0,0,1))


simple_cp <- data.frame(id = c(1,1,1,2,2,3),
                        time1 = c(0,31,64,0,33,0),
                        time2 = c(31,64,96,33,59,28),
                        state = c(0,0,1,0,0,1))


covar_long <- data.frame(id = c(1,1,1,1,2,2,2,3,3),
                          time = c(0,31,64,96,0,33,59,0,28),
                          state = c(0,0,0,1,0,0,0,0,1),
                          c = c(46,46,46,46,39,39,39,57,57),
                          tv = c(0,0,1,2,0,1,2,0,2))


covar_cp <- data.frame(id = c(1,1,1,2,2,3),
                        time1 = c(0,31,64,0,33,0),
                        time2 = c(31,64,96,33,59,28),
                        state = c(0,0,1,0,0,1),
                        c = c(46,46,46,39,39,57),
                        tv = c(0,1,2,1,2,2))


cp2long_results <- data.frame(id = c(1,1,1,1,2,2,2,3,3),
                              time = c(0,31,64,96,0,33,59,0,28),
                              state = c(NA,0,0,1,NA,0,0,NA,1))
















toydata <- data.frame(id = c(1,1,1,2,2,3),
                    time1 = c(0,31,64,0,33,0),
                    time2 = c(31,64,96,33,59,28),
                    event1 = c(0,0,1,0,0,1),
                    event2 = c(0,1,1,0,1,1),
                    state = c(0,1,2,0,1,2),
                    age = c(46,46,46,39,39,57),
                    meds = c(0,1,2,0,1,2))

basedata <- data.frame(id = c(1,1,1,2,2,3),
                     base = c(0,0,0,10,10,0),
                     time1 = c(31,64,96,33,59,28),
                     event = c(0,0,1,0,0,1),
                     age = c(46,46,46,39,39,57),
                     state = c(0,1,2,0,1,2))