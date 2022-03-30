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

Updated: 2022-03-31

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
    ##  1 United States          104712. 79266906            757
    ##  2 India                   57672. 43023215            746
    ##  3 Brazil                  39963. 29852341            747
    ##  4 France                  32316. 24527949            759
    ##  5 United Kingdom          27723. 20986175            757
    ##  6 Germany                 27407. 20829608            760
    ##  7 Russia                  24021. 17823648            742
    ##  8 Turkey                  19988. 14831231            742
    ##  9 Italy                   18925. 14496579            766
    ## 10 South Korea             16612. 12774956            769
    ## 11 Spain                   15182. 11508309            758
    ## 12 Vietnam                 12719.  9386489            738
    ## 13 Argentina               12087.  9028730            747
    ## 14 Netherlands             10366.  7806076            753
    ## 15 Iran                     9367.  7156746            764
    ## 16 Japan                    8401.  6452108            768
    ## 17 Colombia                 8199.  6083939            742
    ## 18 Indonesia                8050.  6005646            746
    ## 19 Poland                   7986.  5957940            746
    ## 20 Mexico                   7555.  5651553            748

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Denmark                       741.             556243.            751
    ##  2 Israel                        707.             529849.            749
    ##  3 Netherlands                   623.             468974.            753
    ##  4 Austria                       619.             465186.            751
    ##  5 Switzerland                   602.             455356.            757
    ##  6 France                        499.             378702.            759
    ##  7 Czech Republic                486.             363507.            748
    ##  8 Belgium                       484.             365995.            756
    ##  9 United Kingdom                445.             336595.            757
    ## 10 Portugal                      428.             319690.            747
    ## 11 Slovakia                      421.             312291.            742
    ## 12 Norway                        370.             279933.            756
    ## 13 Greece                        363.             271535.            748
    ## 14 Serbia                        362.             268591.            741
    ## 15 Jordan                        358.             264158.            738
    ## 16 Sweden                        345.             259707.            753
    ## 17 South Korea                   343.             263822.            769
    ## 18 United States                 338.             255508.            757
    ## 19 Germany                       335.             254634.            760
    ## 20 Spain                         326.             247459.            758

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.2        2143    11803
    ##  2 Sudan                 7.92       4905    61929
    ##  3 Peru                  5.98     212157  3545628
    ##  4 Mexico                5.71     322761  5651553
    ##  5 Syria                 5.64       3138    55680
    ##  6 Somalia               5.15       1361    26410
    ##  7 Egypt                 4.83      24417   505264
    ##  8 Afghanistan           4.31       7665   177663
    ##  9 Ecuador               4.12      35421   859207
    ## 10 Niger                 3.50        308     8801
    ## 11 Bulgaria              3.21      36498  1136604
    ## 12 Myanmar               3.18      19430   611275
    ## 13 Malawi                3.07       2626    85625
    ## 14 Paraguay              2.88      18664   647905
    ## 15 Tunisia               2.73      28323  1035884
    ## 16 Haiti                 2.73        833    30528
    ## 17 South Africa          2.69      99976  3715390
    ## 18 Chad                  2.61        191     7310
    ## 19 Algeria               2.59       6874   265651
    ## 20 Honduras              2.58      10878   420978

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7094.     212157   29.9 
    ##  2 Bulgaria               5105.      36498    7.15
    ##  3 Hungary                4551.      45430    9.98
    ##  4 Czech Republic         3784.      39640   10.5 
    ##  5 Slovakia               3544.      19334    5.46
    ##  6 Chile                  3372.      56464   16.7 
    ##  7 Brazil                 3277.     658956  201.  
    ##  8 United States          3129.     970847  310.  
    ##  9 Argentina              3095.     127943   41.3 
    ## 10 Poland                 2988.     115040   38.5 
    ## 11 Romania                2958.      64958   22.0 
    ## 12 Belgium                2956.      30747   10.4 
    ## 13 Paraguay               2927.      18664    6.38
    ## 14 Colombia               2921.     139585   47.8 
    ## 15 Mexico                 2870.     322761  112.  
    ## 16 Tunisia                2675.      28323   10.6 
    ## 17 United Kingdom         2646.     164974   62.3 
    ## 18 Italy                  2636.     159054   60.3 
    ## 19 Russia                 2618.     368377  141.  
    ## 20 Greece                 2490.      27392   11

EOL
