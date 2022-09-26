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

Updated: 2022-09-27

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
    ##  1 United States          100981. 94618978            937
    ##  2 India                   48134. 44572243            926
    ##  3 Brazil                  37414. 34607947            925
    ##  4 France                  36297. 34082887            939
    ##  5 Germany                 35018  32952050            941
    ##  6 South Korea             25958. 24634296            949
    ##  7 United Kingdom          25210. 23621956            937
    ##  8 Italy                   23577. 22303606            946
    ##  9 Russia                  22595. 20833109            922
    ## 10 Japan                   22223. 21067544            948
    ## 11 Turkey                  18301. 16873793            922
    ## 12 Spain                   14289. 13403502            938
    ## 13 Vietnam                 12497. 11472301            918
    ## 14 Australia               10970. 10191312            929
    ## 15 Argentina               10457.  9703938            928
    ## 16 Netherlands              9020.  8415459            933
    ## 17 Iran                     7995.  7547089            944
    ## 18 Mexico                   7625.  7076005            928
    ## 19 China                    7581.  7445011            982
    ## 20 Indonesia                6937.  6423873            926

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        682.             633306.            929
    ##  2 Austria                       664.             618368.            931
    ##  3 Denmark                       645.             600161.            931
    ##  4 Switzerland                   573.             536556.            937
    ##  5 France                        560.             526227.            939
    ##  6 Portugal                      553.             512319.            926
    ##  7 Netherlands                   542.             505585.            933
    ##  8 South Korea                   536.             508735.            949
    ##  9 Australia                     510.             473667.            929
    ## 10 Greece                        478.             443201.            928
    ## 11 Belgium                       465.             435060.            936
    ## 12 Germany                       428.             402826.            941
    ## 13 Czech Republic                421.             390459.            928
    ## 14 United Kingdom                404.             378870.            937
    ## 15 Italy                         391.             369630.            946
    ## 16 Slovakia                      366.             337595.            922
    ## 17 Serbia                        347.             319822.            921
    ## 18 United States                 325.             304993.            937
    ## 19 Norway                        312.             291827.            935
    ## 20 Spain                         307.             288210.            938

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2157    11935
    ##  2 Sudan                 7.84       4961    63280
    ##  3 Syria                 5.52       3163    57272
    ##  4 Peru                  5.23     216406  4137314
    ##  5 Somalia               5.00       1361    27207
    ##  6 Egypt                 4.81      24797   515371
    ##  7 Mexico                4.66     329949  7076005
    ##  8 Afghanistan           3.93       7797   198455
    ##  9 Ecuador               3.58      35887  1002057
    ## 10 Niger                 3.33        313     9405
    ## 11 Myanmar               3.13      19455   621402
    ## 12 Malawi                3.05       2680    87981
    ## 13 Bulgaria              3.00      37698  1255139
    ## 14 Paraguay              2.73      19564   716009
    ## 15 Tunisia               2.55      29246  1145345
    ## 16 Chad                  2.55        193     7571
    ## 17 South Africa          2.54     102169  4017552
    ## 18 Haiti                 2.54        857    33702
    ## 19 Algeria               2.54       6879   270643
    ## 20 Sri Lanka             2.50      16755   670709

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7236.     216406   29.9 
    ##  2 Bulgaria               5273.      37698    7.15
    ##  3 Hungary                4754.      47457    9.98
    ##  4 Czech Republic         3915.      41012   10.5 
    ##  5 Slovakia               3749.      20450    5.46
    ##  6 Chile                  3641.      60974   16.7 
    ##  7 Brazil                 3409.     685604  201.  
    ##  8 United States          3366.    1044127  310.  
    ##  9 Argentina              3141.     129855   41.3 
    ## 10 Belgium                3138.      32647   10.4 
    ## 11 Paraguay               3068.      19564    6.38
    ## 12 Poland                 3051.     117456   38.5 
    ## 13 Romania                3050.      66978   22.0 
    ## 14 United Kingdom         3046.     189919   62.3 
    ## 15 Greece                 3001.      33010   11   
    ## 16 Colombia               2966.     141746   47.8 
    ## 17 Mexico                 2934.     329949  112.  
    ## 18 Italy                  2931.     176880   60.3 
    ## 19 Tunisia                2762.      29246   10.6 
    ## 20 Russia                 2749.     386842  141.

EOL
