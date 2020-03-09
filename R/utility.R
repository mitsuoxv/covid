# Remove disturbing characters, and split
make_lines <- function(a_list) {
  a_list %>% 
    str_remove_all("§") %>% 
    str_remove_all("‡") %>% 
    str_remove_all("\\*") %>% 
    str_remove_all("\\^") %>% 
    str_split("\r\n") %>% 
    unlist()
}


# read character vector into a data frame, split by >= 3 spaces
read_chr_vec <- function(chr_vec, skip, expect_col_num,
                         column_chr = c(1)) {
  df_no_name <- chr_vec %>% 
    str_split("\\s{3,}") %>% 
    `[`((skip + 1):length(chr_vec)) %>% 
    `[`(map_lgl(., ~ length(.x) == expect_col_num)) %>% 
    bind_cols() %>% 
    t() %>% 
    as_tibble(.name_repair = "minimal")
  
  bind_cols(map_dfr(df_no_name[, column_chr], ~ str_trim(.x, side = "left")),
            map_dfr(df_no_name[, -column_chr], as.numeric))
}


# read character vector into a data frame
read_chr_vec3 <- function(chr_vec, pattern) {
  temp <- chr_vec %>% 
    str_subset(pattern) %>% 
    str_match(pattern) %>% 
    as_tibble(.name_repair = "minimal") %>% 
    `[`(c(1, 3:6))
  
  df_no_name <- bind_cols(temp[1],
                          map_dfr(temp[-1], as.numeric))
  
  names(df_no_name) <- c("area", "cum_conf",
                         "new_conf", "cum_deaths", "new_deaths")
  
  df_no_name %>%
    mutate(area = area %>% 
             str_sub(1L, 20L) %>% 
             str_trim(side = "both"))
}


# Correct area names
correct_area <- function(df) {
  df %>% 
    mutate(area = if_else(area == "United States of",
                          "the United States", area),
           area = if_else(area == "United States of",
                          "the United States", area),
           area = if_else(area == "America",
                          "the United States", area),
           area = if_else(area == "United States of America",
                          "the United States", area),
           
           area = if_else(area == "The United",
                          "the United Kingdom", area),
           area = if_else(area == "The United Kingdom",
                          "the United Kingdom", area),
           area = if_else(area == "Kingdom",
                          "the United Kingdom", area),
           area = if_else(area == "The United Kingdom",
                          "the United Kingdom", area),
           
           
           area = if_else(area == "United Arab",
                          "United Arab Emirates", area),
           
           area = if_else(area == "International",
                          "International conveyance", area),
           area = if_else(area == "conveyance",
                          "International conveyance", area),
           area = if_else(area == "conveyance (Diamond",
                          "International conveyance", area),
           area = if_else(area == "Princess)",
                          "International conveyance", area)
           
    )
}
