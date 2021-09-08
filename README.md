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

Updated: 2021-09-09

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
    ##  1 United States           70859. 39893580            563
    ##  2 India                   60951. 33096718            543
    ##  3 Brazil                  38419. 20899933            544
    ##  4 Russia                  13109.  7065904            539
    ##  5 United Kingdom          12736.  7056110            554
    ##  6 Turkey                  12138.  6542654            539
    ##  7 France                  11965.  6652726            556
    ##  8 Argentina                9679.  5207695            538
    ##  9 Iran                     9241.  5184124            561
    ## 10 Colombia                 9127.  4919773            539
    ## 11 Spain                    8815.  4892640            555
    ## 12 Italy                    8134.  4579502            563
    ## 13 Indonesia                7638.  4147365            543
    ## 14 Germany                  7236.  4030681            557
    ## 15 Mexico                   6370.  3433511            539
    ## 16 Poland                   5325.  2891602            543
    ## 17 South Africa             5239.  2824063            539
    ## 18 Ukraine                  4321.  2303276            533
    ## 19 Peru                     3991.  2155508            540
    ## 20 Philippines              3906.  2121308            543

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                295.             160527.            545
    ##  2 Israel                        279.             151971.            545
    ##  3 Jordan                        234.             125385.            535
    ##  4 Argentina                     234.             125963.            538
    ##  5 United States                 228.             128592.            563
    ##  6 Sweden                        216.             118613.            550
    ##  7 Netherlands                   214.             117681.            550
    ##  8 Belgium                       208.             115207.            553
    ##  9 United Kingdom                204.             113172.            554
    ## 10 Serbia                        200.             107408.            538
    ## 11 Brazil                        191.             103926.            544
    ## 12 Colombia                      191.             102946.            539
    ## 13 Spain                         190.             105205.            555
    ## 14 Switzerland                   189.             104873.            554
    ## 15 France                        185.             102716.            556
    ## 16 Chile                         181.              98038.            541
    ## 17 Portugal                      181.              98252.            544
    ## 18 Turkey                        156.              84091.            539
    ## 19 Austria                       155.              84754.            548
    ## 20 Hungary                       152.              81553.            537

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               18.8        1534     8181
    ##  2 Peru                 9.21     198523  2155508
    ##  3 Mexico               7.67     263470  3433511
    ##  4 Sudan                7.37       2791    37877
    ##  5 Syria                7.11       2049    28814
    ##  6 Ecuador              6.42      32353   503883
    ##  7 Egypt                5.78      16811   290773
    ##  8 Somalia              5.60       1005    17947
    ##  9 Afghanistan          4.65       7151   153736
    ## 10 China                4.61       5685   123322
    ## 11 Bulgaria             4.15      19270   464715
    ## 12 Myanmar              3.83      16082   420402
    ## 13 Bolivia              3.75      18514   493115
    ## 14 Hungary              3.69      30077   814064
    ## 15 Tanzania             3.66         50     1367
    ## 16 Malawi               3.64       2217    60852
    ## 17 Mali                 3.62        539    14910
    ## 18 Zimbabwe             3.58       4493   125671
    ## 19 Tunisia              3.54      23901   675771
    ## 20 Paraguay             3.49      16003   458922

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6638.     198523   29.9 
    ##  2 Hungary                3013.      30077    9.98
    ##  3 Brazil                 2903.     583810  201.  
    ##  4 Czech Republic         2903.      30408   10.5 
    ##  5 Argentina              2725.     112673   41.3 
    ##  6 Bulgaria               2696.      19270    7.15
    ##  7 Colombia               2623.     125331   47.8 
    ##  8 Paraguay               2510.      16003    6.38
    ##  9 Belgium                2444.      25428   10.4 
    ## 10 Mexico                 2343.     263470  112.  
    ## 11 Slovakia               2301.      12553    5.46
    ## 12 Tunisia                2257.      23901   10.6 
    ## 13 Chile                  2216.      37115   16.7 
    ## 14 Ecuador                2187.      32353   14.8 
    ## 15 Italy                  2148.     129638   60.3 
    ## 16 United Kingdom         2141.     133483   62.3 
    ## 17 United States          2077.     644318  310.  
    ## 18 Poland                 1959.      75403   38.5 
    ## 19 Bolivia                1861.      18514    9.95
    ## 20 Spain                  1829.      85066   46.5

EOL
