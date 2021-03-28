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
-   [Save data](#save-data)

Updated: 2021-03-28

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
    ##  1 United States           76573. 29787178            389
    ##  2 Brazil                  32507. 12320169            379
    ##  3 India                   31505. 11908910            378
    ##  4 Russia                  12060.  4510744            374
    ##  5 France                  11236.  4393375            391
    ##  6 United Kingdom          11119.  4325319            389
    ##  7 Italy                    8765.  3488619            398
    ##  8 Turkey                   8420.  3149094            374
    ##  9 Spain                    8327.  3247738            390
    ## 10 Germany                  7028.  2755225            392
    ## 11 Colombia                 6310.  2359942            374
    ## 12 Argentina                6107.  2278115            373
    ## 13 Mexico                   5921.  2214542            374
    ## 14 Poland                   5877.  2221725            378
    ## 15 Iran                     4643.  1838803            396
    ## 16 Ukraine                  4435.  1632131            368
    ## 17 South Africa             4125.  1543079            374
    ## 18 Peru                     4001.  1500465            375
    ## 19 Czech Republic           3976.  1511021            380
    ## 20 Indonesia                3945.  1487541            377

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                380.             144236.            380
    ##  2 Israel                        298.             113011.            379
    ##  3 United States                 247.              96016.            389
    ##  4 Jordan                        244.              90171.            370
    ##  5 Belgium                       213.              82739.            388
    ##  6 Sweden                        212.              81627.            385
    ##  7 Serbia                        211.              78575.            373
    ##  8 Portugal                      203.              76780.            379
    ##  9 Switzerland                   200.              77758.            389
    ## 10 Netherlands                   193.              74269.            385
    ## 11 Spain                         179.              69835.            390
    ## 12 United Kingdom                178.              69373.            389
    ## 13 Slovakia                      175.              65442.            373
    ## 14 France                        173.              67832.            391
    ## 15 Hungary                       168.              62591.            372
    ## 16 Austria                       167.              64223.            384
    ## 17 Brazil                        162.              61263.            379
    ## 18 Chile                         153.              57464.            376
    ## 19 Poland                        153.              57707.            378
    ## 20 Argentina                     148.              55103.            373

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                21.0         821     3904
    ##  2 Mexico                9.04     200211  2214542
    ##  3 Syria                 6.68       1216    18201
    ##  4 Sudan                 6.46       2028    31407
    ##  5 Egypt                 5.94      11804   198681
    ##  6 Ecuador               5.17      16632   321451
    ##  7 China                 4.73       4851   102659
    ##  8 Bolivia               4.53      12131   267833
    ##  9 Somalia               4.42        471    10664
    ## 10 Afghanistan           4.39       2469    56290
    ## 11 Tanzania              4.13         21      509
    ## 12 Zimbabwe              4.12       1518    36805
    ## 13 Bulgaria              3.87      12601   325233
    ## 14 Mali                  3.87        376     9719
    ## 15 Niger                 3.72        185     4972
    ## 16 Chad                  3.53        158     4480
    ## 17 Guatemala             3.53       6775   192133
    ## 18 Tunisia               3.49       8684   248782
    ## 19 South Africa          3.41      52602  1543079
    ## 20 Peru                  3.39      50831  1500465

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Czech Republic         2461.      25778   10.5 
    ##  2 Belgium                2197.      22852   10.4 
    ##  3 United Kingdom         2029.     126515   62.3 
    ##  4 Hungary                1979.      19752    9.98
    ##  5 Mexico                 1780.     200211  112.  
    ##  6 Italy                  1778.     107256   60.3 
    ##  7 Bulgaria               1763.      12601    7.15
    ##  8 United States          1746.     541708  310.  
    ##  9 Slovakia               1728.       9426    5.46
    ## 10 Peru                   1700.      50831   29.9 
    ## 11 Spain                  1600.      74420   46.5 
    ## 12 Portugal               1575.      16819   10.7 
    ## 13 Brazil                 1509.     303462  201.  
    ## 14 France                 1447.      93728   64.8 
    ## 15 Sweden                 1402.      13402    9.56
    ## 16 Chile                  1349.      22587   16.7 
    ## 17 Poland                 1344.      51753   38.5 
    ## 18 Argentina              1333.      55092   41.3 
    ## 19 Colombia               1308.      62519   47.8 
    ## 20 Switzerland            1263.       9577    7.58

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
