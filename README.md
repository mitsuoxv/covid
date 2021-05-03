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

Updated: 2021-05-04

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
    ##  1 United States           75229. 32047478            426
    ##  2 India                   48013. 19925604            415
    ##  3 Brazil                  35399. 14725975            416
    ##  4 France                  12999.  5563694            428
    ##  5 Turkey                  11862.  4875388            411
    ##  6 Russia                  11756.  4831744            411
    ##  7 United Kingdom          10376.  4420205            426
    ##  8 Italy                    9298   4044762            435
    ##  9 Spain                    8231.  3514942            427
    ## 10 Germany                  7986.  3425982            429
    ## 11 Argentina                7302.  2993865            410
    ## 12 Colombia                 7002.  2877746            411
    ## 13 Poland                   6761.  2805756            415
    ## 14 Iran                     5854.  2534855            433
    ## 15 Mexico                   5712.  2347780            411
    ## 16 Ukraine                  5150.  2085938            405
    ## 17 Peru                     4381.  1804915            412
    ## 18 Indonesia                4051.  1677274            414
    ## 19 Czech Republic           3920.  1634619            417
    ## 20 South Africa             3854.  1584064            411

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                374.             156035.            417
    ##  2 Israel                        274.             114030.            416
    ##  3 Jordan                        273.             111268.            407
    ##  4 United States                 242.             103301.            426
    ##  5 Sweden                        241.             101885.            422
    ##  6 Serbia                        230.              94205.            410
    ##  7 Belgium                       225.              95700.            425
    ##  8 Netherlands                   215.              90575.            422
    ##  9 Switzerland                   203.              86658.            426
    ## 10 France                        201.              85901.            428
    ## 11 Hungary                       192.              78552.            409
    ## 12 Portugal                      188.              78426.            416
    ## 13 Austria                       179.              75362.            421
    ## 14 Spain                         177.              75580.            427
    ## 15 Argentina                     177.              72415.            410
    ## 16 Brazil                        176.              73226.            416
    ## 17 Poland                        176.              72877.            415
    ## 18 Chile                         175.              72309.            413
    ## 19 Slovakia                      171.              70253.            410
    ## 20 United Kingdom                166.              70895.            426

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                19.4        1234     6345
    ##  2 Mexico                9.25     217168  2347780
    ##  3 Syria                 7.00       1603    22898
    ##  4 Sudan                 6.92       2349    33944
    ##  5 Egypt                 5.87      13469   229635
    ##  6 Somalia               5.12        713    13915
    ##  7 Ecuador               4.84      18740   387299
    ##  8 China                 4.69       4858   103667
    ##  9 Afghanistan           4.38       2642    60300
    ## 10 Bolivia               4.24      13009   306527
    ## 11 Tanzania              4.13         21      509
    ## 12 Zimbabwe              4.10       1570    38281
    ## 13 Bulgaria              4.07      16492   405194
    ## 14 Niger                 3.64        191     5251
    ## 15 Hungary               3.56      27908   784111
    ## 16 Chad                  3.52        170     4828
    ## 17 Mali                  3.51        489    13915
    ## 18 Tunisia               3.49      10868   311743
    ## 19 South Africa          3.44      54417  1584064
    ## 20 Peru                  3.42      61789  1804915

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Czech Republic         2803.      29365   10.5 
    ##  2 Hungary                2796.      27908    9.98
    ##  3 Belgium                2335.      24291   10.4 
    ##  4 Bulgaria               2307.      16492    7.15
    ##  5 Slovakia               2164.      11807    5.46
    ##  6 Peru                   2066.      61789   29.9 
    ##  7 United Kingdom         2046.     127538   62.3 
    ##  8 Brazil                 2021.     406437  201.  
    ##  9 Italy                  2008.     121177   60.3 
    ## 10 Mexico                 1931.     217168  112.  
    ## 11 United States          1842.     571302  310.  
    ## 12 Poland                 1769.      68105   38.5 
    ## 13 Spain                  1679.      78080   46.5 
    ## 14 France                 1607.     104107   64.8 
    ## 15 Portugal               1590.      16977   10.7 
    ## 16 Chile                  1586.      26561   16.7 
    ## 17 Colombia               1553.      74215   47.8 
    ## 18 Argentina              1550.      64096   41.3 
    ## 19 Sweden                 1470.      14048    9.56
    ## 20 Jordan                 1389.       8897    6.41

EOL
