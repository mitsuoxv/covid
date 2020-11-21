WHO, Covid-19 situation report
================
Mitsuo Shiota
2020/3/7

  - [Summary](#summary)
  - [Read data from WHO](#read-data-from-who)
  - [Newly confirmed cases by region](#newly-confirmed-cases-by-region)
  - [Fastest spreading areas](#fastest-spreading-areas)
  - [Highest fatality rate areas](#highest-fatality-rate-areas)
  - [Highest deaths per population
    areas](#highest-deaths-per-population-areas)
  - [Save data](#save-data)

Updated: 2020-11-22

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
“Southern Europe”. “West Europe” is basically Europe other than
“Eastern Europe”.

![](README_files/figure-gfm/chart-1.png)<!-- -->

## Fastest spreading areas

Among areas with more than 5 million population, highest
“speed\_since\_100”, which is average number of newly confirmed cases
per day since cumulative cases became more than 100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_since_100 cum_conf days_since_100
    ##    <chr>                    <dbl>    <dbl>          <int>
    ##  1 United States           43931. 11597979            264
    ##  2 India                   35915.  9050597            252
    ##  3 Brazil                  23550.  5981767            254
    ##  4 Russia                   8325.  2064748            248
    ##  5 France                   7817.  2071499            265
    ##  6 Spain                    5896.  1556730            264
    ##  7 United Kingdom           5602.  1473512            263
    ##  8 Argentina                5419.  1349434            249
    ##  9 Italy                    4947.  1345767            272
    ## 10 Colombia                 4941.  1225490            248
    ## 11 Mexico                   4111.  1019543            248
    ## 12 Peru                     3790.   943917            249
    ## 13 Germany                  3393.   902528            266
    ## 14 Poland                   3251.   819262            252
    ## 15 Iran                     3068.   828377            270
    ## 16 South Africa             3063.   762763            249
    ## 17 Ukraine                  2531.   612665            242
    ## 18 Chile                    2150.   537585            250
    ## 19 Belgium                  2112.   553584            262
    ## 20 Iraq                     2110.   531769            252

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Belgium                      203.               53214.            262
    ##  2 Czech Republic               183.               46541.            254
    ##  3 Israel                       175.               44510.            254
    ##  4 Switzerland                  145.               38185.            264
    ##  5 United States                142.               37385.            264
    ##  6 Argentina                    131.               32640.            249
    ##  7 Chile                        128.               32101.            250
    ##  8 Spain                        127.               33474.            264
    ##  9 Peru                         127.               31562.            249
    ## 10 France                       121.               31983.            265
    ## 11 Brazil                       117.               29745.            254
    ## 12 Jordan                       111.               27210.            244
    ## 13 Austria                      111.               28601.            258
    ## 14 Netherlands                  109.               28394.            260
    ## 15 Colombia                     103.               25643.            248
    ## 16 Portugal                      92.3              23370.            253
    ## 17 United Kingdom                89.9              23633.            263
    ## 18 Poland                        84.4              21280.            252
    ## 19 Sweden                        84.1              21798.            259
    ## 20 Italy                         82.0              22303.            272

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  29.2         605     2073
    ##  2 Mexico                  9.82     100104  1019543
    ##  3 Sudan                   7.63       1185    15530
    ##  4 Ecuador                 7.12      13095   183840
    ##  5 Chad                    6.21        101     1626
    ##  6 Bolivia                 6.18       8889   143756
    ##  7 Egypt                   5.81       6521   112318
    ##  8 Iran                    5.30      43896   828377
    ##  9 Niger                   5.24         70     1335
    ## 10 Syria                   5.20        368     7079
    ## 11 China                   5.13       4749    92588
    ## 12 Tanzania                4.13         21      509
    ## 13 Peru                    3.76      35446   943917
    ## 14 Afghanistan             3.74       1661    44443
    ## 15 United Kingdom          3.68      54286  1473512
    ## 16 Italy                   3.61      48569  1345767
    ## 17 Canada                  3.57      11265   315751
    ## 18 Nicaragua               3.47        159     4583
    ## 19 Guatemala               3.45       4067   117757
    ## 20 Mali                    3.43        143     4169

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                1476.      15352   10.4 
    ##  2 Peru                   1185.      35446   29.9 
    ##  3 Spain                   916.      42619   46.5 
    ##  4 Chile                   896.      15003   16.7 
    ##  5 Bolivia                 894.       8889    9.95
    ##  6 Mexico                  890.     100104  112.  
    ##  7 Ecuador                 885.      13095   14.8 
    ##  8 Argentina               884.      36532   41.3 
    ##  9 United Kingdom          871.      54286   62.3 
    ## 10 Brazil                  836.     168061  201.  
    ## 11 United States           808.     250607  310.  
    ## 12 Italy                   805.      48569   60.3 
    ## 13 France                  740.      47917   64.8 
    ## 14 Colombia                727.      34761   47.8 
    ## 15 Sweden                  670.       6406    9.56
    ## 16 Czech Republic          670.       7021   10.5 
    ## 17 Iran                    571.      43896   76.9 
    ## 18 Netherlands             529.       8810   16.6 
    ## 19 Switzerland             471.       3567    7.58
    ## 20 Romania                 444.       9756   22.0

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
