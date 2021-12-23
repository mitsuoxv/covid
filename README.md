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

Updated: 2021-12-24

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
    ##  1 United States           77413. 51092599            660
    ##  2 India                   53568. 34765976            649
    ##  3 Brazil                  34184. 22219477            650
    ##  4 United Kingdom          17648. 11647477            660
    ##  5 Russia                  15998. 10318650            645
    ##  6 Turkey                  14308.  9228835            645
    ##  7 France                  12914.  8549169            662
    ##  8 Germany                 10443.  6923636            663
    ##  9 Iran                     9262.  6177885            667
    ## 10 Spain                    8540.  5645095            661
    ## 11 Argentina                8392.  5404380            644
    ## 12 Italy                    8180.  5472469            669
    ## 13 Colombia                 7924.  5110788            645
    ## 14 Indonesia                6566.  4261208            649
    ## 15 Poland                   6190.  4017420            649
    ## 16 Mexico                   6048.  3937082            651
    ## 17 Ukraine                  5681.  3630391            639
    ## 18 South Africa             5198.  3353106            645
    ## 19 Netherlands              4596.  3014805            656
    ## 20 Philippines              4372.  2837784            649

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                357.             232456.            651
    ##  2 Belgium                       295.             194491.            659
    ##  3 Israel                        284.             184858.            651
    ##  4 United Kingdom                283.             186813.            660
    ##  5 Netherlands                   276.             181124.            656
    ##  6 Serbia                        272.             175092.            644
    ##  7 Jordan                        255.             163212.            641
    ##  8 United States                 250.             164691.            660
    ##  9 Switzerland                   242.             159616.            660
    ## 10 Austria                       233.             152638.            654
    ## 11 Slovakia                      233.             150228.            645
    ## 12 Argentina                     203.             130720.            644
    ## 13 Sweden                        202.             132720.            656
    ## 14 France                        199.             131996.            662
    ## 15 Hungary                       193.             123956.            643
    ## 16 Turkey                        184.             118616.            645
    ## 17 Spain                         184.             121384.            661
    ## 18 Denmark                       182.             119311.            654
    ## 19 Portugal                      179.             116387.            650
    ## 20 Brazil                        170.             110488.            650

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.6        1981    10103
    ##  2 Peru                 8.92     202338  2267715
    ##  3 Mexico               7.57     298161  3937082
    ##  4 Sudan                7.15       3298    46100
    ##  5 Ecuador              6.25      33624   538218
    ##  6 Somalia              5.75       1333    23169
    ##  7 Syria                5.73       2859    49911
    ##  8 Egypt                5.69      21500   377960
    ##  9 Afghanistan          4.65       7341   157841
    ## 10 China                4.38       5699   130109
    ## 11 Bulgaria             4.16      30359   730140
    ## 12 Niger                3.77        273     7237
    ## 13 Myanmar              3.64      19235   528838
    ## 14 Paraguay             3.57      16588   464793
    ## 15 Tunisia              3.53      25491   721797
    ## 16 Malawi               3.44       2317    67278
    ## 17 Bolivia              3.42      19480   568967
    ## 18 Indonesia            3.38     144042  4261208
    ## 19 Mali                 3.31        648    19554
    ## 20 Romania              3.24      58382  1800306

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6766.     202338   29.9 
    ##  2 Bulgaria               4247.      30359    7.15
    ##  3 Hungary                3838.      38307    9.98
    ##  4 Czech Republic         3397.      35585   10.5 
    ##  5 Brazil                 3073.     617948  201.  
    ##  6 Slovakia               2977.      16239    5.46
    ##  7 Argentina              2829.     116953   41.3 
    ##  8 Colombia               2710.     129534   47.8 
    ##  9 Belgium                2698.      28067   10.4 
    ## 10 Romania                2659.      58382   22.0 
    ## 11 Mexico                 2651.     298161  112.  
    ## 12 Paraguay               2602.      16588    6.38
    ## 13 United States          2591.     803744  310.  
    ## 14 Poland                 2427.      93445   38.5 
    ## 15 Tunisia                2407.      25491   10.6 
    ## 16 United Kingdom         2367.     147573   62.3 
    ## 17 Chile                  2323.      38900   16.7 
    ## 18 Ecuador                2273.      33624   14.8 
    ## 19 Italy                  2255.     136077   60.3 
    ## 20 Russia                 2141.     301271  141.

EOL
