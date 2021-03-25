draw_line_chart <- function(df, var, concept_menu, input) {
  select_concept <- paste0("select_concept_", ensym(var))

  df %>%
    ggplot(aes(publish_date, value, color = {{ var }})) +
    geom_hline(yintercept = 0,
               color = "white",
               size = 2) +
    geom_line(size = 1) +
    scale_y_continuous(labels = comma) +
    labs(
      title = names(concept_menu)[concept_menu == input[[select_concept]]],
      x = "published date",
      y = NULL,
      caption = str_c("Latest: ", max(df$publish_date))
    ) +
    theme(legend.position = "top",
          plot.title = element_text(size = rel(2)))
}