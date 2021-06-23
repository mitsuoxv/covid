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

Updated: 2021-06-24

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
    ##  1 United States           68376. 33230655            486
    ##  2 India                   64439. 30028709            466
    ##  3 Brazil                  38473. 17966831            467
    ##  4 France                  11798.  5651293            479
    ##  5 Turkey                  11648.  5381736            462
    ##  6 Russia                  11620.  5368513            462
    ##  7 United Kingdom           9752.  4651992            477
    ##  8 Argentina                9278.  4277395            461
    ##  9 Italy                    8753.  4254294            486
    ## 10 Colombia                 8589.  3968405            462
    ## 11 Spain                    7884.  3768691            478
    ## 12 Germany                  7758.  3723798            480
    ## 13 Iran                     6440.  3117336            484
    ## 14 Poland                   6178.  2879192            466
    ## 15 Mexico                   5365.  2478551            462
    ## 16 Ukraine                  4892.  2230977            456
    ## 17 Peru                     4386.  2030611            463
    ## 18 Indonesia                4363.  2033421            466
    ## 19 South Africa             3990.  1843572            462
    ## 20 Czech Republic           3560.  1666325            468

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                340.             159061.            468
    ##  2 Jordan                        255.             116668.            458
    ##  3 Israel                        244.             114246.            469
    ##  4 Sweden                        241.             113858.            473
    ##  5 Argentina                     224.             103461.            461
    ##  6 United States                 220.             107115.            486
    ##  7 Belgium                       218.             103820.            476
    ##  8 Netherlands                   213.             100945.            473
    ##  9 Serbia                        211.              97471.            461
    ## 10 Chile                         196.              91103.            464
    ## 11 Switzerland                   193.              92205.            477
    ## 12 Brazil                        191.              89341.            467
    ## 13 France                        182.              87254.            479
    ## 14 Colombia                      180.              83038.            462
    ## 15 Hungary                       176.              80923.            460
    ## 16 Portugal                      174.              81194.            467
    ## 17 Spain                         170.              81037.            478
    ## 18 Austria                       167.              78694.            472
    ## 19 Poland                        160.              74784.            466
    ## 20 United Kingdom                156.              74613.            477

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.7        1355     6892
    ##  2 Peru                 9.39     190645  2030611
    ##  3 Mexico               9.33     231244  2478551
    ##  4 Sudan                7.52       2748    36522
    ##  5 Syria                7.34       1851    25205
    ##  6 Egypt                5.73      15935   278295
    ##  7 Somalia              5.21        775    14868
    ##  8 Ecuador              4.77      21315   447176
    ##  9 China                4.60       5421   117759
    ## 10 Bulgaria             4.27      18008   421246
    ## 11 Tanzania             4.13         21      509
    ## 12 Afghanistan          4.04       4366   107957
    ## 13 Zimbabwe             3.96       1691    42714
    ## 14 Bolivia              3.83      16174   422811
    ## 15 Hungary              3.70      29887   807775
    ## 16 Tunisia              3.67      14223   387773
    ## 17 Mali                 3.64        524    14386
    ## 18 Niger                3.53        193     5469
    ## 19 Chad                 3.52        174     4948
    ## 20 Malawi               3.35       1173    34996

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6375.     190645   29.9 
    ##  2 Hungary                2994.      29887    9.98
    ##  3 Czech Republic         2891.      30289   10.5 
    ##  4 Bulgaria               2519.      18008    7.15
    ##  5 Brazil                 2499.     502586  201.  
    ##  6 Belgium                2417.      25144   10.4 
    ##  7 Slovakia               2292.      12502    5.46
    ##  8 Argentina              2165.      89490   41.3 
    ##  9 Italy                  2110.     127322   60.3 
    ## 10 Colombia               2105.     100582   47.8 
    ## 11 Mexico                 2056.     231244  112.  
    ## 12 United Kingdom         2053.     128008   62.3 
    ## 13 Poland                 1945.      74893   38.5 
    ## 14 United States          1924.     597037  310.  
    ## 15 Chile                  1892.      31690   16.7 
    ## 16 Paraguay               1842.      11743    6.38
    ## 17 Spain                  1736.      80719   46.5 
    ## 18 France                 1697.     109924   64.8 
    ## 19 Bolivia                1626.      16174    9.95
    ## 20 Portugal               1599.      17074   10.7

EOL
