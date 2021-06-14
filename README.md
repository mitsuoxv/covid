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

Updated: 2021-06-14

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
    ##  1 United States           69581. 33120623            476
    ##  2 India                   64561. 29439989            456
    ##  3 Brazil                  37847. 17296118            457
    ##  4 France                  12010.  5632993            469
    ##  5 Turkey                  11782.  5325435            452
    ##  6 Russia                  11523.  5208687            452
    ##  7 United Kingdom           9761.  4558498            467
    ##  8 Argentina                9075.  4093090            451
    ##  9 Italy                    8915.  4243482            476
    ## 10 Colombia                 8174.  3694707            452
    ## 11 Spain                    7969.  3729458            468
    ## 12 Germany                  7904.  3714969            470
    ## 13 Iran                     6372.  3020522            474
    ## 14 Poland                   6310.  2877469            456
    ## 15 Mexico                   5417.  2448820            452
    ## 16 Ukraine                  4985.  2223558            446
    ## 17 Peru                     4410.  1998056            453
    ## 18 Indonesia                4179.  1901490            455
    ## 19 South Africa             3848.  1739425            452
    ## 20 Czech Republic           3635.  1665097            458

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                347.             158944.            458
    ##  2 Jordan                        259.             115939.            448
    ##  3 Israel                        250.             114178.            457
    ##  4 Sweden                        245.             113381.            463
    ##  5 United States                 224.             106761.            476
    ##  6 Belgium                       222.             103409.            466
    ##  7 Argentina                     220.              99003.            451
    ##  8 Netherlands                   217.             100433.            463
    ##  9 Serbia                        216.              97314.            451
    ## 10 Switzerland                   197.              91932.            467
    ## 11 Chile                         193.              87719.            454
    ## 12 Brazil                        188.              86006.            457
    ## 13 France                        185.              86971.            469
    ## 14 Hungary                       180.              80824.            450
    ## 15 Portugal                      175.              80175.            457
    ## 16 Spain                         171.              80193.            468
    ## 17 Colombia                      171.              77311.            452
    ## 18 Austria                       170.              78533.            462
    ## 19 Poland                        164.              74739.            456
    ## 20 Slovakia                      159.              71682.            451

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.6        1347     6857
    ##  2 Peru                 9.41     188100  1998056
    ##  3 Mexico               9.39     229823  2448820
    ##  4 Sudan                7.51       2719    36203
    ##  5 Syria                7.29       1808    24789
    ##  6 Egypt                5.72      15582   272491
    ##  7 Somalia              5.24        774    14779
    ##  8 Ecuador              4.80      20997   437121
    ##  9 China                4.53       5257   116103
    ## 10 Bulgaria             4.26      17898   420294
    ## 11 Tanzania             4.13         21      509
    ## 12 Zimbabwe             4.10       1632    39852
    ## 13 Afghanistan          3.92       3527    89861
    ## 14 Bolivia              3.82      15417   403291
    ## 15 Hungary              3.70      29820   806790
    ## 16 Tunisia              3.66      13436   367047
    ## 17 Mali                 3.64        523    14349
    ## 18 Niger                3.53        192     5446
    ## 19 Chad                 3.52        174     4942
    ## 20 Malawi               3.36       1159    34485

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6289.     188100   29.9 
    ##  2 Hungary                2987.      29820    9.98
    ##  3 Czech Republic         2885.      30225   10.5 
    ##  4 Bulgaria               2504.      17898    7.15
    ##  5 Belgium                2411.      25081   10.4 
    ##  6 Brazil                 2408.     484235  201.  
    ##  7 Slovakia               2280.      12439    5.46
    ##  8 Italy                  2104.     126976   60.3 
    ##  9 United Kingdom         2051.     127896   62.3 
    ## 10 Argentina              2047.      84628   41.3 
    ## 11 Mexico                 2043.     229823  112.  
    ## 12 Colombia               1980.      94615   47.8 
    ## 13 Poland                 1937.      74573   38.5 
    ## 14 United States          1916.     594272  310.  
    ## 15 Chile                  1826.      30579   16.7 
    ## 16 Spain                  1730.      80465   46.5 
    ## 17 France                 1691.     109499   64.8 
    ## 18 Paraguay               1656.      10561    6.38
    ## 19 Portugal               1596.      17044   10.7 
    ## 20 Bolivia                1550.      15417    9.95

EOL
