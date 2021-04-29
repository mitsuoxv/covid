test_that("inputs filter right data from world$area_df", {
  testServer(select_showServer, args = list(df = world$area_df), {
    session$setInputs(select_area = "Japan", select_concept = "new_conf",
                      date_range = c(as.Date("2020-04-01"), as.Date("2020-04-01")))
    
    expect_equal(area_var, "area")
    expect_equal(chart_data()$value, 225)
    expect_equal(chart_data()$value_ma, 140.714286)
    expect_equal(chart_data()$value_per1m, 1.767645)
    expect_equal(chart_data()$value_ma_per1m, 1.1054796)
  })
})
