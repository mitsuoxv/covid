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

Updated: 2021-03-31

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
    ##  1 United States           76450. 29968464            392
    ##  2 Brazil                  32813. 12534688            382
    ##  3 India                   31747. 12095855            381
    ##  4 Russia                  12034.  4536820            377
    ##  5 France                  11373.  4481165            394
    ##  6 United Kingdom          11065.  4337700            392
    ##  7 Italy                    8840.  3544957            401
    ##  8 Turkey                   8595.  3240577            377
    ##  9 Spain                    8322.  3270825            393
    ## 10 Germany                  7068.  2791822            395
    ## 11 Colombia                 6320.  2382730            377
    ## 12 Argentina                6140.  2308597            376
    ## 13 Poland                   6007.  2288826            381
    ## 14 Mexico                   5906.  2226550            377
    ## 15 Iran                     4674.  1864984            399
    ## 16 Ukraine                  4482.  1662942            371
    ## 17 South Africa             4100.  1545979            377
    ## 18 Peru                     4047.  1529882            378
    ## 19 Czech Republic           3978.  1523668            383
    ## 20 Indonesia                3950.  1501093            380

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                380.             145444.            383
    ##  2 Israel                        296.             113011.            382
    ##  3 Jordan                        250.              93218.            373
    ##  4 United States                 246.              96600.            392
    ##  5 Belgium                       215.              83912.            391
    ##  6 Serbia                        214.              80331.            376
    ##  7 Sweden                        210.              81627.            388
    ##  8 Portugal                      201.              76875.            382
    ##  9 Switzerland                   200.              78359.            392
    ## 10 Netherlands                   195.              75648.            388
    ## 11 Spain                         179.              70331.            393
    ## 12 United Kingdom                177.              69572.            392
    ## 13 France                        176.              69188.            394
    ## 14 Slovakia                      175.              65872.            376
    ## 15 Hungary                       172.              64690.            375
    ## 16 Austria                       169.              65418.            387
    ## 17 Brazil                        163.              62330.            382
    ## 18 Poland                        156.              59450.            381
    ## 19 Chile                         155.              58787.            379
    ## 20 Argentina                     149.              55840.            376

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                21.0         864     4119
    ##  2 Mexico                9.06     201623  2226550
    ##  3 Syria                 6.69       1247    18638
    ##  4 Sudan                 6.46       2028    31407
    ##  5 Egypt                 5.94      11914   200739
    ##  6 Ecuador               5.15      16746   325124
    ##  7 China                 4.72       4851   102715
    ##  8 Somalia               4.57        510    11164
    ##  9 Bolivia               4.52      12186   269628
    ## 10 Afghanistan           4.39       2476    56384
    ## 11 Zimbabwe              4.13       1520    36839
    ## 12 Tanzania              4.13         21      509
    ## 13 Bulgaria              3.87      12913   333250
    ## 14 Mali                  3.87        384     9921
    ## 15 Niger                 3.72        186     5001
    ## 16 Chad                  3.64        164     4510
    ## 17 Guatemala             3.52       6809   193556
    ## 18 Tunisia               3.49       8760   251169
    ## 19 South Africa          3.41      52710  1545979
    ## 20 Peru                  3.36      51469  1529882

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Czech Republic         2503.      26222   10.5 
    ##  2 Belgium                2203.      22921   10.4 
    ##  3 Hungary                2047.      20435    9.98
    ##  4 United Kingdom         2031.     126615   62.3 
    ##  5 Bulgaria               1806.      12913    7.15
    ##  6 Italy                  1796.     108350   60.3 
    ##  7 Mexico                 1793.     201623  112.  
    ##  8 Slovakia               1764.       9624    5.46
    ##  9 United States          1755.     544430  310.  
    ## 10 Peru                   1721.      51469   29.9 
    ## 11 Spain                  1617.      75199   46.5 
    ## 12 Portugal               1578.      16843   10.7 
    ## 13 Brazil                 1552.     312206  201.  
    ## 14 France                 1458.      94402   64.8 
    ## 15 Sweden                 1402.      13402    9.56
    ## 16 Chile                  1378.      23070   16.7 
    ## 17 Poland                 1361.      52392   38.5 
    ## 18 Argentina              1341.      55449   41.3 
    ## 19 Colombia               1317.      62955   47.8 
    ## 20 Switzerland            1265.       9589    7.58

EOL
