WHO, Covid-19 situation report
================
Mitsuo Shiota
2020/3/7

  - [Summary](#summary)
  - [Load](#load)
  - [Newly confirmed cases by region](#newly-confirmed-cases-by-region)
  - [Fastest spreading areas](#fastest-spreading-areas)
  - [Highest fatality rate areas](#highest-fatality-rate-areas)
  - [Highest deaths per population
    areas](#highest-deaths-per-population-areas)

Updated: 2020-05-29

I added “USA, Covid-19 situation by state” in [another page](USA.md).

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

I later found [Johns Hopkins University, Coronavirus Resource
Center](https://coronavirus.jhu.edu/) and [Financial Times, Coronavirus
tracked](https://www.ft.com/content/a26fbf7e-48f8-11ea-aeb3-955839e06441)
are very informative, and that they provide some time-series charts of
the newly confirmed cases.

I added the United States page to [my Shiny
App](https://mitsuoxv.shinyapps.io/covid/) on May 25, 2020. I use data
from [USAFacts
page](https://usafacts.org/visualizations/coronavirus-covid-19-spread-map/).

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
    ##  1 United States           19288.  1658896             86
    ##  2 Russia                   5337.   379051             71
    ##  3 Brazil                   5215.   391222             75
    ##  4 United Kingdom           3180.   267244             84
    ##  5 Spain                    2724.   237141             87
    ##  6 Italy                    2432.   231139             95
    ##  7 Turkey                   2248.   159797             71
    ##  8 India                    2110.   158333             75
    ##  9 Germany                  2041.   179717             88
    ## 10 Peru                     1825.   129751             71
    ## 11 France                   1640.   142852             87
    ## 12 Iran                     1538.   141591             92
    ## 13 Canada                   1127.    86939             77
    ## 14 Chile                    1125.    82289             73
    ## 15 Mexico                   1063.    74560             70
    ## 16 Saudi Arabia             1046.    78541             75
    ## 17 Pakistan                  836.    61227             73
    ## 18 Bangladesh                734.    38292             52
    ## 19 Belgium                   693.    57592             83
    ## 20 China                     653.    84547            129

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Chile                         67.2               4914.             73
    ##  2 Belgium                       66.6               5536.             83
    ##  3 United States                 62.2               5347.             86
    ##  4 Peru                          61.0               4338.             71
    ##  5 Spain                         58.6               5099.             87
    ##  6 United Kingdom                51.0               4286.             84
    ##  7 Saudi Arabia                  40.6               3052.             75
    ##  8 Italy                         40.3               3831.             95
    ##  9 Portugal                      38.4               2931.             76
    ## 10 Russia                        37.9               2694.             71
    ## 11 Ecuador                       36.1               2576.             71
    ## 12 Canada                        33.5               2581.             77
    ## 13 Netherlands                   33.0               2750.             83
    ## 14 Turkey                        28.9               2054.             71
    ## 15 Brazil                        25.9               1945.             75
    ## 16 France                        25.3               2206.             87
    ## 17 Germany                       24.9               2197.             88
    ## 18 Iran                          20.0               1841.             92
    ## 19 Romania                       11.2                847.             75
    ## 20 Czech Republic                11.1                867.             77

## Highest fatality rate areas

Among areas with more than 10 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  20.8          54      260
    ##  2 France                 20.0       28543   142852
    ##  3 Belgium                16.3        9364    57592
    ##  4 Italy                  14.3       33072   231139
    ##  5 United Kingdom         14.0       37460   267244
    ##  6 Netherlands            12.8        5871    45768
    ##  7 Spain                  12.2       29036   237141
    ##  8 Mexico                 10.9        8134    74560
    ##  9 Chad                    8.95         64      715
    ## 10 Ecuador                 8.60       3275    38103
    ## 11 Canada                  7.67       6671    86939
    ## 12 Algeria                 7.03        623     8857
    ## 13 Niger                   6.70         64      955
    ## 14 Romania                 6.56       1219    18594
    ## 15 Mali                    6.27         70     1116
    ## 16 Burkina Faso            6.27         53      845
    ## 17 Brazil                  6.27      24512   391222
    ## 18 Indonesia               6.18       1473    23851
    ## 19 Philippines             6.01        904    15049
    ## 20 Greece                  5.96        173     2903

## Highest deaths per population areas

Among areas with more than 10 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                900.        9364    10.4
    ##  2 Spain                  624.       29036    46.5
    ##  3 United Kingdom         601.       37460    62.3
    ##  4 Italy                  548.       33072    60.3
    ##  5 France                 441.       28543    64.8
    ##  6 Netherlands            353.        5871    16.6
    ##  7 United States          316.       98119   310. 
    ##  8 Ecuador                221.        3275    14.8
    ##  9 Canada                 198.        6671    33.7
    ## 10 Portugal               127.        1356    10.7
    ## 11 Peru                   127.        3788    29.9
    ## 12 Brazil                 122.       24512   201. 
    ## 13 Germany                103.        8411    81.8
    ## 14 Iran                    98.3       7564    76.9
    ## 15 Mexico                  72.3       8134   112. 
    ## 16 Turkey                  57.0       4431    77.8
    ## 17 Romania                 55.5       1219    22.0
    ## 18 Chile                   50.2        841    16.7
    ## 19 Czech Republic          30.3        317    10.5
    ## 20 Russia                  29.4       4142   141.

EOL
