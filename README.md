WHO, Covid-19 situation report
================
Mitsuo Shiota
2020/3/7

  - [Summary](#summary)
  - [Read data from WHO](#read-data-from-who)
  - [Newly confirmed cases by region](#newly-confirmed-cases-by-region)
  - [Fastest spreading areas](#fastest-spreading-areas)
  - [Highest fatality rate areas](#highest-fatality-rate-areas)
  - [Highest deaths per population
    areas](#highest-deaths-per-population-areas)
  - [Save data](#save-data)

Updated: 2021-01-21

I added “USA, Covid-19 situation by state” in [another page](USA.md).

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
“Southern Europe”. “West Europe” is basically Europe other than
“Eastern Europe”.

![](README_files/figure-gfm/chart-1.png)<!-- -->

## Fastest spreading areas

Among areas with more than 5 million population, highest
“speed\_since\_100”, which is average number of newly confirmed cases
per day since cumulative cases became more than 100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_since_100 cum_conf days_since_100
    ##    <chr>                    <dbl>    <dbl>          <int>
    ##  1 United States           73717. 23884299            324
    ##  2 India                   33960. 10595660            312
    ##  3 Brazil                  27107.  8511770            314
    ##  4 Russia                  11798.  3633952            308
    ##  5 United Kingdom          10733.  3466853            323
    ##  6 France                   8892.  2890012            325
    ##  7 Spain                    7294.  2370742            325
    ##  8 Italy                    7230.  2400598            332
    ##  9 Germany                  6343.  2068002            326
    ## 10 Colombia                 6244.  1923132            308
    ## 11 Argentina                5849.  1807428            309
    ## 12 Mexico                   5355.  1649502            308
    ## 13 Turkey                   5147.  1585443            308
    ## 14 Poland                   4649.  1450747            312
    ## 15 South Africa             4390.  1356716            309
    ## 16 Iran                     4067.  1342134            330
    ## 17 Ukraine                  3881.  1172038            302
    ## 18 Peru                     3458.  1068802            309
    ## 19 Indonesia                2972.   927380            312
    ## 20 Czech Republic           2895.   909131            314

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                276.              86782.            314
    ##  2 Israel                        239.              74853.            313
    ##  3 United States                 238.              76988.            324
    ##  4 Switzerland                   203.              65918.            324
    ##  5 Belgium                       203.              65486.            322
    ##  6 Sweden                        175.              55805.            319
    ##  7 Netherlands                   174.              55367.            319
    ##  8 United Kingdom                172.              55604.            323
    ##  9 Portugal                      170.              53106.            313
    ## 10 Serbia                        167.              51165.            307
    ## 11 Jordan                        162.              49387.            304
    ## 12 Spain                         157.              50977.            325
    ## 13 Austria                       151.              47952.            318
    ## 14 Argentina                     141.              43718.            309
    ## 15 France                        137.              44621.            325
    ## 16 Slovakia                      136.              41939.            308
    ## 17 Brazil                        135.              42325.            314
    ## 18 Colombia                      131.              40241.            308
    ## 19 Chile                         130.              40435.            310
    ## 20 Poland                        121.              37682.            312

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               28.9         613     2119
    ##  2 Mexico               8.56     141248  1649502
    ##  3 Syria                6.43        850    13224
    ##  4 Ecuador              6.18      14382   232568
    ##  5 Sudan                6.03       1657    27494
    ##  6 Egypt                5.50       8696   158174
    ##  7 Bolivia              5.13       9680   188733
    ##  8 China                4.85       4807    99191
    ##  9 Afghanistan          4.34       2354    54278
    ## 10 Iran                 4.24      56973  1342134
    ## 11 Tanzania             4.13         21      509
    ## 12 Bulgaria             4.05       8614   212927
    ## 13 Mali                 4.02        317     7880
    ## 14 Chad                 3.83        114     2977
    ## 15 Greece               3.69       5518   149462
    ## 16 Peru                 3.64      38931  1068802
    ## 17 Guatemala            3.54       5313   150277
    ## 18 Italy                3.46      83157  2400598
    ## 19 Niger                3.46        146     4225
    ## 20 Nicaragua            3.39        168     4953

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                1976.      20554   10.4 
    ##  2 United Kingdom         1467.      91470   62.3 
    ##  3 Czech Republic         1415.      14820   10.5 
    ##  4 Italy                  1378.      83157   60.3 
    ##  5 Peru                   1302.      38931   29.9 
    ##  6 United States          1277.     396155  310.  
    ##  7 Mexico                 1256.     141248  112.  
    ##  8 Bulgaria               1205.       8614    7.15
    ##  9 Spain                  1165.      54173   46.5 
    ## 10 Hungary                1164.      11615    9.98
    ## 11 Argentina              1109.      45832   41.3 
    ## 12 Sweden                 1108.      10591    9.56
    ## 13 France                 1095.      70951   64.8 
    ## 14 Switzerland            1071.       8122    7.58
    ## 15 Chile                  1049.      17573   16.7 
    ## 16 Brazil                 1046.     210299  201.  
    ## 17 Colombia               1025.      49004   47.8 
    ## 18 Bolivia                 973.       9680    9.95
    ## 19 Ecuador                 972.      14382   14.8 
    ## 20 Poland                  887.      34141   38.5

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
