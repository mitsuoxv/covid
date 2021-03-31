draw_line_chart <- function(df, var_str) {
  var <- sym(var_str)
  
  df %>%
    mutate({{ var }} := {{ var }} %>% fct_reorder2(publish_date, value)) %>% 
    ggplot(aes(publish_date, value, color = {{ var }})) +
    geom_hline(yintercept = 0,
               color = "white",
               size = 2) +
    geom_line(size = 1) +
    scale_y_continuous(labels = comma) +
    labs(x = "published date", y = NULL,
         caption = str_c("Latest: ", max(df$publish_date)))
}

draw_map_usa <- function(map_df, df, var_str) {
  var <- sym(var_str)
  
  map_df %>% 
    left_join(df, by = c("iso_3166_2" = "state_abb")) %>% 
    ggplot() +
    geom_sf(aes(fill = {{ var }}), color = "white") +  
    scale_fill_gradient2(low = "#559999", mid = "grey90", high = "#BB650B",
                         midpoint = median(df[[{{ var }}]])) +
    theme_void()
}

draw_map_usa_simple <- function(map_df, df) {
  map_df %>%
    left_join(df, by = c("region" = "state")) %>%
    ggplot(aes(long, lat, group = group, fill = value)) +
    geom_polygon(color = "white") +
    coord_map("polyconic") +
    scale_fill_gradient2(low = "#559999", mid = "grey90", high = "#BB650B",
                         midpoint = median(df$value)) +
    labs(fill = "cases per 1 million\n(7 day average)") +
    theme_void(base_size = 16)
}

draw_map_japan <- function(map_df, df, var_str) {
  var <- sym(var_str)
  
  map_df %>% 
    left_join(df, by = c("jiscode" = "code")) %>% 
    ggplot() +
    geom_sf(aes(fill = {{ var }}), color = "white") +  
    scale_fill_gradient2(low = "#559999", mid = "grey90", high = "#BB650B",
                         midpoint = median(df[[{{ var }}]])) +
    theme_void()
}

draw_map_japan_simple <- function(map_df, df) {
  map_df %>% 
    left_join(df, by = c("jiscode" = "code")) %>% 
    ggplot() +
    geom_sf(aes(fill = value), color = "white") +  
    scale_fill_gradient2(low = "#559999", mid = "grey90", high = "#BB650B",
                         midpoint = median(df$value)) +
    labs(fill = "cases per 1 million\n(7 day average)") +
    theme_void(base_size = 16)
}
