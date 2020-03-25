# Split by line
make_lines <- function(a_list) {
  a_list %>% 
    str_split("\r\n") %>% 
    unlist()
}

# Remove disturbing characters
remove_dis_char <- function(char_vec) {
  char_vec %>% 
    str_remove_all("§") %>% 
    str_remove_all("‡") %>% 
    str_remove_all("\\*") %>% 
    str_remove_all("\\^")
}

# make character vector including space numeric
make_numeric <- function(chr_vec) {
  chr_vec %>% 
    str_remove_all(" ") %>% 
    as.numeric()
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
# https://countrycode.org/
correct_area <- function(df) {
  df %>% 
    mutate(
      area = stringi::stri_trans_general(area, "latin-ascii"),
      
      area = if_else(area %in% c("United States of",
                                 "America",
                                 "United States of America",
                                 "of the America",
                                 "the United States"
                                 ), 
                     "United States", area),

      area = if_else(area %in% c("The United",
                                 "Kingdom",
                                 "The United Kingdom",
                                 "the United Kingdom"
                                 ),
                     "United Kingdom", area),

      area = if_else(area %in% c(
                                 "Iran (Islamic Republic of)",
                                 "of)"
                                 ), 
                     "Iran", area),
           
      area = if_else(area == "Republic of Korea",
                     "South Korea", area),
      
      area = if_else(area == "Malyasia",
                     "Malaysia", area),
      
      area = if_else(area == "Czechia",
                     "Czech Republic", area),
      
      area = if_else(area %in% c("Bosnia and",
                                 "Herzegovina"
                                 ),
                     "Bosnia and Herzegovina", area),
           
      area = if_else(area %in% c("United Arab",
                                 "Emirates"
                                 ), 
                     "United Arab Emirates", area),
           
      area = if_else(area %in% c("territory",
                                 "occupied Palestinian territory"
                                 ),
                     "Palestine", area),
           
      area = if_else(area == "Republic of Moldova",
                     "Moldova", area),
           
      area = if_else(area %in% c("Dominican Republi",
                                 "Dominican Republic"
                                 ), 
                     "Dominican Republic", area),
           
      area = if_else(area == "Brunei Darussalam",
                     "Brunei", area),
           
      area = if_else(area == "State of)",
                     "Bolivia", area),

      area = if_else(area == "Republic of)",
                     "Venezuela", area),
           
      area = if_else(area == "Grenadines",
                     "Saint Vincent and the Grenadines", area),
           
      area = if_else(area == "of the Congo",
                     "Democratic Republic of the Congo", area),
      
      area = if_else(area %in% c("Cote d Ivoire",
                                 "Cote d'Ivoire"),
                     "Ivory Coast", area),
      
      area = if_else(area == "Republic",
                     "Central African Republic", area),
           
      area = if_else(area %in% c("International",
                                 "conveyance",
                                 "conveyance (Diamond",
                                 "conveyance (Japan)",
                                 "Princess)",
                                 "International conveyance"
                                 ), 
                     "International conveyance (Diamond Princess)", area),
      
      area = if_else(area == "Viet Nam",
                     "Vietnam", area),
      
      area = if_else(area == "Russian Federation",
                     "Russia", area),
      
      area = if_else(area == "North Macedonia",
                     "Macedonia", area),
      
      area = if_else(area == "French Guiana",
                     "Guiana", area),
      
      area = if_else(area == "Congo",
                     "Republic of the Congo", area),
      
      area = if_else(area == "Eswatini",
                     "Swaziland", area),
      
      area = if_else(area == "Timor-Leste",
                     "East Timor", area),
      
      area = if_else(area == "Cabo Verde",
                     "Cape Verde", area),
      
      area = if_else(area == "Kosovo[1]",
                     "Kosovo", area),
      
      area = if_else(area == "Syrian Arab Republic",
                     "Syria", area)
           
    )
}


# correct region names
correct_region <- function(df) {
  df %>% 
    mutate(
      region = if_else(region == "Totals",
                       "Total", region),
      
      region = if_else(region == "Hong Kong Sar",
                       "Hong Kong SAR", region),
      
      region = if_else(region == "Macao Sar",
                       "Macao SAR", region)
    )
}         

