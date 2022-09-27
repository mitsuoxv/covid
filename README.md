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

Updated: 2022-09-28

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
    ##  1 United States          101052. 94787120            938
    ##  2 India                   48086. 44575473            927
    ##  3 Brazil                  37400. 34632220            926
    ##  4 France                  36305. 34126825            940
    ##  5 Germany                 35076. 33041332            942
    ##  6 South Korea             25931. 24634296            950
    ##  7 United Kingdom          25183. 23621956            938
    ##  8 Italy                   23562. 22313612            947
    ##  9 Russia                  22611. 20869714            923
    ## 10 Japan                   22200. 21067544            949
    ## 11 Turkey                  18281. 16873793            923
    ## 12 Spain                   14274. 13403502            939
    ## 13 Vietnam                 12483. 11472301            919
    ## 14 Australia               10958. 10191312            930
    ## 15 Argentina               10450.  9708420            929
    ## 16 Netherlands              9010.  8415459            934
    ## 17 Iran                     7987.  7547397            945
    ## 18 Mexico                   7623.  7082034            929
    ## 19 China                    7574.  7445011            983
    ## 20 Indonesia                6932.  6425849            927

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        681.             633306.            930
    ##  2 Austria                       664.             619098.            932
    ##  3 Denmark                       644.             600630.            932
    ##  4 Switzerland                   572.             536556.            938
    ##  5 France                        561.             526906.            940
    ##  6 Portugal                      553.             512319.            927
    ##  7 Netherlands                   541.             505585.            934
    ##  8 South Korea                   536.             508735.            950
    ##  9 Australia                     509.             473667.            930
    ## 10 Greece                        477.             443201.            929
    ## 11 Belgium                       465.             435764.            937
    ## 12 Germany                       429.             403917.            942
    ## 13 Czech Republic                421.             390940.            929
    ## 14 United Kingdom                404.             378870.            938
    ## 15 Italy                         390.             369796.            947
    ## 16 Slovakia                      366.             337676.            923
    ## 17 Serbia                        347.             320160.            922
    ## 18 United States                 326.             305535.            938
    ## 19 Norway                        312.             291854.            936
    ## 20 Spain                         307.             288210.            939

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2157    11935
    ##  2 Sudan                 7.84       4961    63280
    ##  3 Syria                 5.52       3163    57280
    ##  4 Peru                  5.23     216493  4141241
    ##  5 Somalia               5.00       1361    27207
    ##  6 Egypt                 4.81      24797   515371
    ##  7 Mexico                4.66     330046  7082034
    ##  8 Afghanistan           3.93       7798   198583
    ##  9 Ecuador               3.58      35887  1002057
    ## 10 Niger                 3.33        313     9405
    ## 11 Myanmar               3.13      19455   621686
    ## 12 Malawi                3.05       2680    87981
    ## 13 Bulgaria              3.00      37704  1256266
    ## 14 Paraguay              2.73      19583   716059
    ## 15 Tunisia               2.55      29246  1145345
    ## 16 Chad                  2.55        193     7571
    ## 17 South Africa          2.54     102169  4017552
    ## 18 Haiti                 2.54        857    33702
    ## 19 Algeria               2.54       6879   270643
    ## 20 Sri Lanka             2.50      16756   670718

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7239.     216493   29.9 
    ##  2 Bulgaria               5274.      37704    7.15
    ##  3 Hungary                4754.      47457    9.98
    ##  4 Czech Republic         3917.      41039   10.5 
    ##  5 Slovakia               3749.      20453    5.46
    ##  6 Chile                  3648.      61085   16.7 
    ##  7 Brazil                 3410.     685805  201.  
    ##  8 United States          3370.    1045356  310.  
    ##  9 Argentina              3142.     129897   41.3 
    ## 10 Belgium                3139.      32659   10.4 
    ## 11 Paraguay               3071.      19583    6.38
    ## 12 Poland                 3051.     117481   38.5 
    ## 13 Romania                3050.      66981   22.0 
    ## 14 United Kingdom         3046.     189919   62.3 
    ## 15 Greece                 3001.      33010   11   
    ## 16 Colombia               2966.     141769   47.8 
    ## 17 Mexico                 2935.     330046  112.  
    ## 18 Italy                  2932.     176912   60.3 
    ## 19 Tunisia                2762.      29246   10.6 
    ## 20 Russia                 2750.     386943  141.

EOL
