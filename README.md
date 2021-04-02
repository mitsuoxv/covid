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

Updated: 2021-04-03

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
    ##  1 United States           76353. 30159557            395
    ##  2 Brazil                  33113. 12748747            385
    ##  3 India                   32039. 12303131            384
    ##  4 Russia                  12008.  4563056            380
    ##  5 France                  11638.  4620357            397
    ##  6 United Kingdom          11013.  4350270            395
    ##  7 Italy                    8928.  3607083            404
    ##  8 Turkey                   8836.  3357988            380
    ##  9 Spain                    8268.  3274150            396
    ## 10 Germany                  7173.  2855061            398
    ## 11 Colombia                 6332.  2406377            380
    ## 12 Poland                   6217.  2387511            384
    ## 13 Argentina                6197.  2348821            379
    ## 14 Mexico                   5891.  2238887            380
    ## 15 Iran                     4719.  1897314            402
    ## 16 Ukraine                  4576.  1711630            374
    ## 17 South Africa             4077.  1549451            380
    ## 18 Peru                     4065.  1548807            381
    ## 19 Czech Republic           4005.  1545865            386
    ## 20 Indonesia                3963.  1517854            383

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                382.             147563.            386
    ##  2 Israel                        294.             113308.            385
    ##  3 Jordan                        257.              96465.            376
    ##  4 United States                 246.              97216.            395
    ##  5 Sweden                        218.              85098.            391
    ##  6 Serbia                        217.              82426.            379
    ##  7 Belgium                       217.              85352.            394
    ##  8 Switzerland                   200.              79189.            395
    ##  9 Portugal                      200.              77025.            385
    ## 10 Netherlands                   197.              76927.            391
    ## 11 France                        180.              71337.            397
    ## 12 Spain                         178.              70403.            396
    ## 13 Hungary                       178.              67199.            378
    ## 14 United Kingdom                177.              69774.            395
    ## 15 Slovakia                      176.              66705.            379
    ## 16 Austria                       171.              66511.            390
    ## 17 Brazil                        165.              63394.            385
    ## 18 Poland                        161.              62013.            384
    ## 19 Chile                         157.              59917.            382
    ## 20 Argentina                     150.              56813.            379

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                20           907     4535
    ##  2 Mexico                9.08     203210  2238887
    ##  3 Syria                 6.69       1274    19039
    ##  4 Sudan                 6.48       2063    31833
    ##  5 Egypt                 5.94      12041   202843
    ##  6 Ecuador               5.11      16877   330388
    ##  7 China                 4.72       4851   102790
    ##  8 Somalia               4.64        529    11398
    ##  9 Bolivia               4.50      12257   272411
    ## 10 Afghanistan           4.41       2495    56572
    ## 11 Zimbabwe              4.13       1523    36896
    ## 12 Tanzania              4.13         21      509
    ## 13 Bulgaria              3.84      13313   346327
    ## 14 Mali                  3.78        386    10199
    ## 15 Niger                 3.72        187     5026
    ## 16 Chad                  3.60        164     4552
    ## 17 Guatemala             3.52       6840   194398
    ## 18 Tunisia               3.46       8843   255308
    ## 19 South Africa          3.41      52897  1549451
    ## 20 Peru                  3.36      52008  1548807

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Czech Republic         2555.      26765   10.5 
    ##  2 Belgium                2215.      23045   10.4 
    ##  3 Hungary                2130.      21262    9.98
    ##  4 United Kingdom         2033.     126764   62.3 
    ##  5 Bulgaria               1862.      13313    7.15
    ##  6 Italy                  1820.     109847   60.3 
    ##  7 Slovakia               1811.       9877    5.46
    ##  8 Mexico                 1807.     203210  112.  
    ##  9 United States          1763.     546818  310.  
    ## 10 Peru                   1739.      52008   29.9 
    ## 11 Spain                  1617.      75215   46.5 
    ## 12 Brazil                 1599.     321515  201.  
    ## 13 Portugal               1579.      16859   10.7 
    ## 14 France                 1472.      95366   64.8 
    ## 15 Sweden                 1413.      13498    9.56
    ## 16 Poland                 1407.      54165   38.5 
    ## 17 Chile                  1393.      23328   16.7 
    ## 18 Argentina              1351.      55858   41.3 
    ## 19 Colombia               1327.      63422   47.8 
    ## 20 Switzerland            1273.       9654    7.58

EOL
