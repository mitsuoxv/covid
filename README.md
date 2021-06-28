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

Updated: 2021-06-29

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
    ##  1 United States           67791. 33285377            491
    ##  2 India                   64287. 30279331            471
    ##  3 Brazil                  38955. 18386894            472
    ##  4 Russia                  11719.  5472941            467
    ##  5 France                  11696.  5660815            484
    ##  6 Turkey                  11582.  5409027            467
    ##  7 United Kingdom           9818.  4732438            482
    ##  8 Argentina                9427.  4393142            466
    ##  9 Colombia                 8836.  4126340            467
    ## 10 Italy                    8672.  4258069            491
    ## 11 Spain                    7821.  3777539            483
    ## 12 Germany                  7684.  3726929            485
    ## 13 Iran                     6478.  3167741            489
    ## 14 Poland                   6114.  2879689            471
    ## 15 Mexico                   5360.  2503408            467
    ## 16 Ukraine                  4846.  2234281            461
    ## 17 Indonesia                4491.  2115304            471
    ## 18 Peru                     4372.  2046057            468
    ## 19 South Africa             4130.  1928897            467
    ## 20 Czech Republic           3524.  1666947            473

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                336.             159121.            473
    ##  2 Jordan                        253.             117024.            463
    ##  3 Israel                        241.             114359.            474
    ##  4 Sweden                        238.             113950.            478
    ##  5 Argentina                     228.             106260.            466
    ##  6 United States                 219.             107292.            491
    ##  7 Belgium                       216.             104054.            481
    ##  8 Netherlands                   212.             101128.            478
    ##  9 Serbia                        209.              97524.            466
    ## 10 Chile                         197.              92384.            469
    ## 11 Brazil                        194.              91430.            472
    ## 12 Switzerland                   191.              92255.            482
    ## 13 Colombia                      185.              86343.            467
    ## 14 France                        181.              87401.            484
    ## 15 Hungary                       174.              80950.            465
    ## 16 Portugal                      174.              81917.            472
    ## 17 Spain                         168.              81227.            483
    ## 18 Austria                       165.              78762.            477
    ## 19 Poland                        159.              74797.            471
    ## 20 United Kingdom                157.              75903.            482

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.7        1360     6908
    ##  2 Peru                 9.36     191584  2046057
    ##  3 Mexico               9.29     232521  2503408
    ##  4 Sudan                7.52       2754    36620
    ##  5 Syria                7.35       1867    25404
    ##  6 Egypt                5.74      16092   280394
    ##  7 Somalia              5.20        775    14892
    ##  8 Ecuador              4.74      21523   454336
    ##  9 China                4.63       5478   118358
    ## 10 Bulgaria             4.28      18027   421531
    ## 11 Tanzania             4.13         21      509
    ## 12 Afghanistan          4.09       4730   115751
    ## 13 Bolivia              3.82      16551   433013
    ## 14 Zimbabwe             3.74       1736    46442
    ## 15 Hungary              3.70      29904   808042
    ## 16 Mali                 3.64        525    14418
    ## 17 Tunisia              3.60      14654   407017
    ## 18 Niger                3.52        193     5479
    ## 19 Chad                 3.51        174     4951
    ## 20 Malawi               3.32       1182    35629

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6406.     191584   29.9 
    ##  2 Hungary                2996.      29904    9.98
    ##  3 Czech Republic         2892.      30298   10.5 
    ##  4 Brazil                 2550.     512735  201.  
    ##  5 Bulgaria               2522.      18027    7.15
    ##  6 Belgium                2419.      25160   10.4 
    ##  7 Slovakia               2293.      12509    5.46
    ##  8 Argentina              2233.      92317   41.3 
    ##  9 Colombia               2176.     104014   47.8 
    ## 10 Italy                  2113.     127472   60.3 
    ## 11 Mexico                 2067.     232521  112.  
    ## 12 United Kingdom         2055.     128100   62.3 
    ## 13 Poland                 1948.      74979   38.5 
    ## 14 Paraguay               1939.      12365    6.38
    ## 15 United States          1929.     598504  310.  
    ## 16 Chile                  1929.      32298   16.7 
    ## 17 Spain                  1737.      80766   46.5 
    ## 18 France                 1699.     110063   64.8 
    ## 19 Bolivia                1664.      16551    9.95
    ## 20 Portugal               1600.      17084   10.7

EOL
