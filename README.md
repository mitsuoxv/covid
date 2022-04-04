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

Updated: 2022-04-05

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
“speed_since_100”, which is average number of newly confirmed cases per
day since cumulative cases became more than 100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_since_100 cum_conf days_since_100
    ##    <chr>                    <dbl>    <dbl>          <int>
    ##  1 United States          104218. 79414511            762
    ##  2 India                   57296. 43029044            751
    ##  3 Brazil                  39883. 29992227            752
    ##  4 France                  33041. 25243085            764
    ##  5 Germany                 28325. 21668677            765
    ##  6 United Kingdom          27843. 21216878            762
    ##  7 Russia                  23979. 17912157            747
    ##  8 Turkey                  19939. 14894731            747
    ##  9 Italy                   19255. 14845815            771
    ## 10 South Korea             18089. 14001406            774
    ## 11 Spain                   15140. 11551574            763
    ## 12 Vietnam                 13214.  9818328            743
    ## 13 Argentina               12023.  9041124            752
    ## 14 Netherlands             10436.  7910315            758
    ## 15 Iran                     9321.  7167646            769
    ## 16 Japan                    8670.  6702086            773
    ## 17 Colombia                 8147.  6085618            747
    ## 18 Indonesia                8018.  6021642            751
    ## 19 Poland                   7949.  5970114            751
    ## 20 Mexico                   7524.  5665376            753

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Denmark                       740.             559210.            756
    ##  2 Israel                        712.             536879.            754
    ##  3 Austria                       635.             479758.            756
    ##  4 Netherlands                   627.             475237.            758
    ##  5 Switzerland                   604.             460479.            762
    ##  6 France                        510.             389744.            764
    ##  7 Belgium                       486.             370186.            761
    ##  8 Czech Republic                486.             365816.            753
    ##  9 Portugal                      450.             338127.            752
    ## 10 United Kingdom                447.             340295.            762
    ## 11 Slovakia                      424.             316581.            747
    ## 12 South Korea                   374.             289150.            774
    ## 13 Greece                        372.             279792.            753
    ## 14 Norway                        370.             281227.            761
    ## 15 Serbia                        361.             269675.            746
    ## 16 Jordan                        356.             264429.            743
    ## 17 Germany                       346.             264891.            765
    ## 18 Sweden                        343.             260347.            758
    ## 19 United States                 336.             255984.            762
    ## 20 Spain                         326.             248389.            763

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.2        2144    11808
    ##  2 Sudan                 7.92       4907    61966
    ##  3 Peru                  5.98     212299  3548088
    ##  4 Mexico                5.71     323212  5665376
    ##  5 Syria                 5.64       3144    55711
    ##  6 Somalia               5.15       1361    26410
    ##  7 Egypt                 4.81      24473   509177
    ##  8 Afghanistan           4.31       7671   177827
    ##  9 Ecuador               4.12      35421   859890
    ## 10 Niger                 3.50        308     8811
    ## 11 Bulgaria              3.21      36568  1140679
    ## 12 Myanmar               3.18      19433   611875
    ## 13 Malawi                3.07       2626    85664
    ## 14 Paraguay              2.88      18664   648353
    ## 15 Tunisia               2.73      28323  1035884
    ## 16 Haiti                 2.73        833    30545
    ## 17 South Africa          2.69     100050  3722954
    ## 18 Chad                  2.61        191     7310
    ## 19 Algeria               2.59       6874   265691
    ## 20 Honduras              2.58      10882   421121

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7099.     212299   29.9 
    ##  2 Bulgaria               5115.      36568    7.15
    ##  3 Hungary                4559.      45510    9.98
    ##  4 Czech Republic         3792.      39723   10.5 
    ##  5 Slovakia               3564.      19440    5.46
    ##  6 Chile                  3385.      56689   16.7 
    ##  7 Brazil                 3282.     660108  201.  
    ##  8 United States          3140.     974179  310.  
    ##  9 Argentina              3098.     128065   41.3 
    ## 10 Poland                 2996.     115345   38.5 
    ## 11 Romania                2964.      65090   22.0 
    ## 12 Belgium                2963.      30826   10.4 
    ## 13 Paraguay               2927.      18664    6.38
    ## 14 Colombia               2922.     139650   47.8 
    ## 15 Mexico                 2874.     323212  112.  
    ## 16 Tunisia                2675.      28323   10.6 
    ## 17 United Kingdom         2656.     165570   62.3 
    ## 18 Italy                  2648.     159784   60.3 
    ## 19 Russia                 2630.     369995  141.  
    ## 20 Greece                 2517.      27684   11

EOL
