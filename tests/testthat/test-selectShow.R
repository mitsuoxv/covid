test_that("inputs filter right data from world$area_df", {
  testServer(selectShowServer, args = list(df = world$area_df), {
    session$setInputs(select_area = "Japan", select_concept = "new_conf",
                      date_range = c(as.Date("2020-04-01"), as.Date("2020-04-01")))
    
    expect_equal(chart_data()$population, 127288000)
    expect_equal(chart_data()$value, 225)
    expect_equal(chart_data()$value_ma, 140.7, tolerance = 0.001)
    expect_equal(chart_data()$value_per1m, 1.768, tolerance = 0.001)
    expect_equal(chart_data()$value_ma_per1m, 1.105, tolerance = 0.001)
  })
})

test_that("inputs filter right data from world$region_df", {
  testServer(selectShowServer, args = list(df = world$region_df), {
    session$setInputs(select_area = "Eastern Asia", select_concept = "new_conf",
                      date_range = c(as.Date("2020-04-01"), as.Date("2020-04-01")))
    
    expect_equal(chart_data()$population, 1531753739)
    expect_equal(chart_data()$value, 414)
    expect_equal(chart_data()$value_ma, 360, tolerance = 0.001)
    expect_equal(chart_data()$value_per1m, 0.2703, tolerance = 0.001)
    expect_equal(chart_data()$value_ma_per1m, 0.235, tolerance = 0.001)
  })
})

test_that("inputs filter right data from usa$area_df", {
  testServer(selectShowServer, args = list(df = usa$area_df), {
    session$setInputs(select_area = "New York", select_concept = "new_conf",
                      date_range = c(as.Date("2020-04-01"), as.Date("2020-04-01")))
    
    expect_equal(chart_data()$population, 19453561)
    expect_equal(chart_data()$value, 7686)
    expect_equal(chart_data()$value_ma, 7024, tolerance = 0.001)
    expect_equal(chart_data()$value_per1m, 395, tolerance = 0.001)
    expect_equal(chart_data()$value_ma_per1m, 361, tolerance = 0.001)
  })
})

test_that("inputs filter right data from japan$area_df", {
  testServer(selectShowServer, args = list(df = japan$area_df), {
    session$setInputs(select_area = "Tokyo", select_concept = "new_conf",
                      date_range = c(as.Date("2020-04-01"), as.Date("2020-04-01")))
    
    expect_equal(chart_data()$population, 13159000)
    expect_equal(chart_data()$value, 67)
    expect_equal(chart_data()$value_ma, 54.143, tolerance = 0.001)
  })
})
