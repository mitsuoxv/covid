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

Updated: 2020-08-01

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
    ##  1 United States           29256.  4388566            150
    ##  2 Brazil                  18361.  2552265            139
    ##  3 India                   11790.  1638870            139
    ##  4 Russia                   6221.   839981            135
    ##  5 South Africa             3571.   482169            135
    ##  6 Mexico                   3047.   408449            134
    ##  7 Peru                     2967.   400683            135
    ##  8 Chile                    2579.   353536            137
    ##  9 Colombia                 2059.   276055            134
    ## 10 United Kingdom           2042.   302305            148
    ## 11 Pakistan                 2030.   278305            137
    ## 12 Bangladesh               2024.   234889            116
    ## 13 Saudi Arabia             1972.   274219            139
    ## 14 Iran                     1932.   301530            156
    ## 15 Spain                    1890.   285430            151
    ## 16 Turkey                   1701.   229891            135
    ## 17 Italy                    1554.   247158            159
    ## 18 Germany                  1366.   207828            152
    ## 19 Argentina                1345.   178996            133
    ## 20 France                   1155.   174648            151

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            154.               21111.            137
    ##  2 Peru                              99.2              13398.            135
    ##  3 United States                     94.3              14146.            150
    ##  4 Brazil                            91.3              12691.            139
    ##  5 Saudi Arabia                      76.6              10657.            139
    ##  6 South Africa                      72.9               9840.            135
    ##  7 Israel                            66.8               9314.            139
    ##  8 Bolivia                           60.5               7392.            122
    ##  9 Sweden                            56.9               8382.            147
    ## 10 Belarus                           56.8               7001.            123
    ## 11 Dominican Republic                53.0               6913.            130
    ## 12 Kyrgyzstan                        52.7               6500.            123
    ## 13 Kazakhstan                        45.7               5807.            127
    ## 14 Belgium                           44.3               6528.            147
    ## 15 Russia                            44.2               5970.            135
    ## 16 Colombia                          43.1               5776.            134
    ## 17 Ecuador                           42.2               5704.            135
    ## 18 Honduras                          41.2               5125.            124
    ## 19 Spain                             40.6               6137.            151
    ## 20 Portugal                          34.0               4765.            140

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  28.2         488     1730
    ##  2 France                 17.3       30136   174648
    ##  3 United Kingdom         15.2       45999   302305
    ##  4 Belgium                14.5        9840    67913
    ##  5 Italy                  14.2       35132   247158
    ##  6 Hungary                13.2         596     4505
    ##  7 Netherlands            11.4        6147    53963
    ##  8 Mexico                 11.1       45361   408449
    ##  9 Spain                   9.96      28443   285430
    ## 10 Chad                    8.02         75      935
    ## 11 Canada                  7.72       8917   115470
    ## 12 Sweden                  7.16       5739    80100
    ## 13 Ecuador                 6.70       5657    84370
    ## 14 Sudan                   6.31        725    11496
    ## 15 Niger                   6.08         69     1134
    ## 16 Syria                   5.56         41      738
    ## 17 Iran                    5.49      16569   301530
    ## 18 China                   5.30       4666    87956
    ## 19 Egypt                   5.09       4774    93757
    ## 20 Mali                    4.92        124     2522

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                 946.       9840   10.4 
    ##  2 United Kingdom          738.      45999   62.3 
    ##  3 Peru                    629.      18816   29.9 
    ##  4 Spain                   612.      28443   46.5 
    ##  5 Sweden                  601.       5739    9.56
    ##  6 Italy                   582.      35132   60.3 
    ##  7 Chile                   560.       9377   16.7 
    ##  8 United States           484.     150054  310.  
    ##  9 France                  465.      30136   64.8 
    ## 10 Brazil                  448.      90134  201.  
    ## 11 Mexico                  403.      45361  112.  
    ## 12 Ecuador                 382.       5657   14.8 
    ## 13 Netherlands             369.       6147   16.6 
    ## 14 Bolivia                 282.       2808    9.95
    ## 15 Canada                  265.       8917   33.7 
    ## 16 Kyrgyzstan              250.       1378    5.51
    ## 17 Switzerland             225.       1703    7.58
    ## 18 Iran                    215.      16569   76.9 
    ## 19 Colombia                198.       9454   47.8 
    ## 20 Portugal                162.       1727   10.7

EOL
