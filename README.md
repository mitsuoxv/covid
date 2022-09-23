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

Updated: 2022-09-24

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
    ##  1 United States          101305. 94618978            934
    ##  2 India                   48276. 44558425            923
    ##  3 Brazil                  37536. 34607947            922
    ##  4 France                  36340. 34014037            936
    ##  5 Germany                 35080. 32905086            938
    ##  6 South Korea             25967. 24565021            946
    ##  7 United Kingdom          25291. 23621956            934
    ##  8 Italy                   23586. 22241369            943
    ##  9 Russia                  22519. 20694894            919
    ## 10 Japan                   22136. 20918843            945
    ## 11 Turkey                  18338. 16852382            919
    ## 12 Spain                   14324. 13393196            935
    ## 13 Vietnam                 12533. 11467619            915
    ## 14 Australia               11006. 10191312            926
    ## 15 Argentina               10491.  9703938            925
    ## 16 Netherlands              9043.  8410076            930
    ## 17 Iran                     8018.  7545351            941
    ## 18 Mexico                   7650.  7076005            925
    ## 19 China                    7480.  7323095            979
    ## 20 Indonesia                6955.  6419394            923

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        684.             633040.            926
    ##  2 Austria                       663.             615507.            928
    ##  3 Denmark                       646.             599923.            928
    ##  4 Switzerland                   574.             536556.            934
    ##  5 France                        561.             525164.            936
    ##  6 Portugal                      555.             512319.            923
    ##  7 Netherlands                   543.             505261.            930
    ##  8 South Korea                   536.             507304.            946
    ##  9 Australia                     512.             473667.            926
    ## 10 Greece                        479.             443201.            925
    ## 11 Belgium                       466.             435060.            933
    ## 12 Germany                       429.             402252.            938
    ## 13 Czech Republic                422.             390130.            925
    ## 14 United Kingdom                406.             378870.            934
    ## 15 Italy                         391.             368599.            943
    ## 16 Slovakia                      367.             337471.            919
    ## 17 Serbia                        348.             319063.            918
    ## 18 United States                 327.             304993.            934
    ## 19 Norway                        313.             291820.            932
    ## 20 Spain                         308.             287989.            935

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2157    11934
    ##  2 Sudan                 7.84       4961    63280
    ##  3 Syria                 5.52       3163    57253
    ##  4 Peru                  5.23     216406  4137314
    ##  5 Somalia               5.00       1361    27207
    ##  6 Egypt                 4.81      24797   515361
    ##  7 Mexico                4.66     329949  7076005
    ##  8 Afghanistan           3.94       7796   197866
    ##  9 Ecuador               3.58      35887  1002057
    ## 10 Niger                 3.33        313     9399
    ## 11 Myanmar               3.14      19452   620444
    ## 12 Malawi                3.05       2680    87981
    ## 13 Bulgaria              3.01      37694  1253934
    ## 14 Paraguay              2.73      19564   716009
    ## 15 Tunisia               2.55      29246  1145345
    ## 16 Chad                  2.55        193     7571
    ## 17 South Africa          2.54     102169  4017011
    ## 18 Haiti                 2.54        857    33702
    ## 19 Algeria               2.54       6879   270631
    ## 20 Sri Lanka             2.50      16752   670668

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7236.     216406   29.9 
    ##  2 Bulgaria               5273.      37694    7.15
    ##  3 Hungary                4754.      47457    9.98
    ##  4 Czech Republic         3914.      40999   10.5 
    ##  5 Slovakia               3748.      20443    5.46
    ##  6 Chile                  3641.      60974   16.7 
    ##  7 Brazil                 3409.     685604  201.  
    ##  8 United States          3366.    1044127  310.  
    ##  9 Argentina              3141.     129855   41.3 
    ## 10 Belgium                3138.      32647   10.4 
    ## 11 Paraguay               3068.      19564    6.38
    ## 12 Poland                 3050.     117431   38.5 
    ## 13 Romania                3049.      66962   22.0 
    ## 14 United Kingdom         3046.     189919   62.3 
    ## 15 Greece                 3001.      33010   11   
    ## 16 Colombia               2966.     141746   47.8 
    ## 17 Mexico                 2934.     329949  112.  
    ## 18 Italy                  2930.     176775   60.3 
    ## 19 Tunisia                2762.      29246   10.6 
    ## 20 Russia                 2747.     386551  141.

EOL
