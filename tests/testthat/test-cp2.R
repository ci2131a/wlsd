context("cp2 test cases")

test_that("simple cp transition", {

  expect_equal(cp2long(simple_cp,"id","time1", "time2", "state"), cp2long_results)

})
