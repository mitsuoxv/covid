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

Updated: 2021-05-01

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
    ##  1 United States           75388. 31889171            423
    ##  2 India                   45541. 18762976            412
    ##  3 Brazil                  35160. 14521289            413
    ##  4 France                  12954.  5505700            425
    ##  5 Russia                  11777.  4805288            408
    ##  6 Turkey                  11737.  4788700            408
    ##  7 United Kingdom          10435.  4414246            423
    ##  8 Italy                    9280.  4009208            432
    ##  9 Spain                    8290.  3514942            424
    ## 10 Germany                  7938.  3381597            426
    ## 11 Argentina                7196.  2928890            407
    ## 12 Colombia                 6923.  2824626            408
    ## 13 Poland                   6777.  2792142            412
    ## 14 Iran                     5767.  2479805            430
    ## 15 Mexico                   5728.  2336944            408
    ## 16 Ukraine                  5148.  2069537            402
    ## 17 Peru                     4360.  1783339            409
    ## 18 Indonesia                4046.  1662868            411
    ## 19 Czech Republic           3939.  1630758            414
    ## 20 South Africa             3871.  1579536            408

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                376.             155666.            414
    ##  2 Israel                        276.             114014.            413
    ##  3 Jordan                        274.             110786.            404
    ##  4 United States                 243.             102791.            423
    ##  5 Sweden                        242.             101265.            419
    ##  6 Serbia                        230.              93663.            407
    ##  7 Belgium                       225.              94840.            422
    ##  8 Netherlands                   213.              89432.            419
    ##  9 Switzerland                   204.              86417.            423
    ## 10 France                        200.              85006.            425
    ## 11 Hungary                       192.              78075.            406
    ## 12 Portugal                      190.              78310.            413
    ## 13 Austria                       179.              74677.            418
    ## 14 Spain                         178.              75580.            424
    ## 15 Poland                        176.              72523.            412
    ## 16 Brazil                        175.              72208.            413
    ## 17 Argentina                     174.              70843.            407
    ## 18 Chile                         173.              71119.            410
    ## 19 Slovakia                      172.              70066.            407
    ## 20 United Kingdom                167.              70800.            423

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                19.4        1223     6298
    ##  2 Mexico                9.24     215918  2336944
    ##  3 Syria                 6.99       1583    22631
    ##  4 Sudan                 6.92       2349    33944
    ##  5 Egypt                 5.86      13278   226531
    ##  6 Somalia               5.12        713    13915
    ##  7 Ecuador               4.87      18552   380689
    ##  8 China                 4.69       4857   103595
    ##  9 Afghanistan           4.39       2625    59745
    ## 10 Bolivia               4.28      12920   301831
    ## 11 Tanzania              4.13         21      509
    ## 12 Zimbabwe              4.10       1567    38235
    ## 13 Bulgaria              4.05      16368   403728
    ## 14 Niger                 3.66        191     5224
    ## 15 Chad                  3.53        170     4810
    ## 16 Hungary               3.53      27540   779348
    ## 17 Mali                  3.48        481    13815
    ## 18 Tunisia               3.46      10641   307215
    ## 19 South Africa          3.44      54331  1579536
    ## 20 Peru                  3.41      60742  1783339

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Czech Republic         2794.      29267   10.5 
    ##  2 Hungary                2759.      27540    9.98
    ##  3 Belgium                2325.      24185   10.4 
    ##  4 Bulgaria               2290.      16368    7.15
    ##  5 Slovakia               2142.      11684    5.46
    ##  6 United Kingdom         2045.     127502   62.3 
    ##  7 Peru                   2031.      60742   29.9 
    ##  8 Italy                  1998.     120544   60.3 
    ##  9 Brazil                 1980.     398185  201.  
    ## 10 Mexico                 1920.     215918  112.  
    ## 11 United States          1834.     568836  310.  
    ## 12 Poland                 1753.      67502   38.5 
    ## 13 Spain                  1679.      78080   46.5 
    ## 14 France                 1599.     103540   64.8 
    ## 15 Portugal               1590.      16974   10.7 
    ## 16 Chile                  1567.      26247   16.7 
    ## 17 Argentina              1523.      62947   41.3 
    ## 18 Colombia               1522.      72725   47.8 
    ## 19 Sweden                 1465.      14002    9.56
    ## 20 Jordan                 1374.       8801    6.41

EOL
