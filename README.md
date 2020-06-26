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

Updated: 2020-06-27

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

    ## `summarise()` regrouping output by 'publish_date' (override with `.groups` argument)

![](README_files/figure-gfm/chart-1.png)<!-- -->

## Fastest spreading areas

Among areas with more than 5 million population, highest
“speed\_since\_100”, which is average number of newly confirmed cases
per day since cumulative cases became more than 100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_since_100 cum_conf days_since_100
    ##    <chr>                    <dbl>    <dbl>          <int>
    ##  1 United States           20582.  2367064            115
    ##  2 Brazil                  11428.  1188631            104
    ##  3 Russia                   6206.   620794            100
    ##  4 India                    4714.   490401            104
    ##  5 United Kingdom           2724.   307984            113
    ##  6 Peru                     2645.   264689            100
    ##  7 Chile                    2538.   259064            102
    ##  8 Spain                    2133.   247486            116
    ##  9 Mexico                   1987.   196847             99
    ## 10 Italy                    1932.   239706            124
    ## 11 Turkey                   1929.   193115            100
    ## 12 Pakistan                 1917.   195745            102
    ## 13 Iran                     1776.   215096            121
    ## 14 Germany                  1645.   192556            117
    ## 15 Saudi Arabia             1640.   170639            104
    ## 16 Bangladesh               1562.   126606             81
    ## 17 France                   1335.   155087            116
    ## 18 South Africa             1183.   118375            100
    ## 19 Canada                    963.   102242            106
    ## 20 Colombia                  778.    77113             99

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            152.               15470.            102
    ##  2 Peru                              88.5               8850.            100
    ##  3 Belarus                           70.7               6235.             88
    ##  4 United States                     66.3               7630.            115
    ##  5 Saudi Arabia                      63.7               6631.            104
    ##  6 Sweden                            59.6               6686.            112
    ##  7 Brazil                            56.8               5911.            104
    ##  8 Belgium                           52.3               5864.            112
    ##  9 Spain                             45.9               5322.            116
    ## 10 Russia                            44.1               4412.            100
    ## 11 United Kingdom                    43.7               4940.            113
    ## 12 Switzerland                       36.7               4135.            112
    ## 13 Portugal                          36.0               3786.            105
    ## 14 Ecuador                           35.8               3594.            100
    ## 15 Italy                             32.0               3973.            124
    ## 16 Bolivia                           31.6               2763.             87
    ## 17 Dominican Republic                31.0               2966.             95
    ## 18 Israel                            28.6               3002.            104
    ## 19 Canada                            28.6               3036.            106
    ## 20 Netherlands                       26.7               2999.            112

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  26.8         289     1080
    ##  2 France                 19.1       29675   155087
    ##  3 Belgium                15.9        9726    61007
    ##  4 Italy                  14.5       34678   239706
    ##  5 United Kingdom         14.0       43230   307984
    ##  6 Hungary                14.0         577     4123
    ##  7 Mexico                 12.4       24324   196847
    ##  8 Netherlands            12.2        6100    49914
    ##  9 Spain                  11.4       28330   247486
    ## 10 Chad                    8.57         74      863
    ## 11 Canada                  8.30       8484   102242
    ## 12 Sweden                  8.19       5230    63890
    ## 13 Ecuador                 8.17       4343    53156
    ## 14 Algeria                 7.06        878    12445
    ## 15 Niger                   6.33         67     1059
    ## 16 Romania                 6.19       1565    25286
    ## 17 Sudan                   6.19        556     8984
    ## 18 Greece                  5.75        191     3321
    ## 19 Burkina Faso            5.67         53      934
    ## 20 Mali                    5.54        113     2039

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                935.        9726   10.4 
    ##  2 United Kingdom         693.       43230   62.3 
    ##  3 Spain                  609.       28330   46.5 
    ##  4 Italy                  575.       34678   60.3 
    ##  5 Sweden                 547.        5230    9.56
    ##  6 France                 458.       29675   64.8 
    ##  7 United States          392.      121645  310.  
    ##  8 Netherlands            366.        6100   16.6 
    ##  9 Ecuador                294.        4343   14.8 
    ## 10 Chile                  293.        4903   16.7 
    ## 11 Peru                   287.        8586   29.9 
    ## 12 Brazil                 268.       53830  201.  
    ## 13 Canada                 252.        8484   33.7 
    ## 14 Switzerland            222.        1681    7.58
    ## 15 Mexico                 216.       24324  112.  
    ## 16 Portugal               145.        1549   10.7 
    ## 17 Iran                   132.       10130   76.9 
    ## 18 Denmark                110.         603    5.48
    ## 19 Germany                109.        8948   81.8 
    ## 20 Bolivia                 88.1        876    9.95

EOL
