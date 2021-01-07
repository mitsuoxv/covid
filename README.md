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

Updated: 2021-01-07

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
    ##  1 United States           66592. 20643544            310
    ##  2 India                   34815. 10374932            298
    ##  3 Brazil                  25846.  7753752            300
    ##  4 Russia                  11253.  3308601            294
    ##  5 United Kingdom           8979.  2774483            309
    ##  6 France                   8474.  2635551            311
    ##  7 Italy                    6860.  2181619            318
    ##  8 Spain                    6108.  1893502            310
    ##  9 Germany                  5797.  1808647            312
    ## 10 Colombia                 5735.  1686131            294
    ## 11 Argentina                5589.  1648940            295
    ## 12 Turkey                   4951.  1455763            294
    ## 13 Mexico                   4949.  1455219            294
    ## 14 Poland                   4512.  1344763            298
    ## 15 Iran                     3973.  1255620            316
    ## 16 South Africa             3823.  1127759            295
    ## 17 Ukraine                  3786.  1090496            288
    ## 18 Peru                     3461.  1021058            295
    ## 19 Netherlands              2734.   834064            305
    ## 20 Indonesia                2616.   779548            298

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                247.              74166.            300
    ##  2 United States                 215.              66542.            310
    ##  3 Belgium                       204.              62745.            308
    ##  4 Israel                        201.              59981.            299
    ##  5 Switzerland                   197.              61160.            310
    ##  6 Netherlands                   164.              50109.            305
    ##  7 Serbia                        162.              47549.            293
    ##  8 Jordan                        162.              47027.            290
    ##  9 Sweden                        161.              49158.            305
    ## 10 Austria                       148.              44946.            304
    ## 11 United Kingdom                144.              44500.            309
    ## 12 Portugal                      137.              40893.            299
    ## 13 Argentina                     135.              39884.            295
    ## 14 Spain                         131.              40715.            310
    ## 15 France                        131.              40692.            311
    ## 16 Brazil                        129.              38556.            300
    ## 17 Chile                         126.              37208.            296
    ## 18 Slovakia                      122.              35939.            294
    ## 19 Colombia                      120.              35282.            294
    ## 20 Poland                        117.              34929.            298

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               29.0         611     2105
    ##  2 Mexico               8.78     127757  1455219
    ##  3 Ecuador              6.54      14069   215080
    ##  4 Sudan                6.30       1468    23316
    ##  5 Syria                6.23        741    11890
    ##  6 Bolivia              5.63       9219   163671
    ##  7 Egypt                5.48       7918   144583
    ##  8 China                4.94       4794    97127
    ##  9 Chad                 4.59        105     2289
    ## 10 Iran                 4.44      55748  1255620
    ## 11 Afghanistan          4.23       2244    53105
    ## 12 Tanzania             4.13         21      509
    ## 13 Bulgaria             3.85       7902   205390
    ## 14 Mali                 3.84        279     7260
    ## 15 Peru                 3.71      37873  1021058
    ## 16 Greece               3.57       5051   141453
    ## 17 Italy                3.50      76329  2181619
    ## 18 Guatemala            3.49       4859   139419
    ## 19 Nicaragua            3.41        166     4867
    ## 20 Tunisia              3.36       4934   147061

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                1906.      19827   10.4 
    ##  2 Peru                   1266.      37873   29.9 
    ##  3 Italy                  1265.      76329   60.3 
    ##  4 United Kingdom         1224.      76305   62.3 
    ##  5 Czech Republic         1187.      12436   10.5 
    ##  6 Mexico                 1136.     127757  112.  
    ##  7 United States          1131.     350753  310.  
    ##  8 Bulgaria               1105.       7902    7.15
    ##  9 Spain                  1085.      50442   46.5 
    ## 10 Argentina              1055.      43634   41.3 
    ## 11 Hungary                1022.      10198    9.98
    ## 12 France                 1018.      65902   64.8 
    ## 13 Chile                  1002.      16788   16.7 
    ## 14 Brazil                  977.     196561  201.  
    ## 15 Switzerland             968.       7335    7.58
    ## 16 Ecuador                 951.      14069   14.8 
    ## 17 Sweden                  940.       8985    9.56
    ## 18 Bolivia                 927.       9219    9.95
    ## 19 Colombia                925.      44187   47.8 
    ## 20 Poland                  781.      30055   38.5

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
