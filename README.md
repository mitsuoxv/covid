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

Updated: 2021-06-12

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
    ##  1 United States           69820. 33094965            474
    ##  2 India                   64482. 29274823            454
    ##  3 Brazil                  37632. 17122877            455
    ##  4 France                  12046.  5625750            467
    ##  5 Turkey                  11806.  5313098            450
    ##  6 Russia                  11512.  5180454            450
    ##  7 United Kingdom           9770.  4542990            465
    ##  8 Argentina                8994.  4038528            449
    ##  9 Italy                    8945.  4239868            474
    ## 10 Colombia                 8079.  3635835            450
    ## 11 Spain                    8003.  3729458            466
    ## 12 Germany                  7930.  3711569            468
    ## 13 Iran                     6362.  3003112            472
    ## 14 Poland                   6337.  2877007            454
    ## 15 Mexico                   5426.  2441866            450
    ## 16 Ukraine                  5003.  2221427            444
    ## 17 Peru                     4415.  1991203            451
    ## 18 Indonesia                4163.  1885942            453
    ## 19 South Africa             3827.  1722086            450
    ## 20 Czech Republic           3651.  1664839            456

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                348.             158919.            456
    ##  2 Jordan                        260.             115837.            446
    ##  3 Israel                        251.             114173.            455
    ##  4 Sweden                        246.             113305.            461
    ##  5 United States                 225.             106678.            474
    ##  6 Belgium                       223.             103259.            464
    ##  7 Argentina                     218.              97683.            449
    ##  8 Netherlands                   218.             100278.            461
    ##  9 Serbia                        217.              97274.            449
    ## 10 Switzerland                   198.              91885.            465
    ## 11 Chile                         192.              86793.            452
    ## 12 Brazil                        187.              85145.            455
    ## 13 France                        186.              86860.            467
    ## 14 Hungary                       180.              80824.            448
    ## 15 Portugal                      176.              80127.            455
    ## 16 Spain                         172.              80193.            466
    ## 17 Austria                       171.              78478.            460
    ## 18 Colombia                      169.              76079.            450
    ## 19 Poland                        165.              74727.            454
    ## 20 Slovakia                      160.              71658.            449

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.6        1338     6836
    ##  2 Peru                 9.42     187479  1991203
    ##  3 Mexico               9.39     229353  2441866
    ##  4 Sudan                7.51       2719    36203
    ##  5 Syria                7.29       1804    24743
    ##  6 Egypt                5.72      15510   271047
    ##  7 Somalia              5.24        774    14779
    ##  8 Ecuador              4.82      20903   433870
    ##  9 China                4.51       5207   115507
    ## 10 Bulgaria             4.26      17887   420090
    ## 11 Tanzania             4.13         21      509
    ## 12 Zimbabwe             4.12       1626    39496
    ## 13 Afghanistan          3.89       3412    87716
    ## 14 Bolivia              3.84      15247   396814
    ## 15 Hungary              3.70      29820   806790
    ## 16 Tunisia              3.67      13305   362658
    ## 17 Mali                 3.64        521    14329
    ## 18 Niger                3.53        192     5442
    ## 19 Chad                 3.52        174     4942
    ## 20 Malawi               3.36       1158    34447

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6269.     187479   29.9 
    ##  2 Hungary                2987.      29820    9.98
    ##  3 Czech Republic         2885.      30219   10.5 
    ##  4 Bulgaria               2502.      17887    7.15
    ##  5 Belgium                2410.      25068   10.4 
    ##  6 Brazil                 2384.     479515  201.  
    ##  7 Slovakia               2279.      12433    5.46
    ##  8 Italy                  2102.     126855   60.3 
    ##  9 United Kingdom         2051.     127867   62.3 
    ## 10 Mexico                 2039.     229353  112.  
    ## 11 Argentina              2014.      83272   41.3 
    ## 12 Colombia               1956.      93473   47.8 
    ## 13 Poland                 1935.      74515   38.5 
    ## 14 United States          1913.     593365  310.  
    ## 15 Chile                  1812.      30339   16.7 
    ## 16 Spain                  1730.      80465   46.5 
    ## 17 France                 1689.     109404   64.8 
    ## 18 Paraguay               1612.      10278    6.38
    ## 19 Portugal               1596.      17043   10.7 
    ## 20 Bolivia                1533.      15247    9.95

EOL
