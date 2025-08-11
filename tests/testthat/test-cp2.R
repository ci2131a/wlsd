# Counting Process transition tests

test_that("simple cp transition", {

  df <- data.frame(
    id = c(1,1,2),
    time1 = c(0,1,0),
    time2 = c(1,2,1),
    e = c(0,1,1),
    c = c(1,1,1),
    t = c(2,3,2)
  )

  result <- cp2long(df, "id", "time1", "time2")
  output <- data.frame(
    id = c(1,1,1,2,2),
    time = c(0,1,2,0,1),
    e = c(0,1,NA,1,NA),
    c = c(1,1,NA,1,NA),
    t = c(2,3,NA,2,NA)
  )

  expect_equal(result, output)
})


test_that("simple cp transition w/ event supplied to status", {

  df <- data.frame(
    id = c(1,1,2),
    time1 = c(0,1,0),
    time2 = c(1,2,1),
    e = c(0,1,1),
    c = c(1,1,1),
    t = c(2,3,2)
  )

  result <- cp2long(df, "id", "time1", "time2", "e")
  output <- data.frame(
    id = c(1,1,1,2,2),
    time = c(0,1,2,0,1),
    e = c(NA,0,1,NA,1),
    c = c(1,1,NA,1,NA),
    t = c(2,3,NA,2,NA)
  )

  expect_equal(result, output)
})


test_that("multiple status columns w/ fill", {

  df <- data.frame(
    id = c(1,1,2),
    time1 = c(0,1,0),
    time2 = c(1,2,1),
    e = c(0,1,1),
    c = c(1,1,1),
    t = c(2,3,2)
  )

  result <- cp2long(df, "id", "time1", "time2", status = c("e","t"), fill = TRUE)
  output <- data.frame(
    id = c(1,1,1,2,2),
    time = c(0,1,2,0,1),
    e = c(NA,0,1,NA,1),
    c = c(1,1,1,1,1),
    t = c(NA,2,3,NA,2)
  )

  expect_equal(result, output)
})


#test_that("cp transition w/ error", {

#})



