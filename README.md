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

Updated: 2021-07-09

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
    ##  1 United States           66725. 33429396            501
    ##  2 India                   63845. 30709557            481
    ##  3 Brazil                  39118. 18855015            482
    ##  4 Russia                  11965   5707452            477
    ##  5 France                  11501.  5681827            494
    ##  6 Turkey                  11446.  5459923            477
    ##  7 United Kingdom          10144.  4990920            492
    ##  8 Argentina                9610.  4574340            476
    ##  9 Colombia                 9230.  4402582            477
    ## 10 Italy                    8514.  4265714            501
    ## 11 Spain                    7906.  3897996            493
    ## 12 Germany                  7542.  3733519            495
    ## 13 Iran                     6621.  3304135            499
    ## 14 Poland                   5989.  2880596            481
    ## 15 Mexico                   5345.  2549862            477
    ## 16 Indonesia                5026.  2417788            481
    ## 17 Ukraine                  4755.  2239591            471
    ## 18 South Africa             4428.  2112336            477
    ## 19 Peru                     4328.  2069051            478
    ## 20 Netherlands              3476.  1696480            488

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                330.             159280.            483
    ##  2 Jordan                        249.             117827.            473
    ##  3 Israel                        237.             114861.            484
    ##  4 Sweden                        234.             114284.            488
    ##  5 Argentina                     232.             110643.            476
    ##  6 United States                 215.             107756.            501
    ##  7 Belgium                       214.             104883.            491
    ##  8 Netherlands                   209.             101921.            488
    ##  9 Serbia                        205.              97646.            476
    ## 10 Chile                         196.              94129.            479
    ## 11 Brazil                        195.              93758.            482
    ## 12 Colombia                      193.              92123.            477
    ## 13 Switzerland                   188.              92495.            492
    ## 14 France                        178.              87725.            494
    ## 15 Portugal                      174.              83929.            482
    ## 16 Hungary                       170.              80985.            475
    ## 17 Spain                         170.              83817.            493
    ## 18 United Kingdom                163.              80049.            492
    ## 19 Austria                       162.              78854.            487
    ## 20 Poland                        156.              74821.            481

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.7        1364     6934
    ##  2 Peru                 9.36     193588  2069051
    ##  3 Mexico               9.18     233958  2549862
    ##  4 Sudan                7.50       2760    36805
    ##  5 Syria                7.36       1893    25735
    ##  6 Egypt                5.78      16332   282582
    ##  7 Somalia              5.17        775    14995
    ##  8 Ecuador              4.67      21728   465029
    ##  9 China                4.67       5563   119094
    ## 10 Bulgaria             4.29      18129   422298
    ## 11 Afghanistan          4.21       5477   130113
    ## 12 Tanzania             4.13         21      509
    ## 13 Bolivia              3.80      17013   448213
    ## 14 Hungary              3.71      30004   808393
    ## 15 Mali                 3.65        527    14455
    ## 16 Niger                3.51        194     5526
    ## 17 Chad                 3.50        174     4972
    ## 18 Tunisia              3.38      15735   464914
    ## 19 Zimbabwe             3.28       1973    60227
    ## 20 Malawi               3.24       1218    37556

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6473.     193588   29.9 
    ##  2 Hungary                3006.      30004    9.98
    ##  3 Czech Republic         2895.      30331   10.5 
    ##  4 Brazil                 2620.     526892  201.  
    ##  5 Bulgaria               2536.      18129    7.15
    ##  6 Belgium                2422.      25196   10.4 
    ##  7 Argentina              2346.      96983   41.3 
    ##  8 Colombia               2302.     110019   47.8 
    ##  9 Slovakia               2294.      12516    5.46
    ## 10 Paraguay               2126.      13553    6.38
    ## 11 Italy                  2117.     127718   60.3 
    ## 12 Mexico                 2080.     233958  112.  
    ## 13 United Kingdom         2058.     128301   62.3 
    ## 14 Chile                  1990.      33328   16.7 
    ## 15 Poland                 1952.      75135   38.5 
    ## 16 United States          1937.     600930  310.  
    ## 17 Spain                  1741.      80969   46.5 
    ## 18 Bolivia                1710.      17013    9.95
    ## 19 France                 1703.     110318   64.8 
    ## 20 Portugal               1604.      17126   10.7

EOL
