WHO, Covid-19 situation report
================
Mitsuo Shiota
2020/3/7

-   [Summary](#summary)
-   [Read data from WHO](#read-data-from-who)
-   [Newly confirmed cases by region](#newly-confirmed-cases-by-region)
-   [Fastest spreading areas](#fastest-spreading-areas)
-   [Highest fatality rate areas](#highest-fatality-rate-areas)
-   [Highest deaths per population
    areas](#highest-deaths-per-population-areas)

Updated: 2021-04-28

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
    ##  1 United States           75578. 31742914            420
    ##  2 India                   43120. 17636307            409
    ##  3 Brazil                  34977. 14340787            410
    ##  4 France                  12838.  5417903            422
    ##  5 Russia                  11801.  4779425            405
    ##  6 Turkey                  11524.  4667281            405
    ##  7 United Kingdom          10492.  4406950            420
    ##  8 Italy                    9256.  3971114            429
    ##  9 Spain                    8286.  3488469            421
    ## 10 Germany                  7826.  3310301            423
    ## 11 Argentina                7081.  2860884            404
    ## 12 Colombia                 6850.  2774464            405
    ## 13 Poland                   6768.  2768034            409
    ## 14 Mexico                   5749.  2328391            405
    ## 15 Iran                     5661.  2417230            427
    ## 16 Ukraine                  5108.  2038248            399
    ## 17 Peru                     4339.  1761575            406
    ## 18 Indonesia                4037.  1647138            408
    ## 19 Czech Republic           3948.  1622777            411
    ## 20 South Africa             3892.  1576320            405

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                377.             154904.            411
    ##  2 Israel                        278.             113978.            410
    ##  3 Jordan                        274.             109963.            401
    ##  4 United States                 244.             102320.            420
    ##  5 Sweden                        236.              98195.            416
    ##  6 Serbia                        230.              92807.            404
    ##  7 Belgium                       224.              93828.            419
    ##  8 Netherlands                   212.              88155.            416
    ##  9 Switzerland                   204.              85589.            420
    ## 10 France                        198.              83650.            422
    ## 11 Hungary                       192.              77410.            403
    ## 12 Portugal                      191.              78179.            410
    ## 13 Austria                       178.              73966.            415
    ## 14 Spain                         178.              75011.            421
    ## 15 Poland                        176.              71897.            409
    ## 16 Brazil                        174.              71311.            410
    ## 17 Slovakia                      173.              69752.            404
    ## 18 Chile                         172.              70201.            407
    ## 19 Argentina                     171.              69198.            404
    ## 20 United Kingdom                168.              70683.            420

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                19.5        1206     6187
    ##  2 Mexico                9.23     214947  2328391
    ##  3 Syria                 6.95       1548    22265
    ##  4 Sudan                 6.90       2340    33891
    ##  5 Egypt                 5.86      13107   223514
    ##  6 Somalia               5.08        702    13812
    ##  7 Ecuador               4.88      18300   374775
    ##  8 China                 4.69       4857   103503
    ##  9 Afghanistan           4.39       2598    59225
    ## 10 Bolivia               4.31      12824   297659
    ## 11 Tanzania              4.13         21      509
    ## 12 Zimbabwe              4.09       1560    38102
    ## 13 Bulgaria              4.03      16101   399259
    ## 14 Niger                 3.67        191     5204
    ## 15 Chad                  3.54        169     4772
    ## 16 Hungary               3.49      26984   772707
    ## 17 Mali                  3.47        474    13658
    ## 18 South Africa          3.44      54186  1576320
    ## 19 Tunisia               3.43      10352   301627
    ## 20 Peru                  3.39      59724  1761575

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Czech Republic         2775.      29075   10.5 
    ##  2 Hungary                2703.      26984    9.98
    ##  3 Belgium                2313.      24065   10.4 
    ##  4 Bulgaria               2252.      16101    7.15
    ##  5 Slovakia               2121.      11572    5.46
    ##  6 United Kingdom         2044.     127434   62.3 
    ##  7 Peru                   1997.      59724   29.9 
    ##  8 Italy                  1981.     119539   60.3 
    ##  9 Brazil                 1943.     390797  201.  
    ## 10 Mexico                 1911.     214947  112.  
    ## 11 United States          1827.     566842  310.  
    ## 12 Poland                 1712.      65897   38.5 
    ## 13 Spain                  1672.      77738   46.5 
    ## 14 Portugal               1589.      16965   10.7 
    ## 15 France                 1584.     102575   64.8 
    ## 16 Chile                  1551.      25975   16.7 
    ## 17 Colombia               1493.      71351   47.8 
    ## 18 Argentina              1491.      61644   41.3 
    ## 19 Sweden                 1457.      13923    9.56
    ## 20 Jordan                 1352.       8660    6.41

EOL
