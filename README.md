WHO, Covid-19 situation report
================
Mitsuo Shiota
2020/3/7

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

Updated: 2021-05-07

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
    ##  1 United States           74983. 32167970            429
    ##  2 India                   50424. 21077410            418
    ##  3 Brazil                  35458. 14856888            419
    ##  4 France                  13030.  5616180            431
    ##  5 Turkey                  11970.  4955594            414
    ##  6 Russia                  11727.  4855128            414
    ##  7 United Kingdom          10317.  4425944            429
    ##  8 Italy                    9293.  4070400            438
    ##  9 Spain                    8258.  3551262            430
    ## 10 Germany                  8040.  3473503            432
    ## 11 Argentina                7378.  3047417            413
    ## 12 Colombia                 7052.  2919805            414
    ## 13 Poland                   6742.  2818378            418
    ## 14 Iran                     5944.  2591609            436
    ## 15 Mexico                   5683.  2352964            414
    ## 16 Ukraine                  5139.  2097024            408
    ## 17 Peru                     4382.  1818689            415
    ## 18 Indonesia                4056.  1691658            417
    ## 19 Czech Republic           3907.  1641120            420
    ## 20 South Africa             3836.  1588221            414

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                373.             156655.            420
    ##  2 Jordan                        273.             111895.            410
    ##  3 Israel                        272.             114056.            419
    ##  4 Sweden                        245.             104186.            425
    ##  5 United States                 242.             103690.            429
    ##  6 Serbia                        229.              94743.            413
    ##  7 Belgium                       225.              96486.            428
    ##  8 Netherlands                   217.              92028.            425
    ##  9 Switzerland                   204.              87631.            429
    ## 10 France                        201.              86712.            431
    ## 11 Hungary                       191.              78907.            412
    ## 12 Portugal                      187.              78503.            419
    ## 13 Austria                       179.              75833.            424
    ## 14 Argentina                     178.              73710.            413
    ## 15 Spain                         178.              76361.            430
    ## 16 Brazil                        176.              73877.            419
    ## 17 Chile                         176.              73027.            416
    ## 18 Poland                        175.              73205.            418
    ## 19 Slovakia                      171.              70515.            413
    ## 20 United Kingdom                165.              70987.            429

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                19.6        1261     6418
    ##  2 Mexico                9.25     217740  2352964
    ##  3 Syria                 7.03       1625    23121
    ##  4 Sudan                 6.86       2365    34461
    ##  5 Egypt                 5.86      13655   232905
    ##  6 Somalia               5.19        745    14368
    ##  7 Ecuador               4.81      18907   393048
    ##  8 China                 4.68       4858   103731
    ##  9 Afghanistan           4.36       2664    61162
    ## 10 Bolivia               4.21      13082   310572
    ## 11 Tanzania              4.13         21      509
    ## 12 Bulgaria              4.11      16773   407827
    ## 13 Zimbabwe              4.10       1574    38357
    ## 14 Niger                 3.62        192     5309
    ## 15 Hungary               3.59      28297   787647
    ## 16 Tunisia               3.52      11122   315600
    ## 17 Mali                  3.52        493    13998
    ## 18 Chad                  3.51        170     4847
    ## 19 Peru                  3.45      62674  1818689
    ## 20 South Africa          3.44      54557  1588221

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Hungary                2835.      28297    9.98
    ##  2 Czech Republic         2818.      29521   10.5 
    ##  3 Bulgaria               2346.      16773    7.15
    ##  4 Belgium                2346.      24406   10.4 
    ##  5 Slovakia               2185.      11920    5.46
    ##  6 Peru                   2096.      62674   29.9 
    ##  7 Brazil                 2047.     411588  201.  
    ##  8 United Kingdom         2046.     127570   62.3 
    ##  9 Italy                  2022.     122005   60.3 
    ## 10 Mexico                 1936.     217740  112.  
    ## 11 United States          1847.     572987  310.  
    ## 12 Poland                 1792.      68993   38.5 
    ## 13 Spain                  1689.      78566   46.5 
    ## 14 France                 1620.     104914   64.8 
    ## 15 Chile                  1596.      26726   16.7 
    ## 16 Portugal               1591.      16983   10.7 
    ## 17 Colombia               1582.      75627   47.8 
    ## 18 Argentina              1577.      65202   41.3 
    ## 19 Sweden                 1481.      14151    9.56
    ## 20 Jordan                 1403.       8988    6.41

EOL
