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

Updated: 2021-01-27

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
    ##  1 United States           75505. 24916899            330
    ##  2 India                   33575. 10676838            318
    ##  3 Brazil                  27639.  8844577            320
    ##  4 Russia                  11964.  3756931            314
    ##  5 United Kingdom          11154.  3669662            329
    ##  6 France                   9086.  3007706            331
    ##  7 Spain                    7835.  2593382            331
    ##  8 Turkey                   7755.  2435247            314
    ##  9 Italy                    7323.  2475372            338
    ## 10 Germany                  6470.  2148077            332
    ## 11 Colombia                 6418.  2015485            314
    ## 12 Argentina                5927.  1867223            315
    ## 13 Mexico                   5615.  1763219            314
    ## 14 Poland                   4662.  1482722            318
    ## 15 South Africa             4500.  1417537            315
    ## 16 Iran                     4105.  1379286            336
    ## 17 Ukraine                  3886.  1197107            308
    ## 18 Peru                     3488.  1099013            315
    ## 19 Indonesia                3142.   999256            318
    ## 20 Czech Republic           2959.   946946            320

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                282.              90392.            320
    ##  2 Israel                        255.              81505.            319
    ##  3 United States                 243.              80317.            330
    ##  4 Switzerland                   204.              67416.            330
    ##  5 Belgium                       204.              66794.            328
    ##  6 Portugal                      189.              60239.            319
    ##  7 United Kingdom                179.              58857.            329
    ##  8 Sweden                        176.              57260.            325
    ##  9 Netherlands                   176.              57251.            325
    ## 10 Spain                         168.              55765.            331
    ## 11 Serbia                        167.              52435.            313
    ## 12 Jordan                        162.              50147.            310
    ## 13 Austria                       151.              49053.            324
    ## 14 Argentina                     143.              45164.            315
    ## 15 France                        140.              46438.            331
    ## 16 Slovakia                      139.              43743.            314
    ## 17 Brazil                        137.              43980.            320
    ## 18 Colombia                      134.              42174.            314
    ## 19 Chile                         133.              41990.            316
    ## 20 Italy                         121.              41024.            338

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               29.0         616     2122
    ##  2 Mexico               8.49     149614  1763219
    ##  3 Syria                6.50        890    13697
    ##  4 Ecuador              6.06      14639   241567
    ##  5 Sudan                6.04       1722    28522
    ##  6 Egypt                5.55       9012   162486
    ##  7 Bolivia              4.97       9985   201037
    ##  8 China                4.80       4814   100291
    ##  9 Afghanistan          4.36       2389    54750
    ## 10 Iran                 4.17      57481  1379286
    ## 11 Tanzania             4.13         21      509
    ## 12 Bulgaria             4.12       8880   215589
    ## 13 Mali                 4.05        323     7983
    ## 14 Greece               3.72       5671   152412
    ## 15 Chad                 3.65        116     3182
    ## 16 Peru                 3.62      39777  1099013
    ## 17 Guatemala            3.54       5469   154430
    ## 18 Italy                3.47      85881  2475372
    ## 19 Niger                3.45        151     4374
    ## 20 Zimbabwe             3.40       1075    31646

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                2001.      20814   10.4 
    ##  2 United Kingdom         1580.      98531   62.3 
    ##  3 Czech Republic         1491.      15618   10.5 
    ##  4 Italy                  1423.      85881   60.3 
    ##  5 United States          1341.     416004  310.  
    ##  6 Mexico                 1330.     149614  112.  
    ##  7 Peru                   1330.      39777   29.9 
    ##  8 Bulgaria               1242.       8880    7.15
    ##  9 Hungary                1213.      12113    9.98
    ## 10 Spain                  1209.      56208   46.5 
    ## 11 Sweden                 1152.      11005    9.56
    ## 12 Argentina              1133.      46827   41.3 
    ## 13 France                 1129.      73101   64.8 
    ## 14 Switzerland            1106.       8384    7.58
    ## 15 Brazil                 1079.     217037  201.  
    ## 16 Colombia               1075.      51374   47.8 
    ## 17 Chile                  1075.      17999   16.7 
    ## 18 Portugal               1004.      10721   10.7 
    ## 19 Bolivia                1004.       9985    9.95
    ## 20 Ecuador                 990.      14639   14.8

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
