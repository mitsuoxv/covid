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

Updated: 2021-02-20

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
    ##  1 United States           77855. 27560643            354
    ##  2 India                   32056. 10963394            342
    ##  3 Brazil                  29008.  9978747            344
    ##  4 Russia                  12245.  4139031            338
    ##  5 United Kingdom          11567.  4083246            353
    ##  6 France                   9792.  3476135            355
    ##  7 Spain                    8793.  3121687            355
    ##  8 Turkey                   7741.  2616600            338
    ##  9 Italy                    7639.  2765412            362
    ## 10 Germany                  6656.  2369719            356
    ## 11 Colombia                 6531.  2207701            338
    ## 12 Argentina                6015.  2039124            339
    ## 13 Mexico                   5957.  2013563            338
    ## 14 Poland                   4746.  1623218            342
    ## 15 South Africa             4421.  1498766            339
    ## 16 Iran                     4306.  1550142            360
    ## 17 Ukraine                  3896.  1293672            332
    ## 18 Peru                     3693.  1252137            339
    ## 19 Indonesia                3662.  1252685            342
    ## 20 Czech Republic           3299.  1134957            344

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                315.             108339.            344
    ##  2 Israel                        290.              99407.            343
    ##  3 United States                 251.              88839.            354
    ##  4 Portugal                      216.              74263.            343
    ##  5 Belgium                       204.              71739.            352
    ##  6 Switzerland                   203.              71776.            353
    ##  7 Spain                         189.              67124.            355
    ##  8 Sweden                        188.              65616.            349
    ##  9 United Kingdom                186.              65491.            353
    ## 10 Netherlands                   179.              62642.            349
    ## 11 Serbia                        173.              58415.            337
    ## 12 Jordan                        167.              55680.            334
    ## 13 Slovakia                      156.              52750.            337
    ## 14 Austria                       153.              53151.            348
    ## 15 France                        151.              53670.            355
    ## 16 Argentina                     145.              49322.            339
    ## 17 Brazil                        144.              49620.            344
    ## 18 Chile                         138.              47063.            340
    ## 19 Colombia                      137.              46196.            338
    ## 20 Italy                         127.              45830.            362

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               28.7         619     2158
    ##  2 Mexico               8.79     177061  2013563
    ##  3 Syria                6.58        990    15045
    ##  4 Sudan                6.19       1864    30128
    ##  5 Egypt                5.79      10201   176333
    ##  6 Ecuador              5.72      15444   269860
    ##  7 China                4.76       4842   101624
    ##  8 Bolivia              4.74      11303   238495
    ##  9 Afghanistan          4.37       2430    55575
    ## 10 Bulgaria             4.17       9786   234428
    ## 11 Mali                 4.14        342     8256
    ## 12 Tanzania             4.13         21      509
    ## 13 Zimbabwe             4.00       1420    35543
    ## 14 Iran                 3.82      59264  1550142
    ## 15 Guatemala            3.65       6164   168880
    ## 16 Niger                3.60        170     4718
    ## 17 Hungary              3.56      14145   397116
    ## 18 Peru                 3.54      44308  1252137
    ## 19 Greece               3.53       6221   176059
    ## 20 Chad                 3.52        132     3751

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                2098.      21821   10.4 
    ##  2 United Kingdom         1915.     119387   62.3 
    ##  3 Czech Republic         1805.      18913   10.5 
    ##  4 Mexico                 1574.     177061  112.  
    ##  5 Italy                  1573.      94887   60.3 
    ##  6 United States          1570.     486970  310.  
    ##  7 Peru                   1482.      44308   29.9 
    ##  8 Portugal               1476.      15754   10.7 
    ##  9 Spain                  1434.      66704   46.5 
    ## 10 Hungary                1417.      14145    9.98
    ## 11 Bulgaria               1369.       9786    7.15
    ## 12 Sweden                 1318.      12598    9.56
    ## 13 France                 1281.      82959   64.8 
    ## 14 Argentina              1224.      50616   41.3 
    ## 15 Colombia               1216.      58134   47.8 
    ## 16 Switzerland            1206.       9139    7.58
    ## 17 Brazil                 1204.     242090  201.  
    ## 18 Chile                  1182.      19798   16.7 
    ## 19 Slovakia               1164.       6350    5.46
    ## 20 Bolivia                1136.      11303    9.95

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
