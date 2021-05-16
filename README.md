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

Updated: 2021-05-17

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
    ##  1 United States           74201. 32574504            439
    ##  2 India                   57673. 24684077            428
    ##  3 Brazil                  36176. 15519525            429
    ##  4 France                  13083.  5769839            441
    ##  5 Turkey                  12044.  5106862            424
    ##  6 Russia                  11651.  4940245            424
    ##  7 United Kingdom          10134.  4448855            439
    ##  8 Italy                    9271.  4153374            448
    ##  9 Spain                    8178.  3598452            440
    ## 10 Germany                  8130.  3593434            442
    ## 11 Argentina                7729.  3269466            423
    ## 12 Colombia                 7274.  3084460            424
    ## 13 Poland                   6668.  2854079            428
    ## 14 Iran                     6143.  2739875            446
    ## 15 Mexico                   5608.  2377995            424
    ## 16 Ukraine                  5153.  2153864            418
    ## 17 Peru                     4421.  1879049            425
    ## 18 Indonesia                4067.  1736670            427
    ## 19 Czech Republic           3844.  1652840            430
    ## 20 South Africa             3800.  1611143            424

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                367.             157774.            430
    ##  2 Jordan                        269.             112898.            420
    ##  3 Israel                        266.             114104.            429
    ##  4 Sweden                        249.             108533.            435
    ##  5 United States                 239.             105000.            439
    ##  6 Serbia                        227.              96107.            423
    ##  7 Belgium                       226.              99017.            438
    ##  8 Netherlands                   220.              95748.            435
    ##  9 Switzerland                   203.              89228.            439
    ## 10 France                        202.              89084.            441
    ## 11 Hungary                       189.              79959.            422
    ## 12 Argentina                     187.              79081.            423
    ## 13 Portugal                      184.              78854.            429
    ## 14 Brazil                        180.              77172.            429
    ## 15 Chile                         179.              76449.            426
    ## 16 Austria                       178.              77075.            434
    ## 17 Spain                         176.              77376.            440
    ## 18 Poland                        173.              74132.            428
    ## 19 Slovakia                      168.              71040.            423
    ## 20 United Kingdom                163.              71355.            439

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                19.7        1286     6542
    ##  2 Mexico                9.26     220159  2377995
    ##  3 Syria                 7.15       1693    23693
    ##  4 Sudan                 7.01       2446    34889
    ##  5 Egypt                 5.84      14269   244520
    ##  6 Somalia               5.20        753    14486
    ##  7 Ecuador               4.81      19692   409520
    ##  8 China                 4.66       4858   104192
    ##  9 Afghanistan           4.32       2742    63484
    ## 10 Bulgaria              4.17      17250   414041
    ## 11 Tanzania              4.13         21      509
    ## 12 Zimbabwe              4.10       1582    38554
    ## 13 Bolivia               4.08      13451   329733
    ## 14 Hungary               3.66      29175   798147
    ## 15 Tunisia               3.62      11779   325832
    ## 16 Mali                  3.60        511    14176
    ## 17 Niger                 3.60        192     5330
    ## 18 Chad                  3.53        173     4901
    ## 19 Peru                  3.49      65608  1879049
    ## 20 South Africa          3.43      55183  1611143

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Hungary                2923.      29175    9.98
    ##  2 Czech Republic         2854.      29901   10.5 
    ##  3 Bulgaria               2413.      17250    7.15
    ##  4 Belgium                2373.      24686   10.4 
    ##  5 Slovakia               2241.      12224    5.46
    ##  6 Peru                   2194.      65608   29.9 
    ##  7 Brazil                 2151.     432628  201.  
    ##  8 Italy                  2056.     124063   60.3 
    ##  9 United Kingdom         2048.     127675   62.3 
    ## 10 Mexico                 1958.     220159  112.  
    ## 11 United States          1868.     579664  310.  
    ## 12 Poland                 1861.      71664   38.5 
    ## 13 Spain                  1705.      79281   46.5 
    ## 14 Argentina              1690.      69853   41.3 
    ## 15 Colombia               1679.      80250   47.8 
    ## 16 Chile                  1656.      27734   16.7 
    ## 17 France                 1649.     106778   64.8 
    ## 18 Portugal               1593.      17006   10.7 
    ## 19 Sweden                 1494.      14275    9.56
    ## 20 Jordan                 1443.       9243    6.41

EOL
