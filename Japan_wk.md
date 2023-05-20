Japan, weekly confirmed Covid-19 cases per hospital
================
Mitsuo Shiota
2023-05-20

Updated: 2023-05-20

## Covid-19 was reclassified as tier 5 on May 8, 2023 in Japan

There are no daily data available on Covid-19 since May 8, 2023 in
Japan. Instead, MHLW (Ministry of Health, Labour and Welfare) publishes
weekly data in [its web
site](https://www.mhlw.go.jp/stf/seisakunitsuite/bunya/0000121431_00432.html).

## Read data from MHLW site

    ## Rows: 48 Columns: 1
    ## ── Column specification ────────────────────────────────────────────────────────
    ## Delimiter: ","
    ## chr (1): prefecture
    ## 
    ## ℹ Use `spec()` to retrieve the full column specification for this data.
    ## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.

    ##  chr [1:5] "                                           Press Release\n                                          令和５年５"| __truncated__ ...

## Weekly confirmed cases per hospital

    ## Warning: Unknown or uninitialised column: `publish_date`.

    ## Warning in max(conf_per_hospital$publish_date): no non-missing arguments to
    ## max; returning -Inf

![](Japan_wk_files/figure-gfm/conf_per_hospital-1.png)<!-- -->

## Confirmed Covid-19 cases per hospital in the latest week by prefecuture

![](Japan_wk_files/figure-gfm/conf_per_hospital_last-1.png)<!-- -->

For more flexible data presentations, please check [my Shiny
app](https://mitsuoxv.shinyapps.io/covid/).

EOL
