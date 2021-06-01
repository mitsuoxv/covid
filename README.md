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

Updated: 2021-06-02

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
    ##  1 United States           70968. 32929178            464
    ##  2 India                   63457. 28175044            444
    ##  3 Brazil                  37112. 16515120            445
    ##  4 France                  12182.  5567152            457
    ##  5 Turkey                  11930.  5249404            440
    ##  6 Russia                  11548.  5081417            440
    ##  7 United Kingdom           9862.  4487343            455
    ##  8 Italy                    9090.  4217821            464
    ##  9 Argentina                8550.  3753609            439
    ## 10 Spain                    8066.  3678390            456
    ## 11 Germany                  8041.  3682911            458
    ## 12 Colombia                 7689.  3383279            440
    ## 13 Poland                   6470.  2872868            444
    ## 14 Iran                     6305.  2913136            462
    ## 15 Mexico                   5483.  2412810            440
    ## 16 Ukraine                  5080.  2204631            434
    ## 17 Peru                     4434.  1955469            441
    ## 18 Indonesia                4112.  1821703            443
    ## 19 South Africa             3785.  1665617            440
    ## 20 Czech Republic           3726.  1661780            446

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                356.             158627.            446
    ##  2 Jordan                        264.             114956.            436
    ##  3 Israel                        256.             114153.            445
    ##  4 Sweden                        248.             111813.            451
    ##  5 United States                 229.             106143.            464
    ##  6 Belgium                       225.             102086.            454
    ##  7 Serbia                        221.              97003.            439
    ##  8 Netherlands                   220.              99096.            451
    ##  9 Argentina                     207.              90791.            439
    ## 10 Switzerland                   200.              91233.            455
    ## 11 France                        188.              85955.            457
    ## 12 Chile                         187.              82665.            442
    ## 13 Brazil                        185.              82123.            445
    ## 14 Hungary                       184.              80616.            438
    ## 15 Portugal                      179.              79533.            445
    ## 16 Austria                       173.              78084.            450
    ## 17 Spain                         173.              79095.            456
    ## 18 Poland                        168.              74620.            444
    ## 19 Slovakia                      163.              71469.            439
    ## 20 Colombia                      161.              70795.            440

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                19.6        1321     6742
    ##  2 Mexico                9.26     223507  2412810
    ##  3 Sudan                 7.41       2631    35512
    ##  4 Syria                 7.23       1770    24495
    ##  5 Egypt                 5.75      15096   262650
    ##  6 Somalia               5.24        769    14662
    ##  7 Ecuador               4.82      20545   425841
    ##  8 China                 4.46       4970   111525
    ##  9 Bulgaria              4.23      17700   418577
    ## 10 Tanzania              4.13         21      509
    ## 11 Zimbabwe              4.10       1596    38961
    ## 12 Afghanistan           4.07       2973    72977
    ## 13 Bolivia               3.93      14471   368474
    ## 14 Hungary               3.69      29677   804712
    ## 15 Tunisia               3.66      12654   345474
    ## 16 Mali                  3.62        517    14265
    ## 17 Niger                 3.55        192     5410
    ## 18 Peru                  3.55      69342  1955469
    ## 19 Chad                  3.51        173     4929
    ## 20 South Africa          3.39      56506  1665617

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Hungary                2973.      29677    9.98
    ##  2 Czech Republic         2875.      30119   10.5 
    ##  3 Bulgaria               2476.      17700    7.15
    ##  4 Belgium                2399.      24955   10.4 
    ##  5 Peru                   2319.      69342   29.9 
    ##  6 Brazil                 2297.     461931  201.  
    ##  7 Slovakia               2265.      12353    5.46
    ##  8 Italy                  2090.     126128   60.3 
    ##  9 United Kingdom         2049.     127782   62.3 
    ## 10 Mexico                 1987.     223507  112.  
    ## 11 Poland                 1918.      73856   38.5 
    ## 12 United States          1897.     588596  310.  
    ## 13 Argentina              1873.      77456   41.3 
    ## 14 Colombia               1847.      88282   47.8 
    ## 15 Chile                  1750.      29300   16.7 
    ## 16 Spain                  1719.      79953   46.5 
    ## 17 France                 1678.     108713   64.8 
    ## 18 Portugal               1595.      17025   10.7 
    ## 19 Sweden                 1512.      14451    9.56
    ## 20 Jordan                 1477.       9462    6.41

EOL
