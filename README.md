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

Updated: 2021-02-03

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
    ##  1 United States           76943. 25930068            337
    ##  2 India                   33127. 10766245            325
    ##  3 Brazil                  28149.  9204731            327
    ##  4 Russia                  12102.  3884730            321
    ##  5 United Kingdom          11416.  3835787            336
    ##  6 France                   9317.  3149255            338
    ##  7 Spain                    8003.  2705001            338
    ##  8 Turkey                   7741.  2485182            321
    ##  9 Italy                    7423.  2560957            345
    ## 10 Germany                  6572.  2228085            339
    ## 11 Colombia                 6526.  2094884            321
    ## 12 Argentina                5985.  1927239            322
    ## 13 Mexico                   5807.  1864260            321
    ## 14 Poland                   4677.  1520215            325
    ## 15 South Africa             4522.  1456309            322
    ## 16 Iran                     4153.  1424596            343
    ## 17 Ukraine                  3885.  1223879            315
    ## 18 Peru                     3534.  1138239            322
    ## 19 Indonesia                3351.  1089308            325
    ## 20 Czech Republic           3041.   994514            327

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                290.              94933.            327
    ##  2 Israel                        269.              87788.            326
    ##  3 United States                 248.              83583.            337
    ##  4 Portugal                      209.              68033.            326
    ##  5 Switzerland                   205.              68926.            336
    ##  6 Belgium                       204.              68386.            335
    ##  7 United Kingdom                183.              61522.            336
    ##  8 Sweden                        179.              59331.            332
    ##  9 Netherlands                   178.              58976.            332
    ## 10 Spain                         172.              58165.            338
    ## 11 Serbia                        169.              54052.            320
    ## 12 Jordan                        161.              51203.            317
    ## 13 Austria                       152.              50204.            331
    ## 14 Argentina                     145.              46616.            322
    ## 15 Slovakia                      144.              46213.            321
    ## 16 France                        144.              48623.            338
    ## 17 Brazil                        140.              45771.            327
    ## 18 Colombia                      137.              43835.            321
    ## 19 Chile                         135.              43644.            323
    ## 20 Italy                         123.              42442.            345

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               29.0         616     2126
    ##  2 Mexico               8.50     158536  1864260
    ##  3 Syria                6.57        926    14096
    ##  4 Sudan                6.14       1812    29488
    ##  5 Ecuador              5.93      14890   250986
    ##  6 Egypt                5.62       9360   166492
    ##  7 Bolivia              4.79      10379   216835
    ##  8 China                4.78       4826   101039
    ##  9 Afghanistan          4.36       2405    55121
    ## 10 Bulgaria             4.16       9142   219580
    ## 11 Tanzania             4.13         21      509
    ## 12 Mali                 4.07        330     8100
    ## 13 Iran                 4.07      58038  1424596
    ## 14 Greece               3.70       5829   157495
    ## 15 Zimbabwe             3.68       1234    33548
    ## 16 Peru                 3.60      41026  1138239
    ## 17 Chad                 3.57        121     3385
    ## 18 Guatemala            3.55       5673   159632
    ## 19 Niger                3.55        161     4537
    ## 20 Italy                3.47      88845  2560957

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                2031.      21124   10.4 
    ##  2 United Kingdom         1709.     106564   62.3 
    ##  3 Czech Republic         1579.      16545   10.5 
    ##  4 Italy                  1472.      88845   60.3 
    ##  5 United States          1412.     437964  310.  
    ##  6 Mexico                 1410.     158536  112.  
    ##  7 Peru                   1372.      41026   29.9 
    ##  8 Bulgaria               1279.       9142    7.15
    ##  9 Hungary                1268.      12656    9.98
    ## 10 Spain                  1243.      57806   46.5 
    ## 11 Sweden                 1213.      11591    9.56
    ## 12 Portugal               1195.      12757   10.7 
    ## 13 France                 1175.      76114   64.8 
    ## 14 Argentina              1160.      47974   41.3 
    ## 15 Switzerland            1145.       8679    7.58
    ## 16 Colombia               1130.      53983   47.8 
    ## 17 Brazil                 1116.     224504  201.  
    ## 18 Chile                  1107.      18537   16.7 
    ## 19 Bolivia                1043.      10379    9.95
    ## 20 Ecuador                1007.      14890   14.8

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
