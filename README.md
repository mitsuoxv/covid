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

Updated: 2021-07-02

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
    ##  1 United States           67445. 33317803            494
    ##  2 India                   64159. 30411634            474
    ##  3 Brazil                  38975. 18513305            475
    ##  4 Russia                  11783.  5538142            470
    ##  5 France                  11631.  5664630            487
    ##  6 Turkey                  11544.  5425652            470
    ##  7 United Kingdom           9899.  4800911            485
    ##  8 Argentina                9483.  4447701            469
    ##  9 Colombia                 8964.  4213074            470
    ## 10 Italy                    8623.  4259909            494
    ## 11 Spain                    7837.  3808960            486
    ## 12 Germany                  7641.  3729033            488
    ## 13 Iran                     6513.  3204557            492
    ## 14 Poland                   6076.  2880010            474
    ## 15 Mexico                   5347.  2513164            470
    ## 16 Ukraine                  4818.  2235801            464
    ## 17 Indonesia                4648.  2203108            474
    ## 18 Peru                     4357.  2052065            471
    ## 19 South Africa             4200.  1973972            470
    ## 20 Netherlands              3503.  1685000            481

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                334.             159167.            476
    ##  2 Jordan                        252.             117277.            466
    ##  3 Israel                        240.             114482.            477
    ##  4 Sweden                        237.             114065.            481
    ##  5 Argentina                     229.             107580.            469
    ##  6 United States                 217.             107396.            494
    ##  7 Belgium                       215.             104309.            484
    ##  8 Netherlands                   210.             101232.            481
    ##  9 Serbia                        208.              97560.            469
    ## 10 Chile                         197.              92909.            472
    ## 11 Brazil                        194.              92059.            475
    ## 12 Switzerland                   190.              92319.            485
    ## 13 Colombia                      188.              88158.            470
    ## 14 France                        180.              87460.            487
    ## 15 Portugal                      173.              82386.            475
    ## 16 Hungary                       173.              80962.            468
    ## 17 Spain                         169.              81903.            486
    ## 18 Austria                       164.              78761.            480
    ## 19 United Kingdom                159.              77001.            485
    ## 20 Poland                        158.              74805.            474

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.7        1361     6920
    ##  2 Peru                 9.37     192331  2052065
    ##  3 Mexico               9.26     232803  2513164
    ##  4 Sudan                7.51       2754    36658
    ##  5 Syria                7.35       1876    25515
    ##  6 Egypt                5.75      16169   281282
    ##  7 Somalia              5.19        775    14946
    ##  8 Ecuador              4.70      21560   458504
    ##  9 China                4.63       5495   118573
    ## 10 Bulgaria             4.28      18061   421829
    ## 11 Afghanistan          4.13       4962   120216
    ## 12 Tanzania             4.13         21      509
    ## 13 Bolivia              3.82      16702   437623
    ## 14 Hungary              3.70      29907   808160
    ## 15 Mali                 3.64        525    14427
    ## 16 Zimbabwe             3.59       1789    49864
    ## 17 Tunisia              3.56      14959   420103
    ## 18 Niger                3.52        193     5489
    ## 19 Chad                 3.51        174     4951
    ## 20 Malawi               3.31       1196    36126

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6431.     192331   29.9 
    ##  2 Hungary                2996.      29907    9.98
    ##  3 Czech Republic         2893.      30304   10.5 
    ##  4 Brazil                 2566.     515985  201.  
    ##  5 Bulgaria               2526.      18061    7.15
    ##  6 Belgium                2420.      25173   10.4 
    ##  7 Slovakia               2293.      12511    5.46
    ##  8 Argentina              2266.      93668   41.3 
    ##  9 Colombia               2217.     105934   47.8 
    ## 10 Italy                  2114.     127566   60.3 
    ## 11 Mexico                 2070.     232803  112.  
    ## 12 United Kingdom         2055.     128140   62.3 
    ## 13 Paraguay               2002.      12763    6.38
    ## 14 Poland                 1949.      75044   38.5 
    ## 15 Chile                  1943.      32545   16.7 
    ## 16 United States          1931.     599089  310.  
    ## 17 Spain                  1739.      80875   46.5 
    ## 18 France                 1701.     110162   64.8 
    ## 19 Bolivia                1679.      16702    9.95
    ## 20 Portugal               1601.      17096   10.7

EOL
