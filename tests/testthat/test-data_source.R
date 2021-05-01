test_that("data source is right, when id is 'usa_map'", {
  expect_snapshot(data_source("usa_map"))
})

test_that("data source is right, when id is 'usa'", {
  expect_snapshot(data_source("usa"))
})

test_that("data source is right, when id is 'japan_map'", {
  expect_snapshot(data_source("japan_map"))
})

test_that("data source is right, when id is 'japan'", {
  expect_snapshot(data_source("japan"))
})

test_that("data source is right, when id is 'world_map'", {
  expect_snapshot(data_source("world_map"))
})

test_that("data source is right, when id is 'world_region'", {
  expect_snapshot(data_source("world_region"))
})

test_that("data source is right, when id is 'world_area'", {
  expect_snapshot(data_source("world_area"))
})

test_that("function stops, when id is out of bound", {
  expect_error(data_source("world_country"), "Incorrect id")
})
