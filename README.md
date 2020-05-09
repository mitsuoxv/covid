WHO, Covid-19 situation report
================
Mitsuo Shiota
2020/3/7

  - [Summary](#summary)
  - [Load](#load)
  - [Newly confirmed cases by region](#newly-confirmed-cases-by-region)
  - [Fastest spreading areas](#fastest-spreading-areas)
  - [Highest fatality rate areas](#highest-fatality-rate-areas)

Updated: 2020-05-10

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
    ##  1 United States           18594.  1245874             67
    ##  2 Russia                   3818.   198676             52
    ##  3 Spain                    3276.   222857             68
    ##  4 United Kingdom           3250    211368             65
    ##  5 Italy                    2856.   217185             76
    ##  6 Turkey                   2603.   135569             52
    ##  7 Germany                  2441.   168551             69
    ##  8 Brazil                   2410.   135106             56
    ##  9 France                   2006.   136578             68
    ## 10 Iran                     1432.   104691             73
    ## 11 Canada                   1125.    65399             58
    ## 12 Peru                     1123.    58526             52
    ## 13 India                    1063.    59662             56
    ## 14 Belgium                   811.    52011             64
    ## 15 China                     765.    84416            110
    ## 16 Netherlands               656.    42093             64
    ## 17 Saudi Arabia              631.    35432             56
    ## 18 Ecuador                   580.    30298             52
    ## 19 Mexico                    578.    29616             51
    ## 20 Pakistan                  505.    27474             54

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Belgium                       78.0               5000.             64
    ##  2 Spain                         70.4               4792.             68
    ##  3 United States                 59.9               4016.             67
    ##  4 United Kingdom                52.1               3390.             65
    ##  5 Italy                         47.3               3599.             76
    ##  6 Portugal                      44.6               2554.             57
    ##  7 Netherlands                   39.4               2529.             64
    ##  8 Ecuador                       39.2               2048.             52
    ##  9 Peru                          37.5               1957.             52
    ## 10 Turkey                        33.5               1742.             52
    ## 11 Canada                        33.4               1942.             58
    ## 12 France                        31.0               2109.             68
    ## 13 Germany                       29.8               2060.             69
    ## 14 Chile                         28.5               1551.             54
    ## 15 Russia                        27.1               1412.             52
    ## 16 Saudi Arabia                  24.5               1377.             56
    ## 17 Iran                          18.6               1361.             73
    ## 18 Czech Republic                13.1                771.             58
    ## 19 Brazil                        12.0                672.             56
    ## 20 Romania                       11.9                674.             56

## Highest fatality rate areas

Among areas with more than 10 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 France                 19.2       26188   136578
    ##  2 Belgium                16.4        8521    52011
    ##  3 United Kingdom         14.8       31241   211368
    ##  4 Italy                  13.9       30201   217185
    ##  5 Netherlands            12.7        5359    42093
    ##  6 Spain                  11.8       26251   222857
    ##  7 Chad                   10.8          28      260
    ##  8 Mexico                 10.0        2961    29616
    ##  9 Algeria                 9.09        488     5369
    ## 10 Indonesia               7.19        943    13112
    ## 11 Canada                  6.84       4471    65399
    ## 12 Brazil                  6.77       9146   135106
    ## 13 Philippines             6.65        696    10463
    ## 14 Burkina Faso            6.52         48      736
    ## 15 Iran                    6.25       6541   104691
    ## 16 Romania                 6.06        898    14811
    ## 17 Egypt                   5.93        503     8476
    ## 18 United States           5.61      69889  1245874
    ## 19 Greece                  5.57        150     2691
    ## 20 Niger                   5.53         44      795

EOL
