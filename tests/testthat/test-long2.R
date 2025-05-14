# Longitudinal test cases


# long2cp() tests

test_that("dropped id where they do not have enough rows", {

  df <- data.frame(
    id = c(1,1,1,2,2,3),
    time = c(0,1,2,0,1,0),
    e = c(0,0,1,0,1,0),
    c = c(1,1,1,1,1,1),
    t = c(1,2,3,1,2,1)
  )

  result <- long2cp(data = df, id = "id", time = "time", drop = TRUE)
  output <- data.frame(
    id = c(1,1,2),
    time1 = c(0,1,0),
    time2 = c(1,2,1),
    e = c(0,1,1),
    c = c(1,1,1),
    t = c(2,3,2)
  )

  expect_equal(result, output)
})




# long2count() tests

test_that("simple case handles quick return",{

  df <- data.frame(
    id = c(1,1,1),
    s = c(1,2,3)
  )

  data <- df
  id <- "id"
  event <- NULL
  state <- "s"

  expect_true(length(setdiff(names(data),c(id, event, state))) == 0)

  result <- long2count(data = df, id = "id", state = "s")
  output <- data.frame(
    id = c(1,1,1),
    s = c(1,2,3),
    s.counts = c(1,1,1),
    count.weight = c(3,3,3)
  )

  expect_equal(output, result)

})


test_that("to count one event, one constant / one state, one constant", {

  df <- data.frame(
    id = c(1,1,1,2,2,3),
    e = c(0,0,1,0,1,0),
    c = c(1,1,1,1,1,1)
  )

  event_df <- long2count(data = df, id = "id", event = "e")
  state_df <- long2count(data = df, id = "id", state = "e")

  event_output <- data.frame(
    id = c(1,2,3),
    c = c(1,1,1),
    e.counts = c(1,1,0),
    count.weight = c(3,2,1)
  )
  state_output <- data.frame(
    id = c(1,1,2,2,3,3),
    e = c(0,1,0,1,0,1),
    c = c(1,1,1,1,1,1),
    e.counts = c(2,1,1,1,1,0),
    count.weight = c(3,3,2,2,1,1)
  )

  expect_equal(event_df, event_output)
  expect_equal(state_df, state_output)

})

test_that("to count one event, one constant / one state, one constant", {

  df <- data.frame(
    id = c(1,1,1,2,2,3),
    e = c(0,0,1,0,1,0),
    c = c(1,1,1,1,1,1)
  )

  event_df <- long2count(data = df, id = "id", event = "e")
  state_df <- long2count(data = df, id = "id", state = "e")

  event_output <- data.frame(
    id = c(1,2,3),
    c = c(1,1,1),
    e.counts = c(1,1,0),
    count.weight = c(3,2,1)
  )
  state_output <- data.frame(
    id = c(1,1,2,2,3,3),
    e = c(0,1,0,1,0,1),
    c = c(1,1,1,1,1,1),
    e.counts = c(2,1,1,1,1,0),
    count.weight = c(3,3,2,2,1,1)
  )

  expect_equal(event_df, event_output)
  expect_equal(state_df, state_output)

})

test_that("to count one event, one time var / one state, one time var",{

  df <- data.frame(
    id = c(1,1,1,2,2,3),
    e = c(0,0,1,0,1,0),
    t = c(0L,5L,10L,0L,10L,1L)
  )

  event_df <- long2count(data = df, id = "id", event = "e")
  state_df <- long2count(data = df, id = "id", state = "e")

  event_output <-data.frame(
    id = c(1,2,3),
    t = c(5, 5, 1),
    e.counts = c(1,1,0),
    count.weight = c(3,2,1)
  )

  state_output <- data.frame(
    id = c(1,1,2,2,3,3),
    e = c(0,1,0,1,0,1),
    t = c(5,5,5,5,1,1),
    e.counts = c(2,1,1,1,1,0),
    count.weight = c(3,3,2,2,1,1)
  )

  expect_equal(event_df, event_output)
  expect_equal(state_df, state_output)

})


test_that("to count multiple events, one constant",{

  df <- data.frame(
    id = c(1,1,1,2,2,3),
    e1 = c(0,0,1,0,1,0),
    e2 = c(0,0,1,0,1,0),
    c = c(1,1,1,1,1,1)
  )

  output <- data.frame(
    id = c(1,2,3),
    c = c(1,1,1),
    e1.counts = c(1,1,0),
    e2.counts = c(1,1,0),
    count.weight = c(3,2,1)
  )

  result <- long2count(data = df, id = "id", event = c("e1","e2"))

  expect_equal(result, output)

})


test_that("to count states, multiple events, multiple constants, multiple time vars",{

  df <- data.frame(
    id = c(1,1,1,2,2,3),
    e1 = c(0,0,1,0,1,0),
    e2 = c(0,0,1,0,1,0),
    s = c(0,0,1,0,1,0),
    c1 = c(1,1,1,2,2,3),
    c2 = c(3,3,3,2,2,1),
    t1 = c(0L,1L,2L,2L,2L,0L),
    t2 = c(1L,2L,3L,2L,4L,1L)
  )

  result <- long2count(data = df, id = "id", event = c("e1","e2"), state = "s")

  output <- data.frame(
    id = c(1,1,2,2,3,3),
    s = c(0,1,0,1,0,1),
    c1 = c(1,1,2,2,3,3),
    c2 = c(3,3,2,2,1,1),
    t1 = c(1,1,2,2,0,0),
    t2 = c(2,2,3,3,1,1),
    s.counts = c(2,1,1,1,1,0),
    e1.counts = c(1,1,1,1,0,0),
    e2.counts = c(1,1,1,1,0,0),
    count.weight = c(3,3,2,2,1,1)
  )

  expect_equal(result, output)

})

test_that("to count with different FUN",{

  df <- data.frame(
    id = c(1,1,1,2,2,3),
    e = c(0,0,1,0,1,0),
    t = c(2L,1L,3L,2L,4L,1L)
  )

  mean_result <- long2count(data = df, id = "id", event = "e", FUN = mean)
  sum_result <- long2count(data = df , id = "id", event = "e", FUN = sum)
  min_result <- long2count(data = df , id = "id", event = "e", FUN = min)
  max_result <- long2count(data = df , id = "id", event = "e", FUN = max)

  expect_equal(mean_result[["t"]], c(2,3,1))
  expect_equal(sum_result[["t"]], c(6,6,1))
  expect_equal(min_result[["t"]], c(1,2,1))
  expect_equal(max_result[["t"]], c(3,4,1))

})


test_that("additional arguments are passed through dots",{

  # modifying df from
  # to count one event, one time var / one state, one time var
  # test

  df <- data.frame(
    id = c(1,1,1,2,2,3),
    e = c(0,0,1,0,1,0),
    t = c(0L,5L,10L,NA,10L,1L)
  )

  na_true <- long2count(data = df, id = "id", event = "e", na.rm = TRUE)
  na_false <- long2count(data = df, id = "id", event = "e", na.rm = FALSE)

  expect_equal(na_true$t, c(5,10,1))
  expect_equal(na_false$t, c(5,NA,1))


})
