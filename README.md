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

Updated: 2021-05-03

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
    ##  1 United States           75299. 32002328            425
    ##  2 India                   47240. 19557457            414
    ##  3 Brazil                  35323. 14659011            415
    ##  4 France                  13006.  5553806            427
    ##  5 Turkey                  11827.  4849408            410
    ##  6 Russia                  11764.  4823255            410
    ##  7 United Kingdom          10396.  4418534            425
    ##  8 Italy                    9298.  4035617            434
    ##  9 Spain                    8251.  3514942            426
    ## 10 Germany                  7983.  3416822            428
    ## 11 Argentina                7279.  2977363            409
    ## 12 Colombia                 6975.  2859724            410
    ## 13 Poland                   6771.  2803233            414
    ## 14 Iran                     5824.  2516157            432
    ## 15 Mexico                   5719.  2344755            410
    ## 16 Ukraine                  5156.  2083180            404
    ## 17 Peru                     4378.  1799445            411
    ## 18 Indonesia                4050.  1672880            413
    ## 19 Czech Republic           3928.  1634114            416
    ## 20 South Africa             3860.  1582842            410

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                375.             155986.            416
    ##  2 Israel                        275.             114025.            415
    ##  3 Jordan                        274.             111139.            406
    ##  4 United States                 243.             103156.            425
    ##  5 Sweden                        242.             101885.            421
    ##  6 Serbia                        230.              94070.            409
    ##  7 Belgium                       225.              95495.            424
    ##  8 Netherlands                   214.              90244.            421
    ##  9 Switzerland                   204.              86658.            425
    ## 10 France                        201.              85749.            427
    ## 11 Hungary                       192.              78430.            408
    ## 12 Portugal                      189.              78395.            415
    ## 13 Austria                       179.              75151.            420
    ## 14 Spain                         177.              75580.            426
    ## 15 Argentina                     176.              72016.            409
    ## 16 Poland                        176.              72811.            414
    ## 17 Brazil                        176.              72893.            415
    ## 18 Chile                         175.              71941.            412
    ## 19 Slovakia                      171.              70159.            409
    ## 20 United Kingdom                167.              70868.            425

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                19.4        1230     6329
    ##  2 Mexico                9.25     216907  2344755
    ##  3 Syria                 7.00       1598    22818
    ##  4 Sudan                 6.92       2349    33944
    ##  5 Egypt                 5.86      13402   228584
    ##  6 Somalia               5.12        713    13915
    ##  7 Ecuador               4.87      18724   384589
    ##  8 China                 4.69       4858   103649
    ##  9 Afghanistan           4.39       2637    60122
    ## 10 Bolivia               4.25      12975   305594
    ## 11 Tanzania              4.13         21      509
    ## 12 Zimbabwe              4.10       1568    38260
    ## 13 Bulgaria              4.06      16444   404846
    ## 14 Niger                 3.65        191     5228
    ## 15 Hungary               3.55      27802   782892
    ## 16 Chad                  3.52        170     4824
    ## 17 Mali                  3.49        485    13896
    ## 18 Tunisia               3.48      10808   310734
    ## 19 South Africa          3.44      54406  1582842
    ## 20 Peru                  3.42      61477  1799445

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Czech Republic         2801.      29343   10.5 
    ##  2 Hungary                2785.      27802    9.98
    ##  3 Belgium                2332.      24258   10.4 
    ##  4 Bulgaria               2300.      16444    7.15
    ##  5 Slovakia               2151.      11732    5.46
    ##  6 Peru                   2056.      61477   29.9 
    ##  7 United Kingdom         2045.     127524   62.3 
    ##  8 Brazil                 2008.     403781  201.  
    ##  9 Italy                  2006.     121033   60.3 
    ## 10 Mexico                 1929.     216907  112.  
    ## 11 United States          1839.     570537  310.  
    ## 12 Poland                 1768       68068   38.5 
    ## 13 Spain                  1679.      78080   46.5 
    ## 14 France                 1606.     103994   64.8 
    ## 15 Portugal               1590.      16976   10.7 
    ## 16 Chile                  1580.      26457   16.7 
    ## 17 Argentina              1545.      63865   41.3 
    ## 18 Colombia               1543.      73720   47.8 
    ## 19 Sweden                 1470.      14048    9.56
    ## 20 Jordan                 1385.       8871    6.41

EOL
