WHO, Covid-19 situation report
================
Mitsuo Shiota
2020-03-07

-   <a href="#summary" id="toc-summary">Summary</a>
-   <a href="#read-data-from-who" id="toc-read-data-from-who">Read data from
    WHO</a>
-   <a href="#newly-confirmed-cases-by-region"
    id="toc-newly-confirmed-cases-by-region">Newly confirmed cases by
    region</a>
-   <a href="#fastest-spreading-areas"
    id="toc-fastest-spreading-areas">Fastest spreading areas</a>
-   <a href="#highest-fatality-rate-areas"
    id="toc-highest-fatality-rate-areas">Highest fatality rate areas</a>
-   <a href="#highest-deaths-per-population-areas"
    id="toc-highest-deaths-per-population-areas">Highest deaths per
    population areas</a>

<!-- badges: start -->

[![R-CMD-check](https://github.com/mitsuoxv/covid/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/mitsuoxv/covid/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

Updated: 2022-09-29

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
    ##  1 United States          100994. 94833079            939
    ##  2 India                   48038. 44579088            928
    ##  3 Brazil                  37366. 34638288            927
    ##  4 France                  36345. 34200464            941
    ##  5 Germany                 35140. 33137143            943
    ##  6 South Korea             25983. 24709789            951
    ##  7 United Kingdom          25156. 23621956            939
    ##  8 Italy                   23585. 22358487            948
    ##  9 Russia                  22629. 20909731            924
    ## 10 Japan                   22230. 21118325            950
    ## 11 Turkey                  18261. 16873793            924
    ## 12 Spain                   14268. 13412263            940
    ## 13 Vietnam                 12473. 11475321            920
    ## 14 Australia               10946. 10191312            931
    ## 15 Argentina               10439.  9708420            930
    ## 16 Netherlands              9008.  8422336            935
    ## 17 Iran                     7978.  7547706            946
    ## 18 China                    7644.  7522247            984
    ## 19 Mexico                   7615.  7082034            930
    ## 20 Indonesia                6926.  6427764            928

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        680.             633306.            931
    ##  2 Austria                       665.             620397.            933
    ##  3 Denmark                       644.             600924.            933
    ##  4 Switzerland                   574.             538757.            939
    ##  5 France                        561.             528043.            941
    ##  6 Portugal                      553.             513382.            928
    ##  7 Netherlands                   541.             505998.            935
    ##  8 South Korea                   537.             510294.            951
    ##  9 Australia                     509.             473667.            931
    ## 10 Greece                        481.             447290.            930
    ## 11 Belgium                       465.             435764.            938
    ## 12 Germany                       430.             405088.            943
    ## 13 Czech Republic                421.             391343.            930
    ## 14 United Kingdom                403.             378870.            939
    ## 15 Italy                         391.             370540.            948
    ## 16 Slovakia                      366.             337785.            924
    ## 17 Serbia                        347.             320534.            923
    ## 18 United States                 326.             305684.            939
    ## 19 Norway                        311.             291875.            937
    ## 20 Spain                         307.             288399.            940

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2157    11935
    ##  2 Sudan                 7.84       4961    63280
    ##  3 Syria                 5.52       3163    57284
    ##  4 Peru                  5.23     216514  4141410
    ##  5 Somalia               5.00       1361    27207
    ##  6 Egypt                 4.81      24797   515371
    ##  7 Mexico                4.66     330046  7082034
    ##  8 Afghanistan           3.92       7798   198750
    ##  9 Ecuador               3.58      35887  1002057
    ## 10 Niger                 3.33        313     9407
    ## 11 Myanmar               3.13      19455   622042
    ## 12 Malawi                3.05       2680    88005
    ## 13 Bulgaria              3.00      37708  1257149
    ## 14 Paraguay              2.73      19583   716059
    ## 15 Tunisia               2.55      29249  1145686
    ## 16 Chad                  2.55        193     7581
    ## 17 Haiti                 2.54        857    33702
    ## 18 South Africa          2.54     102169  4018102
    ## 19 Algeria               2.54       6879   270660
    ## 20 Sri Lanka             2.50      16757   670732

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7240.     216514   29.9 
    ##  2 Bulgaria               5275.      37708    7.15
    ##  3 Hungary                4759.      47503    9.98
    ##  4 Czech Republic         3918.      41049   10.5 
    ##  5 Slovakia               3750.      20454    5.46
    ##  6 Chile                  3648.      61087   16.7 
    ##  7 Brazil                 3410.     685835  201.  
    ##  8 United States          3370.    1045619  310.  
    ##  9 Argentina              3142.     129897   41.3 
    ## 10 Belgium                3139.      32659   10.4 
    ## 11 Paraguay               3071.      19583    6.38
    ## 12 Poland                 3052.     117509   38.5 
    ## 13 Romania                3051.      66992   22.0 
    ## 14 United Kingdom         3046.     189919   62.3 
    ## 15 Greece                 3010.      33111   11   
    ## 16 Colombia               2966.     141769   47.8 
    ## 17 Mexico                 2935.     330046  112.  
    ## 18 Italy                  2933.     176976   60.3 
    ## 19 Tunisia                2762.      29249   10.6 
    ## 20 Russia                 2751.     387054  141.

EOL
