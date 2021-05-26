test_that("'area' is extracted from world$area_df", {
  area_df <- data.frame(
    publish_date = as.Date("2020-01-03"),
    area = "Afghanistan",
    population = 29121286,
    region = "Southern Asia",
    concept = "new_conf",
    value = 0,
    value_ma = NA_real_,
    value_per1m = 0,
    value_ma_per1m = NA_real_
  )
  
  expect_equal(extract_area_var(area_df), rlang::sym("area"))
})

test_that("'region' is extracted from world$region_df", {
  area_df <- data.frame(
    publish_date = as.Date("2020-01-03"),
    region = "Central Asia",
    population = 6.11e+07,
    concept = "new_conf",
    value = 0,
    value_ma = NA_real_,
    value_per1m = 0,
    value_ma_per1m = NA_real_
  )
  
  expect_equal(extract_area_var(area_df), rlang::sym("region"))
})

test_that("'state' is extracted from usa$area_df", {
  area_df <- data.frame(
    publish_date = as.Date("2020-01-22"),
    state_abb = "Total",
    state = "Total",
    population = 3.28e+08,
    concept = "cum_conf",
    value = 1,
    value_ma = NA_real_,
    value_per1m = 0.00305,
    value_ma_per1m = NA_real_
  )
  
  expect_equal(extract_area_var(area_df), rlang::sym("state"))
})

test_that("'prefecture' is extracted from japan$area_df", {
  area_df <- data.frame(
    publish_date = as.Date("2020-01-16"),
    code = "01",
    population = 5250000,
    prefecture = "Hokkaido",
    concept = "new_conf",
    value = 0,
    value_ma = NA_real_,
    value_per1m = 0,
    value_ma_per1m = NA_real_
  )
  
  expect_equal(extract_area_var(area_df), rlang::sym("prefecture"))
})

test_that("Error is displayed from an improper data frame", {
  area_df <- data.frame(
    publish_date = as.Date("2020-01-16"),
    code = "01",
    population = 5250000,
    concept = "new_conf",
    value = 0,
    value_ma = NA_real_,
    value_per1m = 0,
    value_ma_per1m = NA_real_
  )
  
  expect_error(extract_area_var(area_df), "Columns must include either")
})
