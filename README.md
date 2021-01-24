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

Updated: 2021-01-25

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
    ##  1 United States           75013. 24604325            328
    ##  2 India                   33717. 10654533            316
    ##  3 Brazil                  27528.  8753920            318
    ##  4 Russia                  11921.  3719400            312
    ##  5 United Kingdom          11062.  3617463            327
    ##  6 France                   9073.  2985259            329
    ##  7 Spain                    7467.  2456675            329
    ##  8 Italy                    7307.  2455185            336
    ##  9 Germany                  6469.  2134936            330
    ## 10 Colombia                 6370.  1987418            312
    ## 11 Argentina                5922.  1853830            313
    ## 12 Mexico                   5552.  1732290            312
    ## 13 Turkey                   5160.  1609990            312
    ## 14 Poland                   4669.  1475445            316
    ## 15 South Africa             4488.  1404839            313
    ## 16 Iran                     4092.  1367032            334
    ## 17 Ukraine                  3894.  1191812            306
    ## 18 Peru                     3476.  1088096            313
    ## 19 Indonesia                3093.   977474            316
    ## 20 Czech Republic           2948.   937617            318

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                281.              89501.            318
    ##  2 Israel                        244.              77394.            317
    ##  3 United States                 242.              79309.            328
    ##  4 Belgium                       204.              66505.            326
    ##  5 Switzerland                   204.              66848.            328
    ##  6 Portugal                      184.              58493.            317
    ##  7 United Kingdom                177.              58020.            327
    ##  8 Sweden                        177.              57260.            323
    ##  9 Netherlands                   176.              56716.            323
    ## 10 Serbia                        167.              52048.            311
    ## 11 Jordan                        162.              49870.            308
    ## 12 Spain                         161.              52825.            329
    ## 13 Austria                       151.              48774.            322
    ## 14 Argentina                     143.              44840.            313
    ## 15 France                        140.              46091.            329
    ## 16 Slovakia                      139.              43350.            312
    ## 17 Brazil                        137.              43529.            318
    ## 18 Colombia                      133.              41586.            312
    ## 19 Chile                         132.              41480.            314
    ## 20 Poland                        121.              38323.            316

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               29.0         616     2122
    ##  2 Mexico               8.52     147614  1732290
    ##  3 Syria                6.48        879    13557
    ##  4 Ecuador              6.13      14596   238232
    ##  5 Sudan                6.05       1707    28233
    ##  6 Egypt                5.52       8902   161143
    ##  7 Bolivia              4.98       9871   198257
    ##  8 China                4.81       4810    99931
    ##  9 Afghanistan          4.36       2378    54595
    ## 10 Iran                 4.19      57294  1367032
    ## 11 Tanzania             4.13         21      509
    ## 12 Bulgaria             4.10       8811   214696
    ## 13 Mali                 4.06        323     7965
    ## 14 Greece               3.71       5622   151646
    ## 15 Chad                 3.67        115     3137
    ## 16 Peru                 3.62      39427  1088096
    ## 17 Guatemala            3.55       5456   153890
    ## 18 Niger                3.49        151     4321
    ## 19 Italy                3.47      85162  2455185
    ## 20 Nicaragua            3.39        168     4953

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                1992.      20726   10.4 
    ##  2 United Kingdom         1561.      97329   62.3 
    ##  3 Czech Republic         1467.      15369   10.5 
    ##  4 Italy                  1411.      85162   60.3 
    ##  5 United States          1324.     410667  310.  
    ##  6 Peru                   1318.      39427   29.9 
    ##  7 Mexico                 1312.     147614  112.  
    ##  8 Bulgaria               1233.       8811    7.15
    ##  9 Hungary                1199.      11968    9.98
    ## 10 Spain                  1184.      55041   46.5 
    ## 11 Sweden                 1152.      11005    9.56
    ## 12 Argentina              1127.      46575   41.3 
    ## 13 France                 1119.      72484   64.8 
    ## 14 Switzerland            1095.       8300    7.58
    ## 15 Brazil                 1070.     215243  201.  
    ## 16 Chile                  1066.      17854   16.7 
    ## 17 Colombia               1059.      50586   47.8 
    ## 18 Bolivia                 992.       9871    9.95
    ## 19 Ecuador                 987.      14596   14.8 
    ## 20 Portugal                955.      10194   10.7

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
