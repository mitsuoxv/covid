WHO, Covid-19 situation report
================
Mitsuo Shiota
2020/3/7

-   [Summary](#summary)
-   [Read data from WHO](#read-data-from-who)
-   [Newly confirmed cases by region](#newly-confirmed-cases-by-region)
-   [Fastest spreading areas](#fastest-spreading-areas)
-   [Highest fatality rate areas](#highest-fatality-rate-areas)
-   [Highest deaths per population
    areas](#highest-deaths-per-population-areas)
-   [Save data](#save-data)

Updated: 2021-03-21

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
“Southern Europe”. “West Europe” is basically Europe other than “Eastern
Europe”.

![](README_files/figure-gfm/chart-1.png)<!-- -->

## Fastest spreading areas

Among areas with more than 5 million population, highest
“speed\_since\_100”, which is average number of newly confirmed cases
per day since cumulative cases became more than 100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_since_100 cum_conf days_since_100
    ##    <chr>                    <dbl>    <dbl>          <int>
    ##  1 United States           76901. 29376388            382
    ##  2 Brazil                  31669. 11780820            372
    ##  3 India                   31146. 11555284            371
    ##  4 Russia                  12118.  4447570            367
    ##  5 United Kingdom          11219.  4285688            382
    ##  6 France                  10706.  4111105            384
    ##  7 Italy                    8522.  3332418            391
    ##  8 Spain                    8371.  3206116            383
    ##  9 Turkey                   8097.  2971633            367
    ## 10 Germany                  6872.  2645783            385
    ## 11 Colombia                 6319.  2319293            367
    ## 12 Argentina                6084.  2226753            366
    ## 13 Mexico                   5946.  2182188            367
    ## 14 Poland                   5489.  2036700            371
    ## 15 Iran                     4592.  1786265            389
    ## 16 Ukraine                  4252.  1535218            361
    ## 17 South Africa             4183.  1535423            367
    ## 18 Peru                     3922.  1443521            368
    ## 19 Indonesia                3919.  1450132            370
    ## 20 Czech Republic           3912.  1459406            373

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                373.             139309.            373
    ##  2 Israel                        301.             112145.            372
    ##  3 United States                 248.              94691.            382
    ##  4 Jordan                        224.              81388.            363
    ##  5 Belgium                       209.              79587.            381
    ##  6 Sweden                        206.              77886.            378
    ##  7 Portugal                      206.              76491.            372
    ##  8 Serbia                        202.              73822.            366
    ##  9 Switzerland                   200.              76231.            382
    ## 10 Netherlands                   189.              71312.            378
    ## 11 Spain                         180.              68940.            383
    ## 12 United Kingdom                180.              68738.            382
    ## 13 Slovakia                      174.              63784.            366
    ## 14 France                        165.              63474.            384
    ## 15 Austria                       163.              61510.            377
    ## 16 Brazil                        157.              58581.            372
    ## 17 Hungary                       154.              56198.            365
    ## 18 Chile                         149.              54821.            369
    ## 19 Argentina                     147.              53860.            366
    ## 20 Poland                        143.              52901.            371

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               22.8         734     3221
    ##  2 Mexico               9.01     196606  2182188
    ##  3 Syria                6.68       1141    17077
    ##  4 Sudan                6.32       1959    30989
    ##  5 Egypt                5.93      11512   194127
    ##  6 Ecuador              5.31      16333   307429
    ##  7 China                4.73       4849   102502
    ##  8 Bolivia              4.57      12028   262941
    ##  9 Afghanistan          4.39       2462    56093
    ## 10 Somalia              4.17        414     9925
    ## 11 Tanzania             4.13         21      509
    ## 12 Zimbabwe             4.12       1510    36652
    ## 13 Mali                 4.00        363     9066
    ## 14 Bulgaria             3.98      11932   299939
    ## 15 Niger                3.77        185     4911
    ## 16 Chad                 3.57        157     4395
    ## 17 Guatemala            3.57       6663   186740
    ## 18 Tunisia              3.48       8506   244776
    ## 19 Iran                 3.45      61649  1786265
    ## 20 Peru                 3.44      49706  1443521

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Czech Republic         2342.      24530   10.5 
    ##  2 Belgium                2177.      22650   10.4 
    ##  3 United Kingdom         2021.     126026   62.3 
    ##  4 Hungary                1810.      18068    9.98
    ##  5 Mexico                 1748.     196606  112.  
    ##  6 Italy                  1728.     104241   60.3 
    ##  7 United States          1723.     534484  310.  
    ##  8 Bulgaria               1669.      11932    7.15
    ##  9 Peru                   1662.      49706   29.9 
    ## 10 Slovakia               1646.       8978    5.46
    ## 11 Portugal               1569.      16754   10.7 
    ## 12 Spain                  1565.      72793   46.5 
    ## 13 Brazil                 1430.     287499  201.  
    ## 14 France                 1408.      91162   64.8 
    ## 15 Sweden                 1388.      13262    9.56
    ## 16 Chile                  1319.      22087   16.7 
    ## 17 Argentina              1315.      54386   41.3 
    ## 18 Colombia               1290.      61636   47.8 
    ## 19 Poland                 1277.      49159   38.5 
    ## 20 Switzerland            1247.       9455    7.58

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
