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

Updated: 2021-06-03

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
    ##  1 United States           70844. 32942677            465
    ##  2 India                   63613. 28307832            445
    ##  3 Brazil                  37097. 16545554            446
    ##  4 France                  12174.  5575650            458
    ##  5 Turkey                  11919.  5256516            441
    ##  6 Russia                  11542.  5090249            441
    ##  7 United Kingdom           9847.  4490442            456
    ##  8 Italy                    9076.  4220304            465
    ##  9 Argentina                8595.  3781784            440
    ## 10 Spain                    8058.  3682778            457
    ## 11 Germany                  8034.  3687828            459
    ## 12 Colombia                 7724.  3406456            441
    ## 13 Poland                   6457.  2873527            445
    ## 14 Iran                     6315.  2923823            463
    ## 15 Mexico                   5473.  2413742            441
    ## 16 Ukraine                  5073.  2206836            435
    ## 17 Peru                     4424.  1955469            442
    ## 18 Indonesia                4113.  1826527            444
    ## 19 South Africa             3785.  1669231            441
    ## 20 Czech Republic           3718.  1662256            447

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                355.             158673.            447
    ##  2 Jordan                        263.             115073.            437
    ##  3 Israel                        256.             114158.            446
    ##  4 Sweden                        247.             111813.            452
    ##  5 United States                 228.             106187.            465
    ##  6 Belgium                       225.             102230.            455
    ##  7 Serbia                        220.              97034.            440
    ##  8 Netherlands                   220.              99236.            452
    ##  9 Argentina                     208.              91473.            440
    ## 10 Switzerland                   200.              91333.            456
    ## 11 France                        188.              86086.            458
    ## 12 Chile                         187.              82964.            443
    ## 13 Brazil                        184.              82274.            446
    ## 14 Hungary                       184.              80644.            439
    ## 15 Portugal                      178.              79575.            446
    ## 16 Spain                         173.              79189.            457
    ## 17 Austria                       173.              78128.            451
    ## 18 Poland                        168.              74637.            445
    ## 19 Slovakia                      162.              71492.            440
    ## 20 Colombia                      162.              71280.            441

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                19.6        1322     6751
    ##  2 Mexico                9.26     223568  2413742
    ##  3 Sudan                 7.41       2634    35537
    ##  4 Syria                 7.23       1774    24529
    ##  5 Egypt                 5.74      15136   263606
    ##  6 Somalia               5.24        769    14667
    ##  7 Ecuador               4.83      20572   426037
    ##  8 China                 4.45       4983   111887
    ##  9 Bulgaria              4.23      17726   418813
    ## 10 Tanzania              4.13         21      509
    ## 11 Zimbabwe              4.10       1599    38998
    ## 12 Afghanistan           4.06       3007    74026
    ## 13 Bolivia               3.91      14524   371279
    ## 14 Hungary               3.69      29690   804987
    ## 15 Tunisia               3.67      12720   346986
    ## 16 Mali                  3.62        517    14271
    ## 17 Niger                 3.55        192     5414
    ## 18 Peru                  3.55      69342  1955469
    ## 19 Chad                  3.51        173     4934
    ## 20 South Africa          3.39      56601  1669231

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Hungary                2974.      29690    9.98
    ##  2 Czech Republic         2876.      30126   10.5 
    ##  3 Bulgaria               2480.      17726    7.15
    ##  4 Belgium                2400.      24968   10.4 
    ##  5 Peru                   2319.      69342   29.9 
    ##  6 Brazil                 2301.     462791  201.  
    ##  7 Slovakia               2267.      12366    5.46
    ##  8 Italy                  2092.     126221   60.3 
    ##  9 United Kingdom         2049.     127782   62.3 
    ## 10 Mexico                 1988.     223568  112.  
    ## 11 Poland                 1922.      73984   38.5 
    ## 12 United States          1898.     588866  310.  
    ## 13 Argentina              1889.      78093   41.3 
    ## 14 Colombia               1858.      88774   47.8 
    ## 15 Chile                  1752.      29344   16.7 
    ## 16 Spain                  1720.      79983   46.5 
    ## 17 France                 1680.     108801   64.8 
    ## 18 Portugal               1595.      17025   10.7 
    ## 19 Sweden                 1512.      14451    9.56
    ## 20 Jordan                 1478.       9472    6.41

EOL
