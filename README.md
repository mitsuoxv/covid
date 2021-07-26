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

Updated: 2021-07-27

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

    ## # A tibble: 20 × 4
    ##    area           speed_since_100 cum_conf days_since_100
    ##    <chr>                    <dbl>    <dbl>          <int>
    ##  1 United States           65941. 34223487            519
    ##  2 India                   62948. 31411262            499
    ##  3 Brazil                  39341. 19670534            500
    ##  4 Russia                  12424.  6149780            495
    ##  5 France                  11467.  5871115            512
    ##  6 Turkey                  11316.  5601608            495
    ##  7 United Kingdom          11172.  5697916            510
    ##  8 Argentina                9796.  4839109            494
    ##  9 Colombia                 9529.  4716798            495
    ## 10 Italy                    8318.  4317415            519
    ## 11 Spain                    8315.  4249258            511
    ## 12 Germany                  7323.  3756856            513
    ## 13 Iran                     7140.  3691432            517
    ## 14 Indonesia                6402.  3194733            499
    ## 15 Poland                   5776.  2882220            499
    ## 16 Mexico                   5539.  2741983            495
    ## 17 South Africa             4803.  2377823            495
    ## 18 Ukraine                  4598.  2248663            489
    ## 19 Peru                     4239.  2102904            496
    ## 20 Netherlands              3643.  1843521            506

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                319.             159655.            501
    ##  2 Jordan                        243.             119396.            491
    ##  3 Argentina                     237.             117047.            494
    ##  4 Israel                        233.             117150.            502
    ##  5 Sweden                        227.             114777.            506
    ##  6 Netherlands                   219.             110755.            506
    ##  7 United States                 213.             110315.            519
    ##  8 Belgium                       210.             107033.            509
    ##  9 Colombia                      199.              98698.            495
    ## 10 Serbia                        198.              98043.            494
    ## 11 Brazil                        196.              97813.            500
    ## 12 Chile                         193.              96090.            497
    ## 13 Switzerland                   183.              93588.            510
    ## 14 United Kingdom                179.              91388.            510
    ## 15 Spain                         179.              91370.            511
    ## 16 Portugal                      179.              89271.            500
    ## 17 France                        177.              90648.            512
    ## 18 Hungary                       164.              81072.            493
    ## 19 Austria                       157.              79448.            505
    ## 20 Poland                        150.              74863.            499

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.6        1373     7012
    ##  2 Peru                 9.31     195795  2102904
    ##  3 Mexico               8.69     238316  2741983
    ##  4 Sudan                7.47       2776    37138
    ##  5 Syria                7.37       1906    25877
    ##  6 Ecuador              6.41      30797   480720
    ##  7 Egypt                5.80      16487   284024
    ##  8 Somalia              5.23        796    15230
    ##  9 China                4.69       5634   120213
    ## 10 Afghanistan          4.49       6477   144285
    ## 11 Bulgaria             4.29      18194   423686
    ## 12 Bolivia              3.77      17637   467975
    ## 13 Hungary              3.71      30020   809262
    ## 14 Mali                 3.64        530    14543
    ## 15 Chad                 3.50        174     4969
    ## 16 Niger                3.48        195     5599
    ## 17 Tanzania             3.45         21      609
    ## 18 Tunisia              3.27      18600   569289
    ## 19 Paraguay             3.25      14593   448918
    ## 20 Slovakia             3.19      12534   392355

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6547.     195795   29.9 
    ##  2 Hungary                3007.      30020    9.98
    ##  3 Czech Republic         2898.      30357   10.5 
    ##  4 Brazil                 2732.     549448  201.  
    ##  5 Bulgaria               2545.      18194    7.15
    ##  6 Argentina              2505.     103584   41.3 
    ##  7 Colombia               2480.     118538   47.8 
    ##  8 Belgium                2424.      25220   10.4 
    ##  9 Slovakia               2298.      12534    5.46
    ## 10 Paraguay               2289.      14593    6.38
    ## 11 Italy                  2120.     127949   60.3 
    ## 12 Mexico                 2119.     238316  112.  
    ## 13 Chile                  2092.      35026   16.7 
    ## 14 Ecuador                2082.      30797   14.8 
    ## 15 United Kingdom         2072.     129158   62.3 
    ## 16 Poland                 1954.      75242   38.5 
    ## 17 United States          1952.     605656  310.  
    ## 18 Bolivia                1773.      17637    9.95
    ## 19 Tunisia                1757.      18600   10.6 
    ## 20 Spain                  1746.      81194   46.5

EOL
