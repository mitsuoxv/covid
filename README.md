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

Updated: 2021-09-28

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
    ##  1 United States           73142. 42568842            582
    ##  2 India                   59926. 33678786            562
    ##  3 Brazil                  37910. 21343304            563
    ##  4 United Kingdom          13375.  7664234            573
    ##  5 Russia                  13339.  7443149            558
    ##  6 Turkey                  12615.  7039500            558
    ##  7 France                  11794.  6781628            575
    ##  8 Iran                     9540.  5533520            580
    ##  9 Argentina                9426.  5250402            557
    ## 10 Colombia                 8871.  4950253            558
    ## 11 Spain                    8618.  4946601            574
    ## 12 Italy                    8007.  4660314            582
    ## 13 Indonesia                7490.  4209403            562
    ## 14 Germany                  7290.  4199400            576
    ## 15 Mexico                   6503.  3628812            558
    ## 16 South Africa             5191.  2896943            558
    ## 17 Poland                   5166.  2903655            562
    ## 18 Philippines              4432.  2490858            562
    ## 19 Ukraine                  4339.  2395404            552
    ## 20 Peru                     3886.  2172261            559

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        305.             172249.            564
    ##  2 Czech Republic                286.             161285.            564
    ##  3 United States                 236.             137216.            582
    ##  4 Jordan                        231.             127949.            554
    ##  5 Argentina                     228.             126996.            557
    ##  6 Serbia                        223.             124042.            557
    ##  7 United Kingdom                215.             122926.            573
    ##  8 Sweden                        211.             120283.            569
    ##  9 Netherlands                   211.             119944.            569
    ## 10 Belgium                       207.             118593.            572
    ## 11 Switzerland                   192.             109870.            573
    ## 12 Brazil                        189.             106131.            563
    ## 13 Colombia                      186.             103583.            558
    ## 14 Spain                         185.             106365.            574
    ## 15 France                        182.             104706.            575
    ## 16 Portugal                      177.              99939.            563
    ## 17 Chile                         176.              98633.            560
    ## 18 Turkey                        162.              90477.            558
    ## 19 Austria                       157.              89245.            567
    ## 20 Hungary                       148.              82274.            556

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.0        1694     8934
    ##  2 Peru                 9.17     199228  2172261
    ##  3 Mexico               7.59     275303  3628812
    ##  4 Sudan                7.44       2841    38201
    ##  5 Syria                6.69       2207    32973
    ##  6 Ecuador              6.44      32720   507858
    ##  7 Egypt                5.70      17187   301625
    ##  8 Somalia              5.59       1103    19723
    ##  9 Afghanistan          4.64       7200   155072
    ## 10 China                4.57       5690   124495
    ## 11 Bulgaria             4.16      20489   492861
    ## 12 Myanmar              3.83      17527   458154
    ## 13 Bolivia              3.75      18696   498595
    ## 14 Malawi               3.70       2276    61509
    ## 15 Hungary              3.67      30171   821261
    ## 16 Mali                 3.61        547    15164
    ## 17 Zimbabwe             3.55       4604   129625
    ## 18 Tunisia              3.51      24788   705295
    ## 19 Paraguay             3.51      16142   459779
    ## 20 Chad                 3.46        174     5034

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6662.     199228   29.9 
    ##  2 Hungary                3023.      30171    9.98
    ##  3 Brazil                 2955.     594200  201.  
    ##  4 Czech Republic         2907.      30454   10.5 
    ##  5 Bulgaria               2866.      20489    7.15
    ##  6 Argentina              2778.     114862   41.3 
    ##  7 Colombia               2639.     126102   47.8 
    ##  8 Paraguay               2532.      16142    6.38
    ##  9 Belgium                2456.      25554   10.4 
    ## 10 Mexico                 2448.     275303  112.  
    ## 11 Tunisia                2341.      24788   10.6 
    ## 12 Slovakia               2309.      12596    5.46
    ## 13 Chile                  2236.      37440   16.7 
    ## 14 Ecuador                2212.      32720   14.8 
    ## 15 United States          2197.     681502  310.  
    ## 16 United Kingdom         2184.     136168   62.3 
    ## 17 Italy                  2166.     130697   60.3 
    ## 18 Poland                 1963.      75572   38.5 
    ## 19 Bolivia                1879.      18696    9.95
    ## 20 Spain                  1854.      86229   46.5

EOL
