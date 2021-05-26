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

Updated: 2021-05-27

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
    ##  1 United States           71659. 32820112            458
    ##  2 India                   62004. 27157795            438
    ##  3 Brazil                  36721. 16120756            439
    ##  4 France                  12216.  5509559            451
    ##  5 Turkey                  11989.  5203385            434
    ##  6 Russia                  11581.  5026168            434
    ##  7 United Kingdom           9949.  4467314            449
    ##  8 Italy                    9165.  4197892            458
    ##  9 Argentina                8226.  3562135            433
    ## 10 Spain                    8117.  3652879            450
    ## 11 Germany                  8089.  3656177            452
    ## 12 Colombia                 7487.  3249433            434
    ## 13 Poland                   6549.  2868450            438
    ## 14 Iran                     6262.  2855396            456
    ## 15 Mexico                   5523.  2397307            434
    ## 16 Ukraine                  5116.  2189858            428
    ## 17 Peru                     4429.  1926923            435
    ## 18 Indonesia                4087.  1786187            437
    ## 19 South Africa             3781.  1640932            434
    ## 20 Czech Republic           3771.  1659433            440

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                360.             158403.            440
    ##  2 Jordan                        266.             114304.            430
    ##  3 Israel                        260.             114141.            439
    ##  4 Sweden                        250.             111384.            445
    ##  5 United States                 231.             105792.            458
    ##  6 Belgium                       225.             100998.            448
    ##  7 Serbia                        223.              96766.            433
    ##  8 Netherlands                   220.              98010.            445
    ##  9 Switzerland                   202.              90625.            449
    ## 10 Argentina                     199.              86160.            433
    ## 11 France                        189.              85066.            451
    ## 12 Hungary                       186.              80417.            432
    ## 13 Chile                         183.              79982.            436
    ## 14 Brazil                        183.              80162.            439
    ## 15 Portugal                      180.              79228.            439
    ## 16 Austria                       175.              77759.            444
    ## 17 Spain                         175.              78546.            450
    ## 18 Poland                        170.              74505.            438
    ## 19 Slovakia                      165.              71343.            433
    ## 20 United Kingdom                160.              71651.            449

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                19.7        1312     6674
    ##  2 Mexico                9.25     221695  2397307
    ##  3 Syria                 7.20       1745    24252
    ##  4 Sudan                 7.01       2446    34889
    ##  5 Egypt                 5.78      14807   256124
    ##  6 Somalia               5.24        767    14632
    ##  7 Ecuador               4.82      20210   419198
    ##  8 China                 4.50       4881   108361
    ##  9 Bulgaria              4.21      17581   417133
    ## 10 Afghanistan           4.21       2855    67743
    ## 11 Tanzania              4.13         21      509
    ## 12 Zimbabwe              4.10       1587    38706
    ## 13 Bolivia               3.98      14024   352170
    ## 14 Hungary               3.68      29537   802723
    ## 15 Tunisia               3.66      12342   337529
    ## 16 Mali                  3.61        514    14252
    ## 17 Niger                 3.56        192     5389
    ## 18 Peru                  3.55      68358  1926923
    ## 19 Chad                  3.51        173     4924
    ## 20 South Africa          3.41      55976  1640932

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Hungary                2959.      29537    9.98
    ##  2 Czech Republic         2869.      30054   10.5 
    ##  3 Bulgaria               2459.      17581    7.15
    ##  4 Belgium                2391.      24873   10.4 
    ##  5 Peru                   2286.      68358   29.9 
    ##  6 Slovakia               2257.      12312    5.46
    ##  7 Brazil                 2237.     449858  201.  
    ##  8 Italy                  2080.     125501   60.3 
    ##  9 United Kingdom         2049.     127739   62.3 
    ## 10 Mexico                 1971.     221695  112.  
    ## 11 Poland                 1904.      73305   38.5 
    ## 12 United States          1886.     585182  310.  
    ## 13 Argentina              1802.      74480   41.3 
    ## 14 Colombia               1783.      85207   47.8 
    ## 15 Spain                  1716.      79801   46.5 
    ## 16 Chile                  1707.      28585   16.7 
    ## 17 France                 1668.     108041   64.8 
    ## 18 Portugal               1594.      17021   10.7 
    ## 19 Sweden                 1507.      14396    9.56
    ## 20 Jordan                 1466.       9395    6.41

EOL
