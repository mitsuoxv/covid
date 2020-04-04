WHO, Covid-19 situation report
================
Mitsuo Shiota
2020/3/7

  - [Summary](#summary)
  - [Load](#load)
  - [Newly confirmed cases by region](#newly-confirmed-cases-by-region)
  - [Fastest spreading areas](#fastest-spreading-areas)
  - [Highest fatality rate areas](#highest-fatality-rate-areas)

Updated: 2020-04-05

## Summary

<https://mitsuoxv.shinyapps.io/covid/>

Coronavirus is affecting the world economy. Uncertaintiy is very high. I
searched around and found some informative sites, like [Coronavirus
Situation
Dashboard](https://who.maps.arcgis.com/apps/opsdashboard/index.html#/c88e37cfc43b4ed3baf977d77e4a0667)
and [Coronavirus Update by
worldometer](https://www.worldometers.info/coronavirus/). But they fail
to offer time-series data of the newly confirmed cases by each area, in
which I am most interested. If the average number of infections one
infected person inflict is even slightly more than one, infections grow
exponentially. If less than one, the newly confirmed cases begin to
decrease, and the virus will be contained eventually in that area.

WHO offers those numbers in [the situation
reports](https://www.who.int/emergencies/diseases/novel-coronavirus-2019/situation-reports/),
which are unfortunately pdf files.

So I scratched numbers from pdf files, scratched my head learning
regular expressions, and made the shiny app above. I would like to
update frequently, but I am not sure. The ugly codes I wrote are in R
directory. Data in Table 1 (In China) and Table 2 (World including
China) in the situation reports are in table1.csv, table2.csv and
tables.rdata in data directory.

## Load

Here, I load Table 1 and Table 2, which I managed to scratch from WHO
situation reports. Beware Table 1 (in\_china) includes total, but Table
2 (world) does not include subtotal or total, as I cut them.

``` r
# load data
load("data/tables.rdata")
```

## Newly confirmed cases by region

I watch newly confirmed cases. China is suceeding to contain the
coronavirus, but areas outside China now face the challenge.

![](README_files/figure-gfm/chart-1.png)<!-- -->

## Fastest spreading areas

Among areas with more than 10 million population, highest
“speed\_since\_100”, which is average number of newly confirmed cases
per day since cumulative cases became more than 100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_since_100 cum_conf days_since_100
    ##    <chr>                    <dbl>    <dbl>          <int>
    ##  1 United States            7550.   241703             32
    ##  2 Spain                    3564.   117710             33
    ##  3 Italy                    2920.   119827             41
    ##  4 Germany                  2519.    85778             34
    ##  5 France                   1920.    63536             33
    ##  6 Iran                     1396.    53183             38
    ##  7 United Kingdom           1268.    38172             30
    ##  8 Turkey                   1219.    20921             17
    ##  9 China                    1101.    82875             75
    ## 10 Belgium                   575.    16770             29
    ## 11 Netherlands               538.    15723             29
    ## 12 Canada                    504.    11732             23
    ## 13 Portugal                  444.     9886             22
    ## 14 Brazil                    371.     7910             21
    ## 15 Russia                    235.     4149             17
    ## 16 South Korea               223.    10156             45
    ## 17 Australia                 214.     5454             25
    ## 18 Chile                     188.     3737             19
    ## 19 Czech Republic            177.     4190             23
    ## 20 Ecuador                   177.     3163             17

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Spain                        76.6                2531.             33
    ##  2 Belgium                      55.2                1612.             29
    ##  3 Italy                        48.4                1986.             41
    ##  4 Portugal                     41.6                 926.             22
    ##  5 Netherlands                  32.3                 945.             29
    ##  6 Germany                      30.8                1049.             34
    ##  7 France                       29.6                 981.             33
    ##  8 United States                24.3                 779.             32
    ##  9 United Kingdom               20.3                 612.             30
    ## 10 Iran                         18.1                 691.             38
    ## 11 Czech Republic               16.9                 400.             23
    ## 12 Turkey                       15.7                 269.             17
    ## 13 Canada                       15.0                 348.             23
    ## 14 Ecuador                      12.0                 214.             17
    ## 15 Chile                        11.3                 223.             19
    ## 16 Australia                     9.93                253.             25
    ## 17 Romania                       6.64                145.             21
    ## 18 Greece                        6.00                147.             21
    ## 19 South Korea                   4.61                210.             45
    ## 20 Malaysia                      4.37                118.             26

## Highest fatality rate areas

Among areas with more than 10 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area                             fatality_rate cum_deaths cum_conf
    ##    <chr>                                    <dbl>      <dbl>    <dbl>
    ##  1 Italy                                    12.3       14681   119827
    ##  2 France                                   10.2        6493    63536
    ##  3 Democratic Republic of the Congo          9.70         13      134
    ##  4 Netherlands                               9.46       1487    15723
    ##  5 United Kingdom                            9.44       3605    38172
    ##  6 Spain                                     9.29      10935   117710
    ##  7 Indonesia                                 9.11        181     1986
    ##  8 Algeria                                   8.42         83      986
    ##  9 Belgium                                   6.82       1143    16770
    ## 10 Egypt                                     6.70         66      985
    ## 11 Iraq                                      6.59         54      820
    ## 12 Iran                                      6.19       3294    53183
    ## 13 Morocco                                   5.92         50      844
    ## 14 Burkina Faso                              5.75         15      261
    ## 15 Philippines                               4.51        136     3018
    ## 16 Romania                                   4.18        133     3183
    ## 17 China                                     4.02       3335    82875
    ## 18 Ecuador                                   3.79        120     3163
    ## 19 Brazil                                    3.78        299     7910
    ## 20 Greece                                    3.66         59     1613

EOL
