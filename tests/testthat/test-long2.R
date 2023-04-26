context("long2cp test cases")

test_that("simple longitudinal to counting process transition", {
  expect_equal(long2cp(simple_long,"id","time"), simple_cp)
})

test_that("longitudinal to counting process transition with covariates", {
  expect_equal(long2cp(covar_long,"id","time"), covar_cp)
})


test_that("longitudinal to count regression transition with events", {
  expect_equal(round(long2count(data = covar_long, id = "id", event = "state", FUN = mean),2), event_count)
})


test_that("longitudinal to count regression transition with states", {
  expect_equal(round(long2count(data = covar_long, id = "id", state = "state", FUN = mean),2), state_count)
})
