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

Updated: 2021-05-11

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
    ##  1 United States           74676. 32334764            433
    ##  2 India                   53703. 22662575            422
    ##  3 Brazil                  35806. 15145879            423
    ##  4 France                  13070.  5685421            435
    ##  5 Turkey                  12036.  5031332            418
    ##  6 Russia                  11675.  4880262            418
    ##  7 United Kingdom          10242.  4434864            433
    ##  8 Italy                    9301.  4111210            442
    ##  9 Spain                    8201.  3559222            434
    ## 10 Germany                  8090.  3527251            436
    ## 11 Argentina                7520.  3136158            417
    ## 12 Colombia                 7142.  2985536            418
    ## 13 Poland                   6718.  2835083            422
    ## 14 Iran                     6033.  2654811            440
    ## 15 Mexico                   5657.  2364617            418
    ## 16 Ukraine                  5151.  2122327            412
    ## 17 Peru                     4403.  1845056            419
    ## 18 Indonesia                4070.  1713684            421
    ## 19 Czech Republic           3880.  1645448            424
    ## 20 South Africa             3819.  1596595            418

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                370.             157068.            424
    ##  2 Jordan                        271.             112372.            414
    ##  3 Israel                        270.             114079.            423
    ##  4 Sweden                        246.             105463.            429
    ##  5 United States                 241.             104227.            433
    ##  6 Serbia                        229.              95360.            417
    ##  7 Belgium                       226.              97723.            432
    ##  8 Netherlands                   218.              93723.            429
    ##  9 Switzerland                   203.              88057.            433
    ## 10 France                        202.              87781.            435
    ## 11 Hungary                       191.              79382.            416
    ## 12 Portugal                      186.              78642.            423
    ## 13 Argentina                     182.              75857.            417
    ## 14 Austria                       179.              76426.            428
    ## 15 Brazil                        178.              75314.            423
    ## 16 Chile                         177.              74163.            420
    ## 17 Spain                         176.              76533.            434
    ## 18 Poland                        174.              73639.            422
    ## 19 Slovakia                      169.              70665.            417
    ## 20 United Kingdom                164.              71130.            433

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                19.6        1272     6486
    ##  2 Mexico                9.26     218928  2364617
    ##  3 Syria                 7.09       1657    23379
    ##  4 Sudan                 7.01       2446    34889
    ##  5 Egypt                 5.86      13904   237410
    ##  6 Somalia               5.18        747    14415
    ##  7 Ecuador               4.80      19222   400296
    ##  8 China                 4.68       4858   103809
    ##  9 Afghanistan           4.35       2698    62063
    ## 10 Bolivia               4.16      13205   317547
    ## 11 Bulgaria              4.13      16929   410202
    ## 12 Tanzania              4.13         21      509
    ## 13 Zimbabwe              4.10       1576    38419
    ## 14 Hungary               3.62      28693   792389
    ## 15 Niger                 3.61        192     5321
    ## 16 Tunisia               3.56      11429   320813
    ## 17 Mali                  3.54        500    14108
    ## 18 Chad                  3.51        171     4877
    ## 19 Peru                  3.46      63826  1845056
    ## 20 South Africa          3.43      54735  1596595

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Hungary                2874.      28693    9.98
    ##  2 Czech Republic         2836.      29711   10.5 
    ##  3 Bulgaria               2368.      16929    7.15
    ##  4 Belgium                2360.      24551   10.4 
    ##  5 Slovakia               2203.      12019    5.46
    ##  6 Peru                   2134.      63826   29.9 
    ##  7 Brazil                 2095.     421316  201.  
    ##  8 United Kingdom         2047.     127605   62.3 
    ##  9 Italy                  2036.     122833   60.3 
    ## 10 Mexico                 1947.     218928  112.  
    ## 11 United States          1857.     575980  310.  
    ## 12 Poland                 1819.      70034   38.5 
    ## 13 Spain                  1693.      78726   46.5 
    ## 14 France                 1631.     105630   64.8 
    ## 15 Argentina              1622.      67042   41.3 
    ## 16 Colombia               1619.      77359   47.8 
    ## 17 Chile                  1618.      27101   16.7 
    ## 18 Portugal               1592.      16992   10.7 
    ## 19 Sweden                 1483.      14173    9.56
    ## 20 Jordan                 1419.       9092    6.41

EOL
