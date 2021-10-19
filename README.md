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

Updated: 2021-10-20

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
    ##  1 United States           71668. 44649996            623
    ##  2 India                   58381. 34094373            584
    ##  3 Brazil                  36999. 21644464            585
    ##  4 United Kingdom          14282.  8497872            595
    ##  5 Russia                  13898.  8060752            580
    ##  6 Turkey                  13247.  7683517            580
    ##  7 France                  11507.  6869868            597
    ##  8 Iran                     9629.  5796659            602
    ##  9 Argentina                9106.  5272551            579
    ## 10 Colombia                 8589.  4981532            580
    ## 11 Spain                    8370.  4988878            596
    ## 12 Italy                    7814.  4719493            604
    ## 13 Germany                  7332.  4384616            598
    ## 14 Indonesia                7254.  4236287            584
    ## 15 Mexico                   6477.  3757056            580
    ## 16 Poland                   5043.  2945056            584
    ## 17 South Africa             5029.  2916803            580
    ## 18 Philippines              4670.  2727286            584
    ## 19 Ukraine                  4634.  2660273            574
    ## 20 Malaysia                 4068.  2396121            589

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        306.             179238.            586
    ##  2 Czech Republic                279.             163445.            586
    ##  3 Serbia                        248.             143678.            579
    ##  4 United States                 231.             143924.            623
    ##  5 United Kingdom                229.             136296.            595
    ##  6 Jordan                        228.             131605.            576
    ##  7 Argentina                     220.             127531.            579
    ##  8 Belgium                       209.             123910.            594
    ##  9 Netherlands                   208.             123224.            591
    ## 10 Sweden                        206.             121593.            591
    ## 11 Switzerland                   189.             112564.            595
    ## 12 Brazil                        184.             107629.            585
    ## 13 Spain                         180.             107274.            596
    ## 14 Colombia                      180.             104238.            580
    ## 15 France                        178.             106068.            597
    ## 16 Portugal                      173.             101171.            585
    ## 17 Chile                         172.              99846.            582
    ## 18 Turkey                        170.              98755.            580
    ## 19 Austria                       160.              94350.            589
    ## 20 Hungary                       145.              83876.            578

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               18.9        1807     9556
    ##  2 Peru                 9.13     199843  2190009
    ##  3 Mexico               7.57     284381  3757056
    ##  4 Sudan                7.48       2979    39839
    ##  5 Ecuador              6.41      32899   513026
    ##  6 Syria                6.15       2429    39488
    ##  7 Egypt                5.64      18015   319339
    ##  8 Somalia              5.55       1180    21269
    ##  9 Afghanistan          4.65       7246   155776
    ## 10 China                4.55       5695   125284
    ## 11 Bulgaria             4.12      22488   545598
    ## 12 Myanmar              3.76      18416   490008
    ## 13 Bolivia              3.72      18834   506654
    ## 14 Malawi               3.72       2294    61726
    ## 15 Hungary              3.63      30418   837248
    ## 16 Mali                 3.56        557    15644
    ## 17 Tunisia              3.53      25100   710953
    ## 18 Paraguay             3.52      16228   460529
    ## 19 Zimbabwe             3.52       4658   132368
    ## 20 Chad                 3.43        174     5069

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6682.     199843   29.9 
    ##  2 Bulgaria               3146.      22488    7.15
    ##  3 Hungary                3047.      30418    9.98
    ##  4 Brazil                 3000.     603282  201.  
    ##  5 Czech Republic         2918.      30570   10.5 
    ##  6 Argentina              2798.     115666   41.3 
    ##  7 Colombia               2655.     126865   47.8 
    ##  8 Paraguay               2545.      16228    6.38
    ##  9 Mexico                 2529.     284381  112.  
    ## 10 Belgium                2478.      25780   10.4 
    ## 11 Tunisia                2370.      25100   10.6 
    ## 12 Slovakia               2358.      12864    5.46
    ## 13 United States          2320.     719694  310.  
    ## 14 Chile                  2246.      37620   16.7 
    ## 15 Ecuador                2224.      32899   14.8 
    ## 16 United Kingdom         2223.     138629   62.3 
    ## 17 Italy                  2181.     131585   60.3 
    ## 18 Poland                 1979.      76179   38.5 
    ## 19 Romania                1941.      42616   22.0 
    ## 20 Bolivia                1893.      18834    9.95

EOL
