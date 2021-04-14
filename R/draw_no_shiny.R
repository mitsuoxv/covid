draw_map_usa <- function(map_df, df, var_str) {
  var <- sym(var_str)
  
  map_df %>%
    left_join(df, by = c(iso_3166_2 = "state_abb")) %>%
    ggplot() +
    geom_sf(aes(fil = {{ var }}), color = "white") +
    scale_fill_gradient2(low = "#559999", mid = "grey90", high = "#BB650B",
                         midpoint = median(df[[{{ var }}]])) +
    theme_void()
}


draw_map_japan <- function(map_df, df, var_str) {
  var <- sym(var_str)
  
  map_df %>%
    left_join(df, by = c(jiscode = "code")) %>%
    ggplot() +
    geom_sf(aes(fil = {{ var }}), color = "white") +
    scale_fill_gradient2(low = "#559999", mid = "grey90", high = "#BB650B",
                         midpoint = median(df[[{{ var }}]])) +
    theme_void()
}
