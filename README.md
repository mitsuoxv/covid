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

Updated: 2021-11-12

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
    ##  1 United States           71847. 46413663            646
    ##  2 India                   56675. 34401670            607
    ##  3 Brazil                  36015. 21897025            608
    ##  4 United Kingdom          15220.  9406005            618
    ##  5 Russia                  14846.  8952472            603
    ##  6 Turkey                  13790.  8315424            603
    ##  7 France                  11319.  7017897            620
    ##  8 Iran                     9620.  6012408            625
    ##  9 Argentina                8803.  5299418            602
    ## 10 Colombia                 8323.  5019158            603
    ## 11 Spain                    8140.  5038517            619
    ## 12 Germany                  7881.  4894250            621
    ## 13 Italy                    7698.  4826738            627
    ## 14 Indonesia                7001.  4249758            607
    ## 15 Mexico                   6291.  3831259            609
    ## 16 Ukraine                  5285.  3155519            597
    ## 17 Poland                   5210.  3162804            607
    ## 18 South Africa             4850.  2924622            603
    ## 19 Philippines              4628.  2809311            607
    ## 20 Malaysia                 4122.  2522498            612

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        298.             181655.            609
    ##  2 Czech Republic                291.             177220.            609
    ##  3 Serbia                        271.             162983.            602
    ##  4 United Kingdom                244.             150862.            618
    ##  5 United States                 232.             149609.            646
    ##  6 Jordan                        230.             137886.            599
    ##  7 Belgium                       228.             140685.            617
    ##  8 Netherlands                   219.             134379.            614
    ##  9 Argentina                     213.             128181.            602
    ## 10 Sweden                        201.             123538.            614
    ## 11 Switzerland                   192.             118373.            618
    ## 12 Austria                       181.             110665.            612
    ## 13 Brazil                        179.             108884.            608
    ## 14 Turkey                        177.             106876.            603
    ## 15 Spain                         175.             108341.            619
    ## 16 France                        175.             108354.            620
    ## 17 Colombia                      174.             105025.            603
    ## 18 Portugal                      170.             103125.            608
    ## 19 Chile                         169.             102431.            605
    ## 20 Slovakia                      164.              99030.            603

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.4        1918     9902
    ##  2 Peru                 9.08     200502  2208891
    ##  3 Mexico               7.57     290110  3831259
    ##  4 Sudan                7.46       3067    41093
    ##  5 Ecuador              6.35      32989   519560
    ##  6 Syria                5.79       2644    45645
    ##  7 Somalia              5.70       1294    22693
    ##  8 Egypt                5.66      19249   340269
    ##  9 Afghanistan          4.66       7291   156414
    ## 10 China                4.49       5697   126908
    ## 11 Bulgaria             3.98      25754   646856
    ## 12 Malawi               3.72       2302    61832
    ## 13 Myanmar              3.70      18869   509771
    ## 14 Bolivia              3.65      18976   519669
    ## 15 Tunisia              3.54      25294   715396
    ## 16 Paraguay             3.53      16272   461466
    ## 17 Zimbabwe             3.52       4694   133302
    ## 18 Mali                 3.52        581    16527
    ## 19 Niger                3.45        227     6589
    ## 20 Chad                 3.43        175     5107

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6704.     200502   29.9 
    ##  2 Bulgaria               3603.      25754    7.15
    ##  3 Hungary                3181.      31751    9.98
    ##  4 Brazil                 3032.     609756  201.  
    ##  5 Czech Republic         2987.      31289   10.5 
    ##  6 Argentina              2810.     116165   41.3 
    ##  7 Colombia               2670.     127610   47.8 
    ##  8 Mexico                 2579.     290110  112.  
    ##  9 Paraguay               2552.      16272    6.38
    ## 10 Belgium                2524.      26261   10.4 
    ## 11 Slovakia               2457.      13405    5.46
    ## 12 United States          2423.     751610  310.  
    ## 13 Tunisia                2389.      25294   10.6 
    ## 14 Romania                2363.      51888   22.0 
    ## 15 United Kingdom         2283.     142338   62.3 
    ## 16 Chile                  2263.      37895   16.7 
    ## 17 Ecuador                2230.      32989   14.8 
    ## 18 Italy                  2197.     132551   60.3 
    ## 19 Poland                 2040.      78524   38.5 
    ## 20 Bolivia                1908.      18976    9.95

EOL
