WHO, Covid-19 situation report
================
Mitsuo Shiota
2020/3/7

  - [Summary](#summary)
  - [Load](#load)
  - [Newly confirmed cases by region](#newly-confirmed-cases-by-region)
  - [Fastest spreading areas](#fastest-spreading-areas)
  - [Highest fatality rate areas](#highest-fatality-rate-areas)

Updated: 2020-05-15

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
    ##  1 United States           18611.  1340098             72
    ##  2 Russia                   4423.   252245             57
    ##  3 United Kingdom           3280.   229709             70
    ##  4 Spain                    3131.   228691             73
    ##  5 Brazil                   2909.   177589             61
    ##  6 Italy                    2740.   222104             81
    ##  7 Turkey                   2507.   143114             57
    ##  8 Germany                  2326.   172239             74
    ##  9 France                   1896.   138609             73
    ## 10 Iran                     1443.   112725             78
    ## 11 India                    1277.    78003             61
    ## 12 Peru                     1262.    72059             57
    ## 13 Canada                   1133.    71486             63
    ## 14 Belgium                   781.    53981             69
    ## 15 Saudi Arabia              733.    44830             61
    ## 16 China                     732.    84464            115
    ## 17 Mexico                    682.    38324             56
    ## 18 Netherlands               624.    43211             69
    ## 19 Pakistan                  595.    35298             59
    ## 20 Chile                     580.    34381             59

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Belgium                       75.1               5189.             69
    ##  2 Spain                         67.3               4917.             73
    ##  3 United States                 60.0               4320.             72
    ##  4 United Kingdom                52.6               3684.             70
    ##  5 Italy                         45.4               3681.             81
    ##  6 Portugal                      42.3               2635.             62
    ##  7 Peru                          42.2               2409.             57
    ##  8 Netherlands                   37.5               2596.             69
    ##  9 Ecuador                       36.0               2061.             57
    ## 10 Chile                         34.6               2053.             59
    ## 11 Canada                        33.6               2123.             63
    ## 12 Turkey                        32.2               1839.             57
    ## 13 Russia                        31.4               1793.             57
    ## 14 France                        29.3               2140.             73
    ## 15 Saudi Arabia                  28.5               1742.             61
    ## 16 Germany                       28.4               2106.             74
    ## 17 Iran                          18.8               1465.             78
    ## 18 Brazil                        14.5                883.             61
    ## 19 Czech Republic                12.4                789.             63
    ## 20 Romania                       11.9                729.             61

## Highest fatality rate areas

Among areas with more than 10 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 France                 19.5       27029   138609
    ##  2 Yemen                  18.1          13       72
    ##  3 Belgium                16.4        8843    53981
    ##  4 Italy                  14.9       33106   222104
    ##  5 United Kingdom         14.4       33186   229709
    ##  6 Netherlands            12.9        5562    43211
    ##  7 Spain                  11.9       27104   228691
    ##  8 Chad                   11.3          42      372
    ##  9 Mexico                 10.2        3926    38324
    ## 10 Algeria                 8.35        522     6253
    ## 11 Ecuador                 7.66       2334    30486
    ## 12 Canada                  7.29       5209    71486
    ## 13 Brazil                  6.98      12400   177589
    ## 14 Indonesia               6.66       1028    15438
    ## 15 Philippines             6.64        772    11618
    ## 16 Burkina Faso            6.60         51      773
    ## 17 Romania                 6.35       1016    16002
    ## 18 United States           6.02      80695  1340098
    ## 19 Iran                    6.02       6783   112725
    ## 20 Mali                    5.80         44      758

EOL
