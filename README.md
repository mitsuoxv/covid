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

Updated: 2021-06-22

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
    ##  1 United States           68575. 33190195            484
    ##  2 India                   64515. 29935221            464
    ##  3 Brazil                  38459. 17883750            465
    ##  4 France                  11845.  5650025            477
    ##  5 Turkey                  11674.  5370299            460
    ##  6 Russia                  11596.  5334204            460
    ##  7 United Kingdom           9747.  4630044            475
    ##  8 Argentina                9277.  4258394            459
    ##  9 Italy                    8787.  4252976            484
    ## 10 Colombia                 8516.  3917348            460
    ## 11 Spain                    7885.  3753228            476
    ## 12 Germany                  7787.  3722327            478
    ## 13 Iran                     6421.  3095135            482
    ## 14 Poland                   6204.  2878840            464
    ## 15 Mexico                   5382.  2475705            460
    ## 16 Ukraine                  4911.  2229846            454
    ## 17 Peru                     4396.  2026729            461
    ## 18 Indonesia                4320.  2004445            464
    ## 19 South Africa             3963.  1823319            460
    ## 20 Czech Republic           3575.  1666082            466

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                341.             159038.            466
    ##  2 Jordan                        255.             116509.            456
    ##  3 Israel                        245.             114216.            466
    ##  4 Sweden                        241.             113504.            471
    ##  5 Argentina                     224.             103001.            459
    ##  6 United States                 221.             106985.            484
    ##  7 Belgium                       219.             103760.            474
    ##  8 Netherlands                   214.             100870.            471
    ##  9 Serbia                        212.              97450.            459
    ## 10 Chile                         196.              90587.            462
    ## 11 Switzerland                   194.              92139.            475
    ## 12 Brazil                        191.              88928.            465
    ## 13 France                        183.              87234.            477
    ## 14 Colombia                      178.              81970.            460
    ## 15 Hungary                       177.              80909.            458
    ## 16 Portugal                      174.              81028.            465
    ## 17 Spain                         170.              80704.            476
    ## 18 Austria                       167.              78675.            470
    ## 19 Poland                        161.              74775.            464
    ## 20 United Kingdom                156.              74261.            475

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.7        1355     6885
    ##  2 Peru                 9.38     190202  2026729
    ##  3 Mexico               9.34     231151  2475705
    ##  4 Sudan                7.53       2737    36347
    ##  5 Syria                7.35       1845    25118
    ##  6 Egypt                5.72      15829   276756
    ##  7 Somalia              5.22        775    14852
    ##  8 Ecuador              4.77      21293   446441
    ##  9 China                4.59       5395   117548
    ## 10 Bulgaria             4.27      17990   421032
    ## 11 Tanzania             4.13         21      509
    ## 12 Afghanistan          4.06       4215   103902
    ## 13 Zimbabwe             4.00       1672    41779
    ## 14 Bolivia              3.82      16009   419313
    ## 15 Hungary              3.70      29875   807630
    ## 16 Tunisia              3.67      14038   382950
    ## 17 Mali                 3.64        524    14382
    ## 18 Niger                3.53        193     5469
    ## 19 Chad                 3.52        174     4946
    ## 20 Malawi               3.35       1168    34868

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6360.     190202   29.9 
    ##  2 Hungary                2993.      29875    9.98
    ##  3 Czech Republic         2890.      30280   10.5 
    ##  4 Bulgaria               2517.      17990    7.15
    ##  5 Brazil                 2490.     500800  201.  
    ##  6 Belgium                2416.      25136   10.4 
    ##  7 Slovakia               2291.      12500    5.46
    ##  8 Argentina              2146.      88742   41.3 
    ##  9 Italy                  2109.     127270   60.3 
    ## 10 Colombia               2079.      99335   47.8 
    ## 11 Mexico                 2055.     231151  112.  
    ## 12 United Kingdom         2053.     127976   62.3 
    ## 13 Poland                 1944.      74829   38.5 
    ## 14 United States          1921.     596003  310.  
    ## 15 Chile                  1882.      31513   16.7 
    ## 16 Paraguay               1807.      11521    6.38
    ## 17 Spain                  1734.      80634   46.5 
    ## 18 France                 1696.     109840   64.8 
    ## 19 Bolivia                1609.      16009    9.95
    ## 20 Portugal               1598.      17065   10.7

EOL
