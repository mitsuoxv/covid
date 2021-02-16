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

Updated: 2021-02-17

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
    ##  1 United States           77805. 27309503            351
    ##  2 India                   32229. 10925710            339
    ##  3 Brazil                  28840.  9834513            341
    ##  4 Russia                  12236.  4099323            335
    ##  5 United Kingdom          11565.  4047847            350
    ##  6 France                   9689.  3410715            352
    ##  7 Spain                    8768.  3086286            352
    ##  8 Turkey                   7743.  2594128            335
    ##  9 Italy                    7602.  2729223            359
    ## 10 Germany                  6637.  2342843            353
    ## 11 Colombia                 6552.  2195039            335
    ## 12 Argentina                6029.  2025798            336
    ## 13 Mexico                   5948.  1992794            335
    ## 14 Poland                   4710.  1596673            339
    ## 15 South Africa             4443.  1492909            336
    ## 16 Iran                     4274.  1526023            357
    ## 17 Ukraine                  3880.  1276618            329
    ## 18 Peru                     3676.  1235298            336
    ## 19 Indonesia                3610.  1223930            339
    ## 20 Czech Republic           3224.  1099654            341

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                308.             104969.            341
    ##  2 Israel                        290.              98701.            340
    ##  3 United States                 251.              88029.            351
    ##  4 Portugal                      217.              73722.            340
    ##  5 Switzerland                   204.              71309.            350
    ##  6 Belgium                       204.              71084.            349
    ##  7 Spain                         189.              66363.            352
    ##  8 United Kingdom                185.              64923.            350
    ##  9 Sweden                        184.              63669.            346
    ## 10 Netherlands                   179.              62006.            346
    ## 11 Serbia                        172.              57484.            334
    ## 12 Jordan                        165.              54559.            331
    ## 13 Slovakia                      153.              51273.            334
    ## 14 Austria                       152.              52540.            345
    ## 15 France                        150.              52660.            352
    ## 16 Argentina                     146.              49000.            336
    ## 17 Brazil                        143.              48903.            341
    ## 18 Chile                         138.              46550.            337
    ## 19 Colombia                      137.              45931.            335
    ## 20 Italy                         126.              45230.            359

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               28.8         618     2149
    ##  2 Mexico               8.74     174207  1992794
    ##  3 Syria                6.58        981    14906
    ##  4 Sudan                6.18       1858    30052
    ##  5 Egypt                5.76      10050   174426
    ##  6 Ecuador              5.74      15355   267701
    ##  7 China                4.76       4838   101561
    ##  8 Bolivia              4.73      11202   236732
    ##  9 Afghanistan          4.37       2428    55518
    ## 10 Bulgaria             4.19       9671   230747
    ## 11 Mali                 4.15        342     8235
    ## 12 Tanzania             4.13         21      509
    ## 13 Zimbabwe             4.00       1410    35222
    ## 14 Iran                 3.87      59028  1526023
    ## 15 Guatemala            3.67       6150   167383
    ## 16 Niger                3.59        169     4702
    ## 17 Chad                 3.58        131     3664
    ## 18 Greece               3.56       6152   172824
    ## 19 Peru                 3.54      43703  1235298
    ## 20 Hungary              3.54      13752   388799

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                2086.      21702   10.4 
    ##  2 United Kingdom         1883.     117396   62.3 
    ##  3 Czech Republic         1759.      18430   10.5 
    ##  4 Italy                  1555.      93835   60.3 
    ##  5 Mexico                 1549.     174207  112.  
    ##  6 United States          1549.     480464  310.  
    ##  7 Peru                   1461.      43703   29.9 
    ##  8 Portugal               1444.      15411   10.7 
    ##  9 Spain                  1407.      65449   46.5 
    ## 10 Hungary                1378.      13752    9.98
    ## 11 Bulgaria               1353.       9671    7.15
    ## 12 Sweden                 1301.      12428    9.56
    ## 13 France                 1263.      81801   64.8 
    ## 14 Argentina              1215.      50236   41.3 
    ## 15 Colombia               1205.      57605   47.8 
    ## 16 Switzerland            1190.       9020    7.58
    ## 17 Brazil                 1190.     239245  201.  
    ## 18 Chile                  1172.      19624   16.7 
    ## 19 Bolivia                1126.      11202    9.95
    ## 20 Slovakia               1111.       6063    5.46

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
