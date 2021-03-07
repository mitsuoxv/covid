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

Updated: 2021-03-08

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
    ##  1 United States           77303. 28602211            370
    ##  2 India                   31315. 11210799            358
    ##  3 Brazil                  30192. 10869227            360
    ##  4 Russia                  12181.  4312181            354
    ##  5 United Kingdom          11418.  4213347            369
    ##  6 France                  10282.  3814830            371
    ##  7 Spain                    8493.  3142358            370
    ##  8 Italy                    8060.  3046762            378
    ##  9 Turkey                   7822.  2769230            354
    ## 10 Germany                  6721.  2500182            372
    ## 11 Colombia                 6411.  2269582            354
    ## 12 Argentina                6047.  2146714            355
    ## 13 Mexico                   5986.  2119305            354
    ## 14 Poland                   5013.  1794914            358
    ## 15 Iran                     4472.  1681682            376
    ## 16 South Africa             4282.  1520206            355
    ## 17 Ukraine                  4026.  1401228            348
    ## 18 Indonesia                3837.  1373836            358
    ## 19 Peru                     3826.  1358294            355
    ## 20 Czech Republic           3670.  1321331            360

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                350.             126129.            360
    ##  2 Israel                        298.             106964.            359
    ##  3 United States                 249.              92196.            370
    ##  4 Portugal                      211.              75722.            359
    ##  5 Belgium                       205.              75537.            368
    ##  6 Switzerland                   200.              73820.            369
    ##  7 Sweden                        196.              71679.            365
    ##  8 Jordan                        188.              65773.            350
    ##  9 Serbia                        186.              65678.            353
    ## 10 Netherlands                   184.              67020.            365
    ## 11 United Kingdom                183.              67577.            369
    ## 12 Spain                         183.              67569.            370
    ## 13 Slovakia                      168.              59283.            353
    ## 14 France                        159.              58900.            371
    ## 15 Austria                       156.              56879.            364
    ## 16 Brazil                        150.              54048.            360
    ## 17 Argentina                     146.              51924.            355
    ## 18 Chile                         143.              50786.            356
    ## 19 Colombia                      134.              47491.            354
    ## 20 Italy                         134.              50493.            378

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               26.6         651     2448
    ##  2 Mexico               8.95     189578  2119305
    ##  3 Syria                6.64       1058    15925
    ##  4 Sudan                6.20       1895    30540
    ##  5 Egypt                5.89      10954   185922
    ##  6 Ecuador              5.47      16020   292943
    ##  7 China                4.75       4848   102064
    ##  8 Bolivia              4.65      11789   253297
    ##  9 Afghanistan          4.39       2449    55847
    ## 10 Mali                 4.18        358     8560
    ## 11 Tanzania             4.13         21      509
    ## 12 Zimbabwe             4.10       1485    36260
    ## 13 Bulgaria             4.08      10593   259811
    ## 14 Somalia              3.66        294     8041
    ## 15 Niger                3.63        172     4740
    ## 16 Guatemala            3.63       6467   178337
    ## 17 Iran                 3.60      60594  1681682
    ## 18 Peru                 3.50      47491  1358294
    ## 19 Tunisia              3.45       8167   237028
    ## 20 Hungary              3.41      15873   466017

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                2138.      22240   10.4 
    ##  2 Czech Republic         2073.      21717   10.5 
    ##  3 United Kingdom         1996.     124419   62.3 
    ##  4 Mexico                 1686.     189578  112.  
    ##  5 United States          1673.     519075  310.  
    ##  6 Italy                  1650.      99578   60.3 
    ##  7 Hungary                1590.      15873    9.98
    ##  8 Peru                   1588.      47491   29.9 
    ##  9 Portugal               1544.      16486   10.7 
    ## 10 Spain                  1516.      70501   46.5 
    ## 11 Bulgaria               1482.      10593    7.15
    ## 12 Slovakia               1436.       7836    5.46
    ## 13 Sweden                 1361.      13003    9.56
    ## 14 France                 1358.      87972   64.8 
    ## 15 Brazil                 1307.     262770  201.  
    ## 16 Argentina              1279.      52870   41.3 
    ## 17 Colombia               1262.      60300   47.8 
    ## 18 Chile                  1254.      21008   16.7 
    ## 19 Switzerland            1224.       9278    7.58
    ## 20 Bolivia                1185.      11789    9.95

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
