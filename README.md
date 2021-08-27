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

Updated: 2021-08-28

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
    ##  1 United States           69253. 38158495            551
    ##  2 India                   61399. 32603188            531
    ##  3 Brazil                  38807. 20645537            532
    ##  4 Russia                  12987.  6844049            527
    ##  5 United Kingdom          12230.  6628713            542
    ##  6 France                  11970.  6511793            544
    ##  7 Turkey                  11941.  6293297            527
    ##  8 Argentina                9800.  5155079            526
    ##  9 Colombia                 9292.  4897150            527
    ## 10 Spain                    8881.  4822320            543
    ## 11 Iran                     8803.  4833135            549
    ## 12 Italy                    8184.  4509611            551
    ## 13 Indonesia                7615.  4043736            531
    ## 14 Germany                  7181.  3913828            545
    ## 15 Mexico                   6207.  3271128            527
    ## 16 Poland                   5438.  2887739            531
    ## 17 South Africa             5189.  2734973            527
    ## 18 Ukraine                  4376.  2280203            521
    ## 19 Peru                     4062.  2145051            528
    ## 20 Netherlands              3585.  1929018            538

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                301.             160228.            533
    ##  2 Israel                        263.             140306.            533
    ##  3 Argentina                     237.             124690.            526
    ##  4 Jordan                        236.             123657.            523
    ##  5 United States                 223.             123000.            551
    ##  6 Sweden                        218.             117429.            538
    ##  7 Netherlands                   215.             115892.            538
    ##  8 Belgium                       209.             113003.            541
    ##  9 United Kingdom                196.             106317.            542
    ## 10 Colombia                      194.             102472.            527
    ## 11 Serbia                        194.             102269.            526
    ## 12 Brazil                        193.             102661.            532
    ## 13 Spain                         191.             103693.            543
    ## 14 Switzerland                   186.             100862.            542
    ## 15 France                        185.             100540.            544
    ## 16 Chile                         185.              97690.            529
    ## 17 Portugal                      181.              96330.            532
    ## 18 Hungary                       155.              81317.            525
    ## 19 Austria                       154.              82544.            537
    ## 20 Turkey                        153.              80886.            527

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               18.8        1444     7676
    ##  2 Peru                 9.23     198031  2145051
    ##  3 Mexico               7.81     255452  3271128
    ##  4 Sudan                7.40       2791    37699
    ##  5 Syria                7.29       1985    27221
    ##  6 Ecuador              6.43      32134   499631
    ##  7 Egypt                5.82      16691   286938
    ##  8 Somalia              5.51        938    17016
    ##  9 Afghanistan          4.64       7101   152960
    ## 10 China                4.62       5680   122852
    ## 11 Bulgaria             4.16      18647   448431
    ## 12 Myanmar              3.87      14850   383514
    ## 13 Bolivia              3.76      18350   488403
    ## 14 Hungary              3.70      30057   811706
    ## 15 Tanzania             3.66         50     1367
    ## 16 Mali                 3.63        537    14804
    ## 17 Malawi               3.54       2129    60090
    ## 18 Tunisia              3.52      22932   651035
    ## 19 Zimbabwe             3.51       4356   123986
    ## 20 Chad                 3.49        174     4991

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6622.     198031   29.9 
    ##  2 Hungary                3011.      30057    9.98
    ##  3 Czech Republic         2902.      30399   10.5 
    ##  4 Brazil                 2867.     576645  201.  
    ##  5 Argentina              2684.     110966   41.3 
    ##  6 Bulgaria               2608.      18647    7.15
    ##  7 Colombia               2605.     124474   47.8 
    ##  8 Paraguay               2452.      15633    6.38
    ##  9 Belgium                2437.      25354   10.4 
    ## 10 Slovakia               2300.      12548    5.46
    ## 11 Mexico                 2271.     255452  112.  
    ## 12 Chile                  2196.      36778   16.7 
    ## 13 Ecuador                2173.      32134   14.8 
    ## 14 Tunisia                2166.      22932   10.6 
    ## 15 Italy                  2137.     128957   60.3 
    ## 16 United Kingdom         2119.     132143   62.3 
    ## 17 United States          2026.     628456  310.  
    ## 18 Poland                 1957.      75335   38.5 
    ## 19 Bolivia                1845.      18350    9.95
    ## 20 Spain                  1803.      83861   46.5

EOL
