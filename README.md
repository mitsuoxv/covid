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

Updated: 2021-07-06

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
    ##  1 United States           67025. 33378423            498
    ##  2 India                   63986. 30585229            478
    ##  3 Brazil                  39127. 18742025            479
    ##  4 Russia                  11888.  5635294            474
    ##  5 France                  11558.  5674906            491
    ##  6 Turkey                  11486.  5444786            474
    ##  7 United Kingdom          10027.  4903438            489
    ##  8 Argentina                9569.  4526473            473
    ##  9 Colombia                 9123.  4324230            474
    ## 10 Italy                    8561.  4263317            498
    ## 11 Spain                    7798.  3821305            490
    ## 12 Germany                  7583.  3731124            492
    ## 13 Iran                     6562.  3254818            496
    ## 14 Poland                   6026.  2880308            478
    ## 15 Mexico                   5353.  2537457            474
    ## 16 Indonesia                4840.  2313829            478
    ## 17 Ukraine                  4781.  2237823            468
    ## 18 South Africa             4352.  2062896            474
    ## 19 Peru                     4343.  2063112            475
    ## 20 Netherlands              3482.  1689106            485

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                332.             159215.            480
    ##  2 Jordan                        250.             117556.            470
    ##  3 Israel                        238.             114648.            481
    ##  4 Sweden                        235.             114158.            485
    ##  5 Argentina                     231.             109485.            473
    ##  6 United States                 216.             107592.            498
    ##  7 Belgium                       214.             104442.            488
    ##  8 Netherlands                   209.             101478.            485
    ##  9 Serbia                        206.              97602.            473
    ## 10 Chile                         197.              93738.            476
    ## 11 Brazil                        195.              93196.            479
    ## 12 Colombia                      191.              90484.            474
    ## 13 Switzerland                   189.              92362.            489
    ## 14 France                        178.              87618.            491
    ## 15 Portugal                      174.              83279.            479
    ## 16 Hungary                       172.              80972.            472
    ## 17 Spain                         168.              82168.            490
    ## 18 Austria                       163.              78808.            484
    ## 19 United Kingdom                161.              78646.            489
    ## 20 Poland                        157.              74813.            478

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.6        1361     6929
    ##  2 Peru                 9.36     193069  2063112
    ##  3 Mexico               9.21     233580  2537457
    ##  4 Sudan                7.52       2760    36709
    ##  5 Syria                7.36       1887    25653
    ##  6 Egypt                5.77      16264   282082
    ##  7 Somalia              5.17        775    14977
    ##  8 Ecuador              4.69      21660   462142
    ##  9 China                4.66       5535   118896
    ## 10 Bulgaria             4.28      18084   422053
    ## 11 Afghanistan          4.19       5283   125937
    ## 12 Tanzania             4.13         21      509
    ## 13 Bolivia              3.81      16920   444090
    ## 14 Hungary              3.71      29996   808262
    ## 15 Mali                 3.65        527    14450
    ## 16 Niger                3.52        194     5506
    ## 17 Chad                 3.51        174     4951
    ## 18 Tunisia              3.47      15377   443631
    ## 19 Zimbabwe             3.45       1878    54474
    ## 20 Malawi               3.27       1208    36926

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6456.     193069   29.9 
    ##  2 Hungary                3005.      29996    9.98
    ##  3 Czech Republic         2893.      30310   10.5 
    ##  4 Brazil                 2604.     523587  201.  
    ##  5 Bulgaria               2530.      18084    7.15
    ##  6 Belgium                2421.      25185   10.4 
    ##  7 Argentina              2312.      95594   41.3 
    ##  8 Slovakia               2294.      12513    5.46
    ##  9 Colombia               2266.     108314   47.8 
    ## 10 Italy                  2115.     127649   60.3 
    ## 11 Mexico                 2077.     233580  112.  
    ## 12 Paraguay               2076.      13235    6.38
    ## 13 United Kingdom         2057.     128222   62.3 
    ## 14 Chile                  1977.      33103   16.7 
    ## 15 Poland                 1950.      75085   38.5 
    ## 16 United States          1935.     600296  310.  
    ## 17 Spain                  1739.      80883   46.5 
    ## 18 France                 1702.     110233   64.8 
    ## 19 Bolivia                1701.      16920    9.95
    ## 20 Portugal               1603.      17112   10.7

EOL
