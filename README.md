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

Updated: 2022-06-23

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
    ##  1 United States          101465. 85332271            841
    ##  2 India                   52207. 43331645            830
    ##  3 Brazil                  38304. 31754465            829
    ##  4 France                  34708. 29258921            843
    ##  5 Germany                 32490. 27454225            845
    ##  6 United Kingdom          26784. 22525810            841
    ##  7 Russia                  22284. 18406485            826
    ##  8 South Korea             21452. 18298341            853
    ##  9 Italy                   21128. 17959329            850
    ## 10 Turkey                  18263. 15085742            826
    ## 11 Spain                   14980. 12613634            842
    ## 12 Vietnam                 13064. 10738909            822
    ## 13 Argentina               11228.  9341492            832
    ## 14 Japan                   10767.  9173938            852
    ## 15 Netherlands              9722.  8137275            837
    ## 16 Australia                9424.  7850285            833
    ## 17 Iran                     8532.  7235175            848
    ## 18 Colombia                 7432.  6131657            825
    ## 19 Indonesia                7317.  6072918            830
    ## 20 Poland                   7243.  6011984            830

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        695.             579331.            833
    ##  2 Denmark                       689.             575487.            835
    ##  3 Austria                       639.             533794.            835
    ##  4 Netherlands                   584.             488872.            837
    ##  5 Switzerland                   582.             489236.            841
    ##  6 Portugal                      573.             475769.            830
    ##  7 France                        536.             451747.            843
    ##  8 Belgium                       480.             403474.            840
    ##  9 Czech Republic                450.             374817.            832
    ## 10 South Korea                   443.             377888.            853
    ## 11 Australia                     438.             364862.            833
    ## 12 United Kingdom                430.             361289.            841
    ## 13 Slovakia                      398.             328634.            826
    ## 14 Germany                       397.             335617.            845
    ## 15 Greece                        389.             323866.            832
    ## 16 Italy                         350.             297634.            850
    ## 17 Norway                        343.             287576.            839
    ## 18 Serbia                        334.             275487.            825
    ## 19 United States                 327.             275059.            841
    ## 20 Jordan                        322.             265068.            822

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               18.2        2149    11824
    ##  2 Sudan                7.92       4951    62541
    ##  3 Peru                 5.93     213395  3600993
    ##  4 Syria                5.63       3150    55917
    ##  5 Mexico               5.54     325417  5877837
    ##  6 Somalia              5.09       1361    26748
    ##  7 Egypt                4.81      24722   514047
    ##  8 Afghanistan          4.24       7715   181808
    ##  9 Ecuador              3.97      35695   898469
    ## 10 Niger                3.43        310     9031
    ## 11 Bulgaria             3.19      37230  1168818
    ## 12 Myanmar              3.17      19434   613521
    ## 13 Malawi               3.07       2644    86204
    ## 14 Paraguay             2.90      18947   653428
    ## 15 Tunisia              2.74      28670  1046703
    ## 16 Haiti                2.69        837    31115
    ## 17 Chad                 2.60        193     7424
    ## 18 Algeria              2.58       6875   265985
    ## 19 Indonesia            2.58     156702  6072918
    ## 20 Honduras             2.56      10903   425930

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7135.     213395   29.9 
    ##  2 Bulgaria               5208.      37230    7.15
    ##  3 Hungary                4671.      46626    9.98
    ##  4 Czech Republic         3848.      40309   10.5 
    ##  5 Slovakia               3691.      20137    5.46
    ##  6 Chile                  3480.      58286   16.7 
    ##  7 Brazil                 3327.     669161  201.  
    ##  8 United States          3236.    1003894  310.  
    ##  9 Argentina              3121.     129016   41.3 
    ## 10 Belgium                3063.      31868   10.4 
    ## 11 Poland                 3023.     116404   38.5 
    ## 12 Romania                2993.      65714   22.0 
    ## 13 Paraguay               2972.      18947    6.38
    ## 14 Colombia               2928.     139918   47.8 
    ## 15 Mexico                 2893.     325417  112.  
    ## 16 United Kingdom         2882.     179706   62.3 
    ## 17 Italy                  2782.     167842   60.3 
    ## 18 Greece                 2738.      30115   11   
    ## 19 Tunisia                2708.      28670   10.6 
    ## 20 Russia                 2705.     380643  141.

EOL
