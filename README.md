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

Updated: 2021-09-22

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
    ##  1 United States           72624. 41831507            576
    ##  2 India                   60260. 33504534            556
    ##  3 Brazil                  38132. 21239783            557
    ##  4 Russia                  13249.  7313851            552
    ##  5 United Kingdom          13166.  7465452            567
    ##  6 Turkey                  12454.  6874947            552
    ##  7 France                  11856.  6746400            569
    ##  8 Argentina                9508.  5239232            551
    ##  9 Iran                     9481.  5442232            574
    ## 10 Colombia                 8951.  4941064            552
    ## 11 Spain                    8689.  4935534            568
    ## 12 Italy                    8053.  4638516            576
    ## 13 Indonesia                7546.  4195958            556
    ## 14 Germany                  7281.  4150516            570
    ## 15 Mexico                   6467.  3569677            552
    ## 16 South Africa             5225.  2884134            552
    ## 17 Poland                   5214.  2899008            556
    ## 18 Ukraine                  4314.  2355805            546
    ## 19 Philippines              4290.  2385616            556
    ## 20 Peru                     3918.  2167008            553

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        299.             166980.            558
    ##  2 Czech Republic                289.             161021.            558
    ##  3 United States                 234.             134839.            576
    ##  4 Jordan                        232.             127152.            548
    ##  5 Argentina                     230.             126725.            551
    ##  6 Serbia                        215.             118738.            551
    ##  7 Sweden                        213.             119819.            563
    ##  8 Netherlands                   212.             119330.            563
    ##  9 United Kingdom                211.             119738.            567
    ## 10 Belgium                       208.             117743.            566
    ## 11 Switzerland                   192.             108638.            567
    ## 12 Brazil                        190.             105616.            557
    ## 13 Colombia                      187.             103391.            552
    ## 14 Spain                         187.             106127.            568
    ## 15 France                        183.             104162.            569
    ## 16 Portugal                      179.              99509.            557
    ## 17 Chile                         178.              98394.            554
    ## 18 Turkey                        160.              88362.            552
    ## 19 Austria                       157.              87975.            561
    ## 20 Hungary                       149.              82000.            550

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               18.9        1649     8718
    ##  2 Peru                 9.18     199006  2167008
    ##  3 Mexico               7.61     271503  3569677
    ##  4 Sudan                7.45       2835    38042
    ##  5 Syria                6.91       2136    30913
    ##  6 Ecuador              6.44      32661   507003
    ##  7 Egypt                5.71      16992   297608
    ##  8 Somalia              5.61       1079    19234
    ##  9 Afghanistan          4.65       7199   154712
    ## 10 China                4.58       5689   124185
    ## 11 Bulgaria             4.16      20166   484546
    ## 12 Myanmar              3.82      17202   449845
    ## 13 Bolivia              3.75      18659   497100
    ## 14 Malawi               3.69       2264    61382
    ## 15 Hungary              3.68      30141   818520
    ## 16 Tanzania             3.66         50     1367
    ## 17 Mali                 3.62        545    15075
    ## 18 Zimbabwe             3.56       4569   128186
    ## 19 Paraguay             3.51      16128   459650
    ## 20 Tunisia              3.50      24553   700807

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6654.     199006   29.9 
    ##  2 Hungary                3020.      30141    9.98
    ##  3 Brazil                 2938.     590752  201.  
    ##  4 Czech Republic         2906.      30442   10.5 
    ##  5 Bulgaria               2821.      20166    7.15
    ##  6 Argentina              2768.     114428   41.3 
    ##  7 Colombia               2634.     125895   47.8 
    ##  8 Paraguay               2530.      16128    6.38
    ##  9 Belgium                2453.      25517   10.4 
    ## 10 Mexico                 2414.     271503  112.  
    ## 11 Tunisia                2319.      24553   10.6 
    ## 12 Slovakia               2306.      12580    5.46
    ## 13 Chile                  2231.      37367   16.7 
    ## 14 Ecuador                2208.      32661   14.8 
    ## 15 United Kingdom         2169.     135252   62.3 
    ## 16 Italy                  2160.     130354   60.3 
    ## 17 United States          2158.     669412  310.  
    ## 18 Poland                 1961.      75503   38.5 
    ## 19 Bolivia                1876.      18659    9.95
    ## 20 Spain                  1847.      85901   46.5

EOL
