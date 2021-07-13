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

Updated: 2021-07-14

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
    ##  1 United States           66243. 33518946            506
    ##  2 India                   63595. 30907282            486
    ##  3 Brazil                  39199. 19089940            487
    ##  4 Russia                  12102.  5833175            482
    ##  5 France                  11423.  5700017            499
    ##  6 Turkey                  11383.  5486959            482
    ##  7 United Kingdom          10373.  5155247            497
    ##  8 Argentina                9663.  4647948            481
    ##  9 Colombia                 9361.  4511960            482
    ## 10 Italy                    8443.  4272163            506
    ## 11 Spain                    7974.  3971124            498
    ## 12 Germany                  7474.  3737135            500
    ## 13 Iran                     6734.  3394279            504
    ## 14 Poland                   5928.  2880959            486
    ## 15 Indonesia                5382.  2615529            486
    ## 16 Mexico                   5374.  2590500            482
    ## 17 Ukraine                  4709.  2241698            476
    ## 18 South Africa             4578.  2206781            482
    ## 19 Peru                     4308.  2080777            483
    ## 20 Netherlands              3523.  1736879            493

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                327.             159388.            488
    ##  2 Jordan                        247.             118258.            478
    ##  3 Israel                        236.             115190.            489
    ##  4 Argentina                     234.             112424.            481
    ##  5 Sweden                        232.             114332.            493
    ##  6 United States                 214.             108044.            506
    ##  7 Belgium                       213.             105453.            496
    ##  8 Netherlands                   212.             104348.            493
    ##  9 Serbia                        203.              97710.            481
    ## 10 Chile                         196.              94923.            484
    ## 11 Colombia                      196.              94412.            482
    ## 12 Brazil                        195.              94926.            487
    ## 13 Switzerland                   186.              92681.            497
    ## 14 France                        176.              88006.            499
    ## 15 Portugal                      175.              85215.            487
    ## 16 Spain                         171.              85390.            498
    ## 17 Hungary                       169.              81001.            480
    ## 18 United Kingdom                166.              82684.            497
    ## 19 Austria                       160.              78901.            492
    ## 20 Poland                        154.              74830.            486

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.6        1366     6952
    ##  2 Peru                 9.34     194387  2080777
    ##  3 Mexico               9.07     234969  2590500
    ##  4 Sudan                7.50       2760    36805
    ##  5 Syria                7.36       1899    25795
    ##  6 Egypt                5.79      16403   283212
    ##  7 Somalia              5.17        779    15060
    ##  8 China                4.68       5589   119374
    ##  9 Ecuador              4.66      21830   468414
    ## 10 Afghanistan          4.30       5849   135889
    ## 11 Bulgaria             4.29      18144   422545
    ## 12 Tanzania             4.13         21      509
    ## 13 Bolivia              3.79      17219   454241
    ## 14 Hungary              3.71      30010   808556
    ## 15 Mali                 3.65        528    14477
    ## 16 Chad                 3.51        174     4954
    ## 17 Niger                3.50        194     5538
    ## 18 Tunisia              3.29      16494   501923
    ## 19 Slovakia             3.19      12522   391953
    ## 20 Malawi               3.19       1256    39418

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6500.     194387   29.9 
    ##  2 Hungary                3006.      30010    9.98
    ##  3 Czech Republic         2895.      30333   10.5 
    ##  4 Brazil                 2653.     533488  201.  
    ##  5 Bulgaria               2538.      18144    7.15
    ##  6 Belgium                2423.      25205   10.4 
    ##  7 Argentina              2389.      98781   41.3 
    ##  8 Colombia               2361.     112826   47.8 
    ##  9 Slovakia               2296.      12522    5.46
    ## 10 Paraguay               2183.      13918    6.38
    ## 11 Italy                  2118.     127788   60.3 
    ## 12 Mexico                 2089.     234969  112.  
    ## 13 United Kingdom         2060.     128431   62.3 
    ## 14 Chile                  2029.      33980   16.7 
    ## 15 Poland                 1953.      75173   38.5 
    ## 16 United States          1940.     601980  310.  
    ## 17 Spain                  1742.      81020   46.5 
    ## 18 Bolivia                1731.      17219    9.95
    ## 19 France                 1705.     110400   64.8 
    ## 20 Portugal               1608.      17164   10.7

EOL
