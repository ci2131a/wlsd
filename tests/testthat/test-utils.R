# utils tests

test_that("2 events to state", {
  expect_equal(events2state(long_events,c("event1","event2")), long_e2s)
})

test_that("2 events to state added arguments - number false but drop true", {
  expect_equal(events2state(long_events,c("event1","event2"), number = FALSE, drop = TRUE, sep = ""), long_e2s_fct)
})


test_that("2 events to state added arguments - false drop", {
  expect_equal(events2state(long_events,c("event1","event2"), number = TRUE, drop = FALSE), long_e2s_nd)
})


test_that("take first tv == 1", {
  expect_equal(takefirst(long_data,"id","tv",1), first_covar)
})


test_that("add a baseline observation", {
  expect_equal(basedate(missing_baseline, "id"), baseline_result)
})
