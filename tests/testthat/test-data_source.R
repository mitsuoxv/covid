test_that("data source is right, when id is 'usa_map'", {
  expect_equal(data_source("usa_map"),
               a(href = "https://usafacts.org/visualizations/coronavirus-covid-19-spread-map/",
                 "Source: USAFacts"))
})

test_that("data source is right, when id is 'usa'", {
  expect_equal(data_source("usa"),
               a(href = "https://usafacts.org/visualizations/coronavirus-covid-19-spread-map/",
                 "Source: USAFacts"))
})

test_that("data source is right, when id is 'japan_map'", {
  expect_equal(data_source("japan_map"),
               a(href = "https://www3.nhk.or.jp/news/special/coronavirus/data/",
                 "Source: NHK"))
})

test_that("data source is right, when id is 'japan'", {
  expect_equal(data_source("japan"),
               a(href = "https://www3.nhk.or.jp/news/special/coronavirus/data/",
                 "Source: NHK"))
})

test_that("data source is right, when id is 'world_map'", {
  expect_equal(data_source("world_map"),
               a(href = "https://covid19.who.int/", "Source: WHO"))
})

test_that("data source is right, when id is 'world_region'", {
  expect_equal(data_source("world_region"),
               a(href = "https://covid19.who.int/", "Source: WHO"))
})

test_that("data source is right, when id is 'world_area'", {
  expect_equal(data_source("world_area"),
               a(href = "https://covid19.who.int/", "Source: WHO"))
})

test_that("function stops, when id is out of bound", {
  expect_error(data_source("world_country"), "Incorrect id")
})
