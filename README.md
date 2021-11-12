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

Updated: 2021-11-13

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
    ##  1 United States           71872. 46501534            647
    ##  2 India                   56602. 34414186            608
    ##  3 Brazil                  35976. 21909298            609
    ##  4 United Kingdom          15264.  9448406            619
    ##  5 Russia                  14888.  8992595            604
    ##  6 Turkey                  13808.  8340322            604
    ##  7 France                  11321.  7030401            621
    ##  8 Iran                     9616.  6019947            626
    ##  9 Argentina                8791.  5300985            603
    ## 10 Colombia                 8314.  5021619            604
    ## 11 Spain                    8133.  5042803            620
    ## 12 Germany                  7947.  4942890            622
    ## 13 Italy                    7700.  4835435            628
    ## 14 Indonesia                6990.  4250157            608
    ## 15 Mexico                   6286.  3834815            610
    ## 16 Ukraine                  5317.  3179577            598
    ## 17 Poland                   5223.  3175769            608
    ## 18 South Africa             4842.  2924978            604
    ## 19 Philippines              4624.  2811248            608
    ## 20 Malaysia                 4125.  2528821            613

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        298.             181709.            610
    ##  2 Czech Republic                292.             178214.            610
    ##  3 Serbia                        271.             163527.            603
    ##  4 United Kingdom                245.             151542.            619
    ##  5 United States                 232.             149892.            647
    ##  6 Jordan                        230.             137886.            600
    ##  7 Belgium                       228.             140685.            618
    ##  8 Netherlands                   220.             135358.            615
    ##  9 Argentina                     213.             128219.            603
    ## 10 Sweden                        201.             123644.            615
    ## 11 Switzerland                   192.             118885.            619
    ## 12 Austria                       183.             112310.            613
    ## 13 Brazil                        179.             108945.            609
    ## 14 Turkey                        177.             107196.            604
    ## 15 Spain                         175.             108433.            620
    ## 16 France                        175.             108547.            621
    ## 17 Colombia                      174.             105077.            604
    ## 18 Portugal                      170.             103263.            609
    ## 19 Chile                         169.             102594.            606
    ## 20 Slovakia                      166.             100285.            604

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.4        1918     9902
    ##  2 Peru                 9.07     200532  2210129
    ##  3 Mexico               7.57     290374  3834815
    ##  4 Sudan                7.46       3067    41093
    ##  5 Ecuador              6.35      32989   519560
    ##  6 Syria                5.79       2644    45645
    ##  7 Somalia              5.70       1294    22693
    ##  8 Egypt                5.66      19249   340269
    ##  9 Afghanistan          4.66       7292   156456
    ## 10 China                4.49       5697   127018
    ## 11 Bulgaria             3.99      25950   650063
    ## 12 Malawi               3.72       2302    61834
    ## 13 Myanmar              3.70      18882   510725
    ## 14 Bolivia              3.65      18985   520553
    ## 15 Tunisia              3.54      25294   715396
    ## 16 Paraguay             3.53      16272   461520
    ## 17 Zimbabwe             3.52       4694   133329
    ## 18 Mali                 3.51        582    16563
    ## 19 Niger                3.46        229     6626
    ## 20 Chad                 3.43        175     5107

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6705.     200532   29.9 
    ##  2 Bulgaria               3630.      25950    7.15
    ##  3 Hungary                3192.      31867    9.98
    ##  4 Brazil                 3033.     610036  201.  
    ##  5 Czech Republic         2993.      31355   10.5 
    ##  6 Argentina              2810.     116184   41.3 
    ##  7 Colombia               2671.     127640   47.8 
    ##  8 Mexico                 2582.     290374  112.  
    ##  9 Paraguay               2552.      16272    6.38
    ## 10 Belgium                2524.      26261   10.4 
    ## 11 Slovakia               2465.      13446    5.46
    ## 12 United States          2427.     752960  310.  
    ## 13 Tunisia                2389.      25294   10.6 
    ## 14 Romania                2377.      52206   22.0 
    ## 15 United Kingdom         2286.     142533   62.3 
    ## 16 Chile                  2264.      37917   16.7 
    ## 17 Ecuador                2230.      32989   14.8 
    ## 18 Italy                  2198.     132618   60.3 
    ## 19 Poland                 2040.      78555   38.5 
    ## 20 Bolivia                1909.      18985    9.95

EOL
