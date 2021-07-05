context("longitudinal")

test_that("longitudinal transition", {

  long <- data.frame(id = c(1,1,1,1,2,2,2,3,3),
                     time = c(0,31,64,96,0,33,59,0,28),
                     state = c(0,0,0,1,0,0,0,0,1),
                     c = c(46,46,46,46,39,39,39,57,57),
                     tv = c(0,0,1,2,0,1,2,0,2))

  expect_equal(long2cp(long,"id","time"),data.frame(id = c(1,1,1,2,2,3),
                                                    time1 = c(0,31,64,0,33,0),
                                                    time2 = c(31,64,96,33,59,28),
                                                    state = c(0,0,1,0,0,1),
                                                    c = c(46,46,46,39,39,57),
                                                    tv = c(0,1,2,1,2,2)))
})
