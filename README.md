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

Updated: 2021-02-08

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
    ##  1 United States           77625. 26547977            342
    ##  2 India                   32807. 10826363            330
    ##  3 Brazil                  28455.  9447165            332
    ##  4 Russia                  12169.  3967281            326
    ##  5 United Kingdom          11524.  3929839            341
    ##  6 France                   9511.  3262505            343
    ##  7 Spain                    8494.  2913425            343
    ##  8 Turkey                   7744.  2524786            326
    ##  9 Italy                    7500.  2625098            350
    ## 10 Germany                  6639.  2284010            344
    ## 11 Colombia                 6572.  2142660            326
    ## 12 Argentina                6024.  1970009            327
    ## 13 Mexico                   5867.  1912871            326
    ## 14 Poland                   4697.  1550255            330
    ## 15 South Africa             4506.  1473700            327
    ## 16 Iran                     4193.  1459370            348
    ## 17 Ukraine                  3890.  1244849            320
    ## 18 Peru                     3587.  1173045            327
    ## 19 Indonesia                3475.  1147010            330
    ## 20 Czech Republic           3117.  1034975            332

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                298.              98795.            332
    ##  2 Israel                        265.              87788.            331
    ##  3 United States                 250.              85574.            342
    ##  4 Portugal                      216.              71366.            331
    ##  5 Switzerland                   205.              69817.            341
    ##  6 Belgium                       205.              69583.            340
    ##  7 United Kingdom                185.              63030.            341
    ##  8 Spain                         183.              62646.            343
    ##  9 Sweden                        183.              61539.            337
    ## 10 Netherlands                   179.              60188.            337
    ## 11 Serbia                        170.              55325.            325
    ## 12 Jordan                        162.              52107.            322
    ## 13 Austria                       152.              51104.            336
    ## 14 Slovakia                      148.              48272.            326
    ## 15 France                        147.              50372.            343
    ## 16 Argentina                     146.              47650.            327
    ## 17 Brazil                        141.              46977.            332
    ## 18 Colombia                      138.              44835.            326
    ## 19 Chile                         136.              44671.            328
    ## 20 Italy                         124.              43505.            350

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               28.9         616     2131
    ##  2 Mexico               8.59     164290  1912871
    ##  3 Syria                6.57        947    14408
    ##  4 Sudan                6.18       1831    29634
    ##  5 Ecuador              5.84      15004   257115
    ##  6 Egypt                5.68       9604   169106
    ##  7 China                4.77       4831   101272
    ##  8 Bolivia              4.73      10687   225910
    ##  9 Afghanistan          4.36       2410    55335
    ## 10 Bulgaria             4.17       9311   223552
    ## 11 Mali                 4.14        338     8160
    ## 12 Tanzania             4.13         21      509
    ## 13 Iran                 4.00      58412  1459370
    ## 14 Zimbabwe             3.82       1316    34487
    ## 15 Greece               3.65       5951   163213
    ## 16 Chad                 3.60        125     3473
    ## 17 Guatemala            3.59       5854   162937
    ## 18 Niger                3.59        165     4598
    ## 19 Peru                 3.57      41933  1173045
    ## 20 Hungary              3.48      13090   376495

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                2052.      21352   10.4 
    ##  2 United Kingdom         1798.     112092   62.3 
    ##  3 Czech Republic         1645.      17235   10.5 
    ##  4 Italy                  1508.      91003   60.3 
    ##  5 United States          1469.     455735  310.  
    ##  6 Mexico                 1461.     164290  112.  
    ##  7 Peru                   1402.      41933   29.9 
    ##  8 Hungary                1311.      13090    9.98
    ##  9 Spain                  1307.      60802   46.5 
    ## 10 Portugal               1307.      13954   10.7 
    ## 11 Bulgaria               1302.       9311    7.15
    ## 12 Sweden                 1268.      12115    9.56
    ## 13 France                 1210.      78389   64.8 
    ## 14 Argentina              1185.      48985   41.3 
    ## 15 Switzerland            1164.       8822    7.58
    ## 16 Colombia               1159.      55403   47.8 
    ## 17 Brazil                 1144.     230034  201.  
    ## 18 Chile                  1128.      18895   16.7 
    ## 19 Bolivia                1074.      10687    9.95
    ## 20 Poland                 1015.      39087   38.5

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
