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

Updated: 2021-05-16

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
    ##  1 United States           74278. 32534073            438
    ##  2 India                   57079. 24372907            427
    ##  3 Brazil                  36060. 15433989            428
    ##  4 France                  13077.  5754154            440
    ##  5 Turkey                  12045.  5095390            423
    ##  6 Russia                  11658.  4931691            423
    ##  7 United Kingdom          10152.  4446828            438
    ##  8 Italy                    9276.  4146722            447
    ##  9 Spain                    8197.  3598452            439
    ## 10 Germany                  8129.  3584934            441
    ## 11 Argentina                7682.  3242103            422
    ## 12 Colombia                 7252.  3067879            423
    ## 13 Poland                   6679.  2851911            427
    ## 14 Iran                     6139.  2732152            445
    ## 15 Mexico                   5615.  2375115            423
    ## 16 Ukraine                  5156.  2150244            417
    ## 17 Peru                     4418.  1873316            424
    ## 18 Indonesia                4071.  1734285            426
    ## 19 Czech Republic           3851.  1652238            429
    ## 20 South Africa             3802.  1608393            423

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                368.             157716.            429
    ##  2 Jordan                        269.             112855.            419
    ##  3 Israel                        267.             114099.            428
    ##  4 Sweden                        250.             108533.            434
    ##  5 United States                 239.             104870.            438
    ##  6 Serbia                        227.              96011.            422
    ##  7 Belgium                       226.              98828.            437
    ##  8 Netherlands                   220.              95481.            434
    ##  9 Switzerland                   204.              89228.            438
    ## 10 France                        202.              88842.            440
    ## 11 Hungary                       190.              79887.            421
    ## 12 Argentina                     186.              78419.            422
    ## 13 Portugal                      184.              78810.            428
    ## 14 Brazil                        179.              76747.            428
    ## 15 Chile                         179.              76047.            425
    ## 16 Austria                       178.              76991.            433
    ## 17 Spain                         176.              77376.            439
    ## 18 Poland                        173.              74076.            427
    ## 19 Slovakia                      168.              71021.            422
    ## 20 United Kingdom                163.              71322.            438

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                19.7        1286     6527
    ##  2 Mexico                9.26     219901  2375115
    ##  3 Syria                 7.14       1688    23645
    ##  4 Sudan                 7.01       2446    34889
    ##  5 Egypt                 5.84      14206   243317
    ##  6 Somalia               5.20        753    14486
    ##  7 Ecuador               4.79      19514   407002
    ##  8 China                 4.67       4858   103986
    ##  9 Afghanistan           4.31       2733    63412
    ## 10 Bulgaria              4.17      17243   413838
    ## 11 Tanzania              4.13         21      509
    ## 12 Zimbabwe              4.11       1582    38535
    ## 13 Bolivia               4.10      13409   327224
    ## 14 Hungary               3.65      29114   797429
    ## 15 Tunisia               3.61      11727   325280
    ## 16 Niger                 3.60        192     5326
    ## 17 Mali                  3.60        510    14163
    ## 18 Chad                  3.52        172     4891
    ## 19 Peru                  3.49      65316  1873316
    ## 20 South Africa          3.43      55124  1608393

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Hungary                2917.      29114    9.98
    ##  2 Czech Republic         2853.      29886   10.5 
    ##  3 Bulgaria               2412.      17243    7.15
    ##  4 Belgium                2371.      24664   10.4 
    ##  5 Slovakia               2237.      12203    5.46
    ##  6 Peru                   2184.      65316   29.9 
    ##  7 Brazil                 2140.     430417  201.  
    ##  8 Italy                  2054.     123927   60.3 
    ##  9 United Kingdom         2048.     127668   62.3 
    ## 10 Mexico                 1955.     219901  112.  
    ## 11 United States          1866.     578984  310.  
    ## 12 Poland                 1860.      71609   38.5 
    ## 13 Spain                  1705.      79281   46.5 
    ## 14 Argentina              1675.      69254   41.3 
    ## 15 Colombia               1669.      79760   47.8 
    ## 16 Chile                  1651.      27647   16.7 
    ## 17 France                 1647.     106666   64.8 
    ## 18 Portugal               1592.      16999   10.7 
    ## 19 Sweden                 1494.      14275    9.56
    ## 20 Jordan                 1440.       9224    6.41

EOL
