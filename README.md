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

Updated: 2022-02-04

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
    ##  1 United States          106534. 74787329            702
    ##  2 India                   60497. 41803318            691
    ##  3 Brazil                  37023. 25620209            692
    ##  4 France                  27446. 19322157            704
    ##  5 United Kingdom          24915. 17515203            703
    ##  6 Russia                  17881. 12284564            687
    ##  7 Turkey                  17223. 11832274            687
    ##  8 Italy                   15803. 11235745            711
    ##  9 Germany                 14784. 10422764            705
    ## 10 Spain                   14403. 10125348            703
    ## 11 Argentina               12285.  8427778            686
    ## 12 Iran                     9092.  6446404            709
    ## 13 Colombia                 8590.  5901715            687
    ## 14 Poland                   7288.  5035796            691
    ## 15 Mexico                   7194.  4985689            693
    ## 16 Netherlands              6598.  4605248            698
    ## 17 Indonesia                6388.  4414483            691
    ## 18 Ukraine                  6123.  4169897            681
    ## 19 South Africa             5259.  3612809            687
    ## 20 Philippines              5177.  3577298            691

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        596.             413688.            694
    ##  2 Denmark                       483.             336057.            696
    ##  3 Belgium                       443.             310452.            701
    ##  4 Czech Republic                433.             300106.            693
    ##  5 Switzerland                   429.             301427.            702
    ##  6 France                        424.             298327.            704
    ##  7 United Kingdom                400.             280924.            703
    ##  8 Netherlands                   396.             276675.            698
    ##  9 Portugal                      372.             257155.            692
    ## 10 United States                 343.             241068.            702
    ## 11 Serbia                        340.             233478.            686
    ## 12 Austria                       338.             235319.            696
    ## 13 Sweden                        333.             232643.            698
    ## 14 Spain                         310.             217721.            703
    ## 15 Argentina                     297.             203849.            686
    ## 16 Jordan                        288.             196811.            683
    ## 17 Slovakia                      283.             194691.            687
    ## 18 Italy                         262.             186206.            711
    ## 19 Greece                        260.             180413.            693
    ## 20 Hungary                       234.             160330.            685

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               18.1        2018    11145
    ##  2 Peru                 6.31     205985  3262165
    ##  3 Mexico               6.16     306920  4985689
    ##  4 Sudan                6.09       3588    58874
    ##  5 Syria                5.81       2995    51569
    ##  6 Egypt                5.28      22735   430480
    ##  7 Somalia              5.12       1335    26067
    ##  8 Ecuador              4.72      34533   732038
    ##  9 Afghanistan          4.52       7418   164190
    ## 10 China                4.08       5700   139665
    ## 11 Myanmar              3.60      19310   536536
    ## 12 Niger                3.48        301     8656
    ## 13 Bulgaria             3.44      33492   972260
    ## 14 Indonesia            3.27     144411  4414483
    ## 15 Malawi               3.03       2564    84632
    ## 16 Haiti                3.00        876    29217
    ## 17 Paraguay             2.95      17386   589318
    ## 18 El Salvador          2.90       3914   135109
    ## 19 Tunisia              2.86      26429   924375
    ## 20 Russia               2.71     333357 12284564

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6888.     205985   29.9 
    ##  2 Bulgaria               4685.      33492    7.15
    ##  3 Hungary                4171.      41636    9.98
    ##  4 Czech Republic         3563.      37325   10.5 
    ##  5 Slovakia               3281.      17896    5.46
    ##  6 Brazil                 3123.     628067  201.  
    ##  7 Argentina              2939.     121513   41.3 
    ##  8 United States          2851.     884477  310.  
    ##  9 Colombia               2815.     134551   47.8 
    ## 10 Belgium                2800.      29132   10.4 
    ## 11 Poland                 2755.     106060   38.5 
    ## 12 Romania                2743.      60242   22.0 
    ## 13 Mexico                 2729.     306920  112.  
    ## 14 Paraguay               2727.      17386    6.38
    ## 15 United Kingdom         2525.     157409   62.3 
    ## 16 Tunisia                2496.      26429   10.6 
    ## 17 Italy                  2441.     147320   60.3 
    ## 18 Chile                  2373.      39742   16.7 
    ## 19 Russia                 2369.     333357  141.  
    ## 20 Ecuador                2335.      34533   14.8

EOL
