WHO, Covid-19 situation report
================
Mitsuo Shiota
2020-03-07

-   [Summary](#summary)
-   [Read data from WHO](#read-data-from-who)
-   [Newly confirmed cases by region](#newly-confirmed-cases-by-region)
-   [Fastest spreading areas](#fastest-spreading-areas)
-   [Highest fatality rate areas](#highest-fatality-rate-areas)
-   [Highest deaths per population
    areas](#highest-deaths-per-population-areas)

<!-- badges: start -->

[![R-CMD-check](https://github.com/mitsuoxv/covid/workflows/R-CMD-check/badge.svg)](https://github.com/mitsuoxv/covid/actions)
<!-- badges: end -->

Updated: 2022-01-19

I added “Japan, Covid-19 situation by prefecture” in [another
page](Japan.md). I added “USA, Covid-19 situation by state” in [another
page](USA.md).

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

    ## # A tibble: 20 × 4
    ##    area           speed_since_100 cum_conf days_since_100
    ##    <chr>                    <dbl>    <dbl>          <int>
    ##  1 United States           94345. 64720612            686
    ##  2 India                   55731. 37618271            675
    ##  3 Brazil                  34024. 23000657            676
    ##  4 United Kingdom          22376. 15305414            684
    ##  5 France                  20229. 13917995            688
    ##  6 Russia                  16193. 10865512            671
    ##  7 Turkey                  15680. 10521208            671
    ##  8 Italy                   12648.  8790302            695
    ##  9 Spain                   12263.  8424503            687
    ## 10 Germany                 11719.  8074527            689
    ## 11 Argentina               10742.  7197323            670
    ## 12 Iran                     8981.  6224196            693
    ## 13 Colombia                 8262.  5543796            671
    ## 14 Mexico                   6452.  4368314            677
    ## 15 Poland                   6434.  4343130            675
    ## 16 Indonesia                6331.  4273783            675
    ## 17 Ukraine                  5666.  3768088            665
    ## 18 South Africa             5307.  3560921            671
    ## 19 Netherlands              5295.  3611351            682
    ## 20 Philippines              4803.  3242374            675

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                370.             250489.            677
    ##  2 Israel                        359.             243679.            678
    ##  3 United Kingdom                359.             245482.            684
    ##  4 Belgium                       349.             238780.            685
    ##  5 Switzerland                   332.             227803.            686
    ##  6 Netherlands                   318.             216963.            682
    ##  7 France                        312.             214889.            688
    ##  8 Denmark                       311.             211522.            680
    ##  9 United States                 304.             208619.            686
    ## 10 Serbia                        294.             197307.            670
    ## 11 Portugal                      264.             178615.            676
    ## 12 Spain                         264.             181149.            687
    ## 13 Austria                       262.             177909.            680
    ## 14 Argentina                     260.             174087.            670
    ## 15 Jordan                        259.             172622.            667
    ## 16 Slovakia                      242.             162164.            671
    ## 17 Sweden                        239.             163288.            682
    ## 18 Greece                        226.             152700.            677
    ## 19 Italy                         210.             145679.            695
    ## 20 Hungary                       203.             135753.            669

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.1        1991    10408
    ##  2 Peru                 7.81     203464  2606126
    ##  3 Mexico               6.90     301410  4368314
    ##  4 Sudan                6.48       3390    52345
    ##  5 Syria                5.81       2950    50748
    ##  6 Ecuador              5.57      34219   614032
    ##  7 Egypt                5.53      22179   401308
    ##  8 Somalia              5.50       1335    24261
    ##  9 Afghanistan          4.65       7381   158826
    ## 10 China                4.18       5700   136270
    ## 11 Bulgaria             3.88      32247   830604
    ## 12 Myanmar              3.62      19304   533245
    ## 13 Niger                3.48        293     8413
    ## 14 Indonesia            3.37     144183  4273783
    ## 15 Paraguay             3.36      16821   501189
    ## 16 Tunisia              3.26      25817   791917
    ## 17 El Salvador          3.10       3834   123577
    ## 18 Romania              3.10      59257  1911546
    ## 19 Hungary              3.00      40601  1355084
    ## 20 Malawi               2.99       2474    82792

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6803.     203464   29.9 
    ##  2 Bulgaria               4511.      32247    7.15
    ##  3 Hungary                4067.      40601    9.98
    ##  4 Czech Republic         3523.      36910   10.5 
    ##  5 Slovakia               3189.      17398    5.46
    ##  6 Brazil                 3088.     621045  201.  
    ##  7 Argentina              2860.     118231   41.3 
    ##  8 Belgium                2755.      28661   10.4 
    ##  9 Colombia               2741.     130996   47.8 
    ## 10 United States          2720.     843718  310.  
    ## 11 Romania                2698.      59257   22.0 
    ## 12 Mexico                 2680.     301410  112.  
    ## 13 Poland                 2667.     102686   38.5 
    ## 14 Paraguay               2638.      16821    6.38
    ## 15 United Kingdom         2439.     152075   62.3 
    ## 16 Tunisia                2438.      25817   10.6 
    ## 17 Chile                  2354.      39426   16.7 
    ## 18 Italy                  2343.     141391   60.3 
    ## 19 Ecuador                2314.      34219   14.8 
    ## 20 Russia                 2293.     322678  141.

EOL
