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

Updated: 2021-07-03

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
    ##  1 United States           67361. 33343961            495
    ##  2 India                   64122. 30458251            475
    ##  3 Brazil                  38985. 18557141            476
    ##  4 Russia                  11807.  5561360            471
    ##  5 France                  11613.  5667081            488
    ##  6 Turkey                  11530.  5430940            471
    ##  7 United Kingdom           9935.  4828467            486
    ##  8 Argentina                9511.  4470374            470
    ##  9 Colombia                 9004.  4240982            471
    ## 10 Italy                    8607.  4260788            495
    ## 11 Spain                    7846.  3821305            487
    ## 12 Germany                  7627.  3729682            489
    ## 13 Poland                   6063.  2880107            475
    ## 14 Mexico                   5349.  2519269            471
    ## 15 Ukraine                  4809.  2236497            465
    ## 16 Indonesia                4692.  2228938            475
    ## 17 Peru                     4347.  2052065            472
    ## 18 South Africa             4237.  1995556            471
    ## 19 Netherlands              3497.  1685825            482
    ## 20 Czech Republic           3496.  1667608            477

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                334.             159184.            477
    ##  2 Israel                        240.             114525.            478
    ##  3 Sweden                        237.             114124.            482
    ##  4 Argentina                     230.             108128.            470
    ##  5 United States                 217.             107480.            495
    ##  6 Belgium                       215.             104382.            485
    ##  7 Netherlands                   210.             101281.            482
    ##  8 Serbia                        208.              97571.            470
    ##  9 Chile                         197.              93068.            473
    ## 10 Brazil                        194.              92277.            476
    ## 11 Switzerland                   190.              92342.            486
    ## 12 Colombia                      188.              88742.            471
    ## 13 France                        179.              87498.            488
    ## 14 Portugal                      174.              82616.            476
    ## 15 Hungary                       173.              80962.            469
    ## 16 Spain                         169.              82168.            487
    ## 17 Austria                       164.              78781.            481
    ## 18 United Kingdom                159.              77443.            486
    ## 19 Poland                        157.              74808.            475
    ## 20 Slovakia                      153.              71801.            470

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Peru                  9.37     192331  2052065
    ##  2 Mexico                9.25     233047  2519269
    ##  3 Ecuador               4.70      21605   459538
    ##  4 China                 4.64       5508   118644
    ##  5 Bulgaria              4.28      18067   421902
    ##  6 Tanzania              4.13         21      509
    ##  7 Bolivia               3.81      16767   439624
    ##  8 Hungary               3.70      29907   808160
    ##  9 Mali                  3.64        525    14429
    ## 10 Zimbabwe              3.53       1808    51221
    ## 11 Chad                  3.51        174     4951
    ## 12 Niger                 3.51        193     5492
    ## 13 Malawi                3.30       1199    36359
    ## 14 Slovakia              3.19      12511   391676
    ## 15 Romania               3.14      33898  1080860
    ## 16 Guatemala             3.13       9282   296438
    ## 17 South Africa          3.06      61029  1995556
    ## 18 Paraguay              3.05      12895   423282
    ## 19 El Salvador           3.03       2387    78766
    ## 20 Greece                3.00      12710   423185

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6431.     192331   29.9 
    ##  2 Hungary                2996.      29907    9.98
    ##  3 Czech Republic         2893.      30308   10.5 
    ##  4 Brazil                 2576.     518066  201.  
    ##  5 Bulgaria               2527.      18067    7.15
    ##  6 Belgium                2420.      25180   10.4 
    ##  7 Slovakia               2293.      12511    5.46
    ##  8 Argentina              2281.      94304   41.3 
    ##  9 Colombia               2229.     106544   47.8 
    ## 10 Italy                  2114.     127587   60.3 
    ## 11 Mexico                 2072.     233047  112.  
    ## 12 United Kingdom         2056.     128162   62.3 
    ## 13 Paraguay               2022.      12895    6.38
    ## 14 Poland                 1950.      75065   38.5 
    ## 15 Chile                  1946.      32588   16.7 
    ## 16 United States          1933.     599680  310.  
    ## 17 Spain                  1739.      80883   46.5 
    ## 18 France                 1701.     110190   64.8 
    ## 19 Bolivia                1686.      16767    9.95
    ## 20 Portugal               1602.      17101   10.7

EOL
