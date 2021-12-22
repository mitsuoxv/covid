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

Updated: 2021-12-23

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
    ##  1 United States           76731. 50565638            659
    ##  2 India                   53639. 34758481            648
    ##  3 Brazil                  34231. 22215856            649
    ##  4 United Kingdom          17514. 11542147            659
    ##  5 Russia                  15983. 10292983            644
    ##  6 Turkey                  14301.  9209740            644
    ##  7 France                  12814.  8469950            661
    ##  8 Germany                 10391.  6878709            662
    ##  9 Iran                     9273.  6175782            666
    ## 10 Spain                    8462.  5585055            660
    ## 11 Argentina                8390.  5395044            643
    ## 12 Italy                    8138.  5436143            668
    ## 13 Colombia                 7933.  5109022            644
    ## 14 Indonesia                6576.  4261072            648
    ## 15 Poland                   6173.  4000270            648
    ## 16 Mexico                   6052.  3934102            650
    ## 17 Ukraine                  5679.  3623179            638
    ## 18 South Africa             5174.  3332008            644
    ## 19 Netherlands              4582.  3001461            655
    ## 20 Philippines              4379.  2837719            648

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                356.             231718.            650
    ##  2 Belgium                       294.             193635.            658
    ##  3 Israel                        284.             184667.            650
    ##  4 United Kingdom                281.             185123.            659
    ##  5 Netherlands                   275.             180322.            655
    ##  6 Serbia                        272.             174920.            643
    ##  7 Jordan                        254.             162830.            640
    ##  8 United States                 247.             162993.            659
    ##  9 Switzerland                   240.             158096.            659
    ## 10 Austria                       233.             152312.            653
    ## 11 Slovakia                      232.             149606.            644
    ## 12 Argentina                     203.             130494.            643
    ## 13 Sweden                        202.             132229.            655
    ## 14 France                        198.             130773.            661
    ## 15 Hungary                       193.             123597.            642
    ## 16 Turkey                        184.             118371.            644
    ## 17 Spain                         182.             120093.            660
    ## 18 Denmark                       179.             116870.            653
    ## 19 Portugal                      178.             115550.            649
    ## 20 Brazil                        170.             110470.            649

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.6        1977    10103
    ##  2 Peru                 8.93     202295  2266205
    ##  3 Mexico               7.57     297916  3934102
    ##  4 Sudan                7.16       3298    46037
    ##  5 Ecuador              6.26      33614   537220
    ##  6 Somalia              5.75       1333    23169
    ##  7 Syria                5.73       2855    49861
    ##  8 Egypt                5.69      21457   377081
    ##  9 Afghanistan          4.65       7335   157816
    ## 10 China                4.38       5699   129988
    ## 11 Bulgaria             4.16      30303   728677
    ## 12 Niger                3.77        272     7214
    ## 13 Myanmar              3.64      19230   528639
    ## 14 Paraguay             3.57      16583   464703
    ## 15 Tunisia              3.53      25485   721450
    ## 16 Malawi               3.50       2313    66166
    ## 17 Bolivia              3.43      19459   566591
    ## 18 Indonesia            3.38     144034  4261072
    ## 19 Mali                 3.32        647    19471
    ## 20 Romania              3.24      58320  1799455

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6764.     202295   29.9 
    ##  2 Bulgaria               4239.      30303    7.15
    ##  3 Hungary                3824.      38167    9.98
    ##  4 Czech Republic         3388.      35494   10.5 
    ##  5 Brazil                 3072.     617873  201.  
    ##  6 Slovakia               2969.      16198    5.46
    ##  7 Argentina              2828.     116930   41.3 
    ##  8 Colombia               2709.     129487   47.8 
    ##  9 Belgium                2695.      28035   10.4 
    ## 10 Romania                2656.      58320   22.0 
    ## 11 Mexico                 2649.     297916  112.  
    ## 12 Paraguay               2601.      16583    6.38
    ## 13 United States          2579.     799942  310.  
    ## 14 Poland                 2411.      92829   38.5 
    ## 15 Tunisia                2407.      25485   10.6 
    ## 16 United Kingdom         2365.     147433   62.3 
    ## 17 Chile                  2323.      38894   16.7 
    ## 18 Ecuador                2273.      33614   14.8 
    ## 19 Italy                  2253.     135931   60.3 
    ## 20 Russia                 2134.     300269  141.

EOL
