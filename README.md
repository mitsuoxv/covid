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

Updated: 2021-05-18

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

    ## # A tibble: 20 x 4
    ##    area           speed_since_100 cum_conf days_since_100
    ##    <chr>                    <dbl>    <dbl>          <int>
    ##  1 United States           72617. 32605236            449
    ##  2 India                   58194. 24965463            429
    ##  3 Brazil                  36247. 15586534            430
    ##  4 France                  13085.  5783787            442
    ##  5 Turkey                  12040.  5117374            425
    ##  6 Russia                  11646.  4949573            425
    ##  7 United Kingdom          10115.  4450781            440
    ##  8 Italy                    9263.  4159122            449
    ##  9 Spain                    8159.  3598452            441
    ## 10 Germany                  8124.  3598846            443
    ## 11 Argentina                7761.  3290935            424
    ## 12 Colombia                 7302.  3103333            425
    ## 13 Poland                   6655.  2855190            429
    ## 14 Iran                     6154.  2751166            447
    ## 15 Mexico                   5601.  2380690            425
    ## 16 Ukraine                  5145.  2156000            419
    ## 17 Peru                     4424.  1884596            426
    ## 18 Indonesia                4065.  1739750            428
    ## 19 Czech Republic           3835.  1653099            431
    ## 20 South Africa             3797.  1613728            425

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                366.             157799.            431
    ##  2 Jordan                        268.             113024.            421
    ##  3 Israel                        265.             114104.            430
    ##  4 Sweden                        249.             108533.            436
    ##  5 United States                 234.             105099.            449
    ##  6 Serbia                        227.              96184.            424
    ##  7 Belgium                       226.              99195.            439
    ##  8 Netherlands                   220.              96015.            436
    ##  9 Switzerland                   203.              89228.            440
    ## 10 France                        202.              89300.            442
    ## 11 Hungary                       189.              80001.            423
    ## 12 Argentina                     188.              79600.            424
    ## 13 Portugal                      183.              78886.            430
    ## 14 Brazil                        180.              77505.            430
    ## 15 Chile                         180.              76825.            427
    ## 16 Austria                       177.              77157.            435
    ## 17 Spain                         175.              77376.            441
    ## 18 Poland                        173.              74161.            429
    ## 19 Slovakia                      168.              71065.            424
    ## 20 United Kingdom                162.              71386.            440

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                19.7        1290     6547
    ##  2 Mexico                9.26     220384  2380690
    ##  3 Syria                 7.15       1698    23738
    ##  4 Sudan                 7.01       2446    34889
    ##  5 Egypt                 5.83      14327   245721
    ##  6 Somalia               5.20        753    14486
    ##  7 Ecuador               4.80      19699   410129
    ##  8 China                 4.65       4858   104428
    ##  9 Afghanistan           4.32       2745    63598
    ## 10 Bulgaria              4.17      17259   414192
    ## 11 Tanzania              4.13         21      509
    ## 12 Zimbabwe              4.10       1582    38560
    ## 13 Bolivia               4.07      13493   331516
    ## 14 Hungary               3.66      29213   798573
    ## 15 Tunisia               3.63      11849   326572
    ## 16 Mali                  3.60        511    14190
    ## 17 Niger                 3.60        192     5333
    ## 18 Chad                  3.53        173     4904
    ## 19 Peru                  3.50      65911  1884596
    ## 20 South Africa          3.42      55210  1613728

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Hungary                2927.      29213    9.98
    ##  2 Czech Republic         2855.      29913   10.5 
    ##  3 Bulgaria               2414.      17259    7.15
    ##  4 Belgium                2375.      24709   10.4 
    ##  5 Slovakia               2243.      12238    5.46
    ##  6 Peru                   2204.      65911   29.9 
    ##  7 Brazil                 2162.     434715  201.  
    ##  8 Italy                  2058.     124156   60.3 
    ##  9 United Kingdom         2048.     127679   62.3 
    ## 10 Mexico                 1960.     220384  112.  
    ## 11 United States          1870.     580166  310.  
    ## 12 Poland                 1862.      71675   38.5 
    ## 13 Spain                  1705.      79281   46.5 
    ## 14 Argentina              1699.      70253   41.3 
    ## 15 Colombia               1690.      80780   47.8 
    ## 16 Chile                  1662.      27832   16.7 
    ## 17 France                 1650.     106859   64.8 
    ## 18 Portugal               1593.      17007   10.7 
    ## 19 Sweden                 1494.      14275    9.56
    ## 20 Jordan                 1445.       9259    6.41

EOL
