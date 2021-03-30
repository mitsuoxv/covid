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
         caption = str_c("Latest: ", max(df$publish_date))) +
    theme(plot.title = element_text(size = rel(2)))
}