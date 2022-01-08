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

Updated: 2022-01-08

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

    ## # A tibble: 20 × 4
    ##    area           speed_since_100 cum_conf days_since_100
    ##    <chr>                    <dbl>    <dbl>          <int>
    ##  1 United States           84337. 56843327            674
    ##  2 India                   52955. 35109286            663
    ##  3 Brazil                  33620. 22323837            664
    ##  4 United Kingdom          20588. 13835338            672
    ##  5 Russia                  16087. 10601300            659
    ##  6 France                  15748. 10645841            676
    ##  7 Turkey                  14746.  9717970            659
    ##  8 Germany                 10874.  7361660            677
    ##  9 Spain                   10255.  6922466            675
    ## 10 Italy                    9892.  6756035            683
    ## 11 Iran                     9106.  6201467            681
    ## 12 Argentina                8846.  5820536            658
    ## 13 Colombia                 7896.  5203374            659
    ## 14 Indonesia                6432.  4264669            663
    ## 15 Poland                   6303.  4179292            663
    ## 16 Mexico                   6028.  4008648            665
    ## 17 Ukraine                  5650.  3689291            653
    ## 18 South Africa             5303.  3494696            659
    ## 19 Netherlands              4811.  3223325            670
    ## 20 Philippines              4331.  2871745            663

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                360.             239671.            665
    ##  2 United Kingdom                330.             221903.            672
    ##  3 Belgium                       311.             209527.            673
    ##  4 Israel                        293.             195414.            666
    ##  5 Netherlands                   289.             193651.            670
    ##  6 Switzerland                   277.             186842.            674
    ##  7 Serbia                        273.             179491.            658
    ##  8 United States                 272.             183228.            674
    ##  9 Jordan                        255.             167289.            655
    ## 10 Denmark                       244.             162909.            668
    ## 11 France                        243.             164368.            676
    ## 12 Slovakia                      238.             157046.            659
    ## 13 Austria                       237.             158624.            668
    ## 14 Spain                         221.             148851.            675
    ## 15 Sweden                        215.             143918.            670
    ## 16 Argentina                     214.             140786.            658
    ## 17 Portugal                      212.             140500.            664
    ## 18 Hungary                       195.             127873.            657
    ## 19 Greece                        190.             126210.            665
    ## 20 Turkey                        190.             124903.            659

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.6        1985    10146
    ##  2 Peru                 8.78     202867  2309856
    ##  3 Mexico               7.48     299711  4008648
    ##  4 Sudan                7.04       3340    47443
    ##  5 Ecuador              6.09      33686   553201
    ##  6 Syria                5.78       2912    50390
    ##  7 Egypt                5.62      21836   388651
    ##  8 Somalia              5.50       1335    24261
    ##  9 Afghanistan          4.66       7367   158245
    ## 10 China                4.28       5699   133154
    ## 11 Bulgaria             4.09      31303   764476
    ## 12 Niger                3.65        277     7590
    ## 13 Myanmar              3.63      19282   531432
    ## 14 Paraguay             3.54      16645   470460
    ## 15 Tunisia              3.50      25606   731077
    ## 16 Indonesia            3.38     144116  4264669
    ## 17 Romania              3.23      58896  1821849
    ## 18 Bolivia              3.14      19810   631554
    ## 19 El Salvador          3.13       3826   122063
    ## 20 Hungary              3.11      39679  1276433

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6783.     202867   29.9 
    ##  2 Bulgaria               4379.      31303    7.15
    ##  3 Hungary                3975.      39679    9.98
    ##  4 Czech Republic         3479.      36449   10.5 
    ##  5 Slovakia               3093.      16871    5.46
    ##  6 Brazil                 3080.     619384  201.  
    ##  7 Argentina              2837.     117294   41.3 
    ##  8 Belgium                2733.      28429   10.4 
    ##  9 Colombia               2722.     130100   47.8 
    ## 10 Romania                2682.      58896   22.0 
    ## 11 Mexico                 2665.     299711  112.  
    ## 12 United States          2657.     824175  310.  
    ## 13 Paraguay               2611.      16645    6.38
    ## 14 Poland                 2580.      99311   38.5 
    ## 15 Tunisia                2418.      25606   10.6 
    ## 16 United Kingdom         2394.     149284   62.3 
    ## 17 Chile                  2339.      39177   16.7 
    ## 18 Italy                  2292.     138276   60.3 
    ## 19 Ecuador                2278.      33686   14.8 
    ## 20 Russia                 2230.     313817  141.

EOL
