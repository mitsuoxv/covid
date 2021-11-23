#' Draw line chart
#'
#' @param df A data frame with columns: publish_date, concept, value, var.
#' @param value_var A symbol: value, value_ma, value_per1m or value_ma_per1m.
#'
#' @return A plot.
#'
#' @examples
#' \dontrun{
#' draw_line_chart(df, value_var)
#' }
draw_line_chart <- function(df, value_var) {
  area_var <- extract_area_var(df)
  
  df %>%
    ggplot2::ggplot(ggplot2::aes(publish_date, {{ value_var }}, color = {{ area_var }})) +
    ggplot2::geom_hline(yintercept = 0,
               color = "white",
               size = 2) +
    ggplot2::geom_line(size = 1) +
    ggplot2::scale_y_continuous(labels = scales::comma) +
    ggplot2::labs(x = "published date", y = NULL,
         caption = paste0("Latest: ", max(df$publish_date)))
}

#' Draw USA state map
#'
#' @param df A data frame with columns: publish_date, concept, value, state.
#' @param value_var A symbol: value, value_ma, value_per1m or value_ma_per1m.
#'
#' @return A plot.
#'
#' @examples
#' \dontrun{
#' draw_map_usa(df, value)
#' }
draw_map_usa <- function(df, value_var) {
  usa$map_df %>%
    dplyr::left_join(df, by = "state_abb") %>%
    ggplot2::ggplot(ggplot2::aes(long, lat, group = group, fill = {{ value_var }})) +
    ggplot2::geom_polygon(color = "white") +
    ggplot2::coord_map("polyconic") +
    ggplot2::scale_fill_gradient2(low = "#559999", mid = "grey90", high = "#BB650B",
                         midpoint = stats::median(df %>% dplyr::pull({{ value_var }}), na.rm = TRUE)) +
    ggplot2::labs(fill = "# of cases") +
    ggplot2::theme_void(base_size = 16)
}

#' Draw Japan prefecture map
#'
#' @param df A data frame with columns: publish_date, concept, value, code.
#' @param value_var A symbol: value, value_ma, value_per1m or value_ma_per1m.
#' 
#' @return A plot.
#'
#' @examples
#' \dontrun{
#' draw_map_japan(df, value_ma)
#' }
draw_map_japan <- function(df, value_var) {
  japan$map_df %>% 
    dplyr::left_join(df, by = c(jiscode = "code")) %>% 
    ggplot2::ggplot() +
    ggplot2::geom_sf(ggplot2::aes(fill = {{ value_var }}), color = "white") +  
    ggplot2::scale_fill_gradient2(low = "#559999", mid = "grey90", high = "#BB650B",
                         midpoint = stats::median(df %>% dplyr::pull({{ value_var }}), na.rm = TRUE)) +
    ggplot2::labs(fill = "# of cases") +
    ggplot2::theme_void(base_size = 16)
}

#' Draw World map
#'
#' @param df A data frame with columns: publish_date, concept, value, area.
#' @param value_var A symbol: value, value_ma, value_per1m or value_ma_per1m.
#'
#' @return A plot.
#'
#' @examples
#' \dontrun{
#' draw_map_world(df, value_ma_per1m)
#' }
draw_map_world <- function(df, value_var) {
  world$map_df %>% 
    fuzzyjoin::regex_left_join(df, by = c(region = "area")) %>% 
    dplyr::filter(population > 1e5) %>% 
    ggplot2::ggplot(ggplot2::aes(long, lat, group = group, fill = {{ value_var }})) +
    ggplot2::geom_polygon(color = "black", size = 0.1) +
    ggplot2::scale_fill_gradient2(low = "#559999", mid = "grey90", high = "#BB650B",
                                  midpoint = df %>% 
                                    dplyr::pull({{ value_var }}) %>% 
                                    stats::median(na.rm = TRUE)) +
    ggplot2::labs(fill = "# of cases") +
    ggthemes::theme_map()
}

#' Draw area bar chart
#'
#' @param df A data frame with columns: publish_date, population,
#'           prefecture, state or area, 
#'           concept, value, value_ma, value_per1m, value_ma_per1m.
#' @param value_var A symbol: value, value_ma, value_per1m or value_ma_per1m.
#' 
#' @return A plot.
#'
#' @examples
#' \dontrun{
#' draw_bar_chart(df, value_ma)
#' }
draw_bar_chart <- function(df, value_var) {
  area_var <- extract_area_var(df)
  
  df_total <- df %>% 
    dplyr::filter({{ area_var }} == "Total")
  
  if (nrow(df_total) == 0) {
    national_avg <- df %>% 
      dplyr::summarize(dplyr::across(c(population, value, value_ma), sum, na.rm = TRUE)) %>% 
      dplyr::mutate(
        value_per1m = value / population * 1e6,
        value_ma_per1m = value_ma / population * 1e6
      ) %>% 
      dplyr::pull({{ value_var }})
    
  } else {
    national_avg <- df_total %>% 
      dplyr::pull({{ value_var }})
    
    df <- df %>% 
      dplyr::filter({{ area_var }} != "Total")
  }

  p <- df %>% 
    dplyr::slice_max({{ value_var }}, n = 55) %>% 
    dplyr::mutate(
      {{ area_var }} := forcats::fct_reorder({{ area_var }}, {{ value_var }}),
      below_avg = {{ value_var }} < national_avg
      ) %>% 
    ggplot2::ggplot(ggplot2::aes({{ value_var }}, {{ area_var }},
                                 fill = below_avg)) +
    ggplot2::geom_col(show.legend = FALSE) +
    ggplot2::scale_x_continuous(labels = scales::comma) +
    ggplot2::labs(x = "# of cases", y = NULL) +
    ggplot2::theme_light()

  if (rlang::as_string(rlang::ensym(value_var)) %in% 
      c("value_per1m", "value_ma_per1m")) {
    p +
      ggplot2::geom_vline(xintercept = national_avg, linetype = 2) +
      ggplot2::annotate("text",
                        y = 10,
                        x = national_avg,
                        label = "Average")
  } else {
    p
  }
}
