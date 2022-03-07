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

Updated: 2022-03-08

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
“speed_since_100”, which is average number of newly confirmed cases per
day since cumulative cases became more than 100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_since_100 cum_conf days_since_100
    ##    <chr>                    <dbl>    <dbl>          <int>
    ##  1 United States          106988. 78529635            734
    ##  2 India                   59429. 42967315            723
    ##  3 Brazil                  40101. 29033052            724
    ##  4 France                  30410. 22382148            736
    ##  5 United Kingdom          26048. 19119185            734
    ##  6 Russia                  23664. 17014818            719
    ##  7 Germany                 21532. 15869417            737
    ##  8 Turkey                  19962. 14352997            719
    ##  9 Italy                   17532. 13026112            743
    ## 10 Spain                   15102. 11100428            735
    ## 11 Argentina               12446.  8936602            718
    ## 12 Iran                     9568.  7089892            741
    ## 13 Netherlands              9188.  6707202            730
    ## 14 Colombia                 8443.  6070616            719
    ## 15 Indonesia                7981.  5770105            723
    ## 16 Poland                   7949.  5747322            723
    ## 17 Mexico                   7673.  5563080            725
    ## 18 Japan                    7240.  5393533            745
    ## 19 Ukraine                  6837.  4875007            713
    ## 20 South Korea              6256.  4666977            746

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Denmark                       717.             522258.            728
    ##  2 Israel                        688.             499601.            726
    ##  3 Netherlands                   552.             402956.            730
    ##  4 Switzerland                   517.             379603.            734
    ##  5 Austria                       484.             352556.            728
    ##  6 Czech Republic                478.             346706.            725
    ##  7 Belgium                       470.             344736.            733
    ##  8 France                        470.             345572.            736
    ##  9 Portugal                      431.             312121.            724
    ## 10 United Kingdom                418.             306651.            734
    ## 11 Slovakia                      386.             277344.            719
    ## 12 Serbia                        365.             262173.            718
    ## 13 Jordan                        361.             258257.            715
    ## 14 Sweden                        352.             257011.            730
    ## 15 Norway                        352.             257506.            732
    ## 16 United States                 345.             253131.            734
    ## 17 Spain                         325.             238688.            735
    ## 18 Greece                        315.             228043.            725
    ## 19 Argentina                     301.             216157.            718
    ## 20 Italy                         291.             215877.            743

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.2        2138    11777
    ##  2 Sudan                 7.89       4865    61625
    ##  3 Peru                  5.99     211032  3525940
    ##  4 Mexico                5.75     319824  5563080
    ##  5 Syria                 5.62       3095    55026
    ##  6 Somalia               5.15       1359    26400
    ##  7 Egypt                 4.93      24197   490969
    ##  8 Afghanistan           4.37       7623   174582
    ##  9 Ecuador               4.22      35264   836216
    ## 10 Niger                 3.50        307     8766
    ## 11 Bulgaria              3.25      35832  1101326
    ## 12 Myanmar               3.24      19389   598446
    ## 13 Malawi                3.07       2619    85429
    ## 14 Paraguay              2.87      18460   643619
    ## 15 Tunisia               2.78      27943  1005804
    ## 16 South Africa          2.70      99543  3684319
    ## 17 Haiti                 2.70        820    30382
    ## 18 Chad                  2.62        190     7257
    ## 19 El Salvador           2.61       4088   156364
    ## 20 Indonesia             2.61     150430  5770105

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7056.     211032   29.9 
    ##  2 Bulgaria               5012.      35832    7.15
    ##  3 Hungary                4452.      44436    9.98
    ##  4 Czech Republic         3717.      38940   10.5 
    ##  5 Slovakia               3429.      18704    5.46
    ##  6 Brazil                 3242.     651927  201.  
    ##  7 Argentina              3066.     126768   41.3 
    ##  8 United States          3064.     950529  310.  
    ##  9 Poland                 2923.     112551   38.5 
    ## 10 Romania                2913.      63961   22.0 
    ## 11 Colombia               2909.     139037   47.8 
    ## 12 Belgium                2909.      30259   10.4 
    ## 13 Paraguay               2895.      18460    6.38
    ## 14 Mexico                 2844.     319824  112.  
    ## 15 Tunisia                2639.      27943   10.6 
    ## 16 United Kingdom         2598.     162008   62.3 
    ## 17 Italy                  2583.     155887   60.3 
    ## 18 Chile                  2572.      43077   16.7 
    ## 19 Russia                 2537.     356949  141.  
    ## 20 Ecuador                2384.      35264   14.8

EOL
