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

Updated: 2022-04-01

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
    ##  1 United States          104607. 79292582            758
    ##  2 India                   57596. 43024440            747
    ##  3 Brazil                  39950. 29882397            748
    ##  4 France                  32496. 24696973            760
    ##  5 United Kingdom          27801. 21073013            758
    ##  6 Germany                 27732. 21104509            761
    ##  7 Russia                  24015. 17842925            743
    ##  8 Turkey                  19981. 14846224            743
    ##  9 Italy                   18993. 14567990            767
    ## 10 South Korea             17007. 13095631            770
    ## 11 Spain                   15194. 11532099            759
    ## 12 Vietnam                 12818.  9472254            739
    ## 13 Argentina               12075.  9032162            748
    ## 14 Netherlands             10390.  7833842            754
    ## 15 Iran                     9359.  7159733            765
    ## 16 Japan                    8459.  6504873            769
    ## 17 Colombia                 8189.  6084240            743
    ## 18 Indonesia                8045.  6009486            747
    ## 19 Poland                   7982.  5962931            747
    ## 20 Mexico                   7549.  5654311            749

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Denmark                       741.             557046.            752
    ##  2 Israel                        709.             531559.            750
    ##  3 Austria                       624.             469546.            752
    ##  4 Netherlands                   624.             470642.            754
    ##  5 Switzerland                   604.             457511.            758
    ##  6 France                        502.             381312.            760
    ##  7 Czech Republic                486.             364216.            749
    ##  8 Belgium                       483.             365995.            757
    ##  9 Portugal                      449.             336154.            749
    ## 10 United Kingdom                446.             337988.            758
    ## 11 Slovakia                      422.             313636.            743
    ## 12 Norway                        370.             280328.            757
    ## 13 Greece                        365.             273576.            749
    ## 14 Serbia                        362.             268849.            742
    ## 15 Jordan                        357.             264158.            739
    ## 16 South Korea                   351.             270444.            770
    ## 17 Sweden                        344.             259707.            754
    ## 18 Germany                       339.             257994.            761
    ## 19 United States                 337.             255591.            758
    ## 20 Spain                         327.             247970.            759

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.2        2143    11805
    ##  2 Sudan                 7.92       4907    61955
    ##  3 Peru                  5.98     212179  3546083
    ##  4 Mexico                5.71     322845  5654311
    ##  5 Syria                 5.64       3140    55688
    ##  6 Somalia               5.15       1361    26410
    ##  7 Egypt                 4.83      24417   505264
    ##  8 Afghanistan           4.31       7665   177694
    ##  9 Ecuador               4.12      35421   859890
    ## 10 Niger                 3.50        308     8801
    ## 11 Bulgaria              3.21      36512  1137780
    ## 12 Myanmar               3.18      19430   611448
    ## 13 Malawi                3.07       2626    85631
    ## 14 Paraguay              2.88      18664   647905
    ## 15 Tunisia               2.73      28323  1035884
    ## 16 Haiti                 2.73        833    30545
    ## 17 South Africa          2.69     100020  3717067
    ## 18 Chad                  2.61        191     7310
    ## 19 Algeria               2.59       6874   265662
    ## 20 Honduras              2.58      10880   421013

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7095.     212179   29.9 
    ##  2 Bulgaria               5107.      36512    7.15
    ##  3 Hungary                4555.      45470    9.98
    ##  4 Czech Republic         3787.      39673   10.5 
    ##  5 Slovakia               3548.      19352    5.46
    ##  6 Chile                  3372.      56467   16.7 
    ##  7 Brazil                 3278.     659241  201.  
    ##  8 United States          3132.     971569  310.  
    ##  9 Argentina              3095.     127970   41.3 
    ## 10 Poland                 2992.     115173   38.5 
    ## 11 Romania                2960.      64994   22.0 
    ## 12 Belgium                2956.      30747   10.4 
    ## 13 Paraguay               2927.      18664    6.38
    ## 14 Colombia               2921.     139595   47.8 
    ## 15 Mexico                 2871.     322845  112.  
    ## 16 Tunisia                2675.      28323   10.6 
    ## 17 United Kingdom         2649.     165187   62.3 
    ## 18 Italy                  2639.     159224   60.3 
    ## 19 Russia                 2621.     368722  141.  
    ## 20 Greece                 2496.      27454   11

EOL
