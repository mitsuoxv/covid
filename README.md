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

Updated: 2021-02-12

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
    ##  1 United States           77814  26923756            346
    ##  2 India                   32548. 10871294            334
    ##  3 Brazil                  28570.  9599565            336
    ##  4 Russia                  12205.  4027748            330
    ##  5 United Kingdom          11551.  3985165            345
    ##  6 France                   9593.  3328987            347
    ##  7 Spain                    8713.  3023601            347
    ##  8 Turkey                   7747.  2556837            330
    ##  9 Italy                    7537.  2668266            354
    ## 10 Germany                  6638.  2310233            348
    ## 11 Colombia                 6566.  2166904            330
    ## 12 Argentina                6022.  1993295            331
    ## 13 Mexico                   5899.  1946751            330
    ## 14 Poland                   4702.  1570658            334
    ## 15 South Africa             4478.  1482412            331
    ## 16 Iran                     4230.  1488981            352
    ## 17 Ukraine                  3883.  1258094            324
    ## 18 Peru                     3615.  1196778            331
    ## 19 Indonesia                3543.  1183555            334
    ## 20 Czech Republic           3169.  1064952            336

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                303.             101656.            336
    ##  2 Israel                        286.              95879.            335
    ##  3 United States                 251.              86786.            346
    ##  4 Portugal                      217.              72582.            335
    ##  5 Switzerland                   205.              70639.            345
    ##  6 Belgium                       204.              70263.            344
    ##  7 Spain                         187.              65015.            347
    ##  8 United Kingdom                185.              63918.            345
    ##  9 Sweden                        184.              62814.            341
    ## 10 Netherlands                   178.              60854.            341
    ## 11 Serbia                        171.              56358.            329
    ## 12 Jordan                        163.              53094.            326
    ## 13 Austria                       152.              51676.            340
    ## 14 Slovakia                      150.              49310.            329
    ## 15 France                        148.              51398.            347
    ## 16 Argentina                     146.              48213.            331
    ## 17 Brazil                        142.              47734.            336
    ## 18 Colombia                      137.              45342.            330
    ## 19 Chile                         137.              45417.            332
    ## 20 Italy                         125.              44220.            354

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               28.9         617     2137
    ##  2 Mexico               8.65     168432  1946751
    ##  3 Syria                6.58        965    14668
    ##  4 Sudan                6.18       1849    29933
    ##  5 Ecuador              5.81      15086   259783
    ##  6 Egypt                5.72       9804   171390
    ##  7 China                4.77       4834   101429
    ##  8 Bolivia              4.74      10929   230731
    ##  9 Afghanistan          4.36       2419    55420
    ## 10 Bulgaria             4.20       9527   226974
    ## 11 Mali                 4.13        339     8203
    ## 12 Tanzania             4.13         21      509
    ## 13 Iran                 3.94      58686  1488981
    ## 14 Zimbabwe             3.91       1364    34864
    ## 15 Guatemala            3.64       5989   164746
    ## 16 Greece               3.60       6034   167549
    ## 17 Niger                3.60        167     4643
    ## 18 Peru                 3.56      42626  1196778
    ## 19 Chad                 3.53        126     3568
    ## 20 Hungary              3.52      13444   381875

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                2068.      21512   10.4 
    ##  2 United Kingdom         1842.     114851   62.3 
    ##  3 Czech Republic         1696.      17772   10.5 
    ##  4 Italy                  1530.      92338   60.3 
    ##  5 Mexico                 1498.     168432  112.  
    ##  6 United States          1497.     464412  310.  
    ##  7 Peru                   1425.      42626   29.9 
    ##  8 Portugal               1379.      14718   10.7 
    ##  9 Spain                  1370.      63704   46.5 
    ## 10 Hungary                1347.      13444    9.98
    ## 11 Bulgaria               1333.       9527    7.15
    ## 12 Sweden                 1290.      12326    9.56
    ## 13 France                 1236.      80032   64.8 
    ## 14 Argentina              1199.      49556   41.3 
    ## 15 Colombia               1182.      56507   47.8 
    ## 16 Switzerland            1178.       8931    7.58
    ## 17 Brazil                 1161.     233520  201.  
    ## 18 Chile                  1141.      19105   16.7 
    ## 19 Bolivia                1099.      10929    9.95
    ## 20 Poland                 1044.      40177   38.5

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
