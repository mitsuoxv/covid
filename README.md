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

Updated: 2021-02-21

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
    ##  1 United States           77827. 27628834            355
    ##  2 India                   32004. 10977387            343
    ##  3 Brazil                  29074. 10030626            345
    ##  4 Russia                  12247.  4151984            339
    ##  5 United Kingdom          11568.  4095273            354
    ##  6 France                   9829.  3499305            356
    ##  7 Spain                    8768.  3121687            356
    ##  8 Turkey                   7740.  2624019            339
    ##  9 Italy                    7660.  2780882            363
    ## 10 Germany                  6663.  2378883            357
    ## 11 Colombia                 6526.  2212525            339
    ## 12 Argentina                6020.  2046795            340
    ## 13 Mexico                   5966.  2022662            339
    ## 14 Poland                   4757.  1631727            343
    ## 15 South Africa             4413.  1500677            340
    ## 16 Iran                     4316.  1558159            361
    ## 17 Ukraine                  3903.  1299967            333
    ## 18 Peru                     3711.  1261804            340
    ## 19 Indonesia                3683.  1263299            343
    ## 20 Czech Republic           3322.  1146321            345

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                317.             109424.            345
    ##  2 Israel                        289.              99407.            344
    ##  3 United States                 251.              89058.            355
    ##  4 Portugal                      216.              74444.            344
    ##  5 Belgium                       204.              72069.            353
    ##  6 Switzerland                   203.              71911.            354
    ##  7 Sweden                        189.              66050.            350
    ##  8 Spain                         189.              67124.            356
    ##  9 United Kingdom                186.              65684.            354
    ## 10 Netherlands                   180.              62926.            350
    ## 11 Serbia                        174.              58773.            338
    ## 12 Jordan                        167.              55815.            335
    ## 13 Slovakia                      157.              53246.            338
    ## 14 Austria                       153.              53370.            349
    ## 15 France                        152.              54028.            356
    ## 16 Argentina                     146.              49507.            340
    ## 17 Brazil                        145.              49878.            345
    ## 18 Chile                         139.              47290.            341
    ## 19 Colombia                      137.              46297.            339
    ## 20 Italy                         127.              46087.            363

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               28.6         619     2161
    ##  2 Mexico               8.81     178108  2022662
    ##  3 Syria                6.59        994    15094
    ##  4 Sudan                6.19       1864    30128
    ##  5 Egypt                5.79      10250   176943
    ##  6 Ecuador              5.70      15474   271276
    ##  7 China                4.76       4842   101646
    ##  8 Bolivia              4.74      11353   239524
    ##  9 Afghanistan          4.37       2430    55580
    ## 10 Mali                 4.16        344     8260
    ## 11 Bulgaria             4.16       9821   235891
    ## 12 Tanzania             4.13         21      509
    ## 13 Zimbabwe             4.00       1430    35710
    ## 14 Iran                 3.81      59341  1558159
    ## 15 Guatemala            3.65       6220   170275
    ## 16 Niger                3.60        170     4725
    ## 17 Hungary              3.56      14252   400111
    ## 18 Peru                 3.53      44489  1261804
    ## 19 Greece               3.52       6249   177494
    ## 20 Chad                 3.50        132     3776

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                2101.      21859   10.4 
    ##  2 United Kingdom         1923.     119920   62.3 
    ##  3 Czech Republic         1823.      19097   10.5 
    ##  4 Mexico                 1584.     178108  112.  
    ##  5 Italy                  1578.      95235   60.3 
    ##  6 United States          1577.     489351  310.  
    ##  7 Peru                   1488.      44489   29.9 
    ##  8 Portugal               1482.      15821   10.7 
    ##  9 Spain                  1434.      66704   46.5 
    ## 10 Hungary                1428.      14252    9.98
    ## 11 Bulgaria               1374.       9821    7.15
    ## 12 Sweden                 1324.      12649    9.56
    ## 13 France                 1290.      83524   64.8 
    ## 14 Argentina              1230.      50857   41.3 
    ## 15 Colombia               1221.      58334   47.8 
    ## 16 Brazil                 1211.     243457  201.  
    ## 17 Switzerland            1207.       9148    7.58
    ## 18 Chile                  1188.      19897   16.7 
    ## 19 Slovakia               1178.       6424    5.46
    ## 20 Bolivia                1141.      11353    9.95

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
