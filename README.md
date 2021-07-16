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

Updated: 2021-07-17

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
    ##  1 United States           66097. 33643529            509
    ##  2 India                   63449. 31026829            489
    ##  3 Brazil                  39203. 19209729            490
    ##  4 Russia                  12181.  5907999            485
    ##  5 France                  11390.  5717748            502
    ##  6 Turkey                  11355.  5507455            485
    ##  7 United Kingdom          10562.  5281102            500
    ##  8 Argentina                9716.  4702657            484
    ##  9 Colombia                 9413.  4565372            485
    ## 10 Italy                    8405.  4278319            509
    ## 11 Spain                    8122.  4069162            501
    ## 12 Germany                  7439.  3741781            503
    ## 13 Poland                   5892.  2881241            489
    ## 14 Indonesia                5686.  2780803            489
    ## 15 Mexico                   5395.  2616827            485
    ## 16 Ukraine                  4684.  2243605            479
    ## 17 South Africa             4646.  2253240            485
    ## 18 Peru                     4292.  2085883            486
    ## 19 Netherlands              3560.  1766102            496
    ## 20 Czech Republic           3402.  1670583            491

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                325.             159468.            491
    ##  2 Argentina                     235.             113747.            484
    ##  3 Israel                        235.             115537.            492
    ##  4 Sweden                        231.             114476.            496
    ##  5 Netherlands                   214.             106104.            496
    ##  6 United States                 213.             108446.            509
    ##  7 Belgium                       212.             105938.            499
    ##  8 Serbia                        202.              97768.            484
    ##  9 Colombia                      197.              95530.            485
    ## 10 Chile                         195.              95214.            487
    ## 11 Brazil                        195.              95522.            490
    ## 12 Switzerland                   186.              92890.            500
    ## 13 Portugal                      176.              86193.            490
    ## 14 France                        176.              88280.            502
    ## 15 Spain                         175.              87498.            501
    ## 16 United Kingdom                169.              84703.            500
    ## 17 Hungary                       168.              81018.            483
    ## 18 Austria                       160.              79005.            495
    ## 19 Poland                        153.              74837.            489
    ## 20 Slovakia                      148.              71867.            484

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Peru                  9.34     194752  2085883
    ##  2 Mexico                9.00     235507  2616827
    ##  3 China                 4.69       5607   119539
    ##  4 Ecuador               4.63      21872   472722
    ##  5 Bulgaria              4.30      18163   422797
    ##  6 Tanzania              4.13         21      509
    ##  7 Bolivia               3.79      17345   458212
    ##  8 Hungary               3.71      30015   808725
    ##  9 Mali                  3.65        529    14497
    ## 10 Chad                  3.51        174     4959
    ## 11 Niger                 3.49        194     5555
    ## 12 Slovakia              3.19      12524   392034
    ## 13 Paraguay              3.19      14066   441056
    ## 14 Romania               3.17      34250  1081539
    ## 15 Malawi                3.14       1301    41498
    ## 16 Zimbabwe              3.07       2418    78872
    ## 17 Guatemala             3.00       9834   327755
    ## 18 El Salvador           3.00       2470    82363
    ## 19 Italy                 2.99     127840  4278319
    ## 20 South Africa          2.93      65972  2253240

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6512.     194752   29.9 
    ##  2 Hungary                3007.      30015    9.98
    ##  3 Czech Republic         2896.      30335   10.5 
    ##  4 Brazil                 2672.     537394  201.  
    ##  5 Bulgaria               2541.      18163    7.15
    ##  6 Argentina              2425.     100250   41.3 
    ##  7 Belgium                2423.      25208   10.4 
    ##  8 Colombia               2392.     114337   47.8 
    ##  9 Slovakia               2296.      12524    5.46
    ## 10 Paraguay               2206.      14066    6.38
    ## 11 Italy                  2119.     127840   60.3 
    ## 12 Mexico                 2094.     235507  112.  
    ## 13 United Kingdom         2062.     128593   62.3 
    ## 14 Chile                  2043.      34207   16.7 
    ## 15 Poland                 1953.      75205   38.5 
    ## 16 United States          1944.     603170  310.  
    ## 17 Bolivia                1744.      17345    9.95
    ## 18 Spain                  1744.      81084   46.5 
    ## 19 France                 1705.     110462   64.8 
    ## 20 Portugal               1610.      17187   10.7

EOL
