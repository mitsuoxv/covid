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

Updated: 2022-04-07

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
    ##  1 United States          104013. 79465958            764
    ##  2 India                   57146. 43030925            753
    ##  3 Brazil                  39805. 30012798            754
    ##  4 France                  33240. 25461732            766
    ##  5 Germany                 28767. 22064059            767
    ##  6 United Kingdom          28024. 21410309            764
    ##  7 Russia                  23953. 17940765            749
    ##  8 Turkey                  19919. 14919591            749
    ##  9 Italy                   19361. 14966058            773
    ## 10 South Korea             18754. 14553644            776
    ## 11 Spain                   15135. 11578653            765
    ## 12 Vietnam                 13318.  9922040            745
    ## 13 Argentina               11993.  9043098            754
    ## 14 Netherlands             10441.  7935106            760
    ## 15 Iran                     9307.  7175780            771
    ## 16 Japan                    8746.  6778235            775
    ## 17 Colombia                 8126.  6086233            749
    ## 18 Indonesia                8003.  6026324            753
    ## 19 Poland                   7933.  5973557            753
    ## 20 Mexico                   7506.  5666921            755

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Denmark                       739.             560236.            758
    ##  2 Israel                        714.             539713.            756
    ##  3 Austria                       637.             482806.            758
    ##  4 Netherlands                   627.             476726.            760
    ##  5 Switzerland                   606.             463277.            764
    ##  6 France                        513.             393120.            766
    ##  7 Belgium                       489.             373116.            763
    ##  8 Czech Republic                486.             367086.            755
    ##  9 Portugal                      452.             340838.            754
    ## 10 United Kingdom                449.             343398.            764
    ## 11 Slovakia                      424.             317524.            749
    ## 12 South Korea                   387.             300555.            776
    ## 13 Greece                        375.             283145.            755
    ## 14 Norway                        369.             281794.            763
    ## 15 Serbia                        361.             270085.            748
    ## 16 Jordan                        355.             264429.            745
    ## 17 Germany                       352.             269724.            767
    ## 18 Sweden                        343.             260347.            760
    ## 19 United States                 335.             256149.            764
    ## 20 Spain                         325.             248971.            765

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.2        2144    11812
    ##  2 Sudan                 7.92       4907    61987
    ##  3 Peru                  5.98     212354  3548717
    ##  4 Mexico                5.70     323235  5666921
    ##  5 Syria                 5.64       3145    55723
    ##  6 Somalia               5.14       1361    26471
    ##  7 Egypt                 4.81      24473   509177
    ##  8 Afghanistan           4.31       7671   177932
    ##  9 Ecuador               4.11      35449   862321
    ## 10 Niger                 3.49        308     8816
    ## 11 Bulgaria              3.21      36636  1142698
    ## 12 Myanmar               3.18      19434   612079
    ## 13 Malawi                3.07       2626    85667
    ## 14 Paraguay              2.89      18731   648353
    ## 15 Tunisia               2.74      28425  1037358
    ## 16 Haiti                 2.72        833    30571
    ## 17 South Africa          2.69     100067  3725177
    ## 18 Chad                  2.61        192     7349
    ## 19 Algeria               2.59       6874   265699
    ## 20 Honduras              2.58      10885   421170

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7100.     212354   29.9 
    ##  2 Bulgaria               5125.      36636    7.15
    ##  3 Hungary                4573.      45647    9.98
    ##  4 Czech Republic         3798.      39784   10.5 
    ##  5 Slovakia               3571.      19482    5.46
    ##  6 Chile                  3392.      56809   16.7 
    ##  7 Brazil                 3283.     660312  201.  
    ##  8 United States          3143.     974930  310.  
    ##  9 Argentina              3098.     128086   41.3 
    ## 10 Poland                 2999.     115472   38.5 
    ## 11 Belgium                2971.      30908   10.4 
    ## 12 Romania                2966.      65129   22.0 
    ## 13 Paraguay               2938.      18731    6.38
    ## 14 Colombia               2923.     139670   47.8 
    ## 15 Mexico                 2874.     323235  112.  
    ## 16 Tunisia                2684.      28425   10.6 
    ## 17 United Kingdom         2665.     166148   62.3 
    ## 18 Italy                  2653.     160103   60.3 
    ## 19 Russia                 2634.     370602  141.  
    ## 20 Greece                 2529.      27816   11

EOL
