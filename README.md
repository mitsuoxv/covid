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

Updated: 2020-08-12

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
    ##  1 United States           31054.  4999815            161
    ##  2 Brazil                  20235.  3035422            150
    ##  3 India                   15124.  2268675            150
    ##  4 Russia                   6147.   897599            146
    ##  5 South Africa             3859.   563598            146
    ##  6 Mexico                   3311.   480278            145
    ##  7 Peru                     3273.   478024            146
    ##  8 Colombia                 2672.   387481            145
    ##  9 Chile                    2533.   375044            148
    ## 10 Bangladesh               2050.   260507            127
    ## 11 Iran                     1968.   328844            167
    ## 12 United Kingdom           1959.   311645            159
    ## 13 Spain                    1940.   314362            162
    ## 14 Saudi Arabia             1932.   289947            150
    ## 15 Pakistan                 1926.   285191            148
    ## 16 Argentina                1711.   246499            144
    ## 17 Turkey                   1656.   241997            146
    ## 18 Italy                    1475.   250825            170
    ## 19 Germany                  1332.   217293            163
    ## 20 France                   1171.   189972            162

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            151.               22395.            148
    ##  2 Peru                             109.               15984.            146
    ##  3 Brazil                           101.               15094.            150
    ##  4 United States                    100.               16116.            161
    ##  5 South Africa                      78.8              11502             146
    ##  6 Israel                            75.4              11327.            150
    ##  7 Saudi Arabia                      75.1              11268.            150
    ##  8 Bolivia                           67.9               9047.            133
    ##  9 Dominican Republic                57.9               8194.            141
    ## 10 Colombia                          55.9               8108.            145
    ## 11 Sweden                            54.9               8683.            158
    ## 12 Kyrgyzstan                        54.7               7344.            134
    ## 13 Kazakhstan                        53.6               7399.            138
    ## 14 Belarus                           53.0               7119.            134
    ## 15 Belgium                           45.3               7164.            158
    ## 16 Honduras                          43.9               5940.            135
    ## 17 Ecuador                           43.8               6403.            146
    ## 18 Russia                            43.7               6379.            146
    ## 19 Spain                             41.7               6760.            162
    ## 20 Argentina                         41.4               5962.            144

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  28.4         519     1830
    ##  2 France                 15.9       30214   189972
    ##  3 United Kingdom         14.9       46526   311645
    ##  4 Italy                  14.0       35209   250825
    ##  5 Belgium                13.3        9879    74527
    ##  6 Hungary                12.8         605     4731
    ##  7 Mexico                 10.9       52298   480278
    ##  8 Netherlands            10.4        6148    59139
    ##  9 Spain                   9.07      28503   314362
    ## 10 Chad                    8.04         76      945
    ## 11 Canada                  7.52       8981   119451
    ## 12 Sweden                  6.95       5766    82972
    ## 13 Sudan                   6.53        781    11956
    ## 14 Ecuador                 6.26       5932    94701
    ## 15 Niger                   5.96         69     1158
    ## 16 Iran                    5.66      18616   328844
    ## 17 Egypt                   5.26       5035    95666
    ## 18 China                   5.25       4696    89383
    ## 19 Mali                    4.86        125     2573
    ## 20 Switzerland             4.67       1711    36619

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                 950.       9879   10.4 
    ##  2 United Kingdom          746.      46526   62.3 
    ##  3 Peru                    705.      21072   29.9 
    ##  4 Spain                   613.      28503   46.5 
    ##  5 Chile                   605.      10139   16.7 
    ##  6 Sweden                  603.       5766    9.56
    ##  7 Italy                   584.      35209   60.3 
    ##  8 United States           521.     161547  310.  
    ##  9 Brazil                  502.     101049  201.  
    ## 10 France                  466.      30214   64.8 
    ## 11 Mexico                  465.      52298  112.  
    ## 12 Ecuador                 401.       5932   14.8 
    ## 13 Netherlands             369.       6148   16.6 
    ## 14 Bolivia                 366.       3640    9.95
    ## 15 Colombia                269.      12842   47.8 
    ## 16 Kyrgyzstan              268.       1478    5.51
    ## 17 Canada                  267.       8981   33.7 
    ## 18 Iran                    242.      18616   76.9 
    ## 19 Switzerland             226.       1711    7.58
    ## 20 South Africa            217.      10621   49

EOL
