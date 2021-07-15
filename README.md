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

Updated: 2021-07-16

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
    ##  1 United States           66151. 33604822            508
    ##  2 India                   63500. 30987880            488
    ##  3 Brazil                  39165. 19151993            489
    ##  4 Russia                  12153.  5882295            484
    ##  5 France                  11405.  5714131            501
    ##  6 Turkey                  11364.  5500151            484
    ##  7 United Kingdom          10487.  5233211            499
    ##  8 Argentina                9695.  4682960            483
    ##  9 Colombia                 9397.  4548142            484
    ## 10 Italy                    8417.  4275846            508
    ## 11 Spain                    8083.  4041474            500
    ## 12 Germany                  7451.  3740325            502
    ## 13 Iran                     6799.  3440400            506
    ## 14 Poland                   5904.  2881151            488
    ## 15 Indonesia                5587.  2726803            488
    ## 16 Mexico                   5381.  2604711            484
    ## 17 Ukraine                  4692.  2242868            478
    ## 18 South Africa             4621.  2236805            484
    ## 19 Peru                     4296.  2083567            485
    ## 20 Netherlands              3545.  1755126            495

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                325.             159445.            490
    ##  2 Jordan                        247.             118467.            480
    ##  3 Israel                        235.             115403.            491
    ##  4 Argentina                     235.             113270.            483
    ##  5 Sweden                        231.             114440.            495
    ##  6 United States                 213.             108321.            508
    ##  7 Netherlands                   213.             105445.            495
    ##  8 Belgium                       212.             105798.            498
    ##  9 Serbia                        202.              97747.            483
    ## 10 Colombia                      197.              95169.            484
    ## 11 Chile                         196.              95072.            486
    ## 12 Brazil                        195.              95235.            489
    ## 13 Switzerland                   186.              92814.            499
    ## 14 France                        176.              88224.            501
    ## 15 Portugal                      176.              85852.            489
    ## 16 Spain                         174.              86902.            500
    ## 17 United Kingdom                168.              83935.            499
    ## 18 Hungary                       168.              81012.            482
    ## 19 Austria                       160.              78968.            494
    ## 20 Poland                        153.              74835.            488

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.6        1366     6964
    ##  2 Peru                 9.34     194606  2083567
    ##  3 Mexico               9.03     235277  2604711
    ##  4 Sudan                7.50       2774    36986
    ##  5 Syria                7.37       1901    25806
    ##  6 Egypt                5.79      16418   283409
    ##  7 Somalia              5.18        781    15076
    ##  8 China                4.69       5601   119485
    ##  9 Ecuador              4.64      21832   470882
    ## 10 Afghanistan          4.34       5983   137853
    ## 11 Bulgaria             4.30      18158   422703
    ## 12 Tanzania             4.13         21      509
    ## 13 Bolivia              3.78      17287   456815
    ## 14 Hungary              3.71      30013   808661
    ## 15 Mali                 3.64        528    14493
    ## 16 Chad                 3.51        174     4955
    ## 17 Niger                3.49        194     5551
    ## 18 Tunisia              3.25      16845   518609
    ## 19 Slovakia             3.19      12524   392000
    ## 20 Paraguay             3.19      14016   439897

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6507.     194606   29.9 
    ##  2 Hungary                3007.      30013    9.98
    ##  3 Czech Republic         2896.      30335   10.5 
    ##  4 Brazil                 2664.     535838  201.  
    ##  5 Bulgaria               2540.      18158    7.15
    ##  6 Belgium                2423.      25207   10.4 
    ##  7 Argentina              2410.      99640   41.3 
    ##  8 Colombia               2382.     113839   47.8 
    ##  9 Slovakia               2296.      12524    5.46
    ## 10 Paraguay               2198.      14016    6.38
    ## 11 Italy                  2119.     127831   60.3 
    ## 12 Mexico                 2092.     235277  112.  
    ## 13 United Kingdom         2061.     128530   62.3 
    ## 14 Chile                  2033.      34049   16.7 
    ## 15 Poland                 1953.      75191   38.5 
    ## 16 United States          1943.     602820  310.  
    ## 17 Spain                  1743.      81043   46.5 
    ## 18 Bolivia                1738.      17287    9.95
    ## 19 France                 1705.     110446   64.8 
    ## 20 Portugal               1609.      17182   10.7

EOL
