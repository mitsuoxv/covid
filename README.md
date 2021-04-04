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

Updated: 2021-04-05

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
    ##  1 United States           76333. 30304462            397
    ##  2 Brazil                  33359. 12910082            387
    ##  3 India                   32346. 12485509            386
    ##  4 Russia                  11991.  4580894            382
    ##  5 France                  11693.  4665709            399
    ##  6 United Kingdom          10975.  4357095            397
    ##  7 Turkey                   9018.  3445052            382
    ##  8 Italy                    8990.  3650247            406
    ##  9 Spain                    8270.  3291394            398
    ## 10 Germany                  7213.  2885386            400
    ## 11 Colombia                 6356.  2428048            382
    ## 12 Poland                   6317.  2438542            386
    ## 13 Argentina                6228.  2373153            381
    ## 14 Mexico                   5883.  2247357            382
    ## 15 Iran                     4753.  1920394            404
    ## 16 Ukraine                  4643.  1745709            376
    ## 17 Peru                     4095.  1568345            383
    ## 18 South Africa             4061.  1551501            382
    ## 19 Czech Republic           3999.  1551896            388
    ## 20 Indonesia                3967.  1527524            385

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                382.             148138.            388
    ##  2 Israel                        293.             113308.            387
    ##  3 Jordan                        259.              97841.            378
    ##  4 United States                 246.              97683.            397
    ##  5 Serbia                        219.              83646.            381
    ##  6 Belgium                       218.              86271.            396
    ##  7 Sweden                        216.              85098.            393
    ##  8 Switzerland                   200.              79485.            397
    ##  9 Portugal                      199.              77076.            387
    ## 10 Netherlands                   198.              77821.            393
    ## 11 France                        181.              72037.            399
    ## 12 Hungary                       179.              68064.            380
    ## 13 Spain                         178.              70774.            398
    ## 14 United Kingdom                176.              69883.            397
    ## 15 Slovakia                      176.              66955.            381
    ## 16 Austria                       172.              67337.            392
    ## 17 Brazil                        166.              64196.            387
    ## 18 Poland                        164.              63339.            386
    ## 19 Chile                         157.              60400.            384
    ## 20 Argentina                     151.              57401.            381

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                19.8         933     4701
    ##  2 Mexico                9.07     203854  2247357
    ##  3 Syria                 6.74       1299    19284
    ##  4 Sudan                 6.48       2063    31833
    ##  5 Egypt                 5.94      12123   204256
    ##  6 Ecuador               5.09      16910   332038
    ##  7 China                 4.72       4851   102867
    ##  8 Somalia               4.70        546    11623
    ##  9 Bolivia               4.49      12305   273947
    ## 10 Afghanistan           4.41       2497    56676
    ## 11 Zimbabwe              4.13       1524    36911
    ## 12 Tanzania              4.13         21      509
    ## 13 Bulgaria              3.83      13507   352259
    ## 14 Mali                  3.75        391    10432
    ## 15 Niger                 3.74        188     5033
    ## 16 Chad                  3.57        164     4589
    ## 17 Guatemala             3.52       6875   195036
    ## 18 Tunisia               3.46       8931   258335
    ## 19 South Africa          3.41      52954  1551501
    ## 20 Nicaragua             3.34        178     5326

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Czech Republic         2572.      26945   10.5 
    ##  2 Belgium                2223.      23130   10.4 
    ##  3 Hungary                2154.      21504    9.98
    ##  4 United Kingdom         2034.     126826   62.3 
    ##  5 Bulgaria               1889.      13507    7.15
    ##  6 Slovakia               1838.      10025    5.46
    ##  7 Italy                  1835.     110704   60.3 
    ##  8 Mexico                 1813.     203854  112.  
    ##  9 United States          1775.     550539  310.  
    ## 10 Peru                   1750.      52331   29.9 
    ## 11 Brazil                 1632.     328206  201.  
    ## 12 Spain                  1624.      75541   46.5 
    ## 13 Portugal               1580.      16868   10.7 
    ## 14 France                 1480.      95875   64.8 
    ## 15 Poland                 1427.      54941   38.5 
    ## 16 Sweden                 1413.      13498    9.56
    ## 17 Chile                  1399.      23421   16.7 
    ## 18 Argentina              1355.      56023   41.3 
    ## 19 Colombia               1335.      63777   47.8 
    ## 20 Switzerland            1276.       9677    7.58

EOL
