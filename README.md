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

Updated: 2021-02-02

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
    ##  1 United States           76839. 25817939            336
    ##  2 India                   33202. 10757610            324
    ##  3 Brazil                  28150.  9176975            326
    ##  4 Russia                  12087.  3868087            320
    ##  5 United Kingdom          11394.  3817180            335
    ##  6 France                   9334.  3145586            337
    ##  7 Spain                    8026.  2705001            337
    ##  8 Turkey                   7741.  2477463            320
    ##  9 Italy                    7421.  2553032            344
    ## 10 Germany                  6574.  2221971            338
    ## 11 Colombia                 6521.  2086806            320
    ## 12 Argentina                5988.  1922264            321
    ## 13 Mexico                   5803.  1857230            320
    ## 14 Poland                   4678.  1515889            324
    ## 15 South Africa             4528.  1453761            321
    ## 16 Iran                     4146.  1417999            342
    ## 17 Ukraine                  3890.  1221485            314
    ## 18 Peru                     3529.  1133022            321
    ## 19 Indonesia                3328.  1078314            324
    ## 20 Czech Republic           3028.   987329            326

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                289.              94247.            326
    ##  2 Israel                        267.              86653.            325
    ##  3 United States                 248.              83221.            336
    ##  4 Portugal                      208.              67489.            325
    ##  5 Belgium                       204.              68264.            334
    ##  6 Switzerland                   204.              68429.            335
    ##  7 United Kingdom                183.              61223.            335
    ##  8 Sweden                        179.              59331.            331
    ##  9 Netherlands                   178.              58785.            331
    ## 10 Spain                         173.              58165.            337
    ## 11 Serbia                        169.              53815.            319
    ## 12 Jordan                        161.              51015.            316
    ## 13 Austria                       152.              50090.            330
    ## 14 Argentina                     145.              46495.            321
    ## 15 France                        144.              48567.            337
    ## 16 Slovakia                      143.              45895.            320
    ## 17 Brazil                        140.              45633.            326
    ## 18 Colombia                      136.              43666.            320
    ## 19 Chile                         135.              43419.            322
    ## 20 Italy                         123.              42311.            344

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               29.0         616     2125
    ##  2 Mexico               8.51     158074  1857230
    ##  3 Syria                6.56        921    14048
    ##  4 Sudan                6.14       1807    29449
    ##  5 Ecuador              5.92      14859   250828
    ##  6 Egypt                5.61       9316   165951
    ##  7 Bolivia              4.80      10330   215397
    ##  8 China                4.78       4825   100974
    ##  9 Afghanistan          4.37       2404    55059
    ## 10 Bulgaria             4.13       9045   218748
    ## 11 Tanzania             4.13         21      509
    ## 12 Iran                 4.09      57959  1417999
    ## 13 Mali                 4.08        330     8091
    ## 14 Greece               3.69       5796   156957
    ## 15 Zimbabwe             3.65       1217    33388
    ## 16 Peru                 3.61      40857  1133022
    ## 17 Guatemala            3.54       5643   159504
    ## 18 Niger                3.52        159     4517
    ## 19 Chad                 3.50        118     3376
    ## 20 Italy                3.47      88516  2553032

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                2027.      21092   10.4 
    ##  2 United Kingdom         1703.     106158   62.3 
    ##  3 Czech Republic         1565.      16392   10.5 
    ##  4 Italy                  1467.      88516   60.3 
    ##  5 United States          1406.     436051  310.  
    ##  6 Mexico                 1405.     158074  112.  
    ##  7 Peru                   1366.      40857   29.9 
    ##  8 Bulgaria               1265.       9045    7.15
    ##  9 Hungary                1260.      12578    9.98
    ## 10 Spain                  1243.      57806   46.5 
    ## 11 Sweden                 1213.      11591    9.56
    ## 12 Portugal               1169.      12482   10.7 
    ## 13 France                 1168.      75661   64.8 
    ## 14 Argentina              1159.      47931   41.3 
    ## 15 Switzerland            1135.       8601    7.58
    ## 16 Colombia               1123.      53650   47.8 
    ## 17 Brazil                 1114.     223945  201.  
    ## 18 Chile                  1102.      18452   16.7 
    ## 19 Bolivia                1038.      10330    9.95
    ## 20 Ecuador                1005.      14859   14.8

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
