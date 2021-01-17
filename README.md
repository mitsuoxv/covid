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

Updated: 2021-01-18

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
    ##  1 United States           72724. 23344423            321
    ##  2 India                   34168. 10557985            309
    ##  3 Brazil                  26988.  8393492            311
    ##  4 Russia                  11699.  3568209            305
    ##  5 United Kingdom          10491.  3357365            320
    ##  6 France                   8841.  2846971            322
    ##  7 Italy                    7199.  2368733            329
    ##  8 Spain                    6869.  2211967            322
    ##  9 Germany                  6295.  2033518            323
    ## 10 Colombia                 6131.  1870179            305
    ## 11 Argentina                5827.  1783047            306
    ## 12 Mexico                   5277.  1609735            305
    ## 13 Turkey                   5135.  1566327            305
    ## 14 Poland                   4646.  1435582            309
    ## 15 South Africa             4332.  1325659            306
    ## 16 Iran                     4050.  1324395            327
    ## 17 Ukraine                  3882.  1160682            299
    ## 18 Peru                     3451.  1056023            306
    ## 19 Indonesia                2901.   896642            309
    ## 20 Netherlands              2870.   906956            316

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                273.              84876.            311
    ##  2 United States                 234.              75248.            321
    ##  3 Israel                        229.              70974.            310
    ##  4 Belgium                       204.              65097.            319
    ##  5 Switzerland                   202.              65003.            321
    ##  6 Sweden                        173.              54781.            316
    ##  7 Netherlands                   172.              54488.            316
    ##  8 United Kingdom                168.              53848.            320
    ##  9 Serbia                        166.              50541.            304
    ## 10 Portugal                      163.              50526.            310
    ## 11 Jordan                        163.              48939.            301
    ## 12 Austria                       151.              47502.            315
    ## 13 Spain                         148.              47563.            322
    ## 14 Argentina                     141.              43128.            306
    ## 15 France                        137.              43956.            322
    ## 16 Brazil                        134.              41737.            311
    ## 17 Slovakia                      134.              40940.            305
    ## 18 Chile                         129.              39739.            307
    ## 19 Colombia                      128.              39133.            305
    ## 20 Poland                        121.              37288.            309

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               29.0         613     2116
    ##  2 Mexico               8.64     139022  1609735
    ##  3 Syria                6.37        824    12942
    ##  4 Ecuador              6.20      14316   230808
    ##  5 Sudan                6.13       1576    25730
    ##  6 Egypt                5.48       8527   155507
    ##  7 Bolivia              5.21       9571   183589
    ##  8 China                4.87       4804    98625
    ##  9 Afghanistan          4.33       2339    53984
    ## 10 Iran                 4.28      56717  1324395
    ## 11 Tanzania             4.13         21      509
    ## 12 Bulgaria             4.00       8474   211736
    ## 13 Mali                 3.94        308     7823
    ## 14 Chad                 3.89        111     2855
    ## 15 Greece               3.67       5441   148370
    ## 16 Peru                 3.66      38654  1056023
    ## 17 Guatemala            3.51       5220   148598
    ## 18 Italy                3.45      81800  2368733
    ## 19 Nicaragua            3.40        167     4916
    ## 20 Niger                3.34        138     4132

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                1961.      20396   10.4 
    ##  2 United Kingdom         1421.      88590   62.3 
    ##  3 Czech Republic         1369.      14338   10.5 
    ##  4 Italy                  1356.      81800   60.3 
    ##  5 Peru                   1292.      38654   29.9 
    ##  6 United States          1254.     389084  310.  
    ##  7 Mexico                 1236.     139022  112.  
    ##  8 Bulgaria               1185.       8474    7.15
    ##  9 Spain                  1141.      53079   46.5 
    ## 10 Hungary                1136.      11341    9.98
    ## 11 Argentina              1094.      45227   41.3 
    ## 12 Sweden                 1080.      10323    9.56
    ## 13 France                 1077.      69753   64.8 
    ## 14 Switzerland            1046.       7930    7.58
    ## 15 Chile                  1041.      17435   16.7 
    ## 16 Brazil                 1036.     208246  201.  
    ## 17 Colombia               1002.      47868   47.8 
    ## 18 Ecuador                 968.      14316   14.8 
    ## 19 Bolivia                 962.       9571    9.95
    ## 20 Poland                  866.      33355   38.5

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
