#' Draw line chart
#'
#' @param df A data frame with columns: publish_date, concept, value, var.
#' @param var_str A character vector of length 1.
#'
#' @return A plot.
#'
#' @examples
#' \dontrun{
#' draw_line_chart(df, var_str)
#' }
draw_line_chart <- function(df, var_str) {
  var <- rlang::sym(var_str)
  
  df %>%
    ggplot2::ggplot(ggplot2::aes(publish_date, value, color = {{ var }})) +
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
#'
#' @return A plot.
#'
#' @examples
#' \dontrun{
#' draw_map_usa_simple(df)
#' }
draw_map_usa_simple <- function(df) {
  usa$map_df %>%
    dplyr::left_join(df, by = c(region = "state")) %>%
    ggplot2::ggplot(ggplot2::aes(long, lat, group = group, fill = value)) +
    ggplot2::geom_polygon(color = "white") +
    ggplot2::coord_map("polyconic") +
    ggplot2::scale_fill_gradient2(low = "#559999", mid = "grey90", high = "#BB650B",
                         midpoint = stats::median(df$value)) +
    ggplot2::labs(fill = "cases per 1 million\n(7 day average)") +
    ggplot2::theme_void(base_size = 16)
}

#' Draw Japan prefecture map
#'
#' @param df A data frame with columns: publish_date, concept, value, code.
#'
#' @return A plot.
#'
#' @examples
#' \dontrun{
#' draw_map_japan_simple(df)
#' }
draw_map_japan_simple <- function(df) {
  japan$map_df %>% 
    dplyr::left_join(df, by = c(jiscode = "code")) %>% 
    ggplot2::ggplot() +
    ggplot2::geom_sf(ggplot2::aes(fill = value), color = "white") +  
    ggplot2::scale_fill_gradient2(low = "#559999", mid = "grey90", high = "#BB650B",
                         midpoint = stats::median(df$value)) +
    ggplot2::labs(fill = "cases per 1 million\n(7 day average)") +
    ggplot2::theme_void(base_size = 16)
}

#' Draw World map
#'
#' @param df A data frame with columns: publish_date, concept, value, area.
#'
#' @return A plot.
#'
#' @examples
#' \dontrun{
#' draw_map_world(df)
#' }
draw_map_world <- function(df) {
  world$map_df %>% 
    fuzzyjoin::regex_left_join(df, by = c(region = "area")) %>% 
    ggplot2::ggplot(ggplot2::aes(long, lat, group = group, fill = value)) +
    ggplot2::geom_polygon(color = "black", size = 0.1) +
    ggplot2::scale_fill_gradient2(low = "#559999", mid = "grey90", high = "#BB650B",
                         midpoint = stats::median(df$value)) +
    ggplot2::labs(fill = "cases per 1 million\n(7 day average)") +
    ggthemes::theme_map()
}
