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

Updated: 2021-02-25

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
    ##  1 United States           77670. 27883560            359
    ##  2 India                   31787. 11030176            347
    ##  3 Brazil                  29212. 10195160            349
    ##  4 Russia                  12247.  4200902            343
    ##  5 United Kingdom          11549.  4134643            358
    ##  6 France                   9908.  3566830            360
    ##  7 Spain                    8781.  3161432            360
    ##  8 Turkey                   7742.  2655633            343
    ##  9 Italy                    7717.  2832162            367
    ## 10 Germany                  6656.  2402818            361
    ## 11 Colombia                 6500.  2229663            343
    ## 12 Argentina                6038.  2077228            344
    ## 13 Mexico                   5958.  2043632            343
    ## 14 Poland                   4787.  1661109            347
    ## 15 South Africa             4376.  1505586            344
    ## 16 Iran                     4357.  1590605            365
    ## 17 Ukraine                  3910.  1317694            337
    ## 18 Indonesia                3742.  1298608            347
    ## 19 Peru                     3740.  1286757            344
    ## 20 Czech Republic           3393.  1184352            349

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                324.             113054.            349
    ##  2 Israel                        290.             101000.            348
    ##  3 United States                 250.              89879.            359
    ##  4 Portugal                      215.              74851.            348
    ##  5 Belgium                       204.              72834.            357
    ##  6 Switzerland                   202.              72382.            358
    ##  7 Sweden                        190.              67194.            354
    ##  8 Spain                         189.              67979.            360
    ##  9 United Kingdom                185.              66315.            358
    ## 10 Netherlands                   181.              63959.            354
    ## 11 Serbia                        176.              60294.            342
    ## 12 Jordan                        171.              58126.            339
    ## 13 Slovakia                      160.              54691.            342
    ## 14 Austria                       153.              54178.            353
    ## 15 France                        153.              55071.            360
    ## 16 Argentina                     146.              50244.            344
    ## 17 Brazil                        145.              50696.            349
    ## 18 Chile                         139.              48089.            345
    ## 19 Colombia                      136.              46655.            343
    ## 20 Italy                         128.              46936.            367

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               28.3         621     2191
    ##  2 Mexico               8.83     180536  2043632
    ##  3 Syria                6.57       1004    15282
    ##  4 Sudan                6.20       1876    30236
    ##  5 Egypt                5.82      10443   179407
    ##  6 Ecuador              5.64      15567   275780
    ##  7 China                4.76       4842   101750
    ##  8 Bolivia              4.72      11470   243176
    ##  9 Afghanistan          4.38       2436    55664
    ## 10 Mali                 4.18        348     8324
    ## 11 Bulgaria             4.15       9978   240391
    ## 12 Tanzania             4.13         21      509
    ## 13 Zimbabwe             4.03       1448    35910
    ## 14 Iran                 3.75      59663  1590605
    ## 15 Guatemala            3.67       6315   172072
    ## 16 Niger                3.63        172     4740
    ## 17 Hungary              3.55      14552   410129
    ## 18 Peru                 3.52      45263  1286757
    ## 19 Chad                 3.50        136     3882
    ## 20 Greece               3.47       6343   182783

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                2111.      21956   10.4 
    ##  2 United Kingdom         1946.     121305   62.3 
    ##  3 Czech Republic         1879.      19682   10.5 
    ##  4 Mexico                 1605.     180536  112.  
    ##  5 United States          1602.     496850  310.  
    ##  6 Italy                  1597.      96348   60.3 
    ##  7 Peru                   1513.      45263   29.9 
    ##  8 Portugal               1507.      16086   10.7 
    ##  9 Spain                  1464.      68079   46.5 
    ## 10 Hungary                1458.      14552    9.98
    ## 11 Bulgaria               1396.       9978    7.15
    ## 12 Sweden                 1330.      12713    9.56
    ## 13 France                 1307.      84621   64.8 
    ## 14 Argentina              1246.      51510   41.3 
    ## 15 Slovakia               1242.       6775    5.46
    ## 16 Colombia               1234.      58974   47.8 
    ## 17 Brazil                 1229.     247143  201.  
    ## 18 Switzerland            1212.       9188    7.58
    ## 19 Chile                  1203.      20151   16.7 
    ## 20 Bolivia                1153.      11470    9.95

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
