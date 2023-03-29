context("helpful function test cases")

test_that("simple 2 events to state", {
  expect_equal(events2state(long_events,c("event1","event2")), long_e2s)
})

test_that("simple 2 events to state more arguments", {
  expect_equal(events2state(long_events,c("event1","event2"), number = FALSE, drop = TRUE, sep = ""), long_e2s_fct)
})
