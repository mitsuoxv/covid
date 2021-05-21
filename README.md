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

Updated: 2021-05-22

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
    ##  1 United States           72199. 32706250            453
    ##  2 India                   60120. 26031991            433
    ##  3 Brazil                  36433. 15812055            434
    ##  4 France                  13051.  5820918            446
    ##  5 Turkey                  12029.  5160423            429
    ##  6 Russia                  11617.  4983845            429
    ##  7 United Kingdom          10034.  4455225            444
    ##  8 Italy                    9223.  4178261            453
    ##  9 Spain                    8161.  3631661            445
    ## 10 Germany                  8132.  3635162            447
    ## 11 Argentina                7970.  3411160            428
    ## 12 Colombia                 7368.  3161126            429
    ## 13 Poland                   6612.  2863031            433
    ## 14 Iran                     6218.  2804632            451
    ## 15 Mexico                   5565.  2387512            429
    ## 16 Ukraine                  5142.  2175382            423
    ## 17 Peru                     4427.  1903615            430
    ## 18 Indonesia                4071.  1758898            432
    ## 19 Czech Republic           3809.  1656874            435
    ## 20 South Africa             3788.  1625003            429

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                364.             158159.            435
    ##  2 Jordan                        268.             113710.            425
    ##  3 Israel                        263.             114126.            434
    ##  4 Sweden                        251.             110421.            440
    ##  5 United States                 233.             105425.            453
    ##  6 Belgium                       226.             100135.            443
    ##  7 Serbia                        225.              96514.            428
    ##  8 Netherlands                   221.              97056.            440
    ##  9 Switzerland                   203.              90102.            444
    ## 10 France                        202.              89873.            446
    ## 11 Argentina                     193.              82508.            428
    ## 12 Hungary                       188.              80247.            427
    ## 13 Portugal                      182.              79030.            434
    ## 14 Chile                         181.              78124.            431
    ## 15 Brazil                        181.              78627.            434
    ## 16 Austria                       176.              77461.            439
    ## 17 Spain                         175.              78090.            445
    ## 18 Poland                        172.              74364.            433
    ## 19 Slovakia                      166.              71224.            428
    ## 20 United Kingdom                161.              71457.            444

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                19.7        1302     6617
    ##  2 Mexico                9.25     220850  2387512
    ##  3 Syria                 7.18       1720    23939
    ##  4 Sudan                 7.01       2446    34889
    ##  5 Egypt                 5.81      14559   250391
    ##  6 Somalia               5.26        767    14594
    ##  7 Ecuador               4.82      20022   415255
    ##  8 China                 4.60       4861   105647
    ##  9 Afghanistan           4.27       2782    65080
    ## 10 Bulgaria              4.19      17447   416055
    ## 11 Tanzania              4.13         21      509
    ## 12 Zimbabwe              4.10       1585    38635
    ## 13 Bolivia               4.02      13693   340207
    ## 14 Hungary               3.67      29427   801025
    ## 15 Tunisia               3.64      12089   331674
    ## 16 Mali                  3.60        512    14226
    ## 17 Niger                 3.58        192     5361
    ## 18 Peru                  3.52      67034  1903615
    ## 19 Chad                  3.52        173     4918
    ## 20 South Africa          3.42      55568  1625003

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Hungary                2948.      29427    9.98
    ##  2 Czech Republic         2863.      29990   10.5 
    ##  3 Bulgaria               2441.      17447    7.15
    ##  4 Belgium                2383.      24794   10.4 
    ##  5 Slovakia               2251.      12280    5.46
    ##  6 Peru                   2241.      67034   29.9 
    ##  7 Brazil                 2196.     441691  201.  
    ##  8 Italy                  2068.     124810   60.3 
    ##  9 United Kingdom         2048.     127701   62.3 
    ## 10 Mexico                 1964.     220850  112.  
    ## 11 Poland                 1888.      72691   38.5 
    ## 12 United States          1877.     582346  310.  
    ## 13 Argentina              1748.      72265   41.3 
    ## 14 Colombia               1731.      82743   47.8 
    ## 15 Spain                  1712.      79601   46.5 
    ## 16 Chile                  1682.      28169   16.7 
    ## 17 France                 1658.     107403   64.8 
    ## 18 Portugal               1594.      17014   10.7 
    ## 19 Sweden                 1502.      14351    9.56
    ## 20 Jordan                 1456.       9328    6.41

EOL
