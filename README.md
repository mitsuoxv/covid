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

Updated: 2022-09-21

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
    ##  1 United States          101411. 94413388            931
    ##  2 India                   48416. 44543089            920
    ##  3 Brazil                  37635. 34587047            919
    ##  4 France                  36320. 33886832            933
    ##  5 Germany                 35017. 32740593            935
    ##  6 South Korea             25940. 24461737            943
    ##  7 United Kingdom          25333. 23585309            931
    ##  8 Italy                   23584. 22169273            940
    ##  9 Russia                  22418. 20535057            916
    ## 10 Japan                   22018. 20740797            942
    ## 11 Turkey                  18398. 16852382            916
    ## 12 Spain                   14361. 13384876            932
    ## 13 Vietnam                 12566. 11460227            912
    ## 14 Australia               11027. 10177640            923
    ## 15 Argentina               10525.  9703938            922
    ## 16 Netherlands              9067.  8405580            927
    ## 17 Iran                     8042.  7543548            938
    ## 18 Mexico                   7667.  7069543            922
    ## 19 China                    7360.  7183866            976
    ## 20 Indonesia                6970.  6412944            920

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        685.             632635.            923
    ##  2 Austria                       662.             612765.            925
    ##  3 Denmark                       648.             599571.            925
    ##  4 Switzerland                   574.             534758.            931
    ##  5 France                        561.             523200.            933
    ##  6 Portugal                      556.             511604.            920
    ##  7 Netherlands                   545.             504991.            927
    ##  8 South Korea                   536.             505171.            943
    ##  9 Australia                     512.             473032.            923
    ## 10 Greece                        477.             439892.            922
    ## 11 Belgium                       467.             434222.            930
    ## 12 Germany                       428.             400241.            935
    ## 13 Czech Republic                422.             389277.            922
    ## 14 United Kingdom                406.             378282.            931
    ## 15 Italy                         391.             367404.            940
    ## 16 Slovakia                      368.             337238.            916
    ## 17 Serbia                        348.             318096.            915
    ## 18 United States                 327.             304331.            931
    ## 19 Norway                        314.             291768.            929
    ## 20 Spain                         309.             287810.            932

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2155    11932
    ##  2 Sudan                 7.84       4961    63280
    ##  3 Syria                 5.53       3163    57227
    ##  4 Peru                  5.23     216309  4132687
    ##  5 Somalia               5.00       1361    27207
    ##  6 Egypt                 4.81      24797   515361
    ##  7 Mexico                4.67     329896  7069543
    ##  8 Afghanistan           3.95       7796   197476
    ##  9 Ecuador               3.59      35885  1000214
    ## 10 Niger                 3.33        313     9395
    ## 11 Myanmar               3.14      19444   619167
    ## 12 Malawi                3.05       2675    87842
    ## 13 Bulgaria              3.01      37682  1252615
    ## 14 Paraguay              2.73      19564   716009
    ## 15 Tunisia               2.55      29243  1145163
    ## 16 Chad                  2.55        193     7571
    ## 17 South Africa          2.54     102146  4016157
    ## 18 Haiti                 2.54        857    33702
    ## 19 Algeria               2.54       6879   270609
    ## 20 Sri Lanka             2.50      16748   670617

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7233.     216309   29.9 
    ##  2 Bulgaria               5271.      37682    7.15
    ##  3 Hungary                4749.      47409    9.98
    ##  4 Czech Republic         3911.      40967   10.5 
    ##  5 Slovakia               3747.      20439    5.46
    ##  6 Chile                  3638.      60923   16.7 
    ##  7 Brazil                 3408.     685376  201.  
    ##  8 United States          3361.    1042582  310.  
    ##  9 Argentina              3141.     129855   41.3 
    ## 10 Belgium                3137.      32636   10.4 
    ## 11 Paraguay               3068.      19564    6.38
    ## 12 Poland                 3048.     117367   38.5 
    ## 13 Romania                3048.      66921   22.0 
    ## 14 United Kingdom         3039.     189484   62.3 
    ## 15 Greece                 2990.      32894   11   
    ## 16 Colombia               2966.     141746   47.8 
    ## 17 Mexico                 2933.     329896  112.  
    ## 18 Italy                  2927.     176609   60.3 
    ## 19 Tunisia                2762.      29243   10.6 
    ## 20 Russia                 2745.     386234  141.

EOL
