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

Updated: 2021-08-31

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
    ##  1 United States           69538. 38524389            554
    ##  2 India                   61307. 32737939            534
    ##  3 Brazil                  38745. 20728605            535
    ##  4 Russia                  13021.  6901152            530
    ##  5 United Kingdom          12351.  6731427            545
    ##  6 France                  11980.  6553326            547
    ##  7 Turkey                  11975.  6346881            530
    ##  8 Argentina                9776.  5171458            529
    ##  9 Colombia                 9251.  4903304            530
    ## 10 Iran                     8925.  4926964            552
    ## 11 Spain                    8849.  4831809            546
    ## 12 Italy                    8177.  4530246            554
    ## 13 Indonesia                7629.  4073831            534
    ## 14 Germany                  7184.  3937106            548
    ## 15 Mexico                   6281.  3328863            530
    ## 16 Poland                   5409.  2888385            534
    ## 17 South Africa             5217.  2764931            530
    ## 18 Ukraine                  4360.  2284940            524
    ## 19 Peru                     4046.  2148419            531
    ## 20 Philippines              3659.  1954023            534

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                299.             160266.            536
    ##  2 Israel                        267.             143259.            536
    ##  3 Argentina                     236.             125086.            529
    ##  4 Jordan                        236.             124107.            526
    ##  5 United States                 224.             124179.            554
    ##  6 Sweden                        217.             117562.            541
    ##  7 Netherlands                   215.             116346.            541
    ##  8 Belgium                       208.             113228.            544
    ##  9 United Kingdom                198.             107965.            545
    ## 10 Serbia                        195.             103149.            529
    ## 11 Colombia                      194.             102601.            530
    ## 12 Brazil                        193.             103074.            535
    ## 13 Spain                         190.             103897.            546
    ## 14 Switzerland                   187.             102042.            545
    ## 15 France                        185.             101181.            547
    ## 16 Chile                         184.              97801.            532
    ## 17 Portugal                      181.              96941.            535
    ## 18 Hungary                       154.              81369.            528
    ## 19 Turkey                        154.              81575.            530
    ## 20 Austria                       154.              83061.            540

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               18.8        1461     7784
    ##  2 Peru                 9.22     198167  2148419
    ##  3 Mexico               7.75     257906  3328863
    ##  4 Sudan                7.40       2791    37708
    ##  5 Syria                7.24       2003    27654
    ##  6 Ecuador              6.43      32223   501049
    ##  7 Egypt                5.81      16721   287899
    ##  8 Somalia              5.57        963    17302
    ##  9 Afghanistan          4.65       7116   153148
    ## 10 China                4.62       5682   122995
    ## 11 Bulgaria             4.15      18731   451599
    ## 12 Myanmar              3.87      15183   392300
    ## 13 Bolivia              3.76      18402   489802
    ## 14 Hungary              3.70      30057   812227
    ## 15 Tanzania             3.66         50     1367
    ## 16 Mali                 3.63        539    14858
    ## 17 Malawi               3.58       2161    60345
    ## 18 Tunisia              3.54      23369   660587
    ## 19 Zimbabwe             3.54       4401   124437
    ## 20 Chad                 3.48        174     4993

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6626.     198167   29.9 
    ##  2 Hungary                3011.      30057    9.98
    ##  3 Czech Republic         2902.      30402   10.5 
    ##  4 Brazil                 2879.     579010  201.  
    ##  5 Argentina              2693.     111324   41.3 
    ##  6 Bulgaria               2620.      18731    7.15
    ##  7 Colombia               2610.     124743   47.8 
    ##  8 Paraguay               2462.      15698    6.38
    ##  9 Belgium                2438.      25360   10.4 
    ## 10 Slovakia               2300.      12548    5.46
    ## 11 Mexico                 2293.     257906  112.  
    ## 12 Tunisia                2207.      23369   10.6 
    ## 13 Chile                  2203.      36885   16.7 
    ## 14 Ecuador                2179.      32223   14.8 
    ## 15 Italy                  2139.     129093   60.3 
    ## 16 United Kingdom         2124.     132437   62.3 
    ## 17 United States          2034.     631134  310.  
    ## 18 Poland                 1957.      75340   38.5 
    ## 19 Bolivia                1850.      18402    9.95
    ## 20 Spain                  1806.      84000   46.5

EOL
