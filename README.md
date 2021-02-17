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

Updated: 2021-02-18

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
    ##  1 United States           77936. 27433718            352
    ##  2 India                   32168. 10937320            340
    ##  3 Brazil                  28850.  9866710            342
    ##  4 Russia                  12238.  4112151            336
    ##  5 United Kingdom          11562.  4058472            351
    ##  6 France                   9716.  3429726            353
    ##  7 Spain                    8771.  3096343            353
    ##  8 Turkey                   7744.  2602034            336
    ##  9 Italy                    7610.  2739591            360
    ## 10 Germany                  6639.  2350399            354
    ## 11 Colombia                 6543.  2198549            336
    ## 12 Argentina                6021.  2029057            337
    ## 13 Mexico                   5940.  1995892            336
    ## 14 Poland                   4721.  1605372            340
    ## 15 South Africa             4433.  1494119            337
    ## 16 Iran                     4285.  1534034            358
    ## 17 Ukraine                  3881.  1280904            330
    ## 18 Peru                     3675.  1238501            337
    ## 19 Indonesia                3629.  1233959            340
    ## 20 Czech Republic           3252.  1112322            342

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                310.             106178.            342
    ##  2 Israel                        291.              99407.            341
    ##  3 United States                 251.              88429.            352
    ##  4 Portugal                      217.              73863.            341
    ##  5 Belgium                       204.              71249.            350
    ##  6 Switzerland                   204.              71451.            351
    ##  7 Spain                         189.              66579.            353
    ##  8 Sweden                        186.              64658.            347
    ##  9 United Kingdom                185.              65093.            351
    ## 10 Netherlands                   179.              62169.            347
    ## 11 Serbia                        172.              57730.            335
    ## 12 Jordan                        166.              54973.            332
    ## 13 Slovakia                      155.              51854.            335
    ## 14 Austria                       152.              52708.            346
    ## 15 France                        150.              52954.            353
    ## 16 Argentina                     146.              49078.            337
    ## 17 Brazil                        143.              49063.            342
    ## 18 Chile                         138.              46699.            338
    ## 19 Colombia                      137.              46004.            336
    ## 20 Italy                         126.              45402.            360

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               28.8         619     2152
    ##  2 Mexico               8.75     174657  1995892
    ##  3 Syria                6.58        984    14951
    ##  4 Sudan                6.19       1863    30078
    ##  5 Egypt                5.77      10101   175059
    ##  6 Ecuador              5.74      15392   268073
    ##  7 China                4.76       4840   101576
    ##  8 Bolivia              4.74      11234   237144
    ##  9 Afghanistan          4.37       2428    55540
    ## 10 Bulgaria             4.18       9703   232096
    ## 11 Mali                 4.15        342     8241
    ## 12 Tanzania             4.13         21      509
    ## 13 Zimbabwe             4.00       1414    35315
    ## 14 Iran                 3.85      59117  1534034
    ## 15 Guatemala            3.66       6158   168103
    ## 16 Niger                3.59        169     4706
    ## 17 Greece               3.55       6181   173905
    ## 18 Hungary              3.55      13837   389622
    ## 19 Chad                 3.55        131     3689
    ## 20 Peru                 3.54      43880  1238501

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                2091.      21750   10.4 
    ##  2 United Kingdom         1896.     118195   62.3 
    ##  3 Czech Republic         1775.      18596   10.5 
    ##  4 Italy                  1561.      94171   60.3 
    ##  5 United States          1557.     482989  310.  
    ##  6 Mexico                 1553.     174657  112.  
    ##  7 Peru                   1467.      43880   29.9 
    ##  8 Portugal               1454.      15522   10.7 
    ##  9 Spain                  1419.      65979   46.5 
    ## 10 Hungary                1386.      13837    9.98
    ## 11 Bulgaria               1357.       9703    7.15
    ## 12 Sweden                 1307.      12487    9.56
    ## 13 France                 1272.      82383   64.8 
    ## 14 Argentina              1217.      50327   41.3 
    ## 15 Colombia               1209.      57786   47.8 
    ## 16 Switzerland            1194.       9055    7.58
    ## 17 Brazil                 1192.     239773  201.  
    ## 18 Chile                  1173.      19644   16.7 
    ## 19 Slovakia               1131.       6168    5.46
    ## 20 Bolivia                1129.      11234    9.95

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
