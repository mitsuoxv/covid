test_that("inputs filter right data from world$area_df", {
  testServer(drawMapServer, args = list(df = world$area_df), {
    session$setInputs(select_concept = "new_conf",
                      select_date = as.Date("2020-04-01"))
    
    data_part <- chart_data() %>% 
      dplyr::filter(area == "Japan")
    
    expect_equal(data_part$population, 127288000)
    expect_equal(data_part$value, 225)
    expect_equal(data_part$value_ma, 140.7, tolerance = 0.001)
    expect_equal(data_part$value_per1m, 1.768, tolerance = 0.001)
    expect_equal(data_part$value_ma_per1m, 1.105, tolerance = 0.001)
  })
})

test_that("inputs filter right data from world$region_df", {
  testServer(drawMapServer, args = list(df = world$region_df), {
    session$setInputs(select_concept = "new_conf",
                      select_date = as.Date("2020-04-01"))
    
    data_part <- chart_data() %>% 
      dplyr::filter(region == "Eastern Asia")
    
    expect_equal(data_part$population, 1531753739)
    expect_equal(data_part$value, 414)
    expect_equal(data_part$value_ma, 360, tolerance = 0.001)
    expect_equal(data_part$value_per1m, 0.2703, tolerance = 0.001)
    expect_equal(data_part$value_ma_per1m, 0.235, tolerance = 0.001)
  })
})

test_that("inputs filter right data from usa$area_df", {
  testServer(drawMapServer, args = list(df = usa$area_df), {
    session$setInputs(select_concept = "new_conf",
                      select_date = as.Date("2020-04-01"))
    
    data_part <- chart_data() %>% 
      dplyr::filter(state == "New York")
    
    expect_equal(data_part$population, 19453561)
    expect_equal(data_part$value, 7686)
    expect_equal(data_part$value_ma, 7024, tolerance = 0.001)
    expect_equal(data_part$value_per1m, 395, tolerance = 0.001)
    expect_equal(data_part$value_ma_per1m, 361, tolerance = 0.001)
  })
})

test_that("inputs filter right data from japan$area_df", {
  testServer(drawMapServer, args = list(df = japan$area_df), {
    session$setInputs(select_concept = "new_conf",
                      select_date = as.Date("2020-04-01"))
    
    data_part <- chart_data() %>% 
      dplyr::filter(prefecture == "Tokyo")
    
    expect_equal(data_part$population, 13159000)
    expect_equal(data_part$value, 67)
    expect_equal(data_part$value_ma, 54.143, tolerance = 0.001)
  })
})
