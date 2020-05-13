WHO, Covid-19 situation report
================
Mitsuo Shiota
2020/3/7

  - [Summary](#summary)
  - [Load](#load)
  - [Newly confirmed cases by region](#newly-confirmed-cases-by-region)
  - [Fastest spreading areas](#fastest-spreading-areas)
  - [Highest fatality rate areas](#highest-fatality-rate-areas)

Updated: 2020-05-14

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

Note that the confirmed cases are not the actual cases, due to delays
from infection to symptoms, limited testing capacity, and so on, as
[Nate Silver tells
us](https://fivethirtyeight.com/features/coronavirus-case-counts-are-meaningless/).

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
    ##  1 United States           18619.  1322054             71
    ##  2 Russia                   4324.   242271             56
    ##  3 United Kingdom           3280.   226467             69
    ##  4 Spain                    3166.   228030             72
    ##  5 Brazil                   2804.   168331             60
    ##  6 Italy                    2764.   221216             80
    ##  7 Turkey                   2523.   141475             56
    ##  8 Germany                  2345.   171306             73
    ##  9 France                   1916.   138161             72
    ## 10 Iran                     1437.   110767             77
    ## 11 India                    1236.    74281             60
    ## 12 Peru                     1226.    68822             56
    ## 13 Canada                   1132.    70342             62
    ## 14 Belgium                   789.    53779             68
    ## 15 China                     738.    84458            114
    ## 16 Saudi Arabia              714.    42925             60
    ## 17 Mexico                    658.    36327             55
    ## 18 Netherlands               630.    42984             68
    ## 19 Pakistan                  587.    34261             58
    ## 20 Chile                     544.    31721             58

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Belgium                       75.9               5170.             68
    ##  2 Spain                         68.1               4903.             72
    ##  3 United States                 60.0               4261.             71
    ##  4 United Kingdom                52.6               3632.             69
    ##  5 Italy                         45.8               3666.             80
    ##  6 Portugal                      42.7               2615.             61
    ##  7 Peru                          41.0               2301.             56
    ##  8 Netherlands                   37.9               2582.             68
    ##  9 Ecuador                       36.5               2057.             56
    ## 10 Canada                        33.6               2089.             62
    ## 11 Chile                         32.5               1894.             58
    ## 12 Turkey                        32.4               1818.             56
    ## 13 Russia                        30.7               1722.             56
    ## 14 France                        29.6               2133.             72
    ## 15 Germany                       28.7               2094.             73
    ## 16 Saudi Arabia                  27.7               1668.             60
    ## 17 Iran                          18.7               1440.             77
    ## 18 Brazil                        13.9                837.             60
    ## 19 Czech Republic                12.5                785.             62
    ## 20 Romania                       11.9                719.             60

## Highest fatality rate areas

Among areas with more than 10 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 France                 19.5       26948   138161
    ##  2 Yemen                  16.4          11       67
    ##  3 Belgium                16.3        8761    53779
    ##  4 United Kingdom         14.4       32692   226467
    ##  5 Italy                  14.0       30911   221216
    ##  6 Netherlands            12.8        5510    42984
    ##  7 Spain                  11.8       26920   228030
    ##  8 Chad                   11.2          40      357
    ##  9 Mexico                  9.84       3573    36327
    ## 10 Algeria                 8.49        515     6067
    ## 11 Ecuador                 7.65       2327    30419
    ## 12 Canada                  7.18       5049    70342
    ## 13 Brazil                  6.84      11519   168331
    ## 14 Indonesia               6.83       1007    14749
    ## 15 Burkina Faso            6.66         51      766
    ## 16 Philippines             6.62        751    11350
    ## 17 Romania                 6.35       1002    15778
    ## 18 Iran                    6.08       6733   110767
    ## 19 United States           6.02      79634  1322054
    ## 20 Greece                  5.54        152     2744

EOL
