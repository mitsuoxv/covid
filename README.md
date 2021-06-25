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

Updated: 2021-06-26

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
    ##  1 United States           68151. 33257768            488
    ##  2 India                   64390. 30134445            468
    ##  3 Brazil                  38741. 18169881            469
    ##  4 France                  11757.  5655376            481
    ##  5 Russia                  11657.  5409088            464
    ##  6 Turkey                  11623.  5393248            464
    ##  7 United Kingdom           9780.  4684576            479
    ##  8 Argentina                9343.  4326101            463
    ##  9 Italy                    8720.  4255700            488
    ## 10 Colombia                 8679.  4027016            464
    ## 11 Spain                    7870.  3777539            480
    ## 12 Germany                  7729.  3725580            482
    ## 13 Iran                     6461.  3140129            486
    ## 14 Poland                   6152.  2879470            468
    ## 15 Mexico                   5361.  2487747            464
    ## 16 Ukraine                  4875.  2232790            458
    ## 17 Indonesia                4429.  2072867            468
    ## 18 Peru                     4379.  2036449            465
    ## 19 South Africa             4045.  1877143            464
    ## 20 Czech Republic           3546.  1666686            470

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                338.             159096.            470
    ##  2 Jordan                        254.             116853.            460
    ##  3 Israel                        243.             114295.            471
    ##  4 Sweden                        240.             113950.            475
    ##  5 Argentina                     226.             104639.            463
    ##  6 United States                 220.             107203.            488
    ##  7 Belgium                       218.             104000.            478
    ##  8 Netherlands                   213.             101026.            475
    ##  9 Serbia                        211.              97496.            463
    ## 10 Chile                         196.              91474.            466
    ## 11 Brazil                        193.              90351.            469
    ## 12 Switzerland                   193.              92240.            479
    ## 13 Colombia                      182.              84265.            464
    ## 14 France                        182.              87317.            481
    ## 15 Hungary                       175.              80937.            462
    ## 16 Portugal                      174.              81480.            469
    ## 17 Spain                         169.              81227.            480
    ## 18 Austria                       166.              78716.            474
    ## 19 Poland                        160.              74791.            468
    ## 20 United Kingdom                157.              75135.            479

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.6        1356     6905
    ##  2 Peru                 9.38     191073  2036449
    ##  3 Mexico               9.32     231847  2487747
    ##  4 Sudan                7.52       2750    36574
    ##  5 Syria                7.35       1859    25287
    ##  6 Egypt                5.73      16002   279184
    ##  7 Somalia              5.21        775    14875
    ##  8 Ecuador              4.76      21377   449483
    ##  9 China                4.62       5451   118040
    ## 10 Bulgaria             4.28      18022   421401
    ## 11 Tanzania             4.13         21      509
    ## 12 Afghanistan          4.05       4519   111592
    ## 13 Zimbabwe             3.86       1709    44306
    ## 14 Bolivia              3.83      16329   426748
    ## 15 Hungary              3.70      29896   807910
    ## 16 Mali                 3.65        525    14397
    ## 17 Tunisia              3.64      14406   395362
    ## 18 Niger                3.53        193     5475
    ## 19 Chad                 3.51        174     4951
    ## 20 Malawi               3.34       1178    35219

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6389.     191073   29.9 
    ##  2 Hungary                2995.      29896    9.98
    ##  3 Czech Republic         2892.      30292   10.5 
    ##  4 Brazil                 2522.     507109  201.  
    ##  5 Bulgaria               2521.      18022    7.15
    ##  6 Belgium                2418.      25152   10.4 
    ##  7 Slovakia               2292.      12505    5.46
    ##  8 Argentina              2201.      90986   41.3 
    ##  9 Colombia               2133.     101947   47.8 
    ## 10 Italy                  2111.     127362   60.3 
    ## 11 Mexico                 2061.     231847  112.  
    ## 12 United Kingdom         2054.     128048   62.3 
    ## 13 Poland                 1947.      74953   38.5 
    ## 14 United States          1927.     597727  310.  
    ## 15 Chile                  1899.      31797   16.7 
    ## 16 Paraguay               1878.      11973    6.38
    ## 17 Spain                  1737.      80766   46.5 
    ## 18 France                 1698.     110001   64.8 
    ## 19 Bolivia                1642.      16329    9.95
    ## 20 Portugal               1600.      17079   10.7

EOL
