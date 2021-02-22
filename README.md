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

Updated: 2021-02-23

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
    ##  1 United States           77795. 27773047            357
    ##  2 India                   31901. 11005850            345
    ##  3 Brazil                  29219. 10139148            347
    ##  4 Russia                  12250.  4177330            341
    ##  5 United Kingdom          11560.  4115513            356
    ##  6 France                   9897.  3543295            358
    ##  7 Spain                    8719.  3121687            358
    ##  8 Turkey                   7737.  2638422            341
    ##  9 Italy                    7696.  2809246            365
    ## 10 Germany                  6660.  2390928            359
    ## 11 Colombia                 6516.  2222018            341
    ## 12 Argentina                6025.  2060625            342
    ## 13 Mexico                   5977.  2038276            341
    ## 14 Poland                   4761.  1642658            345
    ## 15 South Africa             4397.  1503796            342
    ## 16 Iran                     4336.  1574012            363
    ## 17 Ukraine                  3903.  1307662            335
    ## 18 Peru                     3730.  1275899            342
    ## 19 Indonesia                3706.  1278653            345
    ## 20 Czech Republic           3334.  1157180            347

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                318.             110460.            347
    ##  2 Israel                        292.             101000.            346
    ##  3 United States                 251.              89523.            357
    ##  4 Portugal                      216.              74703.            346
    ##  5 Belgium                       204.              72525.            355
    ##  6 Switzerland                   202.              71911.            356
    ##  7 Sweden                        188.              66050.            352
    ##  8 Spain                         187.              67124.            358
    ##  9 United Kingdom                185.              66008.            356
    ## 10 Netherlands                   180.              63481.            352
    ## 11 Serbia                        175.              59448.            340
    ## 12 Jordan                        168.              56770.            337
    ## 13 Slovakia                      158.              53674.            340
    ## 14 Austria                       153.              53838.            351
    ## 15 France                        153.              54707.            358
    ## 16 Argentina                     146.              49842.            342
    ## 17 Brazil                        145.              50418.            347
    ## 18 Chile                         139.              47739.            343
    ## 19 Colombia                      136.              46495.            341
    ## 20 Italy                         128.              46557.            365

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               28.6         620     2169
    ##  2 Mexico               8.82     179797  2038276
    ##  3 Syria                6.57        998    15179
    ##  4 Sudan                6.19       1864    30128
    ##  5 Egypt                5.81      10353   178151
    ##  6 Ecuador              5.66      15536   274673
    ##  7 China                4.76       4842   101700
    ##  8 Bolivia              4.72      11417   241771
    ##  9 Afghanistan          4.37       2433    55617
    ## 10 Mali                 4.19        348     8299
    ## 11 Bulgaria             4.16       9854   236666
    ## 12 Tanzania             4.13         21      509
    ## 13 Zimbabwe             4.01       1436    35796
    ## 14 Iran                 3.78      59483  1574012
    ## 15 Guatemala            3.67       6282   171170
    ## 16 Niger                3.59        170     4733
    ## 17 Hungary              3.54      14347   405646
    ## 18 Peru                 3.52      44877  1275899
    ## 19 Greece               3.50       6297   179802
    ## 20 Chad                 3.48        134     3849

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                2105.      21903   10.4 
    ##  2 United Kingdom         1934.     120580   62.3 
    ##  3 Czech Republic         1845.      19330   10.5 
    ##  4 Mexico                 1599.     179797  112.  
    ##  5 United States          1592.     493976  310.  
    ##  6 Italy                  1586.      95718   60.3 
    ##  7 Peru                   1501.      44877   29.9 
    ##  8 Portugal               1495.      15962   10.7 
    ##  9 Hungary                1437.      14347    9.98
    ## 10 Spain                  1434.      66704   46.5 
    ## 11 Bulgaria               1378.       9854    7.15
    ## 12 Sweden                 1324.      12649    9.56
    ## 13 France                 1295.      83866   64.8 
    ## 14 Argentina              1237.      51122   41.3 
    ## 15 Colombia               1228.      58685   47.8 
    ## 16 Brazil                 1223.     245977  201.  
    ## 17 Switzerland            1207.       9148    7.58
    ## 18 Slovakia               1206.       6577    5.46
    ## 19 Chile                  1197.      20042   16.7 
    ## 20 Bolivia                1148.      11417    9.95

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
