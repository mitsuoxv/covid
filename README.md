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

Updated: 2021-07-10

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
    ##  1 United States           66637. 33451965            502
    ##  2 India                   63803. 30752950            482
    ##  3 Brazil                  39149. 18909037            483
    ##  4 Russia                  11994.  5733218            478
    ##  5 France                  11487.  5686066            495
    ##  6 Turkey                  11433.  5465094            478
    ##  7 United Kingdom          10188.  5022897            493
    ##  8 Argentina                9630.  4593763            477
    ##  9 Colombia                 9261.  4426811            478
    ## 10 Italy                    8500.  4267105            502
    ## 11 Spain                    7925.  3915313            494
    ## 12 Germany                  7529.  3734468            496
    ## 13 Iran                     6655.  3327526            500
    ## 14 Poland                   5976.  2880670            482
    ## 15 Mexico                   5352.  2558369            478
    ## 16 Indonesia                5095.  2455912            482
    ## 17 Ukraine                  4746.  2240246            472
    ## 18 South Africa             4467.  2135246            478
    ## 19 Peru                     4325.  2071637            479
    ## 20 Netherlands              3480.  1701911            489

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                329.             159306.            484
    ##  2 Jordan                        249.             117827.            474
    ##  3 Israel                        237.             114920.            485
    ##  4 Sweden                        234.             114307.            489
    ##  5 Argentina                     233.             111113.            477
    ##  6 United States                 215.             107829.            502
    ##  7 Belgium                       213.             105016.            492
    ##  8 Netherlands                   209.             102248.            489
    ##  9 Serbia                        205.              97659.            477
    ## 10 Chile                         196.              94324.            480
    ## 11 Brazil                        195.              94026.            483
    ## 12 Colombia                      194.              92630.            478
    ## 13 Switzerland                   188.              92530.            493
    ## 14 France                        177.              87791.            495
    ## 15 Portugal                      174.              84235.            483
    ## 16 Spain                         170.              84189.            494
    ## 17 Hungary                       170.              80989.            476
    ## 18 United Kingdom                163.              80562.            493
    ## 19 Austria                       162.              78868.            488
    ## 20 Poland                        155.              74823.            482

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.7        1364     6934
    ##  2 Peru                 9.35     193743  2071637
    ##  3 Mexico               9.15     234192  2558369
    ##  4 Sudan                7.50       2760    36805
    ##  5 Syria                7.36       1893    25735
    ##  6 Egypt                5.78      16332   282582
    ##  7 Somalia              5.17        775    14995
    ##  8 Ecuador              4.67      21768   465878
    ##  9 China                4.67       5566   119141
    ## 10 Bulgaria             4.29      18134   422353
    ## 11 Afghanistan          4.23       5561   131586
    ## 12 Tanzania             4.13         21      509
    ## 13 Bolivia              3.80      17067   449687
    ## 14 Hungary              3.71      30004   808437
    ## 15 Mali                 3.65        528    14456
    ## 16 Chad                 3.51        174     4953
    ## 17 Niger                3.51        194     5529
    ## 18 Tunisia              3.38      15735   464914
    ## 19 Zimbabwe             3.25       2029    62383
    ## 20 Malawi               3.23       1227    37983

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6478.     193743   29.9 
    ##  2 Hungary                3006.      30004    9.98
    ##  3 Czech Republic         2895.      30331   10.5 
    ##  4 Brazil                 2628.     528540  201.  
    ##  5 Bulgaria               2537.      18134    7.15
    ##  6 Belgium                2422.      25196   10.4 
    ##  7 Argentina              2357.      97439   41.3 
    ##  8 Colombia               2314.     110578   47.8 
    ##  9 Slovakia               2294.      12516    5.46
    ## 10 Paraguay               2140.      13645    6.38
    ## 11 Italy                  2117.     127731   60.3 
    ## 12 Mexico                 2082.     234192  112.  
    ## 13 United Kingdom         2058.     128336   62.3 
    ## 14 Chile                  2001.      33514   16.7 
    ## 15 Poland                 1952       75152   38.5 
    ## 16 United States          1938.     601231  310.  
    ## 17 Spain                  1742.      80997   46.5 
    ## 18 Bolivia                1716.      17067    9.95
    ## 19 France                 1704.     110341   64.8 
    ## 20 Portugal               1605.      17135   10.7

EOL
