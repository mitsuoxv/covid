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

Updated: 2021-07-20

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
    ##  1 United States           65865. 33723155            512
    ##  2 India                   63301. 31144229            492
    ##  3 Brazil                  39234. 19342448            493
    ##  4 Russia                  12259.  5982766            488
    ##  5 France                  11385.  5749620            505
    ##  6 Turkey                  11331   5529719            488
    ##  7 United Kingdom          10803.  5433943            503
    ##  8 Argentina                9752.  4749443            487
    ##  9 Colombia                 9470.  4621260            488
    ## 10 Spain                    8913.  4492066            504
    ## 11 Italy                    8374.  4287458            512
    ## 12 Germany                  7401.  3745227            506
    ## 13 Iran                     6908.  3523263            510
    ## 14 Indonesia                5918.  2911733            492
    ## 15 Poland                   5856.  2881491            492
    ## 16 Mexico                   5440.  2654699            488
    ## 17 South Africa             4703.  2295095            488
    ## 18 Ukraine                  4657.  2244677            482
    ## 19 Peru                     4278.  2092125            489
    ## 20 Netherlands              3604.  1798570            499

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                323.             159521.            494
    ##  2 Jordan                        245.             118810.            484
    ##  3 Argentina                     236.             114878.            487
    ##  4 Israel                        234.             115879.            495
    ##  5 Sweden                        229.             114514.            499
    ##  6 Netherlands                   217.             108055.            499
    ##  7 United States                 212.             108703.            512
    ##  8 Belgium                       211.             106067.            502
    ##  9 Serbia                        201.              97836.            487
    ## 10 Colombia                      198.              96699.            488
    ## 11 Brazil                        195.              96182.            493
    ## 12 Chile                         195.              95535.            490
    ## 13 Spain                         192.              96591.            504
    ## 14 Switzerland                   185.              92972.            503
    ## 15 Portugal                      177.              87175.            493
    ## 16 France                        176.              88772.            505
    ## 17 United Kingdom                173.              87154.            503
    ## 18 Hungary                       167.              81018.            486
    ## 19 Austria                       159.              79142.            498
    ## 20 Poland                        152.              74844.            492

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.6        1368     6981
    ##  2 Peru                 9.32     195047  2092125
    ##  3 Mexico               8.90     236240  2654699
    ##  4 Sudan                7.47       2776    37138
    ##  5 Syria                7.37       1905    25834
    ##  6 Egypt                5.80      16446   283703
    ##  7 Somalia              5.16        781    15123
    ##  8 China                4.69       5616   119698
    ##  9 Ecuador              4.62      21933   475215
    ## 10 Afghanistan          4.39       6213   141489
    ## 11 Bulgaria             4.30      18174   422965
    ## 12 Tanzania             4.13         21      509
    ## 13 Bolivia              3.78      17443   461714
    ## 14 Hungary              3.71      30015   808725
    ## 15 Mali                 3.65        530    14514
    ## 16 Chad                 3.51        174     4964
    ## 17 Niger                3.47        194     5587
    ## 18 Tunisia              3.21      17527   546233
    ## 19 Paraguay             3.20      14230   444427
    ## 20 Slovakia             3.19      12527   392104

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6522.     195047   29.9 
    ##  2 Hungary                3007.      30015    9.98
    ##  3 Czech Republic         2896.      30338   10.5 
    ##  4 Brazil                 2691.     541266  201.  
    ##  5 Bulgaria               2542.      18174    7.15
    ##  6 Argentina              2453.     101434   41.3 
    ##  7 Colombia               2424.     115831   47.8 
    ##  8 Belgium                2423.      25209   10.4 
    ##  9 Slovakia               2296.      12527    5.46
    ## 10 Paraguay               2232.      14230    6.38
    ## 11 Italy                  2119.     127867   60.3 
    ## 12 Mexico                 2100.     236240  112.  
    ## 13 United Kingdom         2064.     128708   62.3 
    ## 14 Chile                  2061.      34514   16.7 
    ## 15 Poland                 1954.      75215   38.5 
    ## 16 United States          1946.     603790  310.  
    ## 17 Spain                  1765.      82082   46.5 
    ## 18 Bolivia                1754.      17443    9.95
    ## 19 France                 1706.     110497   64.8 
    ## 20 Tunisia                1655.      17527   10.6

EOL
