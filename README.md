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

Updated: 2020-07-22

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
    ##  1 United States           26772.  3748248            140
    ##  2 Brazil                  16266.  2098389            129
    ##  3 India                    8954.  1155191            129
    ##  4 Russia                   6265.   783328            125
    ##  5 South Africa             2988.   373628            125
    ##  6 Peru                     2828.   353590            125
    ##  7 Mexico                   2775.   344224            124
    ##  8 Chile                    2621.   333029            127
    ##  9 United Kingdom           2140.   295376            138
    ## 10 Pakistan                 2094.   266096            127
    ## 11 Saudi Arabia             1963.   253349            129
    ## 12 Bangladesh               1956.   207453            106
    ## 13 Iran                     1891.   276202            146
    ## 14 Spain                    1877.   264836            141
    ## 15 Turkey                   1763.   220572            125
    ## 16 Italy                    1641.   244624            149
    ## 17 Colombia                 1590.   197278            124
    ## 18 Germany                  1424.   202345            142
    ## 19 France                   1176.   166057            141
    ## 20 Argentina                1029.   126755            123

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            157.               19886.            127
    ##  2 Peru                              94.5              11823.            125
    ##  3 United States                     86.3              12082.            140
    ##  4 Brazil                            80.9              10434.            129
    ##  5 Saudi Arabia                      76.3               9846.            129
    ##  6 South Africa                      61.0               7625.            125
    ##  7 Belarus                           60.4               6837.            113
    ##  8 Sweden                            59.5               8168.            137
    ##  9 Bolivia                           53.4               5990.            112
    ## 10 Israel                            53.0               6866.            129
    ## 11 Dominican Republic                45.6               5492.            120
    ## 12 Kyrgyzstan                        45.2               5129.            113
    ## 13 Belgium                           44.9               6161.            137
    ## 14 Russia                            44.5               5567.            125
    ## 15 Kazakhstan                        40.9               4789.            117
    ## 16 Spain                             40.4               5695.            141
    ## 17 Ecuador                           40.3               5045.            125
    ## 18 Honduras                          37.0               4235.            114
    ## 19 Portugal                          35.1               4568.            130
    ## 20 United Kingdom                    34.3               4738.            138

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  27.6         448     1623
    ##  2 France                 18.1       30066   166057
    ##  3 United Kingdom         15.3       45312   295376
    ##  4 Belgium                15.3        9805    64094
    ##  5 Italy                  14.3       35058   244624
    ##  6 Hungary                13.7         596     4347
    ##  7 Netherlands            11.8        6136    51910
    ##  8 Mexico                 11.4       39184   344224
    ##  9 Spain                  10.7       28422   264836
    ## 10 Chad                    8.44         75      889
    ## 11 Canada                  8.02       8852   110338
    ## 12 Sweden                  7.23       5639    78048
    ## 13 Ecuador                 7.13       5318    74620
    ## 14 Sudan                   6.30        693    10992
    ## 15 Niger                   6.24         69     1105
    ## 16 Syria                   5.56         29      522
    ## 17 China                   5.40       4653    86152
    ## 18 Romania                 5.34       2038    38139
    ## 19 Iran                    5.22      14405   276202
    ## 20 Switzerland             5.03       1687    33547

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                 943.       9805   10.4 
    ##  2 United Kingdom          727.      45312   62.3 
    ##  3 Spain                   611.      28422   46.5 
    ##  4 Sweden                  590.       5639    9.56
    ##  5 Italy                   581.      35058   60.3 
    ##  6 Chile                   516.       8633   16.7 
    ##  7 France                  464.      30066   64.8 
    ##  8 United States           451.     139964  310.  
    ##  9 Peru                    441.      13187   29.9 
    ## 10 Brazil                  395.      79488  201.  
    ## 11 Netherlands             369.       6136   16.6 
    ## 12 Ecuador                 360.       5318   14.8 
    ## 13 Mexico                  348.      39184  112.  
    ## 14 Canada                  263.       8852   33.7 
    ## 15 Switzerland             223.       1687    7.58
    ## 16 Bolivia                 216.       2151    9.95
    ## 17 Kyrgyzstan              196.       1079    5.51
    ## 18 Iran                    187.      14405   76.9 
    ## 19 Portugal                158.       1691   10.7 
    ## 20 Colombia                141.       6736   47.8

EOL
