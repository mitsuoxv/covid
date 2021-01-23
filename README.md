WHO, Covid-19 situation report
================
Mitsuo Shiota
2020/3/7

  - [Summary](#summary)
  - [Read data from WHO](#read-data-from-who)
  - [Newly confirmed cases by region](#newly-confirmed-cases-by-region)
  - [Fastest spreading areas](#fastest-spreading-areas)
  - [Highest fatality rate areas](#highest-fatality-rate-areas)
  - [Highest deaths per population
    areas](#highest-deaths-per-population-areas)
  - [Save data](#save-data)

Updated: 2021-01-24

I added “USA, Covid-19 situation by state” in [another page](USA.md).

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
“Southern Europe”. “West Europe” is basically Europe other than
“Eastern Europe”.

![](README_files/figure-gfm/chart-1.png)<!-- -->

## Fastest spreading areas

Among areas with more than 5 million population, highest
“speed\_since\_100”, which is average number of newly confirmed cases
per day since cumulative cases became more than 100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_since_100 cum_conf days_since_100
    ##    <chr>                    <dbl>    <dbl>          <int>
    ##  1 United States           74658. 24413331            327
    ##  2 India                   33776. 10639684            315
    ##  3 Brazil                  27436.  8697368            317
    ##  4 Russia                  11891.  3698273            311
    ##  5 United Kingdom          10993.  3583911            326
    ##  6 France                   9029.  2961737            328
    ##  7 Spain                    7490.  2456675            328
    ##  8 Italy                    7289.  2441854            335
    ##  9 Germany                  6452.  2122679            329
    ## 10 Colombia                 6342.  1972345            311
    ## 11 Argentina                5907.  1843077            312
    ## 12 Mexico                   5502.  1711283            311
    ## 13 Turkey                   5157.  1604134            311
    ## 14 Poland                   4669.  1470879            315
    ## 15 South Africa             4463.  1392568            312
    ## 16 Iran                     4086.  1360825            333
    ## 17 Ukraine                  3894.  1187897            305
    ## 18 Peru                     3470.  1082907            312
    ## 19 Indonesia                3064.   965283            315
    ## 20 Czech Republic           2944.   933361            317

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                281.              89095.            317
    ##  2 Israel                        245.              77394.            316
    ##  3 United States                 241.              78694.            327
    ##  4 Switzerland                   204.              66848.            327
    ##  5 Belgium                       204.              66257.            325
    ##  6 Portugal                      181.              57057.            316
    ##  7 Sweden                        178.              57260.            322
    ##  8 United Kingdom                176.              57482.            326
    ##  9 Netherlands                   175.              56391.            322
    ## 10 Serbia                        167.              51846.            310
    ## 11 Jordan                        162.              49775.            307
    ## 12 Spain                         161.              52825.            328
    ## 13 Austria                       151.              48585.            321
    ## 14 Argentina                     143.              44580.            312
    ## 15 France                        139.              45728.            328
    ## 16 Slovakia                      137.              42718.            311
    ## 17 Brazil                        136.              43248.            317
    ## 18 Colombia                      133.              41271.            311
    ## 19 Chile                         132.              41207.            313
    ## 20 Poland                        121.              38205.            315

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               29.0         615     2122
    ##  2 Mexico               8.54     146174  1711283
    ##  3 Syria                6.48        873    13479
    ##  4 Ecuador              6.14      14562   237158
    ##  5 Sudan                6.05       1707    28233
    ##  6 Egypt                5.52       8853   160463
    ##  7 Bolivia              5.00       9818   196393
    ##  8 China                4.82       4810    99767
    ##  9 Afghanistan          4.35       2373    54559
    ## 10 Iran                 4.21      57225  1360825
    ## 11 Tanzania             4.13         21      509
    ## 12 Bulgaria             4.10       8799   214430
    ## 13 Mali                 4.04        321     7937
    ## 14 Greece               3.71       5598   151041
    ## 15 Chad                 3.70        115     3104
    ## 16 Peru                 3.63      39274  1082907
    ## 17 Guatemala            3.54       5420   152956
    ## 18 Italy                3.47      84674  2441854
    ## 19 Niger                3.45        147     4267
    ## 20 Nicaragua            3.39        168     4953

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                1987.      20675   10.4 
    ##  2 United Kingdom         1539.      95981   62.3 
    ##  3 Czech Republic         1458.      15270   10.5 
    ##  4 Italy                  1403.      84674   60.3 
    ##  5 Peru                   1313.      39274   29.9 
    ##  6 United States          1311.     406782  310.  
    ##  7 Mexico                 1300.     146174  112.  
    ##  8 Bulgaria               1231.       8799    7.15
    ##  9 Hungary                1193.      11904    9.98
    ## 10 Spain                  1184.      55041   46.5 
    ## 11 Sweden                 1152.      11005    9.56
    ## 12 Argentina              1121.      46355   41.3 
    ## 13 France                 1116.      72255   64.8 
    ## 14 Switzerland            1095.       8300    7.58
    ## 15 Brazil                 1065.     214147  201.  
    ## 16 Chile                  1062.      17786   16.7 
    ## 17 Colombia               1050.      50187   47.8 
    ## 18 Bolivia                 987.       9818    9.95
    ## 19 Ecuador                 985.      14562   14.8 
    ## 20 Portugal                929.       9920   10.7

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
