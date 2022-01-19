WHO, Covid-19 situation report
================
Mitsuo Shiota
2020-03-07

-   [Summary](#summary)
-   [Read data from WHO](#read-data-from-who)
-   [Newly confirmed cases by region](#newly-confirmed-cases-by-region)
-   [Fastest spreading areas](#fastest-spreading-areas)
-   [Highest fatality rate areas](#highest-fatality-rate-areas)
-   [Highest deaths per population
    areas](#highest-deaths-per-population-areas)

<!-- badges: start -->

[![R-CMD-check](https://github.com/mitsuoxv/covid/workflows/R-CMD-check/badge.svg)](https://github.com/mitsuoxv/covid/actions)
<!-- badges: end -->

Updated: 2022-01-20

I added “Japan, Covid-19 situation by prefecture” in [another
page](Japan.md). I added “USA, Covid-19 situation by state” in [another
page](USA.md).

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

## Read data from WHO

WHO offers [Data Table in its Dashboard](https://covid19.who.int/table).
I use the data from
<https://covid19.who.int/WHO-COVID-19-global-data.csv>.

I also use the data, like area name and population, from
<https://countrycode.org/>.

## Newly confirmed cases by region

I watch newly confirmed cases. China is suceeding to contain the
coronavirus, but areas outside China now face the challenge.

Region classification is mostly based on [UN M49
Standard](https://unstats.un.org/unsd/methodology/m49/). One exception
is “West Europe”, which I make by combining “Western”, “Northern” and
“Southern Europe”. “West Europe” is basically Europe other than “Eastern
Europe”.

![](README_files/figure-gfm/chart-1.png)<!-- -->

## Fastest spreading areas

Among areas with more than 5 million population, highest
“speed\_since\_100”, which is average number of newly confirmed cases
per day since cumulative cases became more than 100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_since_100 cum_conf days_since_100
    ##    <chr>                    <dbl>    <dbl>          <int>
    ##  1 United States           96441. 66254888            687
    ##  2 India                   56067. 37901241            676
    ##  3 Brazil                  34084. 23074791            677
    ##  4 United Kingdom          22481. 15399304            685
    ##  5 France                  20822. 14346424            689
    ##  6 Russia                  16219. 10899411            672
    ##  7 Turkey                  15760. 10590866            672
    ##  8 Italy                   12957.  9018425            696
    ##  9 Spain                   12245.  8424504            688
    ## 10 Germany                 11865.  8186850            690
    ## 11 Argentina               10726.  7197323            671
    ## 12 Iran                     8974.  6227849            694
    ## 13 Colombia                 8286.  5568068            672
    ## 14 Poland                   6470.  4373718            676
    ## 15 Mexico                   6468.  4385415            678
    ## 16 Indonesia                6325.  4275528            676
    ## 17 Ukraine                  5677.  3780903            666
    ## 18 Netherlands              5333.  3642696            683
    ## 19 South Africa             5304.  3564578            672
    ## 20 Philippines              4838.  3270758            676

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        386.             262055.            678
    ##  2 Czech Republic                373.             253215.            678
    ##  3 United Kingdom                361.             246988.            685
    ##  4 Belgium                       353.             242378.            686
    ##  5 Switzerland                   337.             231634.            687
    ##  6 France                        321.             221503.            689
    ##  7 Netherlands                   320.             218846.            683
    ##  8 Denmark                       319.             217629.            681
    ##  9 United States                 311.             213565.            687
    ## 10 Serbia                        298.             199759.            671
    ## 11 Portugal                      270.             182711.            677
    ## 12 Austria                       264.             179819.            681
    ## 13 Spain                         263.             181149.            688
    ## 14 Jordan                        260.             173430.            668
    ## 15 Argentina                     259.             174087.            671
    ## 16 Sweden                        254.             173465.            683
    ## 17 Slovakia                      243.             163297.            672
    ## 18 Greece                        228.             154854.            678
    ## 19 Italy                         215.             149459.            696
    ## 20 Hungary                       205.             137244.            670

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.1        1992    10449
    ##  2 Peru                 7.73     203550  2631826
    ##  3 Mexico               6.87     301469  4385415
    ##  4 Sudan                6.39       3390    53080
    ##  5 Syria                5.81       2953    50784
    ##  6 Egypt                5.52      22205   402611
    ##  7 Somalia              5.50       1335    24261
    ##  8 Ecuador              5.44      34232   629507
    ##  9 Afghanistan          4.64       7383   158974
    ## 10 China                4.18       5700   136441
    ## 11 Bulgaria             3.84      32338   841785
    ## 12 Myanmar              3.62      19305   533408
    ## 13 Niger                3.46        293     8459
    ## 14 Indonesia            3.37     144192  4275528
    ## 15 Paraguay             3.34      16844   504380
    ## 16 Tunisia              3.21      25846   804353
    ## 17 El Salvador          3.10       3837   123577
    ## 18 Romania              3.08      59327  1928306
    ## 19 Malawi               2.99       2480    82975
    ## 20 Hungary              2.97      40686  1369974

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6806.     203550   29.9 
    ##  2 Bulgaria               4524.      32338    7.15
    ##  3 Hungary                4076.      40686    9.98
    ##  4 Czech Republic         3526.      36937   10.5 
    ##  5 Slovakia               3201.      17459    5.46
    ##  6 Brazil                 3089.     621166  201.  
    ##  7 Argentina              2860.     118231   41.3 
    ##  8 Belgium                2758.      28695   10.4 
    ##  9 Colombia               2744.     131130   47.8 
    ## 10 United States          2729.     846647  310.  
    ## 11 Romania                2702.      59327   22.0 
    ## 12 Mexico                 2680.     301469  112.  
    ## 13 Poland                 2677.     103062   38.5 
    ## 14 Paraguay               2642.      16844    6.38
    ## 15 United Kingdom         2446.     152513   62.3 
    ## 16 Tunisia                2441.      25846   10.6 
    ## 17 Chile                  2354.      39427   16.7 
    ## 18 Italy                  2350.     141825   60.3 
    ## 19 Ecuador                2314.      34232   14.8 
    ## 20 Russia                 2298.     323376  141.

EOL
