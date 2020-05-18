WHO, Covid-19 situation report
================
Mitsuo Shiota
2020/3/7

  - [Summary](#summary)
  - [Load](#load)
  - [Newly confirmed cases by region](#newly-confirmed-cases-by-region)
  - [Fastest spreading areas](#fastest-spreading-areas)
  - [Highest fatality rate areas](#highest-fatality-rate-areas)

Updated: 2020-05-19

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
    ##  1 United States           18844.  1432265             76
    ##  2 Russia                   4763.   290678             61
    ##  3 Brazil                   3585.   233142             65
    ##  4 United Kingdom           3292.   243699             74
    ##  5 Spain                    3003.   231350             77
    ##  6 Italy                    2651.   225435             85
    ##  7 Turkey                   2447.   149435             61
    ##  8 Germany                  2238.   174697             78
    ##  9 France                   1816.   140036             77
    ## 10 India                    1478.    96169             65
    ## 11 Iran                     1464.   120198             82
    ## 12 Peru                     1449.    88541             61
    ## 13 Canada                   1135.    76204             67
    ## 14 Saudi Arabia              841.    54752             65
    ## 15 Mexico                    784.    47144             60
    ## 16 Belgium                   756.    55280             73
    ## 17 China                     708.    84494            119
    ## 18 Chile                     692.    43781             63
    ## 19 Pakistan                  666.    42125             63
    ## 20 Netherlands               601.    43995             73

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Belgium                       72.6               5314.             73
    ##  2 Spain                         64.6               4975.             77
    ##  3 United States                 60.7               4617.             76
    ##  4 United Kingdom                52.8               3909.             74
    ##  5 Peru                          48.5               2961.             61
    ##  6 Italy                         43.9               3736.             85
    ##  7 Chile                         41.3               2614.             63
    ##  8 Portugal                      41.0               2720.             66
    ##  9 Netherlands                   36.1               2643.             73
    ## 10 Ecuador                       36.1               2212.             61
    ## 11 Russia                        33.9               2066.             61
    ## 12 Canada                        33.7               2263.             67
    ## 13 Saudi Arabia                  32.7               2128.             65
    ## 14 Turkey                        31.4               1921.             61
    ## 15 France                        28.0               2162.             77
    ## 16 Germany                       27.4               2136.             78
    ## 17 Iran                          19.0               1563.             82
    ## 18 Brazil                        17.8               1159.             65
    ## 19 Czech Republic                11.9                809.             67
    ## 20 Romania                       11.7                768.             65

## Highest fatality rate areas

Among areas with more than 10 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 France                 20.0       28059   140036
    ##  2 Belgium                16.4        9052    55280
    ##  3 Yemen                  15.9          21      132
    ##  4 United Kingdom         14.2       34636   243699
    ##  5 Italy                  14.2       31908   225435
    ##  6 Netherlands            12.9        5680    43995
    ##  7 Spain                  12.0       27650   231350
    ##  8 Mexico                 10.7        5045    47144
    ##  9 Chad                   10.5          53      503
    ## 10 Ecuador                 8.21       2688    32723
    ## 11 Algeria                 7.81        548     7019
    ## 12 Canada                  7.48       5702    76204
    ## 13 Brazil                  6.71      15633   233142
    ## 14 Philippines             6.59        824    12513
    ## 15 Indonesia               6.55       1148    17514
    ## 16 Romania                 6.50       1097    16871
    ## 17 Burkina Faso            6.41         51      796
    ## 18 United States           6.09      87180  1432265
    ## 19 Mali                    6.05         52      860
    ## 20 Niger                   5.97         54      904

EOL
