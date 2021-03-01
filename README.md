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

Updated: 2021-03-02

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
    ##  1 United States           77595. 28244591            364
    ##  2 India                   31569. 11112241            352
    ##  3 Brazil                  29709. 10517232            354
    ##  4 Russia                  12234.  4257650            348
    ##  5 United Kingdom          11505.  4176558            363
    ##  6 France                  10110.  3690421            365
    ##  7 Spain                    8736.  3180212            364
    ##  8 Italy                    7863.  2925265            372
    ##  9 Turkey                   7763.  2701588            348
    ## 10 Germany                  6686.  2447068            366
    ## 11 Colombia                 6460.  2248135            348
    ## 12 Argentina                6038.  2107365            349
    ## 13 Mexico                   5989.  2084128            348
    ## 14 Poland                   4863.  1711772            352
    ## 15 Iran                     4408.  1631169            370
    ## 16 South Africa             4336.  1513393            349
    ## 17 Ukraine                  3953.  1352134            342
    ## 18 Peru                     3793.  1323863            349
    ## 19 Indonesia                3791.  1334634            352
    ## 20 Czech Republic           3503.  1240051            354

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                334.             118371.            354
    ##  2 Israel                        295.             103997.            353
    ##  3 United States                 250.              91043.            364
    ##  4 Portugal                      213.              75362.            353
    ##  5 Belgium                       205.              74162.            362
    ##  6 Switzerland                   201.              72852.            363
    ##  7 Sweden                        192.              68786.            359
    ##  8 Spain                         188.              68383.            364
    ##  9 United Kingdom                185.              66987.            363
    ## 10 Netherlands                   182.              65406.            359
    ## 11 Serbia                        180.              62528.            347
    ## 12 Jordan                        177.              61040.            344
    ## 13 Slovakia                      163.              56477.            347
    ## 14 France                        156.              56979.            365
    ## 15 Austria                       155.              55590.            358
    ## 16 Brazil                        148.              52298.            354
    ## 17 Argentina                     146.              50972.            349
    ## 18 Chile                         141.              49301.            350
    ## 19 Colombia                      135.              47042.            348
    ## 20 Italy                         130.              48479.            372

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               27.7         635     2289
    ##  2 Mexico               8.89     185257  2084128
    ##  3 Syria                6.59       1027    15588
    ##  4 Sudan                6.19       1880    30364
    ##  5 Egypt                5.86      10688   182424
    ##  6 Ecuador              5.53      15811   286155
    ##  7 China                4.75       4844   101920
    ##  8 Bolivia              4.68      11628   248547
    ##  9 Afghanistan          4.39       2444    55733
    ## 10 Mali                 4.21        353     8376
    ## 11 Tanzania             4.13         21      509
    ## 12 Bulgaria             4.13      10191   247038
    ## 13 Zimbabwe             4.05       1463    36089
    ## 14 Iran                 3.68      60073  1631169
    ## 15 Guatemala            3.66       6393   174542
    ## 16 Niger                3.63        172     4740
    ## 17 Chad                 3.52        140     3973
    ## 18 Peru                 3.50      46299  1323863
    ## 19 Hungary              3.48      15058   432925
    ## 20 Tunisia              3.43       8001   233277

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                2122.      22077   10.4 
    ##  2 United Kingdom         1970.     122849   62.3 
    ##  3 Czech Republic         1954.      20469   10.5 
    ##  4 Mexico                 1647.     185257  112.  
    ##  5 United States          1639.     508584  310.  
    ##  6 Italy                  1619.      97699   60.3 
    ##  7 Peru                   1548.      46299   29.9 
    ##  8 Portugal               1528.      16317   10.7 
    ##  9 Hungary                1509.      15058    9.98
    ## 10 Spain                  1480.      68813   46.5 
    ## 11 Bulgaria               1426.      10191    7.15
    ## 12 Sweden                 1342.      12826    9.56
    ## 13 France                 1328.      85986   64.8 
    ## 14 Slovakia               1318.       7189    5.46
    ## 15 Brazil                 1264.     254221  201.  
    ## 16 Argentina              1257.      51965   41.3 
    ## 17 Colombia               1248.      59660   47.8 
    ## 18 Chile                  1228.      20572   16.7 
    ## 19 Switzerland            1216.       9219    7.58
    ## 20 Bolivia                1169.      11628    9.95

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
