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

Updated: 2021-09-23

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
    ##  1 United States           72850. 42034347            577
    ##  2 India                   60200. 33531498            557
    ##  3 Brazil                  38078. 21247667            558
    ##  4 Russia                  13261.  7333557            553
    ##  5 United Kingdom          13198.  7496547            568
    ##  6 Turkey                  12485.  6904285            553
    ##  7 France                  11849.  6753865            570
    ##  8 Iran                     9495.  5459796            575
    ##  9 Argentina                9495.  5241394            552
    ## 10 Colombia                 8937.  4942249            553
    ## 11 Spain                    8678.  4937984            569
    ## 12 Italy                    8045.  4641890            577
    ## 13 Indonesia                7538.  4198678            557
    ## 14 Germany                  7287.  4160970            571
    ## 15 Mexico                   6461.  3573044            553
    ## 16 South Africa             5215.  2884134            553
    ## 17 Poland                   5206.  2899888            557
    ## 18 Ukraine                  4319.  2362559            547
    ## 19 Philippines              4312.  2401916            557
    ## 20 Peru                     3913.  2167652            554

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        302.             169075.            559
    ##  2 Czech Republic                288.             161078.            559
    ##  3 United States                 235.             135493.            577
    ##  4 Jordan                        232.             127288.            549
    ##  5 Argentina                     230.             126778.            552
    ##  6 Serbia                        217.             119722.            552
    ##  7 Sweden                        213.             120027.            564
    ##  8 Netherlands                   212.             119430.            564
    ##  9 United Kingdom                212.             120236.            568
    ## 10 Belgium                       208.             117916.            567
    ## 11 Switzerland                   192.             108800.            568
    ## 12 Brazil                        189.             105655.            558
    ## 13 Colombia                      187.             103416.            553
    ## 14 Spain                         187.             106180.            569
    ## 15 France                        183.             104277.            570
    ## 16 Portugal                      178.              99582.            558
    ## 17 Chile                         177.              98410.            555
    ## 18 Turkey                        160.              88739.            553
    ## 19 Austria                       157.              88126.            562
    ## 20 Hungary                       149.              82050.            551

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               18.9        1654     8752
    ##  2 Peru                 9.18     199036  2167652
    ##  3 Mexico               7.61     271765  3573044
    ##  4 Sudan                7.45       2835    38050
    ##  5 Syria                6.89       2146    31148
    ##  6 Ecuador              6.44      32661   507020
    ##  7 Egypt                5.70      17016   298296
    ##  8 Somalia              5.61       1079    19234
    ##  9 Afghanistan          4.65       7199   154757
    ## 10 China                4.58       5689   124232
    ## 11 Bulgaria             4.16      20224   486738
    ## 12 Myanmar              3.82      17266   451663
    ## 13 Bolivia              3.75      18664   497386
    ## 14 Malawi               3.69       2264    61382
    ## 15 Hungary              3.68      30143   819021
    ## 16 Tanzania             3.66         50     1367
    ## 17 Mali                 3.62        545    15075
    ## 18 Zimbabwe             3.56       4569   128186
    ## 19 Paraguay             3.51      16132   459665
    ## 20 Tunisia              3.50      24553   700807

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6655.     199036   29.9 
    ##  2 Hungary                3020.      30143    9.98
    ##  3 Brazil                 2939.     590955  201.  
    ##  4 Czech Republic         2906.      30446   10.5 
    ##  5 Bulgaria               2829.      20224    7.15
    ##  6 Argentina              2770.     114518   41.3 
    ##  7 Colombia               2635.     125924   47.8 
    ##  8 Paraguay               2530.      16132    6.38
    ##  9 Belgium                2454.      25524   10.4 
    ## 10 Mexico                 2416.     271765  112.  
    ## 11 Tunisia                2319.      24553   10.6 
    ## 12 Slovakia               2308.      12589    5.46
    ## 13 Chile                  2232.      37374   16.7 
    ## 14 Ecuador                2208.      32661   14.8 
    ## 15 United Kingdom         2173.     135455   62.3 
    ## 16 United States          2165.     671728  310.  
    ## 17 Italy                  2161.     130421   60.3 
    ## 18 Poland                 1962.      75523   38.5 
    ## 19 Bolivia                1876.      18664    9.95
    ## 20 Spain                  1849.      85983   46.5

EOL
