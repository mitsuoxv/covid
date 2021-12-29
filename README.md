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

Updated: 2021-12-30

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
    ##  1 United States           78894. 52543602            666
    ##  2 India                   53143. 34808886            655
    ##  3 Brazil                  33912. 22246276            656
    ##  4 United Kingdom          18526. 12338680            666
    ##  5 Russia                  16065. 10458271            651
    ##  6 Turkey                  14385.  9364508            651
    ##  7 France                  13578.  9070254            668
    ##  8 Germany                 10562.  7066412            669
    ##  9 Iran                     9196.  6188857            673
    ## 10 Spain                    9044.  6032298            667
    ## 11 Italy                    8528.  5756412            675
    ## 12 Argentina                8431.  5480305            650
    ## 13 Colombia                 7877.  5127971            651
    ## 14 Indonesia                6507.  4262351            655
    ## 15 Poland                   6229.  4080282            655
    ## 16 Mexico                   6015.  3951946            657
    ## 17 Ukraine                  5666.  3654690            645
    ## 18 South Africa             5260.  3424534            651
    ## 19 Netherlands              4661.  3085553            662
    ## 20 Philippines              4334.  2839111            655

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                358.             235183.            657
    ##  2 Belgium                       298.             198292.            665
    ##  3 United Kingdom                297.             197899.            666
    ##  4 Israel                        283.             186515.            658
    ##  5 Netherlands                   280.             185374.            662
    ##  6 Serbia                        271.             176095.            650
    ##  7 Jordan                        254.             164645.            647
    ##  8 United States                 254.             169368.            666
    ##  9 Switzerland                   252.             167633.            666
    ## 10 Slovakia                      235.             153171.            651
    ## 11 Austria                       234.             154131.            660
    ## 12 France                        210.             140041.            668
    ## 13 Sweden                        205.             135472.            662
    ## 14 Argentina                     204.             132556.            650
    ## 15 Denmark                       202.             133489.            660
    ## 16 Spain                         194.             129710.            667
    ## 17 Hungary                       193.             125195.            649
    ## 18 Portugal                      186.             122077.            656
    ## 19 Turkey                        185.             120360.            651
    ## 20 Brazil                        169.             110621.            656

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.6        1984    10123
    ##  2 Peru                 8.88     202550  2281362
    ##  3 Mexico               7.56     298819  3951946
    ##  4 Sudan                7.16       3331    46518
    ##  5 Ecuador              6.20      33650   542960
    ##  6 Syria                5.74       2879    50127
    ##  7 Somalia              5.66       1333    23532
    ##  8 Egypt                5.66      21639   382194
    ##  9 Afghanistan          4.66       7355   157998
    ## 10 China                4.34       5699   131315
    ## 11 Bulgaria             4.16      30657   737233
    ## 12 Niger                3.75        274     7307
    ## 13 Myanmar              3.63      19262   530272
    ## 14 Paraguay             3.57      16607   465564
    ## 15 Tunisia              3.53      25538   723422
    ## 16 Indonesia            3.38     144081  4262351
    ## 17 Bolivia              3.37      19576   580690
    ## 18 Romania              3.25      58642  1804455
    ## 19 Malawi               3.25       2343    72135
    ## 20 Mali                 3.24        658    20288

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6773.     202550   29.9 
    ##  2 Bulgaria               4288.      30657    7.15
    ##  3 Hungary                3908.      39009    9.98
    ##  4 Czech Republic         3434.      35975   10.5 
    ##  5 Brazil                 3076.     618534  201.  
    ##  6 Slovakia               3035.      16554    5.46
    ##  7 Argentina              2832.     117066   41.3 
    ##  8 Colombia               2716.     129798   47.8 
    ##  9 Belgium                2716.      28250   10.4 
    ## 10 Romania                2670.      58642   22.0 
    ## 11 Mexico                 2657.     298819  112.  
    ## 12 United States          2619.     812577  310.  
    ## 13 Paraguay               2605.      16607    6.38
    ## 14 Poland                 2486.      95707   38.5 
    ## 15 Tunisia                2412.      25538   10.6 
    ## 16 United Kingdom         2374.     148021   62.3 
    ## 17 Chile                  2332.      39059   16.7 
    ## 18 Ecuador                2275.      33650   14.8 
    ## 19 Italy                  2270.     136955   60.3 
    ## 20 Russia                 2182.     307022  141.

EOL
