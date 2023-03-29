context("helpful function test cases")

test_that("2 events to state", {
  expect_equal(events2state(long_events,c("event1","event2")), long_e2s)
})

test_that("2 events to state added arguments", {
  expect_equal(events2state(long_events,c("event1","event2"), number = FALSE, drop = TRUE, sep = ""), long_e2s_fct)
})


test_that("take first tv == 1", {
  expect_equal(takefirst(covar_long,"id","tv",1), first_covar)
})
