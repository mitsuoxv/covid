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

Updated: 2021-06-30

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
    ##  1 United States           67681. 33299361            492
    ##  2 India                   64230. 30316897            472
    ##  3 Brazil                  38944. 18420598            473
    ##  4 Russia                  11738.  5493557            468
    ##  5 France                  11672.  5661069            485
    ##  6 Turkey                  11569.  5414310            468
    ##  7 United Kingdom           9845.  4755082            483
    ##  8 Argentina                9433.  4405247            467
    ##  9 Colombia                 8886.  4158716            468
    ## 10 Italy                    8655.  4258456            492
    ## 11 Spain                    7836.  3792642            484
    ## 12 Germany                  7669.  3727333            486
    ## 13 Iran                     6490.  3180092            490
    ## 14 Poland                   6101.  2879811            472
    ## 15 Mexico                   5354.  2505792            468
    ## 16 Ukraine                  4836.  2234463            462
    ## 17 Indonesia                4569.  2156465            472
    ## 18 Peru                     4367.  2048115            469
    ## 19 South Africa             4147.  1941119            468
    ## 20 Czech Republic           3517.  1667115            474

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                336.             159137.            474
    ##  2 Jordan                        252.             117119.            464
    ##  3 Israel                        241.             114403.            475
    ##  4 Sweden                        238.             113950.            479
    ##  5 Argentina                     228.             106553.            467
    ##  6 United States                 218.             107337.            492
    ##  7 Belgium                       216.             104151.            482
    ##  8 Netherlands                   211.             101161.            479
    ##  9 Serbia                        209.              97536.            467
    ## 10 Chile                         197.              92625.            470
    ## 11 Brazil                        194.              91598.            473
    ## 12 Switzerland                   191.              92286.            483
    ## 13 Colombia                      186.              87021.            468
    ## 14 France                        180.              87405.            485
    ## 15 Hungary                       174.              80953.            466
    ## 16 Portugal                      173.              82002.            473
    ## 17 Spain                         168.              81552.            484
    ## 18 Austria                       165.              78757.            478
    ## 19 Poland                        158.              74800.            472
    ## 20 United Kingdom                158.              76266.            483

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.7        1361     6909
    ##  2 Peru                 9.37     191899  2048115
    ##  3 Mexico               9.28     232564  2505792
    ##  4 Sudan                7.52       2754    36620
    ##  5 Syria                7.35       1870    25442
    ##  6 Egypt                5.74      16125   280770
    ##  7 Somalia              5.19        775    14933
    ##  8 Ecuador              4.72      21523   455743
    ##  9 China                4.63       5481   118439
    ## 10 Bulgaria             4.28      18040   421646
    ## 11 Tanzania             4.13         21      509
    ## 12 Afghanistan          4.09       4794   117158
    ## 13 Bolivia              3.82      16581   433935
    ## 14 Hungary              3.70      29906   808076
    ## 15 Zimbabwe             3.70       1749    47284
    ## 16 Mali                 3.64        525    14420
    ## 17 Tunisia              3.60      14737   408931
    ## 18 Niger                3.52        193     5480
    ## 19 Chad                 3.51        174     4951
    ## 20 Malawi               3.32       1187    35709

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6417.     191899   29.9 
    ##  2 Hungary                2996.      29906    9.98
    ##  3 Czech Republic         2892.      30298   10.5 
    ##  4 Brazil                 2553.     513474  201.  
    ##  5 Bulgaria               2524.      18040    7.15
    ##  6 Belgium                2419.      25168   10.4 
    ##  7 Slovakia               2293.      12510    5.46
    ##  8 Argentina              2239.      92568   41.3 
    ##  9 Colombia               2190.     104678   47.8 
    ## 10 Italy                  2113.     127500   60.3 
    ## 11 Mexico                 2068.     232564  112.  
    ## 12 United Kingdom         2055.     128103   62.3 
    ## 13 Paraguay               1963.      12517    6.38
    ## 14 Poland                 1948.      75005   38.5 
    ## 15 Chile                  1938.      32454   16.7 
    ## 16 United States          1930.     598787  310.  
    ## 17 Spain                  1737.      80789   46.5 
    ## 18 France                 1700.     110094   64.8 
    ## 19 Bolivia                1667.      16581    9.95
    ## 20 Portugal               1600.      17086   10.7

EOL
