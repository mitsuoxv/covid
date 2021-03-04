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

Updated: 2021-03-05

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
    ##  1 United States           77393. 28403416            367
    ##  2 India                   31428. 11156923            355
    ##  3 Brazil                  29823. 10646926            357
    ##  4 Russia                  12222.  4290135            351
    ##  5 United Kingdom          11461.  4194789            366
    ##  6 France                  10174.  3744060            368
    ##  7 Spain                    8545.  3136321            367
    ##  8 Italy                    7936.  2976274            375
    ##  9 Turkey                   7791.  2734836            351
    ## 10 Germany                  6699.  2471942            369
    ## 11 Colombia                 6437.  2259599            351
    ## 12 Argentina                6041.  2126531            352
    ## 13 Mexico                   5975.  2097194            351
    ## 14 Poland                   4931.  1750659            355
    ## 15 Iran                     4441.  1656699            373
    ## 16 South Africa             4307.  1516262            352
    ## 17 Ukraine                  3984.  1374762            345
    ## 18 Indonesia                3813.  1353834            355
    ## 19 Peru                     3802.  1338297            352
    ## 20 Czech Republic           3597.  1284288            357

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                343.             122593.            357
    ##  2 Israel                        299.             106322.            356
    ##  3 United States                 249.              91555.            367
    ##  4 Portugal                      212.              75555.            356
    ##  5 Belgium                       205.              74748.            365
    ##  6 Switzerland                   201.              73498.            366
    ##  7 Sweden                        195.              70668.            362
    ##  8 United Kingdom                184.              67280.            366
    ##  9 Spain                         184.              67439.            367
    ## 10 Jordan                        183.              63620.            347
    ## 11 Serbia                        183.              64119.            350
    ## 12 Netherlands                   183.              66172.            362
    ## 13 Slovakia                      166.              58141.            350
    ## 14 France                        157.              57807.            368
    ## 15 Austria                       156.              56268.            361
    ## 16 Brazil                        148.              52943.            357
    ## 17 Argentina                     146.              51436.            352
    ## 18 Chile                         141.              49894.            353
    ## 19 Colombia                      135.              47282.            351
    ## 20 Italy                         132.              49325.            375

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               27.2         644     2367
    ##  2 Mexico               8.93     187187  2097194
    ##  3 Syria                6.63       1045    15753
    ##  4 Sudan                6.22       1895    30479
    ##  5 Egypt                5.88      10822   184168
    ##  6 Ecuador              5.50      15921   289472
    ##  7 China                4.75       4845   101995
    ##  8 Bolivia              4.67      11703   250557
    ##  9 Afghanistan          4.39       2446    55775
    ## 10 Mali                 4.23        357     8446
    ## 11 Tanzania             4.13         21      509
    ## 12 Bulgaria             4.11      10413   253183
    ## 13 Zimbabwe             4.09       1478    36179
    ## 14 Guatemala            3.66       6412   175411
    ## 15 Iran                 3.64      60353  1656699
    ## 16 Niger                3.63        172     4740
    ## 17 Peru                 3.50      46894  1338297
    ## 18 Hungary              3.47      15476   446178
    ## 19 Chad                 3.45        140     4056
    ## 20 Tunisia              3.44       8074   235008

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                2131.      22169   10.4 
    ##  2 Czech Republic         2017.      21128   10.5 
    ##  3 United Kingdom         1985.     123783   62.3 
    ##  4 Mexico                 1664.     187187  112.  
    ##  5 United States          1654.     513071  310.  
    ##  6 Italy                  1635.      98635   60.3 
    ##  7 Peru                   1568.      46894   29.9 
    ##  8 Hungary                1550.      15476    9.98
    ##  9 Portugal               1539.      16430   10.7 
    ## 10 Spain                  1510.      70247   46.5 
    ## 11 Bulgaria               1457.      10413    7.15
    ## 12 Slovakia               1386.       7560    5.46
    ## 13 Sweden                 1357.      12964    9.56
    ## 14 France                 1345.      87093   64.8 
    ## 15 Brazil                 1280.     257361  201.  
    ## 16 Argentina              1269.      52453   41.3 
    ## 17 Colombia               1255.      59972   47.8 
    ## 18 Chile                  1236.      20704   16.7 
    ## 19 Switzerland            1221.       9258    7.58
    ## 20 Bolivia                1176.      11703    9.95

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
