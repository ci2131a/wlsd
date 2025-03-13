# toy data sets
# use to test the functions

long_data <- data.frame(id = c(1,1,1,1,2,2,2,3,3),
                         time = c(0,31,64,96,0,33,59,0,28),
                         state = c(0,0,0,1,0,0,0,0,1),
                         c = c(46,46,46,46,39,39,39,57,57),
                         tv = c(0,0,1,2,0,1,2,0,2))

cp_data <- data.frame(id = c(1,1,1,2,2,3),
                       time1 = c(0,31,64,0,33,0),
                       time2 = c(31,64,96,33,59,28),
                       state = c(0,0,1,0,0,1),
                       c = c(46,46,46,39,39,57),
                       tv = c(0,1,2,1,2,2))

cp2long_results <- data.frame(id = c(1,1,1,1,2,2,2,3,3),
                              time = c(0,31,64,96,0,33,59,0,28),
                              state = c(NA,0,0,1,NA,0,0,NA,1),
                              c = c(NA,46,46,46,NA,39,39,NA,57),
                              tv = c(NA,0,1,2,NA,1,2,NA,2))



#long2count() sets

# state variable treated as an event
event_count <- data.frame(id = c(1,2,3),
                            time = c(47.75,30.66667,14),
                            c = c(46,39,57),
                            tv = c(0.75,1,1),
                            state.counts = c(1,0,1),
                            count.weight = c(4,3,2))

# state variable treated as a state
state_count <- data.frame(id = c(1,1,2,2,3,3),
                          time = c(47.75,47.75,30.66667,30.66667,14,14),
                          state = c(0,1,0,1,0,1),
                          c = c(46,46,39,39,57,57),
                          tv = c(0.75,0.75,1,1,1,1),
                          state.counts = c(3,1,3,0,1,1),
                          count.weight = c(4,4,3,3,2,2))


# events2state() sets

long_events <- data.frame(id = c(1,1,1,1,2,2,2,3,3),
                          time = c(0,31,64,96,0,33,59,0,28),
                          event1 = c(0,0,0,1,0,0,0,0,1),
                          event2 = c(0,1,1,1,0,0,1,0,1))

long_e2s <- data.frame(id = c(1,1,1,1,2,2,2,3,3),
                       time = c(0,31,64,96,0,33,59,0,28),
                       event1 = c(0,0,0,1,0,0,0,0,1),
                       event2 = c(0,1,1,1,0,0,1,0,1),
                       state = c(1,2,2,3,1,1,2,1,3))


long_e2s_fct <- data.frame(id = c(1,1,1,1,2,2,2,3,3),
                       time = c(0,31,64,96,0,33,59,0,28),
                       event1 = c(0,0,0,1,0,0,0,0,1),
                       event2 = c(0,1,1,1,0,0,1,0,1),
                       state = factor(c("00","01","01","11","00","00","01","00","11")))


long_e2s_nd <- data.frame(id = c(1,1,1,1,2,2,2,3,3),
                       time = c(0,31,64,96,0,33,59,0,28),
                       event1 = c(0,0,0,1,0,0,0,0,1),
                       event2 = c(0,1,1,1,0,0,1,0,1),
                       state = c(1,3,3,4,1,1,3,1,4))



# takefirst() result

first_covar <- data.frame(id = c(1,1,1,2,2,3,3),
                          time = c(0,31,64,0,33,0,28),
                          state = c(0,0,0,0,0,0,1),
                          c = c(46,46,46,39,39,57,57),
                          tv = c(0,0,1,0,1,0,2))




missing_baseline <- data.frame(id = c(1,1,1,2,2,3),
                               time = c(31,64,96,33,59,28),
                               state = c(0,0,1,0,0,1),
                               c = c(46,46,46,39,39,57),
                               tv = c(0,1,2,1,2,2))


baseline_result <- data.frame(id = c(1,1,1,1,2,2,2,3,3),
                               time = c(NA,31,64,96,NA,33,59,NA,28),
                               state = c(NA,0,0,1,NA,0,0,NA,1),
                               c = c(46,46,46,46,39,39,39,57,57),
                               tv = c(NA,0,1,2,NA,1,2,NA,2))


