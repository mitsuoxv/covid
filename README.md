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

Updated: 2021-05-28

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
    ##  1 United States           71557. 32844547            459
    ##  2 India                   62344. 27369093            439
    ##  3 Brazil                  36805. 16194209            440
    ##  4 France                  12217.  5522205            452
    ##  5 Turkey                  11981.  5212123            435
    ##  6 Russia                  11575.  5035207            435
    ##  7 United Kingdom           9934.  4470301            450
    ##  8 Italy                    9154.  4201827            459
    ##  9 Argentina                8264.  3586736            434
    ## 10 Spain                    8110.  3657886            451
    ## 11 Germany                  8085.  3662490            453
    ## 12 Colombia                 7518.  3270614            435
    ## 13 Poland                   6537.  2869652            439
    ## 14 Iran                     6271.  2865864            457
    ## 15 Mexico                   5516.  2399790            435
    ## 16 Ukraine                  5112.  2193367            429
    ## 17 Peru                     4432.  1932255            436
    ## 18 Indonesia                4089.  1791221            438
    ## 19 South Africa             3783.  1645555            435
    ## 20 Czech Republic           3764.  1659980            441

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                359.             158456.            441
    ##  2 Jordan                        265.             114436.            431
    ##  3 Israel                        259.             114144.            440
    ##  4 Sweden                        250.             111670.            446
    ##  5 United States                 231.             105871.            459
    ##  6 Belgium                       225.             101187.            449
    ##  7 Serbia                        223.              96818.            434
    ##  8 Netherlands                   220.              98176.            446
    ##  9 Switzerland                   202.              90756.            450
    ## 10 Argentina                     200.              86755.            434
    ## 11 France                        189.              85261.            452
    ## 12 Hungary                       186.              80457.            433
    ## 13 Chile                         184.              80293.            437
    ## 14 Brazil                        183.              80527.            440
    ## 15 Portugal                      180.              79284.            440
    ## 16 Austria                       175.              77814.            445
    ## 17 Spain                         174.              78654.            451
    ## 18 Poland                        170.              74536.            439
    ## 19 Slovakia                      164.              71374.            434
    ## 20 United Kingdom                159.              71699.            450

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                19.6        1314     6692
    ##  2 Mexico                9.25     221960  2399790
    ##  3 Syria                 7.20       1750    24315
    ##  4 Sudan                 7.01       2446    34889
    ##  5 Egypt                 5.77      14850   257275
    ##  6 Somalia               5.24        767    14632
    ##  7 Ecuador               4.81      20227   420167
    ##  8 China                 4.49       4892   109016
    ##  9 Bulgaria              4.22      17617   417526
    ## 10 Afghanistan           4.20       2869    68366
    ## 11 Tanzania              4.13         21      509
    ## 12 Zimbabwe              4.09       1589    38819
    ## 13 Bolivia               3.97      14124   355349
    ## 14 Hungary               3.68      29569   803119
    ## 15 Tunisia               3.66      12398   338853
    ## 16 Mali                  3.61        514    14256
    ## 17 Niger                 3.56        192     5398
    ## 18 Peru                  3.54      68470  1932255
    ## 19 Chad                  3.51        173     4924
    ## 20 South Africa          3.41      56077  1645555

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Hungary                2962.      29569    9.98
    ##  2 Czech Republic         2869.      30059   10.5 
    ##  3 Bulgaria               2464.      17617    7.15
    ##  4 Belgium                2392.      24889   10.4 
    ##  5 Peru                   2289.      68470   29.9 
    ##  6 Slovakia               2258.      12320    5.46
    ##  7 Brazil                 2248.     452031  201.  
    ##  8 Italy                  2082.     125622   60.3 
    ##  9 United Kingdom         2049.     127748   62.3 
    ## 10 Mexico                 1974.     221960  112.  
    ## 11 Poland                 1908.      73440   38.5 
    ## 12 United States          1888.     585770  310.  
    ## 13 Argentina              1815.      75056   41.3 
    ## 14 Colombia               1793.      85666   47.8 
    ## 15 Spain                  1717.      79855   46.5 
    ## 16 Chile                  1709.      28624   16.7 
    ## 17 France                 1671.     108214   64.8 
    ## 18 Portugal               1594.      17022   10.7 
    ## 19 Sweden                 1511.      14436    9.56
    ## 20 Jordan                 1468.       9407    6.41

EOL
