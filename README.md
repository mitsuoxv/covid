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

Updated: 2021-04-08

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
    ##  1 United States           76189. 30475874            400
    ##  2 Brazil                  33368. 13013601            390
    ##  3 India                   32909. 12801785            389
    ##  4 Russia                  11964.  4606162            385
    ##  5 France                  11852.  4764504            402
    ##  6 United Kingdom          10911.  4364533            400
    ##  7 Turkey                   9296.  3579185            385
    ##  8 Italy                    9014.  3686707            409
    ##  9 Spain                    8274.  3317948            401
    ## 10 Germany                  7222.  2910445            403
    ## 11 Colombia                 6380.  2456409            385
    ## 12 Poland                   6354.  2471617            389
    ## 13 Argentina                6268.  2407159            384
    ## 14 Mexico                   5848.  2251705            385
    ## 15 Iran                     4824.  1963394            407
    ## 16 Ukraine                  4708.  1784579            379
    ## 17 Peru                     4119.  1590209            386
    ## 18 South Africa             4033.  1552853            385
    ## 19 Czech Republic           3991.  1560777            391
    ## 20 Indonesia                3975.  1542516            388

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                381.             148986.            391
    ##  2 Israel                        291.             113508.            390
    ##  3 Jordan                        264.             100740.            381
    ##  4 United States                 246.              98235.            400
    ##  5 Serbia                        222.              85199.            384
    ##  6 Sweden                        221.              87380.            396
    ##  7 Belgium                       218.              86963.            399
    ##  8 Switzerland                   200.              80133.            400
    ##  9 Netherlands                   199.              78883.            396
    ## 10 Portugal                      198.              77217.            390
    ## 11 France                        183.              73562.            402
    ## 12 Hungary                       181.              69493.            383
    ## 13 Spain                         178.              71345.            401
    ## 14 United Kingdom                175.              70002.            400
    ## 15 Slovakia                      175.              67045.            384
    ## 16 Austria                       173.              68221.            395
    ## 17 Brazil                        166.              64711.            390
    ## 18 Poland                        165.              64198.            389
    ## 19 Chile                         160.              61970.            387
    ## 20 Argentina                     152.              58224.            384

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                19.6         977     4979
    ##  2 Mexico                9.08     204399  2251705
    ##  3 Syria                 6.78       1332    19641
    ##  4 Sudan                 6.48       2063    31833
    ##  5 Egypt                 5.93      12253   206510
    ##  6 Ecuador               5.04      17004   337702
    ##  7 Somalia               4.81        576    11978
    ##  8 China                 4.71       4851   102970
    ##  9 Bolivia               4.48      12344   275392
    ## 10 Afghanistan           4.42       2512    56873
    ## 11 Zimbabwe              4.14       1531    36966
    ## 12 Tanzania              4.13         21      509
    ## 13 Bulgaria              3.86      13918   360863
    ## 14 Niger                 3.73        188     5042
    ## 15 Mali                  3.68        396    10750
    ## 16 Chad                  3.61        166     4603
    ## 17 Guatemala             3.52       6894   195680
    ## 18 Tunisia               3.44       9039   263043
    ## 19 South Africa          3.42      53032  1552853
    ## 20 Peru                  3.34      53138  1590209

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Czech Republic         2609.      27329   10.5 
    ##  2 Hungary                2245.      22409    9.98
    ##  3 Belgium                2235.      23247   10.4 
    ##  4 United Kingdom         2035.     126882   62.3 
    ##  5 Bulgaria               1947.      13918    7.15
    ##  6 Italy                  1852.     111747   60.3 
    ##  7 Slovakia               1850.      10094    5.46
    ##  8 Mexico                 1817.     204399  112.  
    ##  9 United States          1780.     552125  310.  
    ## 10 Peru                   1777.      53138   29.9 
    ## 11 Brazil                 1655.     332752  201.  
    ## 12 Spain                  1632.      75911   46.5 
    ## 13 Portugal               1582.      16887   10.7 
    ## 14 France                 1493.      96673   64.8 
    ## 15 Poland                 1447.      55703   38.5 
    ## 16 Chile                  1417.      23734   16.7 
    ## 17 Sweden                 1416.      13533    9.56
    ## 18 Argentina              1366.      56471   41.3 
    ## 19 Colombia               1345.      64293   47.8 
    ## 20 Switzerland            1279.       9697    7.58

EOL
