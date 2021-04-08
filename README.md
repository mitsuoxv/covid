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

Updated: 2021-04-09

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
    ##  1 United States           76162. 30541000            401
    ##  2 Brazil                  33505  13100580            391
    ##  3 India                   33150. 12928574            390
    ##  4 Russia                  11955.  4614834            386
    ##  5 France                  11822.  4764318            403
    ##  6 United Kingdom          10891.  4367295            401
    ##  7 Turkey                   9414.  3633925            386
    ##  8 Italy                    9025.  3700393            410
    ##  9 Spain                    8275.  3326736            402
    ## 10 Germany                  7254.  2930852            404
    ## 11 Poland                   6409.  2499507            390
    ## 12 Colombia                 6394.  2468236            386
    ## 13 Argentina                6306.  2428029            385
    ## 14 Mexico                   5845.  2256380            386
    ## 15 Iran                     4863.  1984348            408
    ## 16 Ukraine                  4747.  1803998            380
    ## 17 Peru                     4130.  1598593            387
    ## 18 South Africa             4024.  1553609            386
    ## 19 Czech Republic           3999.  1567848            392
    ## 20 Indonesia                3977.  1547376            389

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                382.             149661.            392
    ##  2 Israel                        290.             113596.            391
    ##  3 Jordan                        266.             101556.            382
    ##  4 United States                 245.              98445.            401
    ##  5 Serbia                        223.              85691.            385
    ##  6 Sweden                        222.              88093.            397
    ##  7 Belgium                       218.              87303.            400
    ##  8 Switzerland                   201.              80436.            401
    ##  9 Netherlands                   200.              79264.            397
    ## 10 Portugal                      198.              77279.            391
    ## 11 France                        183.              73559.            403
    ## 12 Hungary                       182.              69975.            384
    ## 13 Spain                         178.              71534.            402
    ## 14 Slovakia                      175.              67547.            385
    ## 15 United Kingdom                175.              70047.            401
    ## 16 Austria                       173.              68588.            396
    ## 17 Brazil                        167.              65144.            391
    ## 18 Poland                        166.              64922.            390
    ## 19 Chile                         160.              62283.            388
    ## 20 Argentina                     153.              58729.            385

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                19.5         987     5051
    ##  2 Mexico                9.09     205002  2256380
    ##  3 Syria                 6.79       1342    19761
    ##  4 Sudan                 6.48       2063    31833
    ##  5 Egypt                 5.93      12290   207293
    ##  6 Ecuador               5.02      17057   339604
    ##  7 Somalia               4.81        576    11978
    ##  8 China                 4.71       4851   103003
    ##  9 Bolivia               4.47      12366   276890
    ## 10 Afghanistan           4.42       2516    56943
    ## 11 Zimbabwe              4.14       1531    36984
    ## 12 Tanzania              4.13         21      509
    ## 13 Bulgaria              3.85      14034   364419
    ## 14 Niger                 3.72        188     5052
    ## 15 Mali                  3.69        400    10841
    ## 16 Chad                  3.60        166     4606
    ## 17 Guatemala             3.49       6928   198374
    ## 18 Tunisia               3.43       9087   264994
    ## 19 South Africa          3.42      53111  1553609
    ## 20 Peru                  3.34      53411  1598593

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Czech Republic         2622.      27466   10.5 
    ##  2 Hungary                2272.      22681    9.98
    ##  3 Belgium                2240.      23301   10.4 
    ##  4 United Kingdom         2036.     126927   62.3 
    ##  5 Bulgaria               1963.      14034    7.15
    ##  6 Slovakia               1892.      10322    5.46
    ##  7 Italy                  1862.     112374   60.3 
    ##  8 Mexico                 1823.     205002  112.  
    ##  9 Peru                   1786.      53411   29.9 
    ## 10 United States          1782.     552928  310.  
    ## 11 Brazil                 1675.     336947  201.  
    ## 12 Spain                  1635.      76037   46.5 
    ## 13 Portugal               1582.      16890   10.7 
    ## 14 France                 1493.      96672   64.8 
    ## 15 Poland                 1472.      56659   38.5 
    ## 16 Chile                  1421.      23796   16.7 
    ## 17 Sweden                 1421.      13578    9.56
    ## 18 Argentina              1370.      56634   41.3 
    ## 19 Colombia               1350.      64524   47.8 
    ## 20 Switzerland            1282.       9718    7.58

EOL
