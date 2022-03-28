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

Updated: 2022-03-29

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
“speed_since_100”, which is average number of newly confirmed cases per
day since cumulative cases became more than 100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_since_100 cum_conf days_since_100
    ##    <chr>                    <dbl>    <dbl>          <int>
    ##  1 United States          104910. 79207517            755
    ##  2 India                   57823. 43020723            744
    ##  3 Brazil                  40003. 29802257            745
    ##  4 France                  32090. 24291909            757
    ##  5 United Kingdom          27405. 20691127            755
    ##  6 Germany                 26812. 20323779            758
    ##  7 Russia                  24032. 17783843            740
    ##  8 Turkey                  20001. 14800677            740
    ##  9 Italy                   18802. 14364723            764
    ## 10 South Korea             15649. 12003054            767
    ## 11 Spain                   15148. 11451676            756
    ## 12 Vietnam                 12244.  9011473            736
    ## 13 Argentina               12115.  9026075            745
    ## 14 Netherlands             10325.  7753878            751
    ## 15 Iran                     9384.  7151088            762
    ## 16 Japan                    8326.  6377719            766
    ## 17 Colombia                 8221.  6083291            740
    ## 18 Indonesia                8067.  6001751            744
    ## 19 Poland                   7991.  5945594            744
    ## 20 Mexico                   7574.  5649977            746

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Denmark                       741.             554807.            749
    ##  2 Israel                        704.             525875.            747
    ##  3 Netherlands                   620.             465838.            751
    ##  4 Austria                       614.             459627.            749
    ##  5 Switzerland                   601.             453467.            755
    ##  6 France                        495.             375058.            757
    ##  7 Czech Republic                485.             361810.            746
    ##  8 Belgium                       482.             363557.            754
    ##  9 United Kingdom                440.             331863.            755
    ## 10 Portugal                      429.             319690.            745
    ## 11 Slovakia                      419.             309845.            740
    ## 12 Norway                        370.             279017.            754
    ## 13 Serbia                        363.             268085.            739
    ## 14 Jordan                        359.             264158.            736
    ## 15 Greece                        357.             266393.            746
    ## 16 Sweden                        346.             259707.            751
    ## 17 United States                 338.             255316.            755
    ## 18 Germany                       328.             248450.            758
    ## 19 Spain                         326.             246241.            756
    ## 20 South Korea                   323.             247881.            767

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2142    11803
    ##  2 Sudan                 7.92       4902    61916
    ##  3 Peru                  5.98     212102  3544862
    ##  4 Mexico                5.71     322735  5649977
    ##  5 Syria                 5.63       3135    55663
    ##  6 Somalia               5.15       1361    26410
    ##  7 Egypt                 4.83      24417   505264
    ##  8 Afghanistan           4.32       7662   177544
    ##  9 Ecuador               4.13      35418   857299
    ## 10 Niger                 3.50        308     8801
    ## 11 Bulgaria              3.21      36437  1133464
    ## 12 Myanmar               3.18      19430   610858
    ## 13 Malawi                3.07       2626    85610
    ## 14 Paraguay              2.88      18663   647836
    ## 15 Haiti                 2.73        833    30522
    ## 16 Tunisia               2.72      28165  1033731
    ## 17 South Africa          2.69      99966  3713252
    ## 18 Honduras              2.61      10971   420621
    ## 19 Chad                  2.61        190     7288
    ## 20 Algeria               2.59       6873   265629

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7092.     212102   29.9 
    ##  2 Bulgaria               5097.      36437    7.15
    ##  3 Hungary                4542.      45342    9.98
    ##  4 Czech Republic         3777.      39563   10.5 
    ##  5 Slovakia               3537.      19292    5.46
    ##  6 Chile                  3367.      56381   16.7 
    ##  7 Brazil                 3275.     658566  201.  
    ##  8 United States          3125.     969628  310.  
    ##  9 Argentina              3094.     127909   41.3 
    ## 10 Poland                 2983.     114829   38.5 
    ## 11 Romania                2956.      64905   22.0 
    ## 12 Belgium                2950.      30686   10.4 
    ## 13 Paraguay               2927.      18663    6.38
    ## 14 Colombia               2920.     139558   47.8 
    ## 15 Mexico                 2870.     322735  112.  
    ## 16 Tunisia                2660.      28165   10.6 
    ## 17 United Kingdom         2638.     164453   62.3 
    ## 18 Italy                  2631.     158782   60.3 
    ## 19 Russia                 2613.     367686  141.  
    ## 20 Greece                 2479.      27268   11

EOL
