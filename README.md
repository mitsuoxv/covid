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

Updated: 2021-02-22

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
    ##  1 United States           77814. 27702074            356
    ##  2 India                   31952. 10991651            344
    ##  3 Brazil                  29137. 10081676            346
    ##  4 Russia                  12249.  4164726            340
    ##  5 United Kingdom          11565.  4105679            355
    ##  6 France                   9863.  3521249            357
    ##  7 Spain                    8744.  3121687            357
    ##  8 Turkey                   7740.  2631876            340
    ##  9 Italy                    7680.  2795796            364
    ## 10 Germany                  6666.  2386559            358
    ## 11 Colombia                 6520.  2217001            340
    ## 12 Argentina                6025.  2054681            341
    ## 13 Mexico                   5972.  2030491            340
    ## 14 Poland                   4764.  1638767            344
    ## 15 South Africa             4405.  1502367            341
    ## 16 Iran                     4326.  1566081            362
    ## 17 Ukraine                  3905.  1304456            334
    ## 18 Peru                     3723.  1269523            341
    ## 19 Indonesia                3695.  1271353            344
    ## 20 Czech Republic           3332.  1153159            346

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                318.             110076.            346
    ##  2 Israel                        288.              99407.            345
    ##  3 United States                 251.              89294.            356
    ##  4 Portugal                      216.              74592.            345
    ##  5 Belgium                       204.              72323.            354
    ##  6 Switzerland                   203.              71911.            355
    ##  7 Sweden                        188.              66050.            351
    ##  8 Spain                         188.              67124.            357
    ##  9 United Kingdom                185.              65851.            355
    ## 10 Netherlands                   180.              63200.            351
    ## 11 Serbia                        174.              59106.            339
    ## 12 Jordan                        167.              56158.            336
    ## 13 Slovakia                      158.              53555.            339
    ## 14 Austria                       153.              53611.            350
    ## 15 France                        152.              54367.            357
    ## 16 Argentina                     146.              49698.            341
    ## 17 Brazil                        145.              50132.            346
    ## 18 Chile                         139.              47523.            342
    ## 19 Colombia                      136.              46390.            340
    ## 20 Italy                         127.              46334.            364

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               28.6         619     2161
    ##  2 Mexico               8.81     178965  2030491
    ##  3 Syria                6.58        996    15143
    ##  4 Sudan                6.19       1864    30128
    ##  5 Egypt                5.80      10298   177543
    ##  6 Ecuador              5.68      15513   273097
    ##  7 China                4.76       4842   101669
    ##  8 Bolivia              4.73      11390   240676
    ##  9 Afghanistan          4.37       2432    55604
    ## 10 Mali                 4.18        347     8292
    ## 11 Bulgaria             4.16       9839   236439
    ## 12 Tanzania             4.13         21      509
    ## 13 Zimbabwe             4.00       1432    35768
    ## 14 Iran                 3.79      59409  1566081
    ## 15 Guatemala            3.66       6249   170931
    ## 16 Niger                3.59        170     4733
    ## 17 Hungary              3.55      14299   403023
    ## 18 Peru                 3.52      44690  1269523
    ## 19 Chad                 3.51        133     3794
    ## 20 Greece               3.51       6272   178918

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                2104.      21887   10.4 
    ##  2 United Kingdom         1931.     120365   62.3 
    ##  3 Czech Republic         1834.      19214   10.5 
    ##  4 Mexico                 1591.     178965  112.  
    ##  5 United States          1586.     491894  310.  
    ##  6 Italy                  1582.      95486   60.3 
    ##  7 Peru                   1494.      44690   29.9 
    ##  8 Portugal               1489.      15897   10.7 
    ##  9 Spain                  1434.      66704   46.5 
    ## 10 Hungary                1432.      14299    9.98
    ## 11 Bulgaria               1376.       9839    7.15
    ## 12 Sweden                 1324.      12649    9.56
    ## 13 France                 1292.      83707   64.8 
    ## 14 Argentina              1234.      51000   41.3 
    ## 15 Colombia               1224.      58511   47.8 
    ## 16 Brazil                 1217.     244765  201.  
    ## 17 Switzerland            1207.       9148    7.58
    ## 18 Chile                  1193.      19974   16.7 
    ## 19 Slovakia               1192.       6505    5.46
    ## 20 Bolivia                1145.      11390    9.95

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
