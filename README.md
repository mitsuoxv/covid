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

Updated: 2022-11-12

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
    ##  1 United States           98343. 96474411            981
    ##  2 India                   45951. 44664810            972
    ##  3 France                  36512. 35964696            985
    ##  4 Germany                 36406. 35932654            987
    ##  5 Brazil                  35919. 34877559            971
    ##  6 South Korea             26222. 26091539            995
    ##  7 United Kingdom          24344. 23930041            983
    ##  8 Italy                   23833. 23642011            992
    ##  9 Japan                   23095. 22956237            994
    ## 10 Russia                  22188. 21477926            968
    ## 11 Turkey                  17479. 16919638            968
    ## 12 Spain                   13750. 13529643            984
    ## 13 Vietnam                 11937. 11507540            964
    ## 14 Australia               10669. 10402258            975
    ## 15 Argentina                9980.  9720232            974
    ## 16 China                    9006.  9258687           1028
    ## 17 Netherlands              8708.  8525378            979
    ## 18 Iran                     7635.  7558690            990
    ## 19 Mexico                   7305.  7115360            974
    ## 20 Indonesia                6733.  6544201            972

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Austria                       683.             666992.            977
    ##  2 Israel                        654.             638099.            975
    ##  3 Denmark                       623.             608975.            977
    ##  4 Switzerland                   571.             561418.            983
    ##  5 France                        564.             555282.            985
    ##  6 South Korea                   542.             538829.            995
    ##  7 Portugal                      532.             517487.            972
    ##  8 Netherlands                   523.             512189.            979
    ##  9 Australia                     496.             483472.            975
    ## 10 Greece                        490.             477299.            974
    ## 11 Belgium                       452.             444076.            982
    ## 12 Germany                       445.             439262.            987
    ## 13 Czech Republic                408.             397425.            974
    ## 14 Italy                         395.             391811.            992
    ## 15 United Kingdom                390.             383811.            983
    ## 16 Slovakia                      351.             339847.            968
    ## 17 Serbia                        339.             328153.            967
    ## 18 United States                 317.             310974.            981
    ## 19 Norway                        298.             292628.            981
    ## 20 Chile                         297.             287762.            970

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2159    11945
    ##  2 Sudan                 7.83       4980    63561
    ##  3 Syria                 5.51       3163    57374
    ##  4 Peru                  5.21     217129  4165187
    ##  5 Somalia               5.00       1361    27243
    ##  6 Egypt                 4.81      24798   515412
    ##  7 Mexico                4.64     330418  7115360
    ##  8 Afghanistan           3.83       7829   204173
    ##  9 Ecuador               3.56      35935  1009388
    ## 10 Niger                 3.33        314     9430
    ## 11 Myanmar               3.08      19486   632522
    ## 12 Malawi                3.05       2685    88009
    ## 13 Bulgaria              2.96      37936  1282284
    ## 14 Paraguay              2.73      19606   717980
    ## 15 Tunisia               2.55      29263  1146702
    ## 16 Haiti                 2.54        860    33828
    ## 17 Chad                  2.54        194     7631
    ## 18 Algeria               2.54       6881   270847
    ## 19 South Africa          2.54     102363  4031096
    ## 20 Sri Lanka             2.50      16783   671369

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7260.     217129   29.9 
    ##  2 Bulgaria               5307.      37936    7.15
    ##  3 Hungary                4820.      48111    9.98
    ##  4 Czech Republic         3979.      41682   10.5 
    ##  5 Slovakia               3786.      20651    5.46
    ##  6 Chile                  3698.      61923   16.7 
    ##  7 United States          3426.    1062721  310.  
    ##  8 Brazil                 3424.     688567  201.  
    ##  9 Belgium                3168.      32959   10.4 
    ## 10 Argentina              3144.     130003   41.3 
    ## 11 United Kingdom         3123.     194704   62.3 
    ## 12 Greece                 3081.      33888   11   
    ## 13 Paraguay               3075.      19606    6.38
    ## 14 Poland                 3070      118195   38.5 
    ## 15 Romania                3061.      67217   22.0 
    ## 16 Italy                  2974.     179436   60.3 
    ## 17 Colombia               2968.     141850   47.8 
    ## 18 Mexico                 2938.     330418  112.  
    ## 19 Russia                 2777.     390774  141.  
    ## 20 Tunisia                2764.      29263   10.6

EOL
