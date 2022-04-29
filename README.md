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

Updated: 2022-04-30

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
    ##  1 United States          102186. 80420406            787
    ##  2 India                   55505. 43072176            776
    ##  3 Brazil                  39224. 30399004            775
    ##  4 France                  35134. 27720499            789
    ##  5 Germany                 31240. 24710769            791
    ##  6 United Kingdom          27987. 22025929            787
    ##  7 Russia                  23543. 18174991            772
    ##  8 South Korea             21520. 17194616            799
    ##  9 Italy                   20540. 16349788            796
    ## 10 Turkey                  19467. 15028397            772
    ## 11 Spain                   15017. 11833457            788
    ## 12 Vietnam                 13852. 10638632            768
    ## 13 Argentina               11661.  9072230            778
    ## 14 Netherlands             10275   8045456            783
    ## 15 Japan                    9792.  7813849            798
    ## 16 Iran                     9092.  7219433            794
    ## 17 Colombia                 7901.  6091959            771
    ## 18 Indonesia                7792.  6046467            776
    ## 19 Poland                   7726.  5995674            776
    ## 20 Mexico                   7373.  5736579            778

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Denmark                       727.             567976.            781
    ##  2 Israel                        711.             553831.            779
    ##  3 Austria                       651.             508722.            781
    ##  4 Netherlands                   617.             483356.            783
    ##  5 Switzerland                   604.             475201.            787
    ##  6 France                        542.             427994.            789
    ##  7 Belgium                       496.             389931.            786
    ##  8 Czech Republic                479.             372629.            778
    ##  9 Portugal                      463.             359800.            777
    ## 10 United Kingdom                449.             353271.            787
    ## 11 South Korea                   444.             355095.            799
    ## 12 Slovakia                      423.             326310.            772
    ## 13 Greece                        387.             300906.            778
    ## 14 Germany                       382.             302079.            791
    ## 15 Norway                        362.             284495.            785
    ## 16 Serbia                        354.             272990.            771
    ## 17 Jordan                        345.             264667.            768
    ## 18 Italy                         340.             270960.            796
    ## 19 Australia                     338.             263038.            779
    ## 20 Sweden                        334.             261715.            783

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.2        2149    11818
    ##  2 Sudan                 7.94       4931    62117
    ##  3 Peru                  5.97     212778  3563151
    ##  4 Mexico                5.65     324221  5736579
    ##  5 Syria                 5.64       3150    55807
    ##  6 Somalia               5.14       1361    26485
    ##  7 Egypt                 4.79      24606   513468
    ##  8 Afghanistan           4.30       7683   178769
    ##  9 Ecuador               4.10      35581   868570
    ## 10 Niger                 3.46        309     8924
    ## 11 Bulgaria              3.19      36901  1155975
    ## 12 Myanmar               3.17      19434   612843
    ## 13 Malawi                3.07       2634    85767
    ## 14 Paraguay              2.90      18795   649034
    ## 15 Tunisia               2.74      28550  1040193
    ## 16 Haiti                 2.72        835    30655
    ## 17 South Africa          2.66     100351  3776298
    ## 18 Chad                  2.60        193     7411
    ## 19 Algeria               2.59       6875   265773
    ## 20 Indonesia             2.58     156240  6046467

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7115.     212778   29.9 
    ##  2 Bulgaria               5162.      36901    7.15
    ##  3 Hungary                4628.      46201    9.98
    ##  4 Czech Republic         3832.      40143   10.5 
    ##  5 Slovakia               3646.      19891    5.46
    ##  6 Chile                  3433.      57495   16.7 
    ##  7 Brazil                 3297.     663111  201.  
    ##  8 United States          3177.     985482  310.  
    ##  9 Argentina              3109.     128542   41.3 
    ## 10 Belgium                3022.      31439   10.4 
    ## 11 Poland                 3014.     116042   38.5 
    ## 12 Romania                2981.      65471   22.0 
    ## 13 Paraguay               2948.      18795    6.38
    ## 14 Colombia               2925.     139785   47.8 
    ## 15 Mexico                 2883.     324221  112.  
    ## 16 United Kingdom         2802.     174696   62.3 
    ## 17 Italy                  2705.     163244   60.3 
    ## 18 Tunisia                2696.      28550   10.6 
    ## 19 Russia                 2670.     375727  141.  
    ## 20 Greece                 2643       29073   11

EOL
