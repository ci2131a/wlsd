# Longitudinal test cases

test_that("simple longitudinal to counting process transition", {
  expect_equal(long2cp(long_data,"id","time"), cp_data)
})


test_that("longitudinal to count regression transition with events", {
  expect_equal(round(long2count(data = long_data, id = "id", event = "state", FUN = mean),2), round(event_count,2))
})


test_that("longitudinal to count regression transition with states", {
  expect_equal(round(long2count(data = long_data, id = "id", state = "state", FUN = mean),2), round(state_count,2))
})
