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

Updated: 2021-07-01

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
    ##  1 United States           67582. 33317803            493
    ##  2 India                   64192. 30362848            473
    ##  3 Brazil                  38920. 18448402            474
    ##  4 Russia                  11758.  5514599            469
    ##  5 France                  11650.  5662173            486
    ##  6 Turkey                  11556.  5420156            469
    ##  7 United Kingdom           9866.  4775305            484
    ##  8 Argentina                9452.  4423636            468
    ##  9 Colombia                 8928.  4187194            469
    ## 10 Italy                    8639.  4259133            493
    ## 11 Spain                    7834.  3799733            485
    ## 12 Germany                  7655.  3728141            487
    ## 13 Iran                     6502.  3192809            491
    ## 14 Poland                   6088.  2879912            473
    ## 15 Mexico                   5346.  2507453            469
    ## 16 Ukraine                  4827.  2235096            463
    ## 17 Indonesia                4605.  2178272            473
    ## 18 Peru                     4361.  2049567            470
    ## 19 South Africa             4167.  1954466            469
    ## 20 Czech Republic           3510.  1667287            475

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                335.             159153.            475
    ##  2 Jordan                        252.             117196.            465
    ##  3 Israel                        240.             114443.            476
    ##  4 Sweden                        238.             114039.            480
    ##  5 Argentina                     229.             106998.            468
    ##  6 United States                 218.             107396.            493
    ##  7 Belgium                       216.             104254.            483
    ##  8 Netherlands                   211.             101194.            480
    ##  9 Serbia                        208.              97546.            468
    ## 10 Chile                         197.              92782.            471
    ## 11 Brazil                        194.              91736.            474
    ## 12 Switzerland                   191.              92303.            484
    ## 13 Colombia                      187.              87617.            469
    ## 14 France                        180.              87422.            486
    ## 15 Hungary                       173.              80959.            467
    ## 16 Portugal                      173.              82165.            474
    ## 17 Spain                         168.              81704.            485
    ## 18 Austria                       164.              78755.            479
    ## 19 United Kingdom                158.              76591.            484
    ## 20 Poland                        158.              74803.            473

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.7        1361     6918
    ##  2 Peru                 9.38     192163  2049567
    ##  3 Mexico               9.28     232608  2507453
    ##  4 Sudan                7.51       2754    36658
    ##  5 Syria                7.35       1873    25479
    ##  6 Egypt                5.75      16148   281031
    ##  7 Somalia              5.19        775    14933
    ##  8 Ecuador              4.72      21523   455743
    ##  9 China                4.63       5490   118503
    ## 10 Bulgaria             4.28      18049   421751
    ## 11 Tanzania             4.13         21      509
    ## 12 Afghanistan          4.11       4871   118659
    ## 13 Bolivia              3.82      16631   435568
    ## 14 Hungary              3.70      29907   808128
    ## 15 Mali                 3.65        526    14423
    ## 16 Zimbabwe             3.63       1761    48533
    ## 17 Tunisia              3.58      14843   414182
    ## 18 Niger                3.52        193     5488
    ## 19 Chad                 3.51        174     4951
    ## 20 Malawi               3.33       1194    35897

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6425.     192163   29.9 
    ##  2 Hungary                2996.      29907    9.98
    ##  3 Czech Republic         2893.      30303   10.5 
    ##  4 Brazil                 2556.     514092  201.  
    ##  5 Bulgaria               2525.      18049    7.15
    ##  6 Belgium                2419.      25170   10.4 
    ##  7 Slovakia               2293.      12510    5.46
    ##  8 Argentina              2253.      93142   41.3 
    ##  9 Colombia               2204.     105326   47.8 
    ## 10 Italy                  2114.     127542   60.3 
    ## 11 Mexico                 2068.     232608  112.  
    ## 12 United Kingdom         2055.     128126   62.3 
    ## 13 Paraguay               1983.      12641    6.38
    ## 14 Poland                 1949.      75021   38.5 
    ## 15 Chile                  1940.      32489   16.7 
    ## 16 United States          1931.     599089  310.  
    ## 17 Spain                  1738.      80829   46.5 
    ## 18 France                 1700.     110137   64.8 
    ## 19 Bolivia                1672.      16631    9.95
    ## 20 Portugal               1601.      17092   10.7

EOL
