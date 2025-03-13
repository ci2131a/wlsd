# Counting Process transition tests

test_that("simple cp transition", {
  expect_equal(cp2long(cp_data,"id","time1", "time2", "state"), cp2long_results)
})
