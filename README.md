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

Updated: 2021-06-19

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
    ##  1 United States           68972. 33175399            481
    ##  2 India                   64561. 29762793            461
    ##  3 Brazil                  38157. 17628588            462
    ##  4 France                  11906.  5643756            474
    ##  5 Turkey                  11715.  5354153            457
    ##  6 Russia                  11556.  5281309            457
    ##  7 United Kingdom           9747.  4600627            472
    ##  8 Argentina                9207.  4198620            456
    ##  9 Italy                    8835.  4249755            481
    ## 10 Colombia                 8380.  3829879            457
    ## 11 Spain                    7935.  3753228            473
    ## 12 Germany                  7831.  3720031            475
    ## 13 Iran                     6410.  3070426            479
    ## 14 Poland                   6244.  2878466            461
    ## 15 Mexico                   5390.  2463390            457
    ## 16 Ukraine                  4940.  2228192            451
    ## 17 Peru                     4400.  2015190            458
    ## 18 Indonesia                4258.  1963266            461
    ## 19 South Africa             3908.  1786079            457
    ## 20 Czech Republic           3598.  1665818            463

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                343.             159013.            463
    ##  2 Jordan                        257.             116335.            453
    ##  3 Israel                        247.             114192.            463
    ##  4 Sweden                        242.             113504.            468
    ##  5 Argentina                     223.             101555.            456
    ##  6 United States                 222.             106937.            481
    ##  7 Belgium                       220.             103648.            471
    ##  8 Netherlands                   215.             100733.            468
    ##  9 Serbia                        214.              97407.            456
    ## 10 Switzerland                   195.              92116.            472
    ## 11 Chile                         195.              89465.            459
    ## 12 Brazil                        190.              87659.            462
    ## 13 France                        184.              87138.            474
    ## 14 Hungary                       178.              80888.            455
    ## 15 Colombia                      175.              80140.            457
    ## 16 Portugal                      175.              80707.            462
    ## 17 Spain                         171.              80704.            473
    ## 18 Austria                       168.              78627.            467
    ## 19 Poland                        162.              74765.            461
    ## 20 Slovakia                      157.              71723.            456

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.7        1351     6869
    ##  2 Peru                 9.40     189522  2015190
    ##  3 Mexico               9.36     230624  2463390
    ##  4 Sudan                7.53       2737    36347
    ##  5 Syria                7.33       1832    24991
    ##  6 Egypt                5.72      15723   275010
    ##  7 Somalia              5.22        775    14841
    ##  8 Ecuador              4.79      21175   442341
    ##  9 China                4.56       5343   117051
    ## 10 Bulgaria             4.27      17980   420859
    ## 11 Tanzania             4.13         21      509
    ## 12 Zimbabwe             4.02       1647    40927
    ## 13 Afghanistan          3.98       3934    98734
    ## 14 Bolivia              3.82      15826   414513
    ## 15 Hungary              3.70      29866   807428
    ## 16 Tunisia              3.66      13792   376691
    ## 17 Mali                 3.64        523    14365
    ## 18 Niger                3.54        193     5457
    ## 19 Chad                 3.52        174     4944
    ## 20 Malawi               3.35       1164    34702

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6337.     189522   29.9 
    ##  2 Hungary                2992.      29866    9.98
    ##  3 Czech Republic         2890.      30275   10.5 
    ##  4 Bulgaria               2515.      17980    7.15
    ##  5 Brazil                 2455.     493693  201.  
    ##  6 Belgium                2414.      25117   10.4 
    ##  7 Slovakia               2287.      12478    5.46
    ##  8 Argentina              2111.      87261   41.3 
    ##  9 Italy                  2108.     127190   60.3 
    ## 10 United Kingdom         2052.     127945   62.3 
    ## 11 Mexico                 2051.     230624  112.  
    ## 12 Colombia               2041.      97560   47.8 
    ## 13 Poland                 1942.      74782   38.5 
    ## 14 United States          1920.     595591  310.  
    ## 15 Chile                  1859.      31140   16.7 
    ## 16 Paraguay               1754.      11181    6.38
    ## 17 Spain                  1734.      80634   46.5 
    ## 18 France                 1694.     109743   64.8 
    ## 19 Portugal               1598.      17057   10.7 
    ## 20 Bolivia                1591.      15826    9.95

EOL
