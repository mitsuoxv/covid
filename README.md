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

Updated: 2022-11-10

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
    ##  1 United States           98544. 96474411            979
    ##  2 India                   46044. 44662952            970
    ##  3 France                  36587. 35964696            983
    ##  4 Germany                 36480. 35932654            985
    ##  5 Brazil                  35970. 34855492            969
    ##  6 South Korea             26165. 25981655            993
    ##  7 United Kingdom          24393. 23930041            981
    ##  8 Italy                   23881. 23642011            990
    ##  9 Japan                   22974. 22790250            992
    ## 10 Russia                  22234. 21477926            966
    ## 11 Turkey                  17515. 16919638            966
    ## 12 Spain                   13778. 13529643            982
    ## 13 Vietnam                 11961. 11506656            962
    ## 14 Australia               10652. 10364859            973
    ## 15 Argentina               10000.  9720232            972
    ## 16 China                    8972.  9205758           1026
    ## 17 Netherlands              8726.  8525378            977
    ## 18 Iran                     7650.  7558593            988
    ## 19 Mexico                   7318.  7113429            972
    ## 20 Indonesia                6740.  6537907            970

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Austria                       684.             666992.            975
    ##  2 Israel                        656.             638099.            973
    ##  3 Denmark                       625.             608975.            975
    ##  4 Switzerland                   572.             561418.            981
    ##  5 France                        565.             555282.            983
    ##  6 South Korea                   540.             536560.            993
    ##  7 Portugal                      533.             517487.            970
    ##  8 Netherlands                   524.             512189.            977
    ##  9 Australia                     495.             481733.            973
    ## 10 Greece                        491.             477299.            972
    ## 11 Belgium                       453.             444076.            980
    ## 12 Germany                       446.             439262.            985
    ## 13 Czech Republic                409.             397425.            972
    ## 14 Italy                         396.             391811.            990
    ## 15 United Kingdom                391.             383811.            981
    ## 16 Slovakia                      352.             339847.            966
    ## 17 Serbia                        340.             328153.            965
    ## 18 United States                 318.             310974.            979
    ## 19 Norway                        299.             292628.            979
    ## 20 Chile                         296.             286821.            968

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2159    11945
    ##  2 Sudan                 7.83       4978    63558
    ##  3 Syria                 5.51       3163    57372
    ##  4 Peru                  5.22     217098  4161769
    ##  5 Somalia               5.00       1361    27243
    ##  6 Egypt                 4.81      24798   515412
    ##  7 Mexico                4.64     330406  7113429
    ##  8 Afghanistan           3.84       7829   203968
    ##  9 Ecuador               3.56      35934  1009044
    ## 10 Niger                 3.33        314     9430
    ## 11 Myanmar               3.08      19486   632461
    ## 12 Malawi                3.05       2683    88099
    ## 13 Bulgaria              2.96      37936  1282284
    ## 14 Paraguay              2.73      19606   717980
    ## 15 Tunisia               2.55      29263  1146702
    ## 16 Haiti                 2.54        860    33828
    ## 17 Chad                  2.54        194     7631
    ## 18 Algeria               2.54       6881   270847
    ## 19 South Africa          2.54     102363  4030660
    ## 20 Sri Lanka             2.50      16783   671354

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7259.     217098   29.9 
    ##  2 Bulgaria               5307.      37936    7.15
    ##  3 Hungary                4820.      48111    9.98
    ##  4 Czech Republic         3979.      41682   10.5 
    ##  5 Slovakia               3786.      20651    5.46
    ##  6 Chile                  3694.      61868   16.7 
    ##  7 United States          3426.    1062721  310.  
    ##  8 Brazil                 3423.     688395  201.  
    ##  9 Belgium                3168.      32959   10.4 
    ## 10 Argentina              3144.     130003   41.3 
    ## 11 United Kingdom         3123.     194704   62.3 
    ## 12 Greece                 3081.      33888   11   
    ## 13 Paraguay               3075.      19606    6.38
    ## 14 Poland                 3070      118195   38.5 
    ## 15 Romania                3061.      67217   22.0 
    ## 16 Italy                  2974.     179436   60.3 
    ## 17 Colombia               2968.     141850   47.8 
    ## 18 Mexico                 2938.     330406  112.  
    ## 19 Russia                 2777.     390774  141.  
    ## 20 Tunisia                2764.      29263   10.6

EOL
