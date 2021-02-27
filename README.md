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

Updated: 2021-02-28

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
    ##  1 United States           77630. 28102166            362
    ##  2 India                   31657. 11079979            350
    ##  3 Brazil                  29518. 10390461            352
    ##  4 Russia                  12239.  4234720            346
    ##  5 United Kingdom          11532.  4163089            361
    ##  6 France                  10047.  3647212            363
    ##  7 Spain                    8785.  3180212            362
    ##  8 Italy                    7808.  2888923            370
    ##  9 Turkey                   7757.  2683971            346
    ## 10 Germany                  6688.  2434446            364
    ## 11 Colombia                 6477.  2241225            346
    ## 12 Argentina                6048.  2098728            347
    ## 13 Mexico                   5980.  2069370            346
    ## 14 Poland                   4848.  1696885            350
    ## 15 Iran                     4389.  1615184            368
    ## 16 South Africa             4353.  1510778            347
    ## 17 Ukraine                  3947.  1342016            340
    ## 18 Indonesia                3779.  1322866            350
    ## 19 Peru                     3771.  1308722            347
    ## 20 Czech Republic           3487.  1227595            352

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                333.             117182.            352
    ##  2 Israel                        296.             103997.            351
    ##  3 United States                 250.              90584.            362
    ##  4 Portugal                      214.              75194.            351
    ##  5 Belgium                       205.              73695.            360
    ##  6 Switzerland                   202.              72852.            361
    ##  7 Sweden                        193.              68786.            357
    ##  8 Spain                         189.              68383.            362
    ##  9 United Kingdom                185.              66771.            361
    ## 10 Netherlands                   182.              64829.            357
    ## 11 Serbia                        179.              61709.            345
    ## 12 Jordan                        175.              59920.            342
    ## 13 Slovakia                      163.              56144.            345
    ## 14 France                        155.              56312.            363
    ## 15 Austria                       154.              54992.            356
    ## 16 Brazil                        147.              51667.            352
    ## 17 Argentina                     146.              50764.            347
    ## 18 Chile                         140.              48782.            348
    ## 19 Colombia                      136.              46897.            346
    ## 20 Italy                         129.              47877.            370

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               27.7         630     2271
    ##  2 Mexico               8.88     183692  2069370
    ##  3 Syria                6.58       1018    15467
    ##  4 Sudan                6.19       1878    30316
    ##  5 Egypt                5.84      10590   181241
    ##  6 Ecuador              5.57      15669   281169
    ##  7 China                4.76       4843   101836
    ##  8 Bolivia              4.69      11577   246822
    ##  9 Afghanistan          4.39       2443    55707
    ## 10 Mali                 4.19        350     8358
    ## 11 Tanzania             4.13         21      509
    ## 12 Bulgaria             4.12      10128   245627
    ## 13 Zimbabwe             4.05       1458    35994
    ## 14 Iran                 3.71      59899  1615184
    ## 15 Guatemala            3.65       6348   173814
    ## 16 Niger                3.63        172     4740
    ## 17 Hungary              3.51      14902   424130
    ## 18 Peru                 3.51      45903  1308722
    ## 19 Chad                 3.48        137     3934
    ## 20 Tunisia              3.42       7942   231964

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                2118.      22034   10.4 
    ##  2 United Kingdom         1963.     122415   62.3 
    ##  3 Czech Republic         1928.      20194   10.5 
    ##  4 Mexico                 1633.     183692  112.  
    ##  5 United States          1627.     504654  310.  
    ##  6 Italy                  1611.      97227   60.3 
    ##  7 Peru                   1535.      45903   29.9 
    ##  8 Portugal               1521.      16243   10.7 
    ##  9 Hungary                1493.      14902    9.98
    ## 10 Spain                  1480.      68813   46.5 
    ## 11 Bulgaria               1417.      10128    7.15
    ## 12 Sweden                 1342.      12826    9.56
    ## 13 France                 1323.      85687   64.8 
    ## 14 Slovakia               1297.       7075    5.46
    ## 15 Argentina              1255.      51887   41.3 
    ## 16 Brazil                 1251.     251498  201.  
    ## 17 Colombia               1243.      59396   47.8 
    ## 18 Chile                  1218.      20400   16.7 
    ## 19 Switzerland            1216.       9219    7.58
    ## 20 Bolivia                1164.      11577    9.95

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
