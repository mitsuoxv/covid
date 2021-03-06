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

Updated: 2021-03-07

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
    ##  1 United States           77151. 28468736            369
    ##  2 India                   31350. 11192088            357
    ##  3 Brazil                  30066. 10793732            359
    ##  4 Russia                  12215.  4312181            353
    ##  5 United Kingdom          11433.  4207308            368
    ##  6 France                  10247.  3791524            370
    ##  7 Spain                    8516.  3142358            369
    ##  8 Italy                    8019.  3023129            377
    ##  9 Turkey                   7811.  2757460            353
    ## 10 Germany                  6717.  2492079            371
    ## 11 Colombia                 6420.  2266211            353
    ## 12 Argentina                6050.  2141854            354
    ## 13 Mexico                   5984.  2112508            353
    ## 14 Poland                   4948.  1766490            357
    ## 15 Iran                     4462.  1673470            375
    ## 16 South Africa             4291.  1518979            354
    ## 17 Ukraine                  4017.  1394061            347
    ## 18 Indonesia                3832.  1368069            357
    ## 19 Peru                     3813.  1349847            354
    ## 20 Czech Republic           3655.  1312164            359

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                349.             125254.            359
    ##  2 Israel                        299.             106964.            358
    ##  3 United States                 249.              91766.            369
    ##  4 Portugal                      211.              75722.            358
    ##  5 Belgium                       205.              75268.            367
    ##  6 Switzerland                   201.              73820.            368
    ##  7 Sweden                        197.              71679.            364
    ##  8 Jordan                        187.              65230.            349
    ##  9 Serbia                        185.              65199.            352
    ## 10 United Kingdom                183.              67481.            368
    ## 11 Netherlands                   183.              66699.            364
    ## 12 Spain                         183.              67569.            369
    ## 13 Slovakia                      168.              59047.            352
    ## 14 France                        158.              58540.            370
    ## 15 Austria                       157.              56879.            363
    ## 16 Brazil                        150.              53673.            359
    ## 17 Argentina                     146.              51807.            354
    ## 18 Chile                         142.              50485.            355
    ## 19 Colombia                      134.              47420.            353
    ## 20 Italy                         133.              50101.            377

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               26.9         649     2415
    ##  2 Mexico               8.94     188866  2112508
    ##  3 Syria                6.64       1054    15870
    ##  4 Sudan                6.22       1895    30479
    ##  5 Egypt                5.89      10916   185334
    ##  6 Ecuador              5.50      15997   291070
    ##  7 China                4.75       4846   102036
    ##  8 Bolivia              4.66      11761   252360
    ##  9 Afghanistan          4.39       2449    55840
    ## 10 Mali                 4.21        358     8509
    ## 11 Tanzania             4.13         21      509
    ## 12 Zimbabwe             4.09       1484    36248
    ## 13 Bulgaria             4.09      10571   258385
    ## 14 Guatemala            3.64       6435   176876
    ## 15 Niger                3.63        172     4740
    ## 16 Iran                 3.62      60512  1673470
    ## 17 Peru                 3.50      47306  1349847
    ## 18 Somalia              3.49        274     7850
    ## 19 Tunisia              3.44       8130   236356
    ## 20 Hungary              3.43      15765   459816

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                2135.      22215   10.4 
    ##  2 Czech Republic         2058.      21558   10.5 
    ##  3 United Kingdom         1993.     124261   62.3 
    ##  4 Mexico                 1679.     188866  112.  
    ##  5 United States          1660.     515013  310.  
    ##  6 Italy                  1645.      99271   60.3 
    ##  7 Peru                   1582.      47306   29.9 
    ##  8 Hungary                1579.      15765    9.98
    ##  9 Portugal               1544.      16486   10.7 
    ## 10 Spain                  1516.      70501   46.5 
    ## 11 Bulgaria               1479.      10571    7.15
    ## 12 Slovakia               1419.       7739    5.46
    ## 13 Sweden                 1361.      13003    9.56
    ## 14 France                 1355.      87776   64.8 
    ## 15 Brazil                 1298.     260970  201.  
    ## 16 Argentina              1277.      52784   41.3 
    ## 17 Colombia               1259.      60189   47.8 
    ## 18 Chile                  1250.      20928   16.7 
    ## 19 Switzerland            1224.       9278    7.58
    ## 20 Bolivia                1182.      11761    9.95

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
