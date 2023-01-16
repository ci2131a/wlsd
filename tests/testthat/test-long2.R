context("long2cp test cases")

test_that("simple longitudinal transition", {

  expect_equal(long2cp(simple_long,"id","time"), simple_cp)

})


