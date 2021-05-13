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

Updated: 2021-05-14

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
    ##  1 United States           74452. 32461049            436
    ##  2 India                   55773. 23703665            425
    ##  3 Brazil                  35875. 15282705            426
    ##  4 France                  13078.  5728256            438
    ##  5 Turkey                  12048.  5072462            421
    ##  6 Russia                  11651.  4905059            421
    ##  7 United Kingdom          10188.  4441979            436
    ##  8 Italy                    9283.  4131078            445
    ##  9 Spain                    8221.  3592751            437
    ## 10 Germany                  8122.  3565704            439
    ## 11 Argentina                7598.  3191097            420
    ## 12 Colombia                 7201.  3031726            421
    ## 13 Poland                   6696.  2845762            425
    ## 14 Iran                     6112.  2707761            443
    ## 15 Mexico                   5625.  2368393            421
    ## 16 Ukraine                  5146.  2135886            415
    ## 17 Peru                     4403.  1858239            422
    ## 18 Indonesia                4076.  1728204            424
    ## 19 Czech Republic           3864.  1649947            427
    ## 20 South Africa             3805.  1602031            421

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                369.             157498.            427
    ##  2 Jordan                        270.             112740.            417
    ##  3 Israel                        268.             114094.            426
    ##  4 Sweden                        249.             107571.            432
    ##  5 United States                 240.             104634.            436
    ##  6 Serbia                        228.              95781.            420
    ##  7 Belgium                       226.              98393.            435
    ##  8 Netherlands                   219.              94788.            432
    ##  9 Switzerland                   204.              88925.            436
    ## 10 France                        202.              88442.            438
    ## 11 Hungary                       190.              79663.            419
    ## 12 Portugal                      185.              78727.            426
    ## 13 Argentina                     184.              77186.            420
    ## 14 Brazil                        178.              75994.            426
    ## 15 Austria                       178.              76769.            431
    ## 16 Chile                         178.              75266.            423
    ## 17 Spain                         177.              77254.            437
    ## 18 Poland                        174.              73916.            425
    ## 19 Slovakia                      169.              70920.            420
    ## 20 United Kingdom                163.              71244.            436

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                19.7        1278     6502
    ##  2 Mexico                9.26     219323  2368393
    ##  3 Syria                 7.12       1676    23543
    ##  4 Sudan                 7.01       2446    34889
    ##  5 Egypt                 5.85      14091   240927
    ##  6 Somalia               5.20        753    14486
    ##  7 Ecuador               4.79      19286   402595
    ##  8 China                 4.68       4858   103902
    ##  9 Afghanistan           4.32       2721    63045
    ## 10 Bulgaria              4.15      17150   412814
    ## 11 Tanzania              4.13         21      509
    ## 12 Bolivia               4.13      13308   322578
    ## 13 Zimbabwe              4.10       1579    38466
    ## 14 Hungary               3.64      28970   795200
    ## 15 Niger                 3.61        192     5325
    ## 16 Tunisia               3.59      11637   324103
    ## 17 Mali                  3.58        507    14149
    ## 18 Chad                  3.52        172     4891
    ## 19 Peru                  3.48      64691  1858239
    ## 20 South Africa          3.43      54968  1602031

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Hungary                2902.      28970    9.98
    ##  2 Czech Republic         2847.      29825   10.5 
    ##  3 Bulgaria               2399.      17150    7.15
    ##  4 Belgium                2368.      24630   10.4 
    ##  5 Slovakia               2225.      12135    5.46
    ##  6 Peru                   2163.      64691   29.9 
    ##  7 Brazil                 2116.     425540  201.  
    ##  8 Italy                  2047.     123544   60.3 
    ##  9 United Kingdom         2047.     127640   62.3 
    ## 10 Mexico                 1950.     219323  112.  
    ## 11 United States          1862.     577510  310.  
    ## 12 Poland                 1845.      71021   38.5 
    ## 13 Spain                  1703.      79208   46.5 
    ## 14 Argentina              1652.      68311   41.3 
    ## 15 Colombia               1648.      78771   47.8 
    ## 16 France                 1642.     106335   64.8 
    ## 17 Chile                  1635.      27384   16.7 
    ## 18 Portugal               1592.      16998   10.7 
    ## 19 Sweden                 1493.      14267    9.56
    ## 20 Jordan                 1433.       9180    6.41

EOL
