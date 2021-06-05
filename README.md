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

Updated: 2021-06-06

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
    ##  1 United States           70508. 32997875            468
    ##  2 India                   64051. 28694879            448
    ##  3 Brazil                  37424. 16803472            449
    ##  4 France                  12145.  5599163            461
    ##  5 Turkey                  11884.  5276468            444
    ##  6 Russia                  11525.  5117274            444
    ##  7 United Kingdom           9817.  4506022            459
    ##  8 Italy                    9033.  4227719            468
    ##  9 Argentina                8768.  3884447            443
    ## 10 Spain                    8028.  3693012            460
    ## 11 Germany                  8004.  3697927            462
    ## 12 Colombia                 7856.  3488046            444
    ## 13 Poland                   6417.  2874824            448
    ## 14 Iran                     6339.  2954309            466
    ## 15 Mexico                   5466.  2426822            444
    ## 16 Ukraine                  5054.  2213580            438
    ## 17 Peru                     4424.  1968693            445
    ## 18 Indonesia                4124.  1843612            447
    ## 19 South Africa             3797.  1686041            444
    ## 20 Czech Republic           3696.  1663363            450

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                353.             158778.            450
    ##  2 Jordan                        262.             115343.            440
    ##  3 Israel                        254.             114161.            449
    ##  4 Sweden                        248.             112816.            455
    ##  5 United States                 227.             106365.            468
    ##  6 Belgium                       224.             102702.            458
    ##  7 Serbia                        219.              97132.            443
    ##  8 Netherlands                   219.              99694.            455
    ##  9 Argentina                     212.              93956.            443
    ## 10 Switzerland                   199.              91569.            459
    ## 11 Chile                         189.              84277.            446
    ## 12 France                        188.              86449.            461
    ## 13 Brazil                        186.              83556.            449
    ## 14 Hungary                       183.              80732.            442
    ## 15 Portugal                      178.              79755.            449
    ## 16 Spain                         173.              79409.            460
    ## 17 Austria                       172.              78260.            454
    ## 18 Poland                        167.              74671.            448
    ## 19 Colombia                      164.              72987.            444
    ## 20 Slovakia                      161.              71556.            443

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                19.6        1325     6773
    ##  2 Peru                  9.42     185380  1968693
    ##  3 Mexico                9.41     228362  2426822
    ##  4 Sudan                 7.47       2662    35656
    ##  5 Syria                 7.26       1787    24619
    ##  6 Egypt                 5.73      15268   266350
    ##  7 Somalia               5.25        771    14699
    ##  8 Ecuador               4.82      20755   430739
    ##  9 China                 4.43       5033   113565
    ## 10 Bulgaria              4.25      17810   419337
    ## 11 Tanzania              4.13         21      509
    ## 12 Zimbabwe              4.10       1605    39144
    ## 13 Afghanistan           3.98       3104    77963
    ## 14 Bolivia               3.90      14832   380457
    ## 15 Hungary               3.69      29758   805871
    ## 16 Tunisia               3.66      12902   352303
    ## 17 Mali                  3.62        517    14287
    ## 18 Niger                 3.53        192     5434
    ## 19 Chad                  3.52        174     4938
    ## 20 South Africa          3.37      56832  1686041

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6199.     185380   29.9 
    ##  2 Hungary                2981.      29758    9.98
    ##  3 Czech Republic         2879.      30157   10.5 
    ##  4 Bulgaria               2491.      17810    7.15
    ##  5 Belgium                2404.      25014   10.4 
    ##  6 Brazil                 2334.     469388  201.  
    ##  7 Slovakia               2272.      12395    5.46
    ##  8 Italy                  2095.     126415   60.3 
    ##  9 United Kingdom         2050.     127823   62.3 
    ## 10 Mexico                 2030.     228362  112.  
    ## 11 Argentina              1932.      79873   41.3 
    ## 12 Poland                 1926.      74139   38.5 
    ## 13 United States          1904.     590693  310.  
    ## 14 Colombia               1891.      90353   47.8 
    ## 15 Chile                  1773.      29696   16.7 
    ## 16 Spain                  1722.      80099   46.5 
    ## 17 France                 1684.     109082   64.8 
    ## 18 Portugal               1595.      17029   10.7 
    ## 19 Sweden                 1520.      14523    9.56
    ## 20 Bolivia                1491.      14832    9.95

EOL
