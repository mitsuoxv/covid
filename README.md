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

[![R-CMD-check](https://github.com/mitsuoxv/covid/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/mitsuoxv/covid/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

Updated: 2022-07-05

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
    ##  1 United States          101329. 86433723            853
    ##  2 India                   51685. 43518564            842
    ##  3 Brazil                  38386. 32282879            841
    ##  4 France                  35420. 30284140            855
    ##  5 Germany                 33133. 28394995            857
    ##  6 United Kingdom          26660. 22741517            853
    ##  7 Russia                  22008. 18442625            838
    ##  8 Italy                   21773. 18768871            862
    ##  9 South Korea             21267. 18395864            865
    ## 10 Turkey                  18047. 15123331            838
    ## 11 Spain                   15009. 12818184            854
    ## 12 Vietnam                 12888. 10748639            834
    ## 13 Argentina               11098.  9367172            844
    ## 14 Japan                   10877.  9398126            864
    ## 15 Australia                9653.  8156829            845
    ## 16 Netherlands              9647.  8190255            849
    ## 17 Iran                     8418.  7239557            860
    ## 18 Colombia                 7349.  6151354            837
    ## 19 Indonesia                7239.  6095351            842
    ## 20 Poland                   7145.  6016526            842

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        705.             596014.            845
    ##  2 Denmark                       683.             578694.            847
    ##  3 Austria                       647.             548394.            847
    ##  4 Netherlands                   580.             492055.            849
    ##  5 Switzerland                   579.             493586.            853
    ##  6 Portugal                      575.             484380.            842
    ##  7 France                        547.             467576.            855
    ##  8 Belgium                       479.             408159.            852
    ##  9 Australia                     449.             379110.            845
    ## 10 Czech Republic                445.             375675.            844
    ## 11 South Korea                   439.             379902.            865
    ## 12 United Kingdom                428.             364749.            853
    ## 13 Germany                       405.             347118.            857
    ## 14 Greece                        401.             338167.            844
    ## 15 Slovakia                      393.             329508.            838
    ## 16 Italy                         361.             311050.            862
    ## 17 Norway                        339.             288925.            851
    ## 18 Serbia                        331.             276646.            837
    ## 19 United States                 327.             278609.            853
    ## 20 Spain                         323.             275625.            854

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               18.2        2149    11824
    ##  2 Sudan                7.90       4952    62696
    ##  3 Peru                 5.89     213497  3625091
    ##  4 Syria                5.63       3150    55932
    ##  5 Mexico               5.44     325638  5986917
    ##  6 Somalia              5.08       1361    26803
    ##  7 Egypt                4.81      24723   514088
    ##  8 Afghanistan          4.23       7724   182724
    ##  9 Ecuador              3.93      35721   908548
    ## 10 Niger                3.43        310     9031
    ## 11 Bulgaria             3.18      37257  1173274
    ## 12 Myanmar              3.17      19434   613659
    ## 13 Malawi               3.06       2645    86410
    ## 14 Paraguay             2.89      18963   655532
    ## 15 Tunisia              2.73      28691  1052180
    ## 16 Haiti                2.65        837    31603
    ## 17 Chad                 2.60        193     7425
    ## 18 Algeria              2.58       6875   266115
    ## 19 Indonesia            2.57     156758  6095351
    ## 20 Honduras             2.55      10906   427483

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7139.     213497   29.9 
    ##  2 Bulgaria               5212.      37257    7.15
    ##  3 Hungary                4673.      46647    9.98
    ##  4 Czech Republic         3849.      40322   10.5 
    ##  5 Slovakia               3694.      20151    5.46
    ##  6 Chile                  3492.      58479   16.7 
    ##  7 Brazil                 3337.     671125  201.  
    ##  8 United States          3248.    1007644  310.  
    ##  9 Argentina              3122.     129070   41.3 
    ## 10 Belgium                3068.      31918   10.4 
    ## 11 Poland                 3024.     116435   38.5 
    ## 12 Romania                2993.      65726   22.0 
    ## 13 Paraguay               2974.      18963    6.38
    ## 14 Colombia               2929.     139970   47.8 
    ## 15 Mexico                 2895.     325638  112.  
    ## 16 United Kingdom         2894.     180417   62.3 
    ## 17 Italy                  2793.     168545   60.3 
    ## 18 Greece                 2755.      30302   11   
    ## 19 Russia                 2710.     381306  141.  
    ## 20 Tunisia                2710.      28691   10.6

EOL
