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

Updated: 2021-04-30

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
    ##  1 United States           75439. 31835314            422
    ##  2 India                   44711. 18376524            411
    ##  3 Brazil                  35052. 14441563            412
    ##  4 France                  12923.  5479327            424
    ##  5 Russia                  11785.  4796557            407
    ##  6 Turkey                  11673.  4751026            407
    ##  7 United Kingdom          10454.  4411801            422
    ##  8 Italy                    9269.  3994894            431
    ##  9 Spain                    8285.  3504799            423
    ## 10 Germany                  7899.  3357268            425
    ## 11 Argentina                7155.  2905172            406
    ## 12 Colombia                 6891.  2804881            407
    ## 13 Poland                   6777.  2785353            411
    ## 14 Iran                     5734.  2459906            429
    ## 15 Mexico                   5732.  2333126            407
    ## 16 Ukraine                  5136.  2059465            401
    ## 17 Peru                     4350.  1775062            408
    ## 18 Indonesia                4041.  1657035            410
    ## 19 Czech Republic           3943.  1628536            413
    ## 20 South Africa             3878.  1578450            407

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                376.             155454.            413
    ##  2 Israel                        277.             114002.            412
    ##  3 Jordan                        274.             110544.            403
    ##  4 United States                 243.             102617.            422
    ##  5 Sweden                        240.             100516.            418
    ##  6 Serbia                        230.              93390.            406
    ##  7 Belgium                       224.              94488.            421
    ##  8 Netherlands                   213.              88995.            418
    ##  9 Switzerland                   204.              86146.            422
    ## 10 France                        200.              84599.            424
    ## 11 Hungary                       192.              77838.            405
    ## 12 Portugal                      190.              78266.            412
    ## 13 Austria                       178.              74434.            417
    ## 14 Spain                         178.              75362.            423
    ## 15 Poland                        176.              72347.            411
    ## 16 Brazil                        174.              71812.            412
    ## 17 Argentina                     173.              70270.            406
    ## 18 Chile                         173.              70718.            409
    ## 19 Slovakia                      172.              69981.            406
    ## 20 United Kingdom                168.              70760.            422

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                19.4        1217     6267
    ##  2 Mexico                9.24     215547  2333126
    ##  3 Syria                 6.98       1572    22513
    ##  4 Sudan                 6.92       2349    33944
    ##  5 Egypt                 5.86      13219   225528
    ##  6 Somalia               5.12        713    13915
    ##  7 Ecuador               4.89      18470   377662
    ##  8 China                 4.69       4857   103562
    ##  9 Afghanistan           4.39       2618    59576
    ## 10 Bolivia               4.29      12885   300258
    ## 11 Tanzania              4.13         21      509
    ## 12 Zimbabwe              4.10       1565    38191
    ## 13 Bulgaria              4.04      16278   402491
    ## 14 Niger                 3.66        191     5224
    ## 15 Chad                  3.55        170     4789
    ## 16 Hungary               3.52      27358   776983
    ## 17 Mali                  3.46        477    13780
    ## 18 Tunisia               3.46      10563   305313
    ## 19 South Africa          3.44      54285  1578450
    ## 20 Peru                  3.40      60416  1775062

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Czech Republic         2789.      29213   10.5 
    ##  2 Hungary                2741.      27358    9.98
    ##  3 Belgium                2320.      24140   10.4 
    ##  4 Bulgaria               2277.      16278    7.15
    ##  5 Slovakia               2135.      11647    5.46
    ##  6 United Kingdom         2045.     127480   62.3 
    ##  7 Peru                   2020.      60416   29.9 
    ##  8 Italy                  1993.     120256   60.3 
    ##  9 Brazil                 1964.     395022  201.  
    ## 10 Mexico                 1917.     215547  112.  
    ## 11 United States          1831.     567971  310.  
    ## 12 Poland                 1742.      67073   38.5 
    ## 13 Spain                  1676.      77943   46.5 
    ## 14 France                 1594.     103234   64.8 
    ## 15 Portugal               1590.      16973   10.7 
    ## 16 Chile                  1557.      26073   16.7 
    ## 17 Argentina              1514.      62599   41.3 
    ## 18 Colombia               1512.      72235   47.8 
    ## 19 Sweden                 1465.      14000    9.56
    ## 20 Jordan                 1366.       8754    6.41

EOL
