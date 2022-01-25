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

Updated: 2022-01-26

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
    ##  1 United States          101232. 70153597            693
    ##  2 India                   58356. 39799202            682
    ##  3 Brazil                  35204. 24044255            683
    ##  4 France                  23521. 16347127            695
    ##  5 United Kingdom          23088. 15953689            691
    ##  6 Russia                  16580. 11241109            678
    ##  7 Turkey                  16243. 11013261            678
    ##  8 Italy                   14247. 10001344            702
    ##  9 Spain                   13373.  9280891            694
    ## 10 Germany                 12747.  8871795            696
    ## 11 Argentina               11614.  7862536            677
    ## 12 Iran                     8940.  6258181            700
    ## 13 Colombia                 8466.  5740179            678
    ## 14 Mexico                   6824.  4667829            684
    ## 15 Poland                   6722.  4584360            682
    ## 16 Indonesia                6296.  4294183            682
    ## 17 Ukraine                  5788.  3889488            672
    ## 18 Netherlands              5739.  3954299            689
    ## 19 South Africa             5284.  3582691            678
    ## 20 Philippines              5047.  3442056            682

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        490.             335942.            685
    ##  2 Belgium                       393.             272106.            692
    ##  3 Czech Republic                390.             266728.            684
    ##  4 Denmark                       382.             262250.            687
    ##  5 Switzerland                   373.             258341.            693
    ##  6 United Kingdom                370.             255879.            691
    ##  7 France                        363.             252394.            695
    ##  8 Netherlands                   345.             237567.            689
    ##  9 United States                 326.             226132.            693
    ## 10 Serbia                        314.             212386.            677
    ## 11 Portugal                      309.             211182.            683
    ## 12 Austria                       290.             199325.            687
    ## 13 Spain                         288.             199563.            694
    ## 14 Argentina                     281.             190177.            677
    ## 15 Sweden                        271.             186692.            689
    ## 16 Jordan                        267.             179883.            674
    ## 17 Slovakia                      251.             170402.            678
    ## 18 Greece                        241.             164762.            684
    ## 19 Italy                         236.             165749.            702
    ## 20 Hungary                       215.             145372.            676

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               18.8        1995    10585
    ##  2 Peru                 6.94     204323  2946151
    ##  3 Mexico               6.50     303183  4667829
    ##  4 Sudan                6.11       3411    55833
    ##  5 Syria                5.82       2971    51029
    ##  6 Somalia              5.49       1335    24322
    ##  7 Egypt                5.44      22396   411749
    ##  8 Ecuador              5.04      34329   681382
    ##  9 Afghanistan          4.62       7393   159896
    ## 10 China                4.14       5700   137555
    ## 11 Bulgaria             3.68      32796   891277
    ## 12 Myanmar              3.62      19310   534163
    ## 13 Niger                3.45        296     8592
    ## 14 Indonesia            3.36     144247  4294183
    ## 15 Paraguay             3.16      16970   536977
    ## 16 Tunisia              3.04      25988   853905
    ## 17 El Salvador          3.04       3857   127012
    ## 18 Malawi               3.01       2528    83927
    ## 19 Romania              2.94      59588  2029211
    ## 20 Russia               2.91     327448 11241109

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6832.     204323   29.9 
    ##  2 Bulgaria               4588.      32796    7.15
    ##  3 Hungary                4109.      41018    9.98
    ##  4 Czech Republic         3540.      37080   10.5 
    ##  5 Slovakia               3244.      17698    5.46
    ##  6 Brazil                 3098.     623097  201.  
    ##  7 Argentina              2882.     119168   41.3 
    ##  8 United States          2772.     860113  310.  
    ##  9 Belgium                2772.      28835   10.4 
    ## 10 Colombia               2767.     132240   47.8 
    ## 11 Romania                2714.      59588   22.0 
    ## 12 Poland                 2704.     104097   38.5 
    ## 13 Mexico                 2696.     303183  112.  
    ## 14 Paraguay               2662.      16970    6.38
    ## 15 United Kingdom         2469.     153916   62.3 
    ## 16 Tunisia                2454.      25988   10.6 
    ## 17 Italy                  2384.     143875   60.3 
    ## 18 Chile                  2361.      39535   16.7 
    ## 19 Russia                 2327.     327448  141.  
    ## 20 Ecuador                2321.      34329   14.8

EOL
