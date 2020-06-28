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

Updated: 2020-06-29

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
    ##  1 United States           20957.  2452048            117
    ##  2 Brazil                  12027.  1274974            106
    ##  3 Russia                   6219.   634437            102
    ##  4 India                    4988.   528859            106
    ##  5 United Kingdom           2697.   310254            115
    ##  6 Peru                     2669.   272364            102
    ##  7 Chile                    2573.   267766            104
    ##  8 Spain                    2105.   248469            118
    ##  9 Mexico                   2062.   208392            101
    ## 10 Pakistan                 1950.   202955            104
    ## 11 Turkey                   1919.   195883            102
    ## 12 Italy                    1905.   240136            126
    ## 13 Iran                     1789.   220180            123
    ## 14 Saudi Arabia             1683.   178504            106
    ## 15 Germany                  1625.   193499            119
    ## 16 Bangladesh               1613.   133978             83
    ## 17 France                   1322.   156156            118
    ## 18 South Africa             1291.   131800            102
    ## 19 Canada                    951.   102794            108
    ## 20 Colombia                  835.    84442            101

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            154.               15989.            104
    ##  2 Peru                              89.2               9107.            102
    ##  3 Belarus                           69.9               6308.             90
    ##  4 United States                     67.6               7904.            117
    ##  5 Saudi Arabia                      65.4               6937.            106
    ##  6 Brazil                            59.8               6340.            106
    ##  7 Sweden                            59.7               6816.            114
    ##  8 Belgium                           51.5               5884.            114
    ##  9 Spain                             45.3               5343.            118
    ## 10 Russia                            44.2               4509.            102
    ## 11 United Kingdom                    43.3               4976.            115
    ## 12 Switzerland                       36.2               4151.            114
    ## 13 Ecuador                           36.1               3690.            102
    ## 14 Portugal                          36.0               3858.            107
    ## 15 Bolivia                           33.1               2958.             89
    ## 16 Dominican Republic                31.9               3117.             97
    ## 17 Italy                             31.6               3980.            126
    ## 18 Israel                            28.7               3062.            106
    ## 19 Canada                            28.2               3052.            108
    ## 20 South Africa                      26.3               2690.            102

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  26.8         297     1107
    ##  2 France                 19.0       29700   156156
    ##  3 Belgium                15.9        9732    61209
    ##  4 Italy                  14.5       34716   240136
    ##  5 United Kingdom         14.0       43514   310254
    ##  6 Hungary                14.0         578     4138
    ##  7 Mexico                 12.4       25779   208392
    ##  8 Netherlands            12.2        6105    50074
    ##  9 Spain                  11.4       28341   248469
    ## 10 Chad                    8.55         74      865
    ## 11 Canada                  8.28       8508   102794
    ## 12 Ecuador                 8.11       4424    54574
    ## 13 Sweden                  8.11       5280    65137
    ## 14 Algeria                 6.88        892    12968
    ## 15 Niger                   6.33         67     1059
    ## 16 Sudan                   6.18        572     9258
    ## 17 Romania                 6.11       1589    26022
    ## 18 Greece                  5.67        191     3366
    ## 19 Burkina Faso            5.56         53      954
    ## 20 Mali                    5.49        113     2060

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                935.        9732   10.4 
    ##  2 United Kingdom         698.       43514   62.3 
    ##  3 Spain                  609.       28341   46.5 
    ##  4 Italy                  575.       34716   60.3 
    ##  5 Sweden                 553.        5280    9.56
    ##  6 France                 459.       29700   64.8 
    ##  7 United States          402.      124811  310.  
    ##  8 Netherlands            367.        6105   16.6 
    ##  9 Chile                  319.        5347   16.7 
    ## 10 Ecuador                299.        4424   14.8 
    ## 11 Peru                   299.        8939   29.9 
    ## 12 Brazil                 278.       55961  201.  
    ## 13 Canada                 253.        8508   33.7 
    ## 14 Mexico                 229.       25779  112.  
    ## 15 Switzerland            222.        1681    7.58
    ## 16 Portugal               146.        1561   10.7 
    ## 17 Iran                   135.       10364   76.9 
    ## 18 Denmark                110.         604    5.48
    ## 19 Germany                109.        8957   81.8 
    ## 20 Bolivia                 93.9        934    9.95

EOL
