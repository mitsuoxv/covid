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

Updated: 2021-06-13

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
    ##  1 United States           69701. 33108269            475
    ##  2 India                   64525. 29359155            455
    ##  3 Brazil                  37743. 17210969            456
    ##  4 France                  12028.  5629389            468
    ##  5 Turkey                  11794.  5319359            451
    ##  6 Russia                  11516.  5193964            451
    ##  7 United Kingdom           9766.  4550948            466
    ##  8 Argentina                9036.  4066156            450
    ##  9 Italy                    8930.  4241760            475
    ## 10 Colombia                 8126.  3665137            451
    ## 11 Spain                    7986.  3729458            467
    ## 12 Germany                  7918.  3713480            469
    ## 13 Iran                     6370.  3013078            473
    ## 14 Poland                   6323.  2877243            455
    ## 15 Mexico                   5422.  2445538            451
    ## 16 Ukraine                  4995.  2222701            445
    ## 17 Peru                     4414.  1995257            452
    ## 18 Indonesia                4172.  1894025            454
    ## 19 South Africa             3836.  1730106            451
    ## 20 Czech Republic           3643.  1665022            457

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                348.             158937.            457
    ##  2 Jordan                        259.             115891.            447
    ##  3 Israel                        250.             114177.            456
    ##  4 Sweden                        245.             113381.            462
    ##  5 United States                 225.             106721.            475
    ##  6 Belgium                       222.             103334.            465
    ##  7 Argentina                     219.              98351.            450
    ##  8 Netherlands                   217.             100360.            462
    ##  9 Serbia                        216.              97297.            450
    ## 10 Switzerland                   197.              91932.            466
    ## 11 Chile                         193.              87267.            453
    ## 12 Brazil                        188.              85583.            456
    ## 13 France                        186.              86916.            468
    ## 14 Hungary                       180.              80824.            449
    ## 15 Portugal                      176.              80175.            456
    ## 16 Spain                         172.              80193.            467
    ## 17 Austria                       170.              78507.            461
    ## 18 Colombia                      170.              76693.            451
    ## 19 Poland                        164.              74734.            455
    ## 20 Slovakia                      159.              71674.            450

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.6        1342     6856
    ##  2 Peru                 9.41     187847  1995257
    ##  3 Mexico               9.39     229580  2445538
    ##  4 Sudan                7.51       2719    36203
    ##  5 Syria                7.29       1806    24767
    ##  6 Egypt                5.72      15547   271780
    ##  7 Somalia              5.24        774    14779
    ##  8 Ecuador              4.80      20997   437121
    ##  9 China                4.52       5231   115820
    ## 10 Bulgaria             4.26      17893   420213
    ## 11 Tanzania             4.13         21      509
    ## 12 Zimbabwe             4.10       1629    39688
    ## 13 Afghanistan          3.89       3449    88740
    ## 14 Bolivia              3.83      15321   400047
    ## 15 Hungary              3.70      29820   806790
    ## 16 Tunisia              3.66      13365   364819
    ## 17 Mali                 3.65        523    14336
    ## 18 Niger                3.53        192     5446
    ## 19 Chad                 3.52        174     4942
    ## 20 Malawi               3.36       1158    34470

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6281.     187847   29.9 
    ##  2 Hungary                2987.      29820    9.98
    ##  3 Czech Republic         2885.      30224   10.5 
    ##  4 Bulgaria               2503.      17893    7.15
    ##  5 Belgium                2410.      25075   10.4 
    ##  6 Brazil                 2397.     482019  201.  
    ##  7 Slovakia               2280.      12436    5.46
    ##  8 Italy                  2103.     126924   60.3 
    ##  9 United Kingdom         2051.     127884   62.3 
    ## 10 Mexico                 2041.     229580  112.  
    ## 11 Argentina              2030.      83941   41.3 
    ## 12 Colombia               1968.      94046   47.8 
    ## 13 Poland                 1937.      74562   38.5 
    ## 14 United States          1914.     593878  310.  
    ## 15 Chile                  1820.      30472   16.7 
    ## 16 Spain                  1730.      80465   46.5 
    ## 17 France                 1690.     109475   64.8 
    ## 18 Paraguay               1633.      10412    6.38
    ## 19 Portugal               1596.      17044   10.7 
    ## 20 Bolivia                1540.      15321    9.95

EOL
