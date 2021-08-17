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

Updated: 2021-08-18

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

    ## # A tibble: 20 × 4
    ##    area           speed_since_100 cum_conf days_since_100
    ##    <chr>                    <dbl>    <dbl>          <int>
    ##  1 United States           67556. 36547639            541
    ##  2 India                   61901. 32250679            521
    ##  3 Brazil                  39011. 20364099            522
    ##  4 Russia                  12848.  6642559            517
    ##  5 United Kingdom          11834.  6295617            532
    ##  6 France                  11830.  6317130            534
    ##  7 Turkey                  11792.  6096816            517
    ##  8 Argentina                9854.  5084635            516
    ##  9 Colombia                 9415.  4867761            517
    ## 10 Spain                    8854.  4719266            533
    ## 11 Iran                     8287.  4467015            539
    ## 12 Italy                    8215.  4444338            541
    ## 13 Indonesia                7471.  3892479            521
    ## 14 Germany                  7153.  3827051            535
    ## 15 Mexico                   5998.  3101266            517
    ## 16 Poland                   5539.  2885676            521
    ## 17 South Africa             5055.  2613569            517
    ## 18 Ukraine                  4437.  2267219            511
    ## 19 Peru                     4119.  2133812            518
    ## 20 Netherlands              3606.  1904128            528

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                306.             160034.            523
    ##  2 Israel                        247.             129348.            524
    ##  3 Jordan                        239.             122463.            513
    ##  4 Argentina                     238.             122986.            516
    ##  5 Sweden                        220.             116174.            528
    ##  6 United States                 218.             117807.            541
    ##  7 Netherlands                   217.             114396.            528
    ##  8 Belgium                       209.             111014.            531
    ##  9 Colombia                      197.             101857.            517
    ## 10 Brazil                        194.             101262.            522
    ## 11 Serbia                        193.              99843.            516
    ## 12 Spain                         190.             101477.            533
    ## 13 United Kingdom                190.             100975.            532
    ## 14 Chile                         188.              97330.            519
    ## 15 Switzerland                   183.              97307.            532
    ## 16 France                        183.              97534.            534
    ## 17 Portugal                      180.              94087.            522
    ## 18 Hungary                       158.              81201.            515
    ## 19 Austria                       154.              81048.            527
    ## 20 Turkey                        152.              78361.            517

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.2        1405     7308
    ##  2 Peru                 9.25     197393  2133812
    ##  3 Mexico               8.01     248380  3101266
    ##  4 Sudan                7.40       2780    37556
    ##  5 Syria                7.35       1940    26409
    ##  6 Ecuador              6.45      31870   493767
    ##  7 Egypt                5.82      16625   285465
    ##  8 Somalia              5.44        892    16399
    ##  9 China                4.63       5669   122433
    ## 10 Afghanistan          4.62       7031   152243
    ## 11 Bulgaria             4.23      18376   434535
    ## 12 Myanmar              3.78      13623   360291
    ## 13 Bolivia              3.77      18185   482428
    ## 14 Hungary              3.71      30042   810549
    ## 15 Tanzania             3.66         50     1367
    ## 16 Mali                 3.64        535    14698
    ## 17 Tunisia              3.50      21905   625688
    ## 18 Chad                 3.49        174     4984
    ## 19 Zimbabwe             3.43       4138   120532
    ## 20 Niger                3.42        196     5724

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6600.     197393   29.9 
    ##  2 Hungary                3010.      30042    9.98
    ##  3 Czech Republic         2900.      30376   10.5 
    ##  4 Brazil                 2830.     569058  201.  
    ##  5 Argentina              2637.     109041   41.3 
    ##  6 Colombia               2583.     123459   47.8 
    ##  7 Bulgaria               2571.      18376    7.15
    ##  8 Belgium                2432.      25299   10.4 
    ##  9 Paraguay               2421.      15439    6.38
    ## 10 Slovakia               2300.      12546    5.46
    ## 11 Mexico                 2208.     248380  112.  
    ## 12 Chile                  2175.      36420   16.7 
    ## 13 Ecuador                2155.      31870   14.8 
    ## 14 Italy                  2129.     128456   60.3 
    ## 15 United Kingdom         2101.     130979   62.3 
    ## 16 Tunisia                2069.      21905   10.6 
    ## 17 United States          1988.     616711  310.  
    ## 18 Poland                 1956       75306   38.5 
    ## 19 Bolivia                1828.      18185    9.95
    ## 20 Spain                  1776.      82595   46.5

EOL
