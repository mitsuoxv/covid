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

Updated: 2022-01-27

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
“speed_since_100”, which is average number of newly confirmed cases per
day since cumulative cases became more than 100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_since_100 cum_conf days_since_100
    ##    <chr>                    <dbl>    <dbl>          <int>
    ##  1 United States          102776. 71326407            694
    ##  2 India                   58690. 40085116            683
    ##  3 Brazil                  35270. 24124595            684
    ##  4 France                  24182. 16830895            696
    ##  5 United Kingdom          23190. 16047720            692
    ##  6 Russia                  16665. 11315801            679
    ##  7 Turkey                  16332. 11089602            679
    ##  8 Italy                   14527. 10212621            703
    ##  9 Spain                   13519.  9395768            695
    ## 10 Germany                 12964.  9035795            697
    ## 11 Argentina               11712.  7940657            678
    ## 12 Iran                     8941.  6267559            701
    ## 13 Colombia                 8485.  5761398            679
    ## 14 Mexico                   6840.  4685767            685
    ## 15 Poland                   6790.  4637776            683
    ## 16 Indonesia                6297.  4301193            683
    ## 17 Ukraine                  5815.  3913809            673
    ## 18 Netherlands              5809.  4008459            690
    ## 19 South Africa             5281.  3585888            679
    ## 20 Philippines              5065.  3459646            683

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        505.             346369.            686
    ##  2 Belgium                       399.             276671.            693
    ##  3 Czech Republic                395.             270519.            685
    ##  4 Denmark                       393.             270746.            688
    ##  5 Switzerland                   379.             263147.            694
    ##  6 France                        373.             259863.            696
    ##  7 United Kingdom                372.             257388.            692
    ##  8 Netherlands                   349.             240821.            690
    ##  9 United States                 331.             229912.            694
    ## 10 Serbia                        317.             215096.            678
    ## 11 Portugal                      317.             216583.            684
    ## 12 Austria                       294.             202256.            688
    ## 13 Sweden                        292.             201236.            690
    ## 14 Spain                         291.             202034.            695
    ## 15 Argentina                     283.             192067.            678
    ## 16 Jordan                        269.             181727.            675
    ## 17 Slovakia                      255.             172938.            679
    ## 18 Greece                        243.             166388.            685
    ## 19 Italy                         241.             169250.            703
    ## 20 Hungary                       218.             147393.            677

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               18.5        2000    10821
    ##  2 Peru                 6.87     204404  2976260
    ##  3 Mexico               6.47     303301  4685767
    ##  4 Sudan                6.03       3411    56595
    ##  5 Syria                5.82       2974    51075
    ##  6 Somalia              5.49       1335    24322
    ##  7 Egypt                5.42      22431   413558
    ##  8 Ecuador              5.04      34329   681382
    ##  9 Afghanistan          4.62       7397   160252
    ## 10 China                4.14       5700   137788
    ## 11 Bulgaria             3.64      32869   903676
    ## 12 Myanmar              3.61      19310   534503
    ## 13 Niger                3.45        297     8603
    ## 14 Indonesia            3.35     144254  4301193
    ## 15 Paraguay             3.14      17009   542388
    ## 16 El Salvador          3.04       3862   127012
    ## 17 Malawi               3.02       2534    84013
    ## 18 Tunisia              3.01      26051   866445
    ## 19 Romania              2.91      59632  2048896
    ## 20 Russia               2.90     328105 11315801

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6835.     204404   29.9 
    ##  2 Bulgaria               4598.      32869    7.15
    ##  3 Hungary                4116.      41087    9.98
    ##  4 Czech Republic         3541.      37092   10.5 
    ##  5 Slovakia               3249.      17725    5.46
    ##  6 Brazil                 3100.     623356  201.  
    ##  7 Argentina              2889.     119444   41.3 
    ##  8 United States          2781.     862863  310.  
    ##  9 Belgium                2774.      28863   10.4 
    ## 10 Colombia               2772.     132477   47.8 
    ## 11 Romania                2716.      59632   22.0 
    ## 12 Poland                 2711.     104373   38.5 
    ## 13 Mexico                 2697.     303301  112.  
    ## 14 Paraguay               2668.      17009    6.38
    ## 15 United Kingdom         2476.     154356   62.3 
    ## 16 Tunisia                2460.      26051   10.6 
    ## 17 Italy                  2392.     144343   60.3 
    ## 18 Chile                  2361.      39543   16.7 
    ## 19 Russia                 2332.     328105  141.  
    ## 20 Ecuador                2321.      34329   14.8

EOL
