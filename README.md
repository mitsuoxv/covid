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

Updated: 2021-08-13

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
    ##  1 United States           67085. 35957692            536
    ##  2 India                   62166. 32077706            516
    ##  3 Brazil                  39096. 20212642            517
    ##  4 Russia                  12763.  6534791            512
    ##  5 France                  11751.  6216600            529
    ##  6 Turkey                  11711.  5996224            512
    ##  7 United Kingdom          11664.  6146804            527
    ##  8 Argentina                9866.  5041487            511
    ##  9 Colombia                 9466.  4846955            512
    ## 10 Spain                    8826.  4660473            528
    ## 11 Italy                    8233.  4413162            536
    ## 12 Iran                     8017.  4281217            534
    ## 13 Indonesia                7314.  3774155            516
    ## 14 Germany                  7179.  3805063            530
    ## 15 Mexico                   5855.  2997885            512
    ## 16 Poland                   5590.  2884780            516
    ## 17 South Africa             4988.  2554240            512
    ## 18 Ukraine                  4471.  2262601            506
    ## 19 Peru                     4146.  2127034            513
    ## 20 Netherlands              3618.  1892104            523

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                309.             159954.            518
    ##  2 Israel                        241.             125250.            519
    ##  3 Jordan                        239.             121667.            508
    ##  4 Argentina                     239.             121942.            511
    ##  5 Sweden                        222.             115955.            523
    ##  6 Netherlands                   217.             113674.            523
    ##  7 United States                 216.             115905.            536
    ##  8 Belgium                       209.             110135.            526
    ##  9 Colombia                      198.             101422.            512
    ## 10 Brazil                        194.             100509.            517
    ## 11 Serbia                        194.              99140.            511
    ## 12 Spain                         190.             100212.            528
    ## 13 Chile                         189.              97062.            514
    ## 14 United Kingdom                187.              98588.            527
    ## 15 Switzerland                   182.              96020.            527
    ## 16 France                        181.              95982.            529
    ## 17 Portugal                      180.              93035.            517
    ## 18 Hungary                       159.              81167.            510
    ## 19 Austria                       154.              80508.            522
    ## 20 Turkey                        151.              77068.            512

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.3        1392     7213
    ##  2 Peru                 9.27     197102  2127034
    ##  3 Mexico               8.19     245476  2997885
    ##  4 Sudan                7.41       2780    37532
    ##  5 Syria                7.36       1927    26165
    ##  6 Ecuador              6.46      31788   491831
    ##  7 Egypt                5.82      16597   284966
    ##  8 Somalia              5.37        864    16103
    ##  9 China                4.64       5664   122058
    ## 10 Afghanistan          4.61       6988   151563
    ## 11 Bulgaria             4.25      18306   430410
    ## 12 Bolivia              3.77      18082   479459
    ## 13 Hungary              3.71      30037   810212
    ## 14 Myanmar              3.67      12667   344730
    ## 15 Tanzania             3.66         50     1367
    ## 16 Mali                 3.64        534    14663
    ## 17 Chad                 3.49        174     4981
    ## 18 Tunisia              3.44      21220   616764
    ## 19 Niger                3.43        196     5711
    ## 20 Zimbabwe             3.38       3991   117954

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6590.     197102   29.9 
    ##  2 Hungary                3009.      30037    9.98
    ##  3 Czech Republic         2899.      30372   10.5 
    ##  4 Brazil                 2808.     564773  201.  
    ##  5 Argentina              2616.     108165   41.3 
    ##  6 Colombia               2569.     122768   47.8 
    ##  7 Bulgaria               2561.      18306    7.15
    ##  8 Belgium                2430.      25282   10.4 
    ##  9 Paraguay               2406.      15341    6.38
    ## 10 Slovakia               2300.      12544    5.46
    ## 11 Mexico                 2183.     245476  112.  
    ## 12 Chile                  2159.      36157   16.7 
    ## 13 Ecuador                2149.      31788   14.8 
    ## 14 Italy                  2126.     128304   60.3 
    ## 15 United Kingdom         2095.     130607   62.3 
    ## 16 Tunisia                2004.      21220   10.6 
    ## 17 United States          1978.     613647  310.  
    ## 18 Poland                 1956.      75291   38.5 
    ## 19 Bolivia                1818.      18082    9.95
    ## 20 Spain                  1770.      82320   46.5

EOL
