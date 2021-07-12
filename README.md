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

Updated: 2021-07-13

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
    ##  1 United States           66350. 33506722            505
    ##  2 India                   63658. 30874376            485
    ##  3 Brazil                  39236. 19069003            486
    ##  4 Russia                  12076.  5808473            481
    ##  5 France                  11443.  5698897            498
    ##  6 Turkey                  11396.  5481555            481
    ##  7 United Kingdom          10325.  5121249            496
    ##  8 Argentina                9665.  4639098            480
    ##  9 Colombia                 9340.  4492537            481
    ## 10 Italy                    8458.  4271276            505
    ## 11 Spain                    7878.  3915313            497
    ## 12 Germany                  7488.  3736489            499
    ## 13 Iran                     6706.  3373450            503
    ## 14 Poland                   5940.  2880865            485
    ## 15 Mexico                   5378.  2586721            481
    ## 16 Indonesia                5294.  2567630            485
    ## 17 Ukraine                  4718.  2241217            475
    ## 18 South Africa             4564.  2195599            481
    ## 19 Peru                     4313.  2078815            482
    ## 20 Netherlands              3513.  1728438            492

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                327.             159364.            487
    ##  2 Jordan                        248.             118138.            477
    ##  3 Israel                        236.             115084.            488
    ##  4 Argentina                     234.             112209.            480
    ##  5 Sweden                        232.             114332.            492
    ##  6 United States                 214.             108005.            505
    ##  7 Belgium                       212.             105133.            495
    ##  8 Netherlands                   211.             103841.            492
    ##  9 Serbia                        203.              97694.            480
    ## 10 Chile                         196.              94795.            483
    ## 11 Colombia                      195.              94006.            481
    ## 12 Brazil                        195.              94822.            486
    ## 13 Switzerland                   187.              92573.            496
    ## 14 France                        177.              87989.            498
    ## 15 Portugal                      175.              85048.            486
    ## 16 Spain                         169.              84189.            497
    ## 17 Hungary                       169.              81000.            479
    ## 18 United Kingdom                166.              82139.            496
    ## 19 Austria                       161.              78890.            491
    ## 20 Poland                        154.              74828.            485

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.7        1366     6948
    ##  2 Peru                 9.34     194249  2078815
    ##  3 Mexico               9.08     234907  2586721
    ##  4 Sudan                7.50       2760    36805
    ##  5 Syria                7.36       1898    25785
    ##  6 Egypt                5.79      16396   283102
    ##  7 Somalia              5.17        777    15036
    ##  8 China                4.68       5588   119321
    ##  9 Ecuador              4.66      21830   468346
    ## 10 Afghanistan          4.30       5791   134653
    ## 11 Bulgaria             4.29      18140   422462
    ## 12 Tanzania             4.13         21      509
    ## 13 Bolivia              3.79      17200   453595
    ## 14 Hungary              3.71      30007   808539
    ## 15 Mali                 3.65        528    14464
    ## 16 Chad                 3.51        174     4954
    ## 17 Niger                3.50        194     5538
    ## 18 Tunisia              3.29      16388   497613
    ## 19 Zimbabwe             3.22       2185    67765
    ## 20 Slovakia             3.19      12521   391925

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6495.     194249   29.9 
    ##  2 Hungary                3006.      30007    9.98
    ##  3 Czech Republic         2895.      30331   10.5 
    ##  4 Brazil                 2650.     532893  201.  
    ##  5 Bulgaria               2537.      18140    7.15
    ##  6 Belgium                2422.      25198   10.4 
    ##  7 Argentina              2383.      98501   41.3 
    ##  8 Colombia               2350.     112298   47.8 
    ##  9 Slovakia               2295.      12521    5.46
    ## 10 Paraguay               2175.      13867    6.38
    ## 11 Italy                  2118.     127775   60.3 
    ## 12 Mexico                 2089.     234907  112.  
    ## 13 United Kingdom         2060.     128425   62.3 
    ## 14 Chile                  2023.      33877   16.7 
    ## 15 Poland                 1952.      75160   38.5 
    ## 16 United States          1940.     601867  310.  
    ## 17 Spain                  1742.      80997   46.5 
    ## 18 Bolivia                1729.      17200    9.95
    ## 19 France                 1704.     110376   64.8 
    ## 20 Portugal               1607.      17156   10.7

EOL
