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

Updated: 2022-01-21

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
    ##  1 United States           98019. 67437353            688
    ##  2 India                   56453. 38218773            677
    ##  3 Brazil                  34236. 23211894            678
    ##  4 United Kingdom          22604. 15506754            686
    ##  5 France                  21419. 14779277            690
    ##  6 Russia                  16253. 10938261            673
    ##  7 Turkey                  15844. 10663481            673
    ##  8 Italy                   13227.  9219391            697
    ##  9 Spain                   12593.  8676916            689
    ## 10 Germany                 12041.  8320386            691
    ## 11 Argentina               10890.  7318305            672
    ## 12 Iran                     8967.  6231909            695
    ## 13 Colombia                 8316.  5596917            673
    ## 14 Mexico                   6531.  4434758            679
    ## 15 Poland                   6509.  4406553            677
    ## 16 Indonesia                6318.  4277644            677
    ## 17 Ukraine                  5696.  3799382            667
    ## 18 Netherlands              5381.  3680896            684
    ## 19 South Africa             5303.  3568900            673
    ## 20 Philippines              4865.  3293625            677

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        407.             276779.            680
    ##  2 Czech Republic                377.             255705.            679
    ##  3 United Kingdom                363.             248711.            686
    ##  4 Belgium                       360.             247555.            687
    ##  5 Switzerland                   344.             236625.            688
    ##  6 France                        331.             228187.            690
    ##  7 Denmark                       329.             224697.            682
    ##  8 Netherlands                   323.             221141.            684
    ##  9 United States                 316.             217377.            688
    ## 10 Serbia                        301.             202117.            672
    ## 11 Portugal                      277.             187633.            678
    ## 12 Spain                         271.             186576.            689
    ## 13 Austria                       269.             183486.            682
    ## 14 Argentina                     263.             177014.            672
    ## 15 Jordan                        261.             174400.            669
    ## 16 Sweden                        260.             177936.            684
    ## 17 Slovakia                      244.             164399.            673
    ## 18 Greece                        231.             156681.            679
    ## 19 Italy                         219.             152790.            697
    ## 20 Hungary                       207.             138800.            671

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.0        1995    10507
    ##  2 Peru                 7.63     203645  2668224
    ##  3 Mexico               6.81     301789  4434758
    ##  4 Sudan                6.29       3393    53959
    ##  5 Syria                5.82       2956    50821
    ##  6 Egypt                5.50      22238   403990
    ##  7 Somalia              5.50       1335    24261
    ##  8 Ecuador              5.44      34232   629507
    ##  9 Afghanistan          4.64       7386   159070
    ## 10 China                4.17       5700   136577
    ## 11 Bulgaria             3.81      32431   851945
    ## 12 Myanmar              3.62      19306   533604
    ## 13 Niger                3.46        293     8472
    ## 14 Indonesia            3.37     144199  4277644
    ## 15 Paraguay             3.31      16866   509795
    ## 16 Tunisia              3.17      25881   817051
    ## 17 El Salvador          3.11       3840   123577
    ## 18 Romania              3.05      59385  1944916
    ## 19 Malawi               2.99       2491    83219
    ## 20 Russia               2.96     324060 10938261

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6809.     203645   29.9 
    ##  2 Bulgaria               4537.      32431    7.15
    ##  3 Hungary                4083.      40757    9.98
    ##  4 Czech Republic         3529.      36972   10.5 
    ##  5 Slovakia               3212.      17520    5.46
    ##  6 Brazil                 3091.     621517  201.  
    ##  7 Argentina              2864.     118420   41.3 
    ##  8 Belgium                2761.      28726   10.4 
    ##  9 Colombia               2747.     131268   47.8 
    ## 10 United States          2738.     849276  310.  
    ## 11 Romania                2704.      59385   22.0 
    ## 12 Poland                 2685.     103378   38.5 
    ## 13 Mexico                 2683.     301789  112.  
    ## 14 Paraguay               2645.      16866    6.38
    ## 15 United Kingdom         2452.     152872   62.3 
    ## 16 Tunisia                2444.      25881   10.6 
    ## 17 Italy                  2357.     142205   60.3 
    ## 18 Chile                  2355.      39431   16.7 
    ## 19 Ecuador                2314.      34232   14.8 
    ## 20 Russia                 2303.     324060  141.

EOL
