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

Updated: 2021-07-22

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
    ##  1 United States           65815. 33828878            514
    ##  2 India                   63191. 31216337            494
    ##  3 Brazil                  39175. 19391845            495
    ##  4 Russia                  12306.  6030240            490
    ##  5 France                  11381.  5770302            507
    ##  6 Turkey                  11318.  5546166            490
    ##  7 United Kingdom          10930.  5519606            505
    ##  8 Argentina                9753.  4769142            489
    ##  9 Colombia                 9502.  4655921            490
    ## 10 Italy                    8352.  4293083            514
    ## 11 Spain                    8279.  4189136            506
    ## 12 Germany                  7379.  3748613            508
    ## 13 Indonesia                6040.  2983830            494
    ## 14 Poland                   5833.  2881718            494
    ## 15 Mexico                   5437.  2664444            490
    ## 16 South Africa             4716.  2311232            490
    ## 17 Ukraine                  4640.  2245930            484
    ## 18 Peru                     4265.  2094445            491
    ## 19 Netherlands              3621.  1814143            501
    ## 20 Czech Republic           3370.  1671685            496

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                322.             159573.            496
    ##  2 Argentina                     236.             115355.            489
    ##  3 Israel                        234.             116261.            497
    ##  4 Sweden                        229.             114618.            501
    ##  5 Netherlands                   218.             108990.            501
    ##  6 United States                 212.             109044.            514
    ##  7 Belgium                       211.             106573.            504
    ##  8 Serbia                        200.              97893.            489
    ##  9 Colombia                      199.              97425.            490
    ## 10 Brazil                        195.              96427.            495
    ## 11 Chile                         194.              95653.            492
    ## 12 Switzerland                   185.              93269.            505
    ## 13 Spain                         178.              90077.            506
    ## 14 Portugal                      177.              87603.            495
    ## 15 France                        176.              89091.            507
    ## 16 United Kingdom                175.              88528.            505
    ## 17 Hungary                       166.              81040.            488
    ## 18 Austria                       158.              79209.            500
    ## 19 Poland                        152.              74850.            494
    ## 20 Paraguay                      148.              69883.            472

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Peru                  9.32     195243  2094445
    ##  2 Mexico                8.87     236469  2664444
    ##  3 China                 4.69       5621   119837
    ##  4 Ecuador               4.61      21958   476312
    ##  5 Bulgaria              4.30      18184   423223
    ##  6 Tanzania              4.13         21      509
    ##  7 Bolivia               3.77      17475   463125
    ##  8 Hungary               3.71      30019   808945
    ##  9 Mali                  3.65        530    14523
    ## 10 Chad                  3.50        174     4965
    ## 11 Niger                 3.47        194     5594
    ## 12 Paraguay              3.22      14340   445565
    ## 13 Slovakia              3.20      12534   392185
    ## 14 Romania               3.17      34260  1081875
    ## 15 Zimbabwe              3.11       2747    88415
    ## 16 Malawi                3.05       1363    44684
    ## 17 El Salvador           3.03       2508    82852
    ## 18 Italy                 2.98     127884  4293083
    ## 19 Guatemala             2.97       9927   334375
    ## 20 South Africa          2.93      67676  2311232

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6528.     195243   29.9 
    ##  2 Hungary                3007.      30019    9.98
    ##  3 Czech Republic         2896.      30342   10.5 
    ##  4 Brazil                 2699.     542756  201.  
    ##  5 Bulgaria               2544.      18184    7.15
    ##  6 Argentina              2466.     101955   41.3 
    ##  7 Colombia               2443.     116753   47.8 
    ##  8 Belgium                2424.      25213   10.4 
    ##  9 Slovakia               2298.      12534    5.46
    ## 10 Paraguay               2249.      14340    6.38
    ## 11 Italy                  2119.     127884   60.3 
    ## 12 Mexico                 2103.     236469  112.  
    ## 13 United Kingdom         2066.     128823   62.3 
    ## 14 Chile                  2064.      34569   16.7 
    ## 15 Poland                 1954.      75222   38.5 
    ## 16 United States          1948.     604252  310.  
    ## 17 Bolivia                1757.      17475    9.95
    ## 18 Spain                  1745.      81148   46.5 
    ## 19 France                 1707.     110534   64.8 
    ## 20 Portugal               1613.      17219   10.7

EOL
