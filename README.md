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

Updated: 2021-06-16

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
    ##  1 United States           69331. 33140498            478
    ##  2 India                   64565. 29570881            458
    ##  3 Brazil                  37936. 17412766            459
    ##  4 France                  11966.  5636249            471
    ##  5 Turkey                  11753.  5336073            454
    ##  6 Russia                  11534.  5236593            454
    ##  7 United Kingdom           9751.  4573423            469
    ##  8 Argentina                9104.  4124190            453
    ##  9 Italy                    8882.  4245779            478
    ## 10 Colombia                 8267.  3753224            454
    ## 11 Spain                    7961.  3741767            470
    ## 12 Germany                  7873.  3716170            472
    ## 13 Iran                     6385.  3039432            476
    ## 14 Poland                   6283.  2877819            458
    ## 15 Mexico                   5405.  2454176            454
    ## 16 Ukraine                  4966.  2224992            448
    ## 17 Peru                     4403.  2003625            455
    ## 18 Indonesia                4209.  1927708            458
    ## 19 South Africa             3860.  1752630            454
    ## 20 Czech Republic           3620.  1665327            460

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                346.             158966.            460
    ##  2 Jordan                        258.             116102.            450
    ##  3 Israel                        249.             114183.            459
    ##  4 Sweden                        244.             113381.            465
    ##  5 United States                 223.             106825.            478
    ##  6 Belgium                       221.             103487.            468
    ##  7 Argentina                     220.              99755.            453
    ##  8 Netherlands                   216.             100546.            465
    ##  9 Serbia                        215.              97349.            453
    ## 10 Switzerland                   196.              92022.            469
    ## 11 Chile                         194.              88536.            456
    ## 12 Brazil                        189.              86586.            459
    ## 13 France                        185.              87022.            471
    ## 14 Hungary                       179.              80856.            452
    ## 15 Portugal                      175.              80374.            459
    ## 16 Colombia                      173.              78536.            454
    ## 17 Spain                         171.              80458.            470
    ## 18 Austria                       169.              78567.            464
    ## 19 Poland                        163.              74749.            458
    ## 20 Slovakia                      158.              71693.            453

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.7        1350     6863
    ##  2 Peru                 9.42     188708  2003625
    ##  3 Mexico               9.38     230150  2454176
    ##  4 Sudan                7.53       2732    36304
    ##  5 Syria                7.30       1815    24860
    ##  6 Egypt                5.72      15654   273795
    ##  7 Somalia              5.22        774    14817
    ##  8 Ecuador              4.79      21051   439139
    ##  9 China                4.55       5298   116507
    ## 10 Bulgaria             4.26      17915   420493
    ## 11 Tanzania             4.13         21      509
    ## 12 Zimbabwe             4.08       1635    40077
    ## 13 Afghanistan          3.95       3683    93272
    ## 14 Bolivia              3.82      15542   406954
    ## 15 Hungary              3.70      29851   807102
    ## 16 Tunisia              3.66      13567   370224
    ## 17 Mali                 3.64        523    14353
    ## 18 Niger                3.52        192     5452
    ## 19 Chad                 3.52        174     4943
    ## 20 Malawi               3.35       1159    34564

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6310.     188708   29.9 
    ##  2 Hungary                2990.      29851    9.98
    ##  3 Czech Republic         2886.      30229   10.5 
    ##  4 Bulgaria               2506.      17915    7.15
    ##  5 Brazil                 2424.     487401  201.  
    ##  6 Belgium                2412.      25093   10.4 
    ##  7 Slovakia               2282.      12446    5.46
    ##  8 Italy                  2105.     127038   60.3 
    ##  9 Argentina              2064.      85343   41.3 
    ## 10 United Kingdom         2051.     127907   62.3 
    ## 11 Mexico                 2046.     230150  112.  
    ## 12 Colombia               2004.      95778   47.8 
    ## 13 Poland                 1938.      74626   38.5 
    ## 14 United States          1917.     594644  310.  
    ## 15 Chile                  1839.      30804   16.7 
    ## 16 Spain                  1731.      80517   46.5 
    ## 17 Paraguay               1699.      10834    6.38
    ## 18 France                 1692.     109572   64.8 
    ## 19 Portugal               1597.      17047   10.7 
    ## 20 Bolivia                1562.      15542    9.95

EOL
