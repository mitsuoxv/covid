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

Updated: 2022-02-05

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
    ##  1 United States          106811. 75087972            703
    ##  2 India                   60625. 41952712            692
    ##  3 Brazil                  37219. 25793112            693
    ##  4 France                  27796. 19596336            705
    ##  5 United Kingdom          25011. 17607836            704
    ##  6 Russia                  18100. 12452765            688
    ##  7 Turkey                  17354. 11939804            688
    ##  8 Italy                   15939. 11348701            712
    ##  9 Germany                 15115. 10671602            706
    ## 10 Spain                   14488. 10199716            704
    ## 11 Argentina               12395.  8515285            687
    ## 12 Iran                     9132.  6483799            710
    ## 13 Colombia                 8600.  5916825            688
    ## 14 Poland                   7346.  5083332            692
    ## 15 Mexico                   7184.  4985689            694
    ## 16 Netherlands              6707.  4688119            699
    ## 17 Indonesia                6426.  4446694            692
    ## 18 Ukraine                  6178.  4213675            682
    ## 19 South Africa             5251.  3612809            688
    ## 20 Philippines              5181.  3585461            692

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        604.             420056.            695
    ##  2 Denmark                       494.             344121.            697
    ##  3 Belgium                       447.             314107.            702
    ##  4 Czech Republic                438.             303714.            694
    ##  5 Switzerland                   436.             306252.            703
    ##  6 France                        429.             302560.            705
    ##  7 Netherlands                   403.             281653.            699
    ##  8 United Kingdom                401.             282410.            704
    ##  9 Portugal                      378.             261880.            693
    ## 10 United States                 344.             242037.            703
    ## 11 Austria                       344.             239971.            697
    ## 12 Serbia                        343.             235605.            687
    ## 13 Sweden                        338.             236467.            699
    ## 14 Spain                         312.             219321.            704
    ## 15 Argentina                     300.             205966.            687
    ## 16 Slovakia                      288.             198337.            688
    ## 17 Jordan                        288.             196811.            684
    ## 18 Italy                         264.             188078.            712
    ## 19 Greece                        262.             182019.            694
    ## 20 Hungary                       236.             161976.            686

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               18.1        2018    11145
    ##  2 Peru                 6.28     206220  3286151
    ##  3 Mexico               6.16     306920  4985689
    ##  4 Sudan                6.09       3588    58874
    ##  5 Syria                5.81       2995    51569
    ##  6 Egypt                5.28      22735   430480
    ##  7 Somalia              5.12       1335    26067
    ##  8 Ecuador              4.68      34572   739297
    ##  9 Afghanistan          4.50       7420   164727
    ## 10 China                4.07       5700   139891
    ## 11 Myanmar              3.60      19310   536904
    ## 12 Niger                3.48        301     8656
    ## 13 Bulgaria             3.43      33588   980402
    ## 14 Indonesia            3.25     144453  4446694
    ## 15 Malawi               3.03       2564    84632
    ## 16 Paraguay             2.93      17426   594430
    ## 17 El Salvador          2.90       3921   135109
    ## 18 Tunisia              2.86      26429   924375
    ## 19 Haiti                2.72        804    29549
    ## 20 Russia               2.68     334039 12452765

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6895.     206220   29.9 
    ##  2 Bulgaria               4698.      33588    7.15
    ##  3 Hungary                4182.      41741    9.98
    ##  4 Czech Republic         3567.      37363   10.5 
    ##  5 Slovakia               3285.      17921    5.46
    ##  6 Brazil                 3128.     628960  201.  
    ##  7 Argentina              2955.     122152   41.3 
    ##  8 United States          2863.     888113  310.  
    ##  9 Colombia               2820.     134781   47.8 
    ## 10 Belgium                2805.      29185   10.4 
    ## 11 Poland                 2761.     106306   38.5 
    ## 12 Romania                2748.      60353   22.0 
    ## 13 Paraguay               2733.      17426    6.38
    ## 14 Mexico                 2729.     306920  112.  
    ## 15 United Kingdom         2530.     157730   62.3 
    ## 16 Tunisia                2496.      26429   10.6 
    ## 17 Italy                  2448.     147734   60.3 
    ## 18 Chile                  2378.      39824   16.7 
    ## 19 Russia                 2374.     334039  141.  
    ## 20 Ecuador                2337.      34572   14.8

EOL
