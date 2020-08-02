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

Updated: 2020-08-03

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
    ##  1 United States           29762.  4523888            152
    ##  2 Brazil                  18882.  2662485            141
    ##  3 India                   12416.  1750723            141
    ##  4 Russia                   6210.   850870            137
    ##  5 South Africa             3673.   503290            137
    ##  6 Mexico                   3121.   424637            136
    ##  7 Peru                     2973.   407492            137
    ##  8 Chile                    2572.   357658            139
    ##  9 Colombia                 2172.   295508            136
    ## 10 Bangladesh               2032.   239860            118
    ## 11 United Kingdom           2026.   303956            150
    ## 12 Pakistan                 2001.   278305            139
    ## 13 Saudi Arabia             1967.   277478            141
    ## 14 Iran                     1941.   306752            158
    ## 15 Spain                    1885.   288522            153
    ## 16 Turkey                   1691.   231869            137
    ## 17 Italy                    1539.   247832            161
    ## 18 Argentina                1416.   191302            135
    ## 19 Germany                  1362.   209893            154
    ## 20 France                   1149.   175920            153

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            154.               21357.            139
    ##  2 Peru                              99.4              13625.            137
    ##  3 United States                     95.9              14582.            152
    ##  4 Brazil                            93.9              13239.            141
    ##  5 Saudi Arabia                      76.5              10783.            141
    ##  6 South Africa                      75.0              10271.            137
    ##  7 Israel                            65.9               9314.            141
    ##  8 Bolivia                           62.2               7719.            124
    ##  9 Sweden                            56.4               8416.            149
    ## 10 Belarus                           56.0               7016.            125
    ## 11 Dominican Republic                54.9               7270.            132
    ## 12 Kyrgyzstan                        53.2               6666.            125
    ## 13 Kazakhstan                        46.2               5971.            129
    ## 14 Colombia                          45.5               6183.            136
    ## 15 Belgium                           44.6               6662.            149
    ## 16 Russia                            44.1               6047.            137
    ## 17 Ecuador                           42.5               5830.            137
    ## 18 Honduras                          41.6               5259.            126
    ## 19 Spain                             40.5               6204.            153
    ## 20 Argentina                         34.3               4627.            135

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  28.5         495     1734
    ##  2 France                 17.1       30147   175920
    ##  3 United Kingdom         15.2       46193   303956
    ##  4 Belgium                14.2        9845    69309
    ##  5 Italy                  14.2       35146   247832
    ##  6 Hungary                13.2         597     4526
    ##  7 Netherlands            11.2        6148    54732
    ##  8 Mexico                 11.0       46688   424637
    ##  9 Spain                   9.86      28445   288522
    ## 10 Chad                    8.01         75      936
    ## 11 Canada                  7.68       8935   116312
    ## 12 Sweden                  7.14       5743    80422
    ## 13 Ecuador                 6.65       5736    86232
    ## 14 Sudan                   6.41        752    11738
    ## 15 Niger                   6.07         69     1136
    ## 16 Iran                    5.54      16982   306752
    ## 17 Syria                   5.51         43      780
    ## 18 China                   5.29       4674    88302
    ## 19 Egypt                   5.13       4834    94316
    ## 20 Mali                    4.89        124     2535

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                 946.       9845   10.4 
    ##  2 United Kingdom          741.      46193   62.3 
    ##  3 Peru                    636.      19021   29.9 
    ##  4 Spain                   612.      28445   46.5 
    ##  5 Sweden                  601.       5743    9.56
    ##  6 Italy                   582.      35146   60.3 
    ##  7 Chile                   569.       9533   16.7 
    ##  8 United States           492.     152630  310.  
    ##  9 France                  465.      30147   64.8 
    ## 10 Brazil                  460.      92475  201.  
    ## 11 Mexico                  415.      46688  112.  
    ## 12 Ecuador                 388.       5736   14.8 
    ## 13 Netherlands             369.       6148   16.6 
    ## 14 Bolivia                 299.       2977    9.95
    ## 15 Canada                  265.       8935   33.7 
    ## 16 Kyrgyzstan              256.       1409    5.51
    ## 17 Switzerland             225.       1707    7.58
    ## 18 Iran                    221.      16982   76.9 
    ## 19 Colombia                211.      10105   47.8 
    ## 20 Honduras                167.       1337    7.99

EOL
