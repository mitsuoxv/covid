test_that("'No' and 'No' produces 'value'", {
  expect_equal(get_value_var("No", "No"), "value")
})

test_that("'Yes' and 'No' produces 'value_ma'", {
  expect_equal(get_value_var("Yes", "No"), "value_ma")
})

test_that("'No' and 'Yes' produces 'value_per1m'", {
  expect_equal(get_value_var("No", "Yes"), "value_per1m")
})

test_that("'Yes' and 'Yes' produces 'value_ma_per1m'", {
  expect_equal(get_value_var("Yes", "Yes"), "value_ma_per1m")
})
