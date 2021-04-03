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

Updated: 2021-04-04

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
    ##  1 United States           76360. 30238692            396
    ##  2 Brazil                  33264. 12839844            386
    ##  3 India                   32187. 12392260            385
    ##  4 Russia                  12000.  4572077            381
    ##  5 France                  11723.  4665709            398
    ##  6 United Kingdom          10994.  4353672            396
    ##  7 Italy                    8960.  3629000            405
    ##  8 Turkey                   8924.  3400296            381
    ##  9 Spain                    8290.  3291394            397
    ## 10 Germany                  7201.  2873190            399
    ## 11 Colombia                 6346.  2417826            381
    ## 12 Poland                   6274.  2415584            385
    ## 13 Argentina                6219.  2363251            380
    ## 14 Mexico                   5890.  2244268            381
    ## 15 Iran                     4737.  1908974            403
    ## 16 Ukraine                  4618.  1731971            375
    ## 17 Peru                     4088.  1561723            382
    ## 18 South Africa             4066.  1549451            381
    ## 19 Czech Republic           4004.  1549734            387
    ## 20 Indonesia                3966.  1523179            384

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                382.             147932.            387
    ##  2 Israel                        294.             113308.            386
    ##  3 Jordan                        258.              97210.            377
    ##  4 United States                 246.              97471.            396
    ##  5 Serbia                        219.              83083.            380
    ##  6 Belgium                       217.              85801.            395
    ##  7 Sweden                        217.              85098.            392
    ##  8 Switzerland                   201.              79485.            396
    ##  9 Portugal                      200.              77076.            386
    ## 10 Netherlands                   197.              77362.            392
    ## 11 France                        181.              72037.            398
    ## 12 Hungary                       180.              68064.            379
    ## 13 Spain                         178.              70774.            397
    ## 14 United Kingdom                176.              69828.            396
    ## 15 Slovakia                      176.              66842.            380
    ## 16 Austria                       171.              66886.            391
    ## 17 Brazil                        165.              63847.            386
    ## 18 Poland                        163.              62742.            385
    ## 19 Chile                         158.              60400.            383
    ## 20 Argentina                     150.              57162.            380

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                19.8         917     4624
    ##  2 Mexico                9.07     203664  2244268
    ##  3 Syria                 6.72       1288    19164
    ##  4 Sudan                 6.48       2063    31833
    ##  5 Egypt                 5.94      12084   203546
    ##  6 Ecuador               5.09      16910   332038
    ##  7 China                 4.72       4851   102838
    ##  8 Somalia               4.64        529    11398
    ##  9 Bolivia               4.49      12280   273327
    ## 10 Afghanistan           4.41       2496    56595
    ## 11 Zimbabwe              4.13       1524    36904
    ## 12 Tanzania              4.13         21      509
    ## 13 Bulgaria              3.84      13438   350340
    ## 14 Mali                  3.79        390    10285
    ## 15 Niger                 3.74        188     5028
    ## 16 Chad                  3.59        164     4573
    ## 17 Guatemala             3.52       6860   194756
    ## 18 Tunisia               3.46       8890   256931
    ## 19 South Africa          3.41      52897  1549451
    ## 20 Nicaragua             3.34        178     5326

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Czech Republic         2565.      26867   10.5 
    ##  2 Belgium                2219.      23083   10.4 
    ##  3 Hungary                2154.      21504    9.98
    ##  4 United Kingdom         2034.     126816   62.3 
    ##  5 Bulgaria               1880.      13438    7.15
    ##  6 Italy                  1828.     110328   60.3 
    ##  7 Slovakia               1824.       9948    5.46
    ##  8 Mexico                 1811.     203664  112.  
    ##  9 United States          1766.     547884  310.  
    ## 10 Peru                   1744.      52161   29.9 
    ## 11 Spain                  1624.      75541   46.5 
    ## 12 Brazil                 1617.     325284  201.  
    ## 13 Portugal               1580.      16868   10.7 
    ## 14 France                 1477.      95690   64.8 
    ## 15 Poland                 1422.      54737   38.5 
    ## 16 Sweden                 1413.      13498    9.56
    ## 17 Chile                  1399.      23421   16.7 
    ## 18 Argentina              1353.      55941   41.3 
    ## 19 Colombia               1331.      63614   47.8 
    ## 20 Switzerland            1276.       9677    7.58

EOL
