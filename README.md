WHO, Covid-19 situation report
================
Mitsuo Shiota
2020-03-07

-   [Summary](#summary)
-   [Read data from WHO](#read-data-from-who)
-   [Newly confirmed cases by region](#newly-confirmed-cases-by-region)
-   [Fastest spreading areas](#fastest-spreading-areas)
-   [Highest fatality rate areas](#highest-fatality-rate-areas)
-   [Highest deaths per population
    areas](#highest-deaths-per-population-areas)

<!-- badges: start -->

[![R-CMD-check](https://github.com/mitsuoxv/covid/workflows/R-CMD-check/badge.svg)](https://github.com/mitsuoxv/covid/actions)
<!-- badges: end -->

Updated: 2021-05-15

I added “Japan, Covid-19 situation by prefecture” in [another
page](Japan.md). I added “USA, Covid-19 situation by state” in [another
page](USA.md).

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
    ##  1 United States           74362. 32496486            437
    ##  2 India                   56448. 24046809            426
    ##  3 Brazil                  35970. 15359397            427
    ##  4 France                  13091.  5747161            439
    ##  5 Turkey                  12047.  5083996            422
    ##  6 Russia                  11665.  4922901            422
    ##  7 United Kingdom          10171.  4444635            437
    ##  8 Italy                    9280.  4139160            446
    ##  9 Spain                    8202.  3592751            438
    ## 10 Germany                  8129.  3577040            440
    ## 11 Argentina                7638.  3215572            421
    ## 12 Colombia                 7224.  3048719            422
    ## 13 Poland                   6688.  2849014            426
    ## 14 Iran                     6130.  2722007            444
    ## 15 Mexico                   5619.  2371483            422
    ## 16 Ukraine                  5152.  2143448            416
    ## 17 Peru                     4410.  1865639            423
    ## 18 Indonesia                4074.  1731652            425
    ## 19 Czech Republic           3858.  1651178            428
    ## 20 South Africa             3804.  1605252            422

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                368.             157615.            428
    ##  2 Jordan                        270.             112805.            418
    ##  3 Israel                        267.             114098.            427
    ##  4 Sweden                        248.             107571.            433
    ##  5 United States                 240.             104749.            437
    ##  6 Serbia                        228.              95904.            421
    ##  7 Belgium                       226.              98671.            436
    ##  8 Netherlands                   220.              95150.            433
    ##  9 Switzerland                   203.              88925.            437
    ## 10 France                        202.              88734.            439
    ## 11 Hungary                       190.              79783.            420
    ## 12 Argentina                     185.              77778.            421
    ## 13 Portugal                      184.              78768.            427
    ## 14 Brazil                        179.              76376.            427
    ## 15 Chile                         178.              75634.            424
    ## 16 Austria                       178.              76903.            432
    ## 17 Spain                         176.              77254.            438
    ## 18 Poland                        174.              74000.            426
    ## 19 Slovakia                      169.              70974.            421
    ## 20 United Kingdom                163.              71287.            437

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                19.6        1279     6511
    ##  2 Mexico                9.26     219590  2371483
    ##  3 Syria                 7.13       1682    23595
    ##  4 Sudan                 7.01       2446    34889
    ##  5 Egypt                 5.84      14150   242120
    ##  6 Somalia               5.20        753    14486
    ##  7 Ecuador               4.79      19442   405783
    ##  8 China                 4.67       4858   103937
    ##  9 Afghanistan           4.31       2730    63355
    ## 10 Bulgaria              4.16      17194   413320
    ## 11 Tanzania              4.13         21      509
    ## 12 Zimbabwe              4.11       1582    38491
    ## 13 Bolivia               4.11      13345   324868
    ## 14 Hungary               3.65      29041   796390
    ## 15 Niger                 3.60        192     5326
    ## 16 Tunisia               3.60      11693   324823
    ## 17 Mali                  3.59        508    14149
    ## 18 Chad                  3.52        172     4891
    ## 19 Peru                  3.48      64898  1865639
    ## 20 South Africa          3.43      55012  1605252

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Hungary                2909.      29041    9.98
    ##  2 Czech Republic         2850.      29857   10.5 
    ##  3 Bulgaria               2405.      17194    7.15
    ##  4 Belgium                2369.      24645   10.4 
    ##  5 Slovakia               2231.      12168    5.46
    ##  6 Peru                   2170.      64898   29.9 
    ##  7 Brazil                 2128.     428034  201.  
    ##  8 Italy                  2051.     123745   60.3 
    ##  9 United Kingdom         2047.     127651   62.3 
    ## 10 Mexico                 1952.     219590  112.  
    ## 11 United States          1864.     578257  310.  
    ## 12 Poland                 1852.      71311   38.5 
    ## 13 Spain                  1703.      79208   46.5 
    ## 14 Argentina              1664.      68807   41.3 
    ## 15 Colombia               1659.      79261   47.8 
    ## 16 France                 1644.     106493   64.8 
    ## 17 Chile                  1643.      27520   16.7 
    ## 18 Portugal               1592.      16999   10.7 
    ## 19 Sweden                 1493.      14267    9.56
    ## 20 Jordan                 1436.       9203    6.41

EOL
