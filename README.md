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

Updated: 2021-07-15

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
    ##  1 United States           66218. 33572715            507
    ##  2 India                   63544. 30946074            487
    ##  3 Brazil                  39153. 19106971            488
    ##  4 Russia                  12126.  5857002            483
    ##  5 France                  11411.  5705517            500
    ##  6 Turkey                  11373.  5493244            483
    ##  7 United Kingdom          10424.  5191463            498
    ##  8 Argentina                9674.  4662937            482
    ##  9 Colombia                 9380.  4530610            483
    ## 10 Italy                    8429.  4273693            507
    ## 11 Spain                    8046.  4015084            499
    ## 12 Germany                  7462.  3738683            501
    ## 13 Iran                     6766.  3417029            505
    ## 14 Poland                   5916.  2881046            487
    ## 15 Indonesia                5370.  2615529            487
    ## 16 Mexico                   5369.  2593574            483
    ## 17 Ukraine                  4700.  2242245            477
    ## 18 South Africa             4595.  2219316            483
    ## 19 Peru                     4300.  2081557            484
    ## 20 Netherlands              3532.  1744700            494

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                326.             159419.            489
    ##  2 Jordan                        247.             118352.            479
    ##  3 Israel                        235.             115307.            490
    ##  4 Argentina                     234.             112786.            482
    ##  5 Sweden                        232.             114402.            494
    ##  6 United States                 213.             108218.            507
    ##  7 Belgium                       212.             105578.            497
    ##  8 Netherlands                   212.             104818.            494
    ##  9 Serbia                        203.              97730.            482
    ## 10 Colombia                      196.              94802.            483
    ## 11 Chile                         196.              94998.            485
    ## 12 Brazil                        195.              95011.            488
    ## 13 Switzerland                   186.              92744.            498
    ## 14 France                        176.              88091.            500
    ## 15 Portugal                      175.              85463.            488
    ## 16 Spain                         173.              86335.            499
    ## 17 Hungary                       168.              81007.            481
    ## 18 United Kingdom                167.              83265.            498
    ## 19 Austria                       160.              78935.            493
    ## 20 Poland                        154.              74832.            487

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.6        1366     6961
    ##  2 Peru                 9.34     194488  2081557
    ##  3 Mexico               9.06     235058  2593574
    ##  4 Sudan                7.50       2760    36805
    ##  5 Syria                7.36       1900    25801
    ##  6 Egypt                5.79      16412   283320
    ##  7 Somalia              5.18        781    15068
    ##  8 China                4.68       5595   119428
    ##  9 Ecuador              4.64      21832   470882
    ## 10 Afghanistan          4.33       5923   136643
    ## 11 Bulgaria             4.30      18154   422619
    ## 12 Tanzania             4.13         21      509
    ## 13 Bolivia              3.79      17250   455436
    ## 14 Hungary              3.71      30013   808612
    ## 15 Mali                 3.64        528    14487
    ## 16 Chad                 3.51        174     4954
    ## 17 Niger                3.50        194     5546
    ## 18 Tunisia              3.26      16651   510396
    ## 19 Slovakia             3.19      12523   391971
    ## 20 Paraguay             3.18      13964   438764

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6503.     194488   29.9 
    ##  2 Hungary                3007.      30013    9.98
    ##  3 Czech Republic         2896.      30335   10.5 
    ##  4 Brazil                 2657.     534233  201.  
    ##  5 Bulgaria               2539.      18154    7.15
    ##  6 Belgium                2423.      25207   10.4 
    ##  7 Argentina              2401.      99255   41.3 
    ##  8 Colombia               2372.     113335   47.8 
    ##  9 Slovakia               2296.      12523    5.46
    ## 10 Paraguay               2190.      13964    6.38
    ## 11 Italy                  2118.     127808   60.3 
    ## 12 Mexico                 2090.     235058  112.  
    ## 13 United Kingdom         2061.     128481   62.3 
    ## 14 Chile                  2031.      34016   16.7 
    ## 15 Poland                 1953.      75179   38.5 
    ## 16 United States          1942.     602409  310.  
    ## 17 Spain                  1742.      81033   46.5 
    ## 18 Bolivia                1734.      17250    9.95
    ## 19 France                 1705.     110442   64.8 
    ## 20 Portugal               1609.      17173   10.7

EOL
