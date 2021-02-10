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

Updated: 2021-02-11

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
    ##  1 United States           77776. 26832826            345
    ##  2 India                   32607. 10858371            333
    ##  3 Brazil                  28501.  9548079            335
    ##  4 Russia                  12196.  4012710            329
    ##  5 United Kingdom          11547.  3972152            344
    ##  6 France                   9550.  3304356            346
    ##  7 Spain                    8686.  3005487            346
    ##  8 Turkey                   7745.  2548195            329
    ##  9 Italy                    7522.  2655319            353
    ## 10 Germany                  6628.  2299996            347
    ## 11 Colombia                 6569.  2161462            329
    ## 12 Argentina                6016.  1985501            330
    ## 13 Mexico                   5884.  1936013            329
    ## 14 Poland                   4695.  1563645            333
    ## 15 South Africa             4482.  1479253            330
    ## 16 Iran                     4220.  1481396            351
    ## 17 Ukraine                  3879.  1253055            323
    ## 18 Peru                     3609.  1191221            330
    ## 19 Indonesia                3528.  1174779            333
    ## 20 Czech Republic           3150.  1055415            335

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                301.             100746.            335
    ##  2 Israel                        281.              93978.            334
    ##  3 United States                 251.              86493.            345
    ##  4 Portugal                      216.              72171.            334
    ##  5 Switzerland                   205.              70428.            344
    ##  6 Belgium                       204.              70012.            343
    ##  7 Spain                         187.              64626.            346
    ##  8 United Kingdom                185.              63709.            344
    ##  9 Sweden                        183.              62388.            340
    ## 10 Netherlands                   178.              60662.            340
    ## 11 Serbia                        171.              56074.            328
    ## 12 Jordan                        162.              52804.            325
    ## 13 Austria                       152.              51502.            339
    ## 14 Slovakia                      148.              48727.            328
    ## 15 France                        147.              51018.            346
    ## 16 Argentina                     146.              48025.            330
    ## 17 Brazil                        142.              47478.            335
    ## 18 Colombia                      137.              45228.            329
    ## 19 Chile                         137.              45274.            331
    ## 20 Italy                         125.              44006.            353

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               28.9         616     2135
    ##  2 Mexico               8.61     166731  1936013
    ##  3 Syria                6.58        961    14611
    ##  4 Sudan                6.15       1835    29851
    ##  5 Ecuador              5.81      15086   259783
    ##  6 Egypt                5.71       9751   170780
    ##  7 China                4.77       4833   101408
    ##  8 Bolivia              4.74      10864   229187
    ##  9 Afghanistan          4.36       2418    55402
    ## 10 Bulgaria             4.19       9482   226061
    ## 11 Mali                 4.14        339     8192
    ## 12 Tanzania             4.13         21      509
    ## 13 Iran                 3.96      58625  1481396
    ## 14 Zimbabwe             3.89       1353    34785
    ## 15 Guatemala            3.63       5955   163993
    ## 16 Greece               3.62       6017   166067
    ## 17 Niger                3.60        167     4643
    ## 18 Peru                 3.56      42467  1191221
    ## 19 Chad                 3.53        125     3539
    ## 20 Hungary              3.51      13347   380013

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                2064.      21472   10.4 
    ##  2 United Kingdom         1826.     113850   62.3 
    ##  3 Czech Republic         1684.      17642   10.5 
    ##  4 Italy                  1525.      92002   60.3 
    ##  5 United States          1488.     461610  310.  
    ##  6 Mexico                 1482.     166731  112.  
    ##  7 Peru                   1420.      42467   29.9 
    ##  8 Portugal               1364.      14557   10.7 
    ##  9 Spain                  1356.      63061   46.5 
    ## 10 Hungary                1337.      13347    9.98
    ## 11 Bulgaria               1326.       9482    7.15
    ## 12 Sweden                 1275.      12188    9.56
    ## 13 France                 1231.      79737   64.8 
    ## 14 Argentina              1195.      49398   41.3 
    ## 15 Colombia               1178.      56290   47.8 
    ## 16 Switzerland            1176.       8914    7.58
    ## 17 Brazil                 1154.     232170  201.  
    ## 18 Chile                  1140.      19084   16.7 
    ## 19 Bolivia                1092.      10864    9.95
    ## 20 Poland                 1032.      39721   38.5

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
