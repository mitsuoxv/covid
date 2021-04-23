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

Updated: 2021-04-24

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
    ##  1 United States           75793. 31530214            416
    ##  2 India                   40157. 16263695            405
    ##  3 Brazil                  34785. 14122795            406
    ##  4 France                  12740.  5325495            418
    ##  5 Russia                  11832.  4744961            401
    ##  6 Turkey                  11225.  4501382            401
    ##  7 United Kingdom          10573.  4398435            416
    ##  8 Italy                    9225.  3920945            425
    ##  9 Spain                    8290.  3456886            417
    ## 10 Germany                  7745.  3245253            419
    ## 11 Argentina                6924.  2769552            400
    ## 12 Poland                   6770.  2742122            405
    ## 13 Colombia                 6736.  2701313            401
    ## 14 Mexico                   5775.  2315811            401
    ## 15 Iran                     5522.  2335905            423
    ## 16 Ukraine                  5075.  2004630            395
    ## 17 Peru                     4295.  1726806            402
    ## 18 Indonesia                4026.  1626812            404
    ## 19 Czech Republic           3969.  1615461            407
    ## 20 South Africa             3918.  1571348            401

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                379.             154206.            407
    ##  2 Israel                        281.             113934.            406
    ##  3 Jordan                        274.             108862.            397
    ##  4 United States                 244.             101634.            416
    ##  5 Sweden                        237.              97539.            412
    ##  6 Serbia                        229.              91700.            400
    ##  7 Belgium                       223.              92716.            415
    ##  8 Netherlands                   209.              86263.            412
    ##  9 Switzerland                   203.              84614.            416
    ## 10 France                        197.              82224.            418
    ## 11 Portugal                      192.              78015.            406
    ## 12 Hungary                       192.              76577.            399
    ## 13 Spain                         178.              74332.            417
    ## 14 Austria                       178.              72978.            411
    ## 15 Poland                        176.              71224.            405
    ## 16 Slovakia                      173.              69411.            400
    ## 17 Brazil                        173.              70227.            406
    ## 18 Chile                         170.              68571.            403
    ## 19 United Kingdom                170.              70546.            416
    ## 20 Argentina                     167.              66989.            400

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                19.2        1158     6024
    ##  2 Mexico                9.22     213597  2315811
    ##  3 Syria                 6.89       1496    21725
    ##  4 Sudan                 6.83       2300    33673
    ##  5 Egypt                 5.88      12914   219774
    ##  6 Somalia               5.12        689    13459
    ##  7 Ecuador               4.92      17965   365393
    ##  8 China                 4.70       4856   103419
    ##  9 Afghanistan           4.38       2565    58542
    ## 10 Bolivia               4.34      12731   293061
    ## 11 Tanzania              4.13         21      509
    ## 12 Zimbabwe              4.09       1555    38018
    ## 13 Bulgaria              3.98      15721   394594
    ## 14 Niger                 3.72        191     5141
    ## 15 Chad                  3.57        169     4735
    ## 16 South Africa          3.44      53995  1571348
    ## 17 Hungary               3.43      26208   764394
    ## 18 Tunisia               3.42      10063   294138
    ## 19 Mali                  3.40        456    13420
    ## 20 Guatemala             3.38       7309   216329

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Czech Republic         2755.      28863   10.5 
    ##  2 Hungary                2626.      26208    9.98
    ##  3 Belgium                2298.      23909   10.4 
    ##  4 Bulgaria               2199.      15721    7.15
    ##  5 Slovakia               2091.      11405    5.46
    ##  6 United Kingdom         2042.     127345   62.3 
    ##  7 Italy                  1961.     118357   60.3 
    ##  8 Peru                   1948.      58261   29.9 
    ##  9 Mexico                 1899.     213597  112.  
    ## 10 Brazil                 1897.     381475  201.  
    ## 11 United States          1818.     564091  310.  
    ## 12 Poland                 1681.      64707   38.5 
    ## 13 Spain                  1666.      77496   46.5 
    ## 14 Portugal               1588.      16956   10.7 
    ## 15 France                 1567.     101513   64.8 
    ## 16 Chile                  1525.      25532   16.7 
    ## 17 Colombia               1456.      69596   47.8 
    ## 18 Argentina              1453.      60083   41.3 
    ## 19 Sweden                 1453.      13882    9.56
    ## 20 Jordan                 1323.       8474    6.41

EOL
