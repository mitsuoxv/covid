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

Updated: 2021-06-04

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

    ## # A tibble: 20 x 4
    ##    area           speed_since_100 cum_conf days_since_100
    ##    <chr>                    <dbl>    <dbl>          <int>
    ##  1 United States           70737. 32963318            466
    ##  2 India                   63771. 28441986            446
    ##  3 Brazil                  37191. 16624480            447
    ##  4 France                  12166.  5584232            459
    ##  5 Turkey                  11908.  5263697            442
    ##  6 Russia                  11536.  5099182            442
    ##  7 United Kingdom           9835   4494703            457
    ##  8 Italy                    9062.  4223200            466
    ##  9 Argentina                8655.  3817139            441
    ## 10 Spain                    8052.  3687762            458
    ## 11 Germany                  8027.  3692468            460
    ## 12 Colombia                 7765.  3432422            442
    ## 13 Poland                   6444.  2874092            446
    ## 14 Iran                     6326.  2935443            464
    ## 15 Mexico                   5476.  2420659            442
    ## 16 Ukraine                  5067.  2209417            436
    ## 17 Peru                     4427.  1961087            443
    ## 18 Indonesia                4116.  1831773            445
    ## 19 South Africa             3789.  1675013            442
    ## 20 Czech Republic           3711.  1662608            448

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                354.             158706.            448
    ##  2 Jordan                        263.             115168.            438
    ##  3 Israel                        255.             114158.            447
    ##  4 Sweden                        247.             111813.            453
    ##  5 United States                 228.             106253.            466
    ##  6 Belgium                       225.             102409.            456
    ##  7 Serbia                        220.              97073.            441
    ##  8 Netherlands                   219.              99386.            453
    ##  9 Argentina                     209.              92328.            441
    ## 10 Switzerland                   200.              91427.            457
    ## 11 France                        188.              86218.            459
    ## 12 Chile                         188.              83299.            444
    ## 13 Brazil                        185.              82666.            447
    ## 14 Hungary                       183.              80675.            440
    ## 15 Portugal                      178.              79642.            447
    ## 16 Spain                         173.              79297.            458
    ## 17 Austria                       173.              78186.            452
    ## 18 Poland                        167.              74652.            446
    ## 19 Colombia                      162.              71823.            442
    ## 20 Slovakia                      162.              71518.            441

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                19.6        1323     6759
    ##  2 Mexico                9.41     227840  2420659
    ##  3 Peru                  9.41     184507  1961087
    ##  4 Sudan                 7.47       2662    35656
    ##  5 Syria                 7.24       1778    24559
    ##  6 Egypt                 5.74      15178   264557
    ##  7 Somalia               5.24        770    14691
    ##  8 Ecuador               4.82      20681   428865
    ##  9 China                 4.44       4995   112458
    ## 10 Bulgaria              4.24      17747   419010
    ## 11 Tanzania              4.13         21      509
    ## 12 Zimbabwe              4.10       1599    39031
    ## 13 Afghanistan           4.04       3034    75119
    ## 14 Bolivia               3.91      14639   374718
    ## 15 Hungary               3.69      29708   805302
    ## 16 Tunisia               3.67      12793   348911
    ## 17 Mali                  3.62        517    14281
    ## 18 Niger                 3.55        192     5416
    ## 19 Chad                  3.51        173     4935
    ## 20 South Africa          3.39      56711  1675013

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6169.     184507   29.9 
    ##  2 Hungary                2976.      29708    9.98
    ##  3 Czech Republic         2877.      30136   10.5 
    ##  4 Bulgaria               2483.      17747    7.15
    ##  5 Belgium                2401.      24982   10.4 
    ##  6 Brazil                 2313.     465199  201.  
    ##  7 Slovakia               2269.      12375    5.46
    ##  8 Italy                  2093.     126283   60.3 
    ##  9 United Kingdom         2050.     127794   62.3 
    ## 10 Mexico                 2026.     227840  112.  
    ## 11 Poland                 1924.      74075   38.5 
    ## 12 Argentina              1904.      78733   41.3 
    ## 13 United States          1900.     589555  310.  
    ## 14 Colombia               1869.      89297   47.8 
    ## 15 Chile                  1755.      29385   16.7 
    ## 16 Spain                  1721.      80049   46.5 
    ## 17 France                 1682.     108925   64.8 
    ## 18 Portugal               1595.      17026   10.7 
    ## 19 Sweden                 1512.      14451    9.56
    ## 20 Jordan                 1481.       9489    6.41

EOL
