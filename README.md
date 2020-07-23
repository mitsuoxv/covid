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

Updated: 2020-07-23

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

Region classification is mostly based on [UN M49
Standard](https://unstats.un.org/unsd/methodology/m49/).

![](README_files/figure-gfm/chart-1.png)<!-- -->

## Fastest spreading areas

Among areas with more than 5 million population, highest
“speed\_since\_100”, which is average number of newly confirmed cases
per day since cumulative cases became more than 100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_since_100 cum_conf days_since_100
    ##    <chr>                    <dbl>    <dbl>          <int>
    ##  1 United States           26989.  3805524            141
    ##  2 Brazil                  16296.  2118646            130
    ##  3 India                    9175.  1192915            130
    ##  4 Russia                   6262.   789190            126
    ##  5 South Africa             3029.   381798            126
    ##  6 Peru                     2838.   357681            126
    ##  7 Mexico                   2794.   349396            125
    ##  8 Chile                    2613.   334683            128
    ##  9 United Kingdom           2127.   295821            139
    ## 10 Pakistan                 2088.   267428            128
    ## 11 Saudi Arabia             1967.   255825            130
    ## 12 Bangladesh               1966.   210510            107
    ## 13 Iran                     1896.   278827            147
    ## 14 Spain                    1874.   266194            142
    ## 15 Turkey                   1756.   221500            126
    ## 16 Colombia                 1631.   204005            125
    ## 17 Italy                    1631.   244752            150
    ## 18 Germany                  1417.   202799            143
    ## 19 France                   1171.   166511            142
    ## 20 Argentina                1054.   130774            124

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            156.               19985.            128
    ##  2 Peru                              94.9              11960.            126
    ##  3 United States                     87.0              12267.            141
    ##  4 Brazil                            81.0              10535.            130
    ##  5 Saudi Arabia                      76.4               9942.            130
    ##  6 South Africa                      61.8               7792.            126
    ##  7 Belarus                           60.0               6851.            114
    ##  8 Sweden                            59.2               8180.            138
    ##  9 Israel                            54.6               7123.            130
    ## 10 Bolivia                           54.2               6131.            113
    ## 11 Kyrgyzstan                        46.6               5330.            114
    ## 12 Dominican Republic                45.9               5578.            121
    ## 13 Belgium                           44.7               6177.            138
    ## 14 Russia                            44.5               5609.            126
    ## 15 Kazakhstan                        41.4               4899.            118
    ## 16 Ecuador                           40.8               5153.            126
    ## 17 Spain                             40.3               5724.            142
    ## 18 Honduras                          37.6               4332.            115
    ## 19 Portugal                          34.9               4580.            131
    ## 20 Colombia                          34.1               4269.            125

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  28.0         457     1633
    ##  2 France                 18.0       30054   166511
    ##  3 United Kingdom         15.4       45422   295821
    ##  4 Belgium                15.3        9805    64258
    ##  5 Italy                  14.3       35073   244752
    ##  6 Hungary                13.7         596     4366
    ##  7 Netherlands            11.8        6136    52073
    ##  8 Mexico                 11.3       39485   349396
    ##  9 Spain                  10.7       28424   266194
    ## 10 Chad                    8.44         75      889
    ## 11 Canada                  7.97       8858   111124
    ## 12 Sweden                  7.22       5646    78166
    ## 13 Ecuador                 7.04       5366    76217
    ## 14 Sudan                   6.34        706    11127
    ## 15 Niger                   6.23         69     1108
    ## 16 Syria                   5.74         31      540
    ## 17 China                   5.40       4655    86226
    ## 18 Romania                 5.30       2074    39133
    ## 19 Iran                    5.25      14634   278827
    ## 20 Switzerland             5.02       1690    33655

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                 943.       9805   10.4 
    ##  2 United Kingdom          729.      45422   62.3 
    ##  3 Spain                   611.      28424   46.5 
    ##  4 Sweden                  591.       5646    9.56
    ##  5 Italy                   581.      35073   60.3 
    ##  6 Chile                   518.       8677   16.7 
    ##  7 France                  464.      30054   64.8 
    ##  8 United States           453.     140437  310.  
    ##  9 Peru                    448.      13384   29.9 
    ## 10 Brazil                  398.      80120  201.  
    ## 11 Netherlands             369.       6136   16.6 
    ## 12 Ecuador                 363.       5366   14.8 
    ## 13 Mexico                  351.      39485  112.  
    ## 14 Canada                  263.       8858   33.7 
    ## 15 Bolivia                 223.       2218    9.95
    ## 16 Switzerland             223.       1690    7.58
    ## 17 Kyrgyzstan              204.       1123    5.51
    ## 18 Iran                    190.      14634   76.9 
    ## 19 Portugal                159.       1697   10.7 
    ## 20 Colombia                145.       6929   47.8

EOL
