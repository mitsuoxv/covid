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

Updated: 2021-01-10

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
    ##  1 United States           68523. 21447670            313
    ##  2 India                   34596. 10413417            301
    ##  3 Brazil                  26276.  7961673            303
    ##  4 Russia                  11377.  3379103            297
    ##  5 United Kingdom           9479.  2957476            312
    ##  6 France                   8604.  2701658            314
    ##  7 Italy                    6971.  2237890            321
    ##  8 Spain                    6471.  2025560            313
    ##  9 Germany                  6005.  1891581            315
    ## 10 Colombia                 5849.  1737347            297
    ## 11 Argentina                5671.  1690006            298
    ## 12 Mexico                   5028.  1493569            297
    ## 13 Turkey                   5027.  1493243            297
    ## 14 Poland                   4572.  1376389            301
    ## 15 South Africa             4002.  1192570            298
    ## 16 Iran                     3995.  1274514            319
    ## 17 Ukraine                  3814.  1110015            291
    ## 18 Peru                     3445.  1026690            298
    ## 19 Netherlands              2788.   858914            308
    ## 20 Czech Republic           2715.   822716            303

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                259.              78533.            303
    ##  2 United States                 221.              69134.            313
    ##  3 Israel                        213.              64348.            302
    ##  4 Belgium                       204.              63511.            311
    ##  5 Switzerland                   200.              62736.            313
    ##  6 Netherlands                   168.              51602.            308
    ##  7 Sweden                        166.              51222.            308
    ##  8 Serbia                        164.              48486.            296
    ##  9 Jordan                        162.              47629.            293
    ## 10 United Kingdom                152.              47435.            312
    ## 11 Austria                       149.              45785.            307
    ## 12 Portugal                      145.              43716.            302
    ## 13 Spain                         139.              43555.            313
    ## 14 Argentina                     137.              40877.            298
    ## 15 France                        133.              41713.            314
    ## 16 Brazil                        131.              39590.            303
    ## 17 Slovakia                      127.              37623.            297
    ## 18 Chile                         126.              37822.            299
    ## 19 Colombia                      122.              36354.            297
    ## 20 Poland                        119.              35750.            301

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               29.0         611     2108
    ##  2 Mexico               8.77     131031  1493569
    ##  3 Ecuador              6.46      14165   219148
    ##  4 Sudan                6.30       1468    23316
    ##  5 Syria                6.26        763    12179
    ##  6 Bolivia              5.51       9304   168891
    ##  7 Egypt                5.47       8085   147810
    ##  8 China                4.92       4796    97387
    ##  9 Iran                 4.40      56018  1274514
    ## 10 Chad                 4.38        106     2419
    ## 11 Afghanistan          4.24       2264    53400
    ## 12 Tanzania             4.13         21      509
    ## 13 Bulgaria             3.88       8078   208012
    ## 14 Mali                 3.85        286     7427
    ## 15 Peru                 3.71      38049  1026690
    ## 16 Greece               3.62       5195   143494
    ## 17 Guatemala            3.50       4972   142064
    ## 18 Italy                3.48      77911  2237890
    ## 19 Nicaragua            3.41        166     4867
    ## 20 Tunisia              3.30       5108   154903

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                1922.      19992   10.4 
    ##  2 Italy                  1291.      77911   60.3 
    ##  3 United Kingdom         1280.      79833   62.3 
    ##  4 Peru                   1272.      38049   29.9 
    ##  5 Czech Republic         1239.      12978   10.5 
    ##  6 United States          1168.     362287  310.  
    ##  7 Mexico                 1165.     131031  112.  
    ##  8 Bulgaria               1130.       8078    7.15
    ##  9 Spain                  1111.      51690   46.5 
    ## 10 Argentina              1067.      44122   41.3 
    ## 11 Hungary                1057.      10554    9.98
    ## 12 France                 1035.      67049   64.8 
    ## 13 Chile                  1014.      16974   16.7 
    ## 14 Brazil                  997.     200498  201.  
    ## 15 Switzerland             995.       7545    7.58
    ## 16 Sweden                  987.       9433    9.56
    ## 17 Ecuador                 958.      14165   14.8 
    ## 18 Colombia                943.      45067   47.8 
    ## 19 Bolivia                 935.       9304    9.95
    ## 20 Poland                  805.      31011   38.5

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
