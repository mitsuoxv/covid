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

Updated: 2022-01-06

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
    ##  1 United States           83168. 55972114            673
    ##  2 India                   52898. 35018358            662
    ##  3 Brazil                  33642. 22305078            663
    ##  4 United Kingdom          20330. 13641524            671
    ##  5 Russia                  16088. 10585984            658
    ##  6 France                  15283. 10316283            675
    ##  7 Turkey                  14668.  9651503            658
    ##  8 Germany                 10795.  7297320            676
    ##  9 Spain                   10067.  6785287            674
    ## 10 Italy                    9629.  6566947            682
    ## 11 Iran                     9118.  6200296            680
    ## 12 Argentina                8735.  5739326            657
    ## 13 Colombia                 7889.  5191021            658
    ## 14 Indonesia                6441.  4264136            662
    ## 15 Poland                   6288.  4162715            662
    ## 16 Mexico                   6014.  3993464            664
    ## 17 Ukraine                  5648.  3682659            652
    ## 18 South Africa             5294.  3483590            658
    ## 19 Netherlands              4781.  3198835            669
    ## 20 Philippines              4322.  2861119            662

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                360.             238963.            664
    ##  2 United Kingdom                326.             218795.            671
    ##  3 Belgium                       308.             206855.            672
    ##  4 Israel                        290.             193130.            665
    ##  5 Netherlands                   287.             192180.            669
    ##  6 Serbia                        272.             178471.            657
    ##  7 Switzerland                   272.             182747.            673
    ##  8 United States                 268.             180420.            673
    ##  9 Jordan                        255.             166932.            654
    ## 10 Slovakia                      238.             156447.            658
    ## 11 Denmark                       236.             157752.            667
    ## 12 France                        236.             159280.            675
    ## 13 Austria                       236.             157311.            667
    ## 14 Spain                         216.             145901.            674
    ## 15 Sweden                        212.             142085.            669
    ## 16 Argentina                     211.             138822.            657
    ## 17 Portugal                      206.             136793.            663
    ## 18 Hungary                       194.             127227.            656
    ## 19 Turkey                        189.             124049.            658
    ## 20 Greece                        184.             122266.            664

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.6        1984    10143
    ##  2 Peru                 8.80     202818  2304674
    ##  3 Mexico               7.50     299581  3993464
    ##  4 Sudan                7.07       3340    47272
    ##  5 Ecuador              6.09      33686   553201
    ##  6 Syria                5.78       2912    50390
    ##  7 Somalia              5.66       1333    23532
    ##  8 Egypt                5.62      21836   388651
    ##  9 Afghanistan          4.66       7366   158207
    ## 10 China                4.29       5699   132901
    ## 11 Bulgaria             4.12      31237   757710
    ## 12 Niger                3.65        277     7590
    ## 13 Myanmar              3.63      19278   531299
    ## 14 Paraguay             3.54      16642   469523
    ## 15 Tunisia              3.50      25606   731077
    ## 16 Indonesia            3.38     144109  4264136
    ## 17 Romania              3.24      58866  1816956
    ## 18 Bolivia              3.18      19763   622312
    ## 19 El Salvador          3.13       3826   122063
    ## 20 Hungary              3.12      39599  1269979

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6782.     202818   29.9 
    ##  2 Bulgaria               4370.      31237    7.15
    ##  3 Hungary                3967.      39599    9.98
    ##  4 Czech Republic         3474.      36397   10.5 
    ##  5 Slovakia               3084.      16824    5.46
    ##  6 Brazil                 3079.     619209  201.  
    ##  7 Argentina              2836.     117245   41.3 
    ##  8 Belgium                2731.      28407   10.4 
    ##  9 Colombia               2722.     130061   47.8 
    ## 10 Romania                2681.      58866   22.0 
    ## 11 Mexico                 2664.     299581  112.  
    ## 12 United States          2648.     821408  310.  
    ## 13 Paraguay               2610.      16642    6.38
    ## 14 Poland                 2563.      98666   38.5 
    ## 15 Tunisia                2418.      25606   10.6 
    ## 16 United Kingdom         2389.     148941   62.3 
    ## 17 Chile                  2339.      39174   16.7 
    ## 18 Italy                  2288.     138045   60.3 
    ## 19 Ecuador                2278.      33686   14.8 
    ## 20 Russia                 2225.     313015  141.

EOL
