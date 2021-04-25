test_that("file name is correct, when 'No' and 'No'", {
  expect_equal(name_file("new_conf", "No", "No"), "new_conf.tsv")
})

test_that("file name is correct, when 'Yes' and 'No'", {
  expect_equal(name_file("new_conf", "Yes", "No"), "new_conf_ma.tsv")
})

test_that("file name is correct, when 'No' and 'Yes'", {
  expect_equal(name_file("new_conf", "No", "Yes"), "new_conf_per1m.tsv")
})

test_that("file name is correct, when 'Yes' and 'Yes'", {
  expect_equal(name_file("new_conf", "Yes", "Yes"), "new_conf_ma_per1m.tsv")
})
