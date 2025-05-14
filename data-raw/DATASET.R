## code to prepare `DATASET` dataset goes here

#usethis::use_data(DATASET, overwrite = TRUE)


long_data <- data.frame(id = c(1,1,1,1,2,2,2,3,3),
                        time = c(0,31,64,96,0,33,59,0,28),
                        event = c(0,0,0,1,0,0,1,0,1),
                        var1 = c(10.4, 11.3, 12.7, 17.5, 1.2, 5.9, 4.4, 10.6, 8.0),
                        var2 = c(10,10,10,10,25,25,25,16,16))


wide_data <- data.frame(id = c(1,2,3),
                        time1 = c(0,0,0),
                        time2 = c(31,33,28),
                        time3 = c(64,59,NA),
                        time4 = c(96, NA, NA),
                        event1 = c(0,0,0),
                        event2 = c(0,0,1),
                        event3 = c(0,1,NA),
                        event4 = c(1,NA,NA),
                        var11 = c(10.4, 1.2,5.9),
                        var12 = c(11.3,5.9,8.0),
                        var13 = c(12.7,4.4,NA),
                        var14 = c(17.5,NA,NA),
                        var2 = c(10,25,16))


cp_data <- data.frame(id = c(1,1,1,2,2,3),
                      time1 = c(0,31,64,0,33,0),
                      time2 = c(31,64,96,33,59,28),
                      event = c(0,0,1,0,0,1),
                      var1 = c(11.3, 12.7, 17.5, 5.9, 4.4, 8.0),
                      var2 = c(10,10,10,25,25,16))


count_data <- data.frame(id = c(1,2,3),
                         time = c(96,59,28),
                         event = c(1,1,1),
                         var1 = c(round(mean(c(10.4, 11.3, 12.7, 17.5)),2), round(mean(c(1.2, 5.9, 4.4)),2), round(mean(c(10.6, 8.0)),2)),
                         var2 = c(10,25,16))



usethis::use_data(long_data, overwrite = TRUE)
usethis::use_data(wide_data, overwrite = TRUE)
usethis::use_data(cp_data, overwrite = TRUE)
usethis::use_data(count_data, overwrite = TRUE)
