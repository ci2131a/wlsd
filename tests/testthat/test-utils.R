# utils tests

test_that("2 events to state", {

  df <- data.frame(
    id = c(1,1,1,2,2),
    t = c(0,2,6,0,3),
    e1 = c(0,0,1,0,1),
    e2 = c(0,1,1,0,1)
  )

  result <- suppressMessages(events2state(df, c("e1","e2")))
  output <- data.frame(
    id = c(1,1,1,2,2),
    t = c(0,2,6,0,3),
    e1 = c(0,0,1,0,1),
    e2 = c(0,1,1,0,1),
    state = c(1,2,3,1,3)
  )

  expect_equal(result, output)

})

test_that("2 events to state added arguments - number true but drop false", {

  df <- data.frame(
    id = c(1,1,1,2,2),
    t = c(0,2,6,0,3),
    e1 = c(0,0,1,0,1),
    e2 = c(0,1,1,0,1)
  )

  result <- suppressMessages(events2state(df, c("e1","e2"), drop = FALSE))

  output <- data.frame(
    id = c(1,1,1,2,2),
    t = c(0,2,6,0,3),
    e1 = c(0,0,1,0,1),
    e2 = c(0,1,1,0,1),
    state = c(1,3,4,1,4)
  )

  expect_equal(result, output)

})

test_that("2 events to state - number false", {

  df <- data.frame(
    id = c(1,1,1,2,2),
    t = c(0,2,6,0,3),
    e1 = c(0,0,1,0,1),
    e2 = c(0,1,1,0,1)
  )

  result <- suppressMessages(events2state(df, c("e1","e2"), number = FALSE))

  output <- data.frame(
    id = c(1,1,1,2,2),
    t = c(0,2,6,0,3),
    e1 = c(0,0,1,0,1),
    e2 = c(0,1,1,0,1),
    state = factor(c("0.0","0.1","1.1","0.0","1.1"))
  )

  expect_equal(result, output)

})



test_that("take first tv == 1", {

  df <- data.frame(
    id = c(1,1,1,1,2,2,2,2),
    t = c(1,2,3,4,1,2,3,4),
    e = c(0,0,1,1,0,1,0,1)
  )

  result <- takefirst(df, "id", "e", 1)
  output <- data.frame(
    id = c(1,1,1,2,2),
    t = c(1,2,3,1,2),
    e = c(0,0,1,0,1)
  )

  expect_equal(result, output)

})


test_that("add a baseline observation", {

  df <- data.frame(
    id = c(1,1,2,2),
    t = c(1,3,2,4),
    c = c(2,2,1,1),
    tv = c(0,1,0,1)
  )

  result <- basedate(df, "id")
  output <- data.frame(
    id = c(1,1,1,2,2,2),
    t = c(NA,1,3,NA,2,4),
    c = c(2,2,2,1,1,1),
    tv = c(NA,0,1,NA,0,1)
  )

  expect_equal(result, output)
})
