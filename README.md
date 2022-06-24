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

[![R-CMD-check](https://github.com/mitsuoxv/covid/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/mitsuoxv/covid/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

Updated: 2022-06-25

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
    ##  1 United States          101629. 85673420            843
    ##  2 India                   52118. 43362294            832
    ##  3 Brazil                  38376. 31890733            831
    ##  4 France                  34813. 29416740            845
    ##  5 Germany                 32682. 27681775            847
    ##  6 United Kingdom          26781. 22576806            843
    ##  7 Russia                  22238. 18412805            828
    ##  8 South Korea             21419. 18312993            855
    ##  9 Italy                   21211. 18071634            852
    ## 10 Turkey                  18219. 15085742            828
    ## 11 Spain                   14945. 12613634            844
    ## 12 Vietnam                 13033. 10738909            824
    ## 13 Argentina               11201.  9341492            834
    ## 14 Japan                   10782.  9207880            854
    ## 15 Netherlands              9711.  8147612            839
    ## 16 Australia                9479.  7915074            835
    ## 17 Iran                     8512.  7235440            850
    ## 18 Colombia                 7414.  6131657            827
    ## 19 Indonesia                7304.  6076894            832
    ## 20 Poland                   7227.  6012635            832

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        697.             581998.            835
    ##  2 Denmark                       688.             576166.            837
    ##  3 Austria                       641.             536327.            837
    ##  4 Netherlands                   583.             489493.            839
    ##  5 Switzerland                   580.             489236.            843
    ##  6 Portugal                      575.             478393.            832
    ##  7 France                        537.             454184.            845
    ##  8 Belgium                       481.             404836.            842
    ##  9 Czech Republic                450.             374955.            834
    ## 10 South Korea                   442.             378191.            855
    ## 11 Australia                     441.             367873.            835
    ## 12 United Kingdom                430.             362107.            843
    ## 13 Germany                       400.             338399.            847
    ## 14 Slovakia                      397.             328815.            828
    ## 15 Greece                        391.             325775.            834
    ## 16 Italy                         352.             299495.            852
    ## 17 Norway                        342.             287726.            841
    ## 18 Serbia                        333.             275629.            827
    ## 19 United States                 328.             276158.            843
    ## 20 Jordan                        322.             265068.            824

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               18.2        2149    11824
    ##  2 Sudan                7.92       4951    62551
    ##  3 Peru                 5.92     213425  3605614
    ##  4 Syria                5.63       3150    55918
    ##  5 Mexico               5.51     325487  5906953
    ##  6 Somalia              5.09       1361    26748
    ##  7 Egypt                4.81      24722   514047
    ##  8 Afghanistan          4.24       7715   181934
    ##  9 Ecuador              3.97      35695   898667
    ## 10 Niger                3.43        310     9031
    ## 11 Bulgaria             3.18      37238  1169474
    ## 12 Myanmar              3.17      19434   613538
    ## 13 Malawi               3.07       2644    86204
    ## 14 Paraguay             2.90      18947   653428
    ## 15 Tunisia              2.74      28670  1046703
    ## 16 Haiti                2.68        837    31226
    ## 17 Chad                 2.60        193     7424
    ## 18 Algeria              2.58       6875   266015
    ## 19 Indonesia            2.58     156711  6076894
    ## 20 Honduras             2.56      10903   425930

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7136.     213425   29.9 
    ##  2 Bulgaria               5209.      37238    7.15
    ##  3 Hungary                4671.      46626    9.98
    ##  4 Czech Republic         3848.      40312   10.5 
    ##  5 Slovakia               3692.      20142    5.46
    ##  6 Chile                  3483.      58335   16.7 
    ##  7 Brazil                 3329.     669530  201.  
    ##  8 United States          3240.    1005025  310.  
    ##  9 Argentina              3121.     129016   41.3 
    ## 10 Belgium                3065.      31883   10.4 
    ## 11 Poland                 3024.     116412   38.5 
    ## 12 Romania                2993.      65726   22.0 
    ## 13 Paraguay               2972.      18947    6.38
    ## 14 Colombia               2928.     139918   47.8 
    ## 15 Mexico                 2894.     325487  112.  
    ## 16 United Kingdom         2885.     179859   62.3 
    ## 17 Italy                  2784.     167967   60.3 
    ## 18 Greece                 2740.      30141   11   
    ## 19 Tunisia                2708.      28670   10.6 
    ## 20 Russia                 2706.     380776  141.

EOL
