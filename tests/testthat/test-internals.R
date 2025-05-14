# Internal Function Tests



## testing the get.weights() function
test_that("count weights returns length of group", {

  df <- data.frame(id = c(1,1,1,2,2,3))
  cf <- data.frame(id = c(1,2,3),
                   count.weight = c(3,2,1))

  expect_equal(get.weights(df,"id"), cf)


})


## testing the es.count() function
test_that("One event counts with sum",{
  df <- data.frame(id = c(1,1,1,2,2,3),
                   e1 = c(1,1,1,0,1,0)
  )
  ef <- data.frame(id = c(1,2,3),
                   e1.counts = c(3,1,0)
  )

  expect_equal(es.count(df, i = "id", e = "e1", s = NULL), ef)

})


test_that("One state counts with quantity for each level",{

  df <- data.frame(id = c(1,1,1,2,2,3),
                   s = c(1,1,2,0,1,3)
  )

  sf <- data.frame(id = sort(rep(c(1,2,3),4)),
                   s = rep(c(0,1,2,3),3),
                   s.counts = c(0,2,1,0,1,1,0,0,0,0,0,1)
  )

  expect_equal(es.count(df, i = "id", e = NULL, s = "s"), sf)

})


test_that("Multiple events but no state handles the c() events",{

  df <- data.frame(id = c(1,1,1,2,2,3),
                   e1 = c(1,1,1,0,1,0),
                   e2 = c(0,0,1,0,0,1)
  )

  ef <- data.frame(id = c(1,2,3),
                   e1.counts = c(3,1,0),
                   e2.counts = c(1,0,1)
  )


  expect_equal(es.count(df, i = "id", e = c("e1","e2"), s = NULL), ef)

})


test_that("Both events and states can be counted correctly",{

  df <- data.frame(
    id = c(1,1,1,2,2,3),
    e1 = c(1,1,1,0,1,0),
    e2 = c(0,0,1,0,0,1),
    s = c(1,1,2,0,1,3)
  )

  esf <- data.frame(
    id = sort(rep(c(1,2,3),4)),
    s = rep(c(0,1,2,3),3),
    s.counts = c(0,2,1,0,1,1,0,0,0,0,0,1),
    e1.counts = c(3,3,3,3,1,1,1,1,0,0,0,0),
    e2.counts = c(1,1,1,1,0,0,0,0,1,1,1,1)
  )

  expect_equal(es.count(df, i = "id", e = c("e1","e2"), s = "s"), esf)

})


# testing the track_var_change() function

test_that("Simple example handles correctly (No covars)",{

  df <- data.frame(
    id = c(1,1,1),
    e = c(1,2,3)
  )

  output <- track_var_change(d = df, i = "id", o = "e")

  expect_true(is.list(output)) # returns list
  expect_equal(output[[1]], "id") # only id is constant
  expect_null(output[[2]])

})

test_that("Single time var handles",{

  df <- data.frame(
    id = c(1,1,1),
    e = c(1,2,3)
  )

  output <- track_var_change(d = df, i = "id", o = NULL)

  expect_equal(output[[1]], "id") # id is only constant
  expect_equal(output[[2]], "e") # e is only time var

})


test_that("Multiple columns are split with an omit",{

  df <- data.frame(
    id = c(1,1,1,2,2,3),
    e = c(1,1,2,1,1,2),
    c1 = c(0,0,0,1,1,6),
    c2 = c(1,1,1,2,2,3),
    t1 = c(1,2,3,1,2,1),
    t2 = c(0,0,1,0,1,1)
  )

  output <- track_var_change(d = df, i = "id", o = "e")

  expect_equal(output[[1]], c("id", "c1", "c2"))
  expect_equal(output[[2]], c("t1", "t2"))

})


test_that("Multiple omit",{

  df <- data.frame(
    id = c(1,1,1,2,2,3),
    e = c(1,1,2,1,1,2),
    c1 = c(0,0,0,1,1,6),
    c2 = c(1,1,1,2,2,3),
    t1 = c(1,2,3,1,2,1),
    t2 = c(0,0,1,0,1,1)
  )

  output <- track_var_change(d = df, i = "id", o = c("e", "c1", "t1"))

  expect_equal(output[[1]], c("id", "c2"))
  expect_equal(output[[2]], c("t2"))

})
