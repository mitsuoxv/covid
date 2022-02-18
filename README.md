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

Updated: 2022-02-19

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
    ##  1 United States          108119. 77521589            717
    ##  2 India                   60595. 42780235            706
    ##  3 Brazil                  39330. 27806786            707
    ##  4 France                  29814. 21436445            719
    ##  5 United Kingdom          25800. 18499062            717
    ##  6 Russia                  21397. 15020573            702
    ##  7 Turkey                  18896. 13265374            702
    ##  8 Germany                 18411. 13255989            720
    ##  9 Italy                   16974. 12323398            726
    ## 10 Spain                   15012. 10778607            718
    ## 11 Argentina               12553.  8799858            701
    ## 12 Iran                     9522.  6894110            724
    ## 13 Colombia                 8591.  6031130            702
    ## 14 Netherlands              8363.  5963238            713
    ## 15 Poland                   7818.  5519282            706
    ## 16 Mexico                   7549.  5344840            708
    ## 17 Indonesia                7209.  5089637            706
    ## 18 Ukraine                  6713.  4672198            696
    ## 19 Japan                    5827.  4241800            728
    ## 20 South Africa             5198.  3648968            702

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        675.             478097.            708
    ##  2 Denmark                       637.             452844.            711
    ##  3 Netherlands                   502.             358260.            713
    ##  4 Switzerland                   485.             347838.            717
    ##  5 Czech Republic                470.             332563.            708
    ##  6 Belgium                       468.             334953.            716
    ##  7 France                        460.             330971.            719
    ##  8 Portugal                      417.             294903.            707
    ##  9 United Kingdom                414.             296704.            717
    ## 10 Austria                       413.             293407.            711
    ## 11 Serbia                        363.             254306.            701
    ## 12 Sweden                        355.             253096.            713
    ## 13 United States                 349.             249882.            717
    ## 14 Slovakia                      346.             242805.            702
    ## 15 Jordan                        341.             238216.            698
    ## 16 Spain                         323.             231768.            718
    ## 17 Norway                        307.             219247.            715
    ## 18 Argentina                     304.             212849.            701
    ## 19 Greece                        290.             205038.            708
    ## 20 Italy                         281.             204232.            726

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.0        2113    11707
    ##  2 Sudan                 6.37       3821    59939
    ##  3 Peru                  6.02     208789  3466309
    ##  4 Mexico                5.88     314128  5344840
    ##  5 Syria                 5.72       3038    53148
    ##  6 Somalia               5.12       1345    26260
    ##  7 Egypt                 5.10      23519   461299
    ##  8 Afghanistan           4.38       7524   171673
    ##  9 Ecuador               4.36      35067   804348
    ## 10 China                 3.48       5726   164322
    ## 11 Myanmar               3.47      19319   556256
    ## 12 Niger                 3.47        303     8728
    ## 13 Bulgaria              3.29      34884  1059192
    ## 14 Malawi                3.05       2599    85106
    ## 15 Indonesia             2.87     146044  5089637
    ## 16 Paraguay              2.87      18079   630718
    ## 17 Tunisia               2.80      27295   974214
    ## 18 El Salvador           2.72       4027   147786
    ## 19 Haiti                 2.69        809    30055
    ## 20 South Africa          2.67      97520  3648968

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6981.     208789   29.9 
    ##  2 Bulgaria               4880.      34884    7.15
    ##  3 Hungary                4314.      43066    9.98
    ##  4 Czech Republic         3637.      38106   10.5 
    ##  5 Slovakia               3337.      18201    5.46
    ##  6 Brazil                 3186.     640774  201.  
    ##  7 Argentina              3022.     124924   41.3 
    ##  8 United States          2972.     921984  310.  
    ##  9 Colombia               2879.     137586   47.8 
    ## 10 Belgium                2873.      29886   10.4 
    ## 11 Poland                 2844.     109509   38.5 
    ## 12 Paraguay               2836.      18079    6.38
    ## 13 Romania                2832.      62188   22.0 
    ## 14 Mexico                 2793.     314128  112.  
    ## 15 Tunisia                2578.      27295   10.6 
    ## 16 United Kingdom         2570.     160221   62.3 
    ## 17 Italy                  2524.     152282   60.3 
    ## 18 Russia                 2445.     343957  141.  
    ## 19 Chile                  2444.      40936   16.7 
    ## 20 Ecuador                2371.      35067   14.8

EOL
