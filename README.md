WHO, Covid-19 situation report
================
Mitsuo Shiota
2020/3/7

  - [Summary](#summary)
  - [Load](#load)
  - [Newly confirmed cases by region](#newly-confirmed-cases-by-region)
  - [Fastest spreading areas](#fastest-spreading-areas)
  - [Highest fatality rate areas](#highest-fatality-rate-areas)

Updated: 2020-04-23

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
    ##  1 United States           15536.   776907             50
    ##  2 Spain                    4001.   204178             51
    ##  3 Italy                    3116.   183957             59
    ##  4 Germany                  2799.   145694             52
    ##  5 Turkey                   2726.    95591             35
    ##  6 United Kingdom           2686.   129048             48
    ##  7 France                   2274.   116151             51
    ##  8 Russia                   1653.    57999             35
    ##  9 Iran                     1512.    84802             56
    ## 10 Brazil                   1037.    40581             39
    ## 11 Canada                    908.    37374             41
    ## 12 China                     903.    84287             93
    ## 13 Belgium                   869.    40956             47
    ## 14 Netherlands               724.    34134             47
    ## 15 Portugal                  532.    21379             40
    ## 16 India                     510.    19984             39
    ## 17 Peru                      462.    16325             35
    ## 18 Saudi Arabia              296.    11631             39
    ## 19 Ecuador                   293.    10398             35
    ## 20 Chile                     289.    10832             37

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Spain                        86.0                4390.             51
    ##  2 Belgium                      83.5                3937.             47
    ##  3 Italy                        51.6                3049.             59
    ##  4 United States                50.1                2504.             50
    ##  5 Portugal                     49.8                2003.             40
    ##  6 Netherlands                  43.5                2051.             47
    ##  7 United Kingdom               43.1                2070.             48
    ##  8 France                       35.1                1793.             51
    ##  9 Turkey                       35.0                1229.             35
    ## 10 Germany                      34.2                1781.             52
    ## 11 Canada                       27.0                1110.             41
    ## 12 Ecuador                      19.8                 703.             35
    ## 13 Iran                         19.7                1102.             56
    ## 14 Chile                        17.2                 647.             37
    ## 15 Czech Republic               16.1                 672.             41
    ## 16 Peru                         15.5                 546.             35
    ## 17 Russia                       11.7                 412.             35
    ## 18 Saudi Arabia                 11.5                 452.             39
    ## 19 Romania                      10.6                 421.             39
    ## 20 Australia                     7.06                309.             43

## Highest fatality rate areas

Among areas with more than 10 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area                             fatality_rate cum_deaths cum_conf
    ##    <chr>                                    <dbl>      <dbl>    <dbl>
    ##  1 France                                   17.9       20763   116151
    ##  2 Belgium                                  14.6        5998    40956
    ##  3 Algeria                                  13.9         392     2811
    ##  4 United Kingdom                           13.4       17337   129048
    ##  5 Italy                                    13.4       24648   183957
    ##  6 Netherlands                              11.5        3916    34134
    ##  7 Spain                                    10.4       21282   204178
    ##  8 Sudan                                     9.29         13      140
    ##  9 Indonesia                                 8.63        616     7135
    ## 10 Mexico                                    8.12        712     8772
    ## 11 Egypt                                     7.56        264     3490
    ## 12 Democratic Republic of the Congo          6.96         25      359
    ## 13 Philippines                               6.62        437     6599
    ## 14 Burkina Faso                              6.54         38      581
    ## 15 Brazil                                    6.35       2575    40581
    ## 16 Iran                                      6.25       5297    84802
    ## 17 China                                     5.51       4642    84287
    ## 18 Mali                                      5.43         14      258
    ## 19 Romania                                   5.23        483     9242
    ## 20 Iraq                                      5.18         83     1602

EOL
