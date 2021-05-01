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

Updated: 2021-05-02

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
    ##  1 United States           75351. 31948761            424
    ##  2 India                   46404. 19164969            413
    ##  3 Brazil                  35243. 14590678            414
    ##  4 France                  12981.  5529820            426
    ##  5 Turkey                  11786.  4820591            409
    ##  6 Russia                  11771.  4814558            409
    ##  7 United Kingdom          10416.  4416627            424
    ##  8 Italy                    9290.  4022653            433
    ##  9 Spain                    8270.  3514942            425
    ## 10 Germany                  7964.  3400532            427
    ## 11 Argentina                7242.  2954943            408
    ## 12 Colombia                 6948.  2841934            409
    ## 13 Poland                   6776.  2798617            413
    ## 14 Iran                     5798.  2499077            431
    ## 15 Mexico                   5723.  2340934            409
    ## 16 Ukraine                  5156.  2078086            403
    ## 17 Peru                     4370.  1791998            410
    ## 18 Indonesia                4049.  1668368            412
    ## 19 Czech Republic           3934.  1632932            415
    ## 20 South Africa             3866.  1581210            409

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                376.             155874.            415
    ##  2 Israel                        275.             114017.            414
    ##  3 Jordan                        274.             111029.            405
    ##  4 United States                 243.             102983.            424
    ##  5 Sweden                        243.             101885.            420
    ##  6 Serbia                        230.              93883.            408
    ##  7 Belgium                       225.              95187.            423
    ##  8 Netherlands                   214.              89898.            420
    ##  9 Switzerland                   204.              86658.            424
    ## 10 France                        200.              85378.            426
    ## 11 Hungary                       192.              78271.            407
    ## 12 Portugal                      189.              78353.            414
    ## 13 Austria                       179.              74949.            419
    ## 14 Spain                         178.              75580.            425
    ## 15 Poland                        176.              72691.            413
    ## 16 Brazil                        175.              72553.            414
    ## 17 Argentina                     175.              71473.            408
    ## 18 Chile                         174.              71552.            411
    ## 19 Slovakia                      172.              70159.            408
    ## 20 United Kingdom                167.              70838.            424

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                19.4        1227     6321
    ##  2 Mexico                9.25     216447  2340934
    ##  3 Syria                 7.00       1592    22733
    ##  4 Sudan                 6.92       2349    33944
    ##  5 Egypt                 5.86      13339   227552
    ##  6 Somalia               5.12        713    13915
    ##  7 Ecuador               4.88      18631   381862
    ##  8 China                 4.69       4857   103622
    ##  9 Afghanistan           4.39       2631    59939
    ## 10 Bolivia               4.26      12951   303732
    ## 11 Tanzania              4.13         21      509
    ## 12 Zimbabwe              4.10       1567    38257
    ## 13 Bulgaria              4.06      16399   404380
    ## 14 Niger                 3.65        191     5228
    ## 15 Hungary               3.55      27701   781299
    ## 16 Chad                  3.53        170     4817
    ## 17 Mali                  3.49        484    13858
    ## 18 Tunisia               3.47      10722   309119
    ## 19 South Africa          3.44      54350  1581210
    ## 20 Peru                  3.41      61101  1791998

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Czech Republic         2798.      29316   10.5 
    ##  2 Hungary                2775.      27701    9.98
    ##  3 Belgium                2329.      24230   10.4 
    ##  4 Bulgaria               2294.      16399    7.15
    ##  5 Slovakia               2151.      11732    5.46
    ##  6 United Kingdom         2045.     127517   62.3 
    ##  7 Peru                   2043.      61101   29.9 
    ##  8 Italy                  2002.     120807   60.3 
    ##  9 Brazil                 1995.     401186  201.  
    ## 10 Mexico                 1925.     216447  112.  
    ## 11 United States          1836.     569722  310.  
    ## 12 Poland                 1764.      67924   38.5 
    ## 13 Spain                  1679.      78080   46.5 
    ## 14 France                 1603.     103830   64.8 
    ## 15 Portugal               1590.      16974   10.7 
    ## 16 Chile                  1574.      26353   16.7 
    ## 17 Argentina              1536.      63508   41.3 
    ## 18 Colombia               1532.      73230   47.8 
    ## 19 Sweden                 1470.      14048    9.56
    ## 20 Jordan                 1379.       8836    6.41

EOL
