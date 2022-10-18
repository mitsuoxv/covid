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

Updated: 2022-10-19

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
    ##  1 United States           99743. 95653603            959
    ##  2 India                   47081. 44632430            948
    ##  3 Brazil                  36694. 34749058            947
    ##  4 France                  36655. 35225269            961
    ##  5 Germany                 36094. 34758889            963
    ##  6 South Korea             25916. 25164695            971
    ##  7 United Kingdom          24816. 23798797            959
    ##  8 Italy                   23878. 23114013            968
    ##  9 Russia                  22589. 21324431            944
    ## 10 Japan                   22446. 21772967            970
    ## 11 Turkey                  17923. 16919638            944
    ## 12 Spain                   14023. 13462593            960
    ## 13 Vietnam                 12226. 11492598            940
    ## 14 Australia               10833. 10301894            951
    ## 15 Argentina               10227.  9715464            950
    ## 16 Netherlands              8875.  8476062            955
    ## 17 China                    8411.  8444753           1004
    ## 18 Iran                     7820.  7554703            966
    ## 19 Mexico                   7477.  7102947            950
    ## 20 Indonesia                6815.  6460265            948

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Austria                       684.             651668.            953
    ##  2 Israel                        668.             635525.            951
    ##  3 Denmark                       635.             605581.            953
    ##  4 Switzerland                   570.             546690.            959
    ##  5 France                        566.             543865.            961
    ##  6 Portugal                      544.             516002.            948
    ##  7 South Korea                   535.             519689.            971
    ##  8 Netherlands                   533.             509226.            955
    ##  9 Australia                     503.             478807.            951
    ## 10 Greece                        481.             456954             950
    ## 11 Belgium                       461.             441636.            958
    ## 12 Germany                       441.             424914.            963
    ## 13 Czech Republic                416.             395523.            950
    ## 14 United Kingdom                398.             381706.            959
    ## 15 Italy                         396.             383061.            968
    ## 16 Slovakia                      359.             339131.            944
    ## 17 Serbia                        345.             325396.            943
    ## 18 United States                 322.             308328.            959
    ## 19 Norway                        305.             292157.            957
    ## 20 Spain                         302.             289481.            960

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2158    11939
    ##  2 Sudan                 7.82       4964    63449
    ##  3 Syria                 5.52       3163    57337
    ##  4 Peru                  5.23     216877  4150737
    ##  5 Somalia               5.00       1361    27223
    ##  6 Egypt                 4.81      24797   515388
    ##  7 Mexico                4.65     330277  7102947
    ##  8 Afghanistan           3.88       7811   201385
    ##  9 Ecuador               3.57      35904  1006922
    ## 10 Niger                 3.33        314     9417
    ## 11 Myanmar               3.10      19471   628861
    ## 12 Malawi                3.05       2682    88057
    ## 13 Bulgaria              2.97      37795  1271228
    ## 14 Paraguay              2.73      19596   717260
    ## 15 Tunisia               2.55      29254  1145930
    ## 16 Chad                  2.55        193     7581
    ## 17 Algeria               2.54       6881   270746
    ## 18 South Africa          2.54     102246  4023358
    ## 19 Haiti                 2.54        857    33761
    ## 20 Sri Lanka             2.50      16769   670929

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7252.     216877   29.9 
    ##  2 Bulgaria               5287.      37795    7.15
    ##  3 Hungary                4777.      47680    9.98
    ##  4 Czech Republic         3954.      41420   10.5 
    ##  5 Slovakia               3762.      20523    5.46
    ##  6 Chile                  3669.      61448   16.7 
    ##  7 Brazil                 3417.     687155  201.  
    ##  8 United States          3397.    1053917  310.  
    ##  9 Belgium                3154.      32810   10.4 
    ## 10 Argentina              3144.     129970   41.3 
    ## 11 United Kingdom         3074.     191681   62.3 
    ## 12 Paraguay               3073.      19596    6.38
    ## 13 Poland                 3063.     117931   38.5 
    ## 14 Romania                3057.      67124   22.0 
    ## 15 Greece                 3028.      33313   11   
    ## 16 Colombia               2968.     141820   47.8 
    ## 17 Italy                  2951.     178081   60.3 
    ## 18 Mexico                 2937.     330277  112.  
    ## 19 Russia                 2765.     389084  141.  
    ## 20 Tunisia                2763.      29254   10.6

EOL
