test_that("'No' and 'No' produces 'value'", {
  expect_equal(get_value_var("No", "No"), rlang::sym("value"))
})

test_that("'Yes' and 'No' produces 'value_ma'", {
  expect_equal(get_value_var("Yes", "No"), rlang::sym("value_ma"))
})

test_that("'No' and 'Yes' produces 'value_per1m'", {
  expect_equal(get_value_var("No", "Yes"), rlang::sym("value_per1m"))
})

test_that("'Yes' and 'Yes' produces 'value_ma_per1m'", {
  expect_equal(get_value_var("Yes", "Yes"), rlang::sym("value_ma_per1m"))
})
