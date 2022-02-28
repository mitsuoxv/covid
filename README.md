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

Updated: 2022-03-01

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
    ##  1 United States          107547. 78186539            727
    ##  2 India                   59950. 42924130            716
    ##  3 Brazil                  40089. 28744050            717
    ##  4 France                  30222. 22031701            729
    ##  5 United Kingdom          25866. 18804769            727
    ##  6 Russia                  23031. 16398036            712
    ##  7 Germany                 20199. 14745107            730
    ##  8 Turkey                  19627. 13974498            712
    ##  9 Italy                   17343. 12764558            736
    ## 10 Spain                   15079. 10977524            728
    ## 11 Argentina               12513.  8897178            711
    ## 12 Iran                     9592.  7040467            734
    ## 13 Netherlands              8759.  6332772            723
    ## 14 Colombia                 8512.  6060793            712
    ## 15 Poland                   7915.  5667054            716
    ## 16 Indonesia                7736.  5539394            716
    ## 17 Mexico                   7664.  5502586            718
    ## 18 Ukraine                  6849.  4835476            706
    ## 19 Japan                    6620.  4885353            738
    ## 20 South Africa             5159.  3673257            712

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Denmark                       695.             501142.            721
    ##  2 Israel                        686.             493332.            719
    ##  3 Netherlands                   526.             380461.            723
    ##  4 Switzerland                   500.             363205.            727
    ##  5 Czech Republic                475.             341192.            718
    ##  6 Belgium                       469.             340674.            726
    ##  7 France                        467.             340161.            729
    ##  8 Austria                       453.             326356.            721
    ##  9 Portugal                      423.             303620.            717
    ## 10 United Kingdom                415.             301608.            727
    ## 11 Slovakia                      373.             265247.            712
    ## 12 Serbia                        365.             259811.            711
    ## 13 Jordan                        358.             253387.            708
    ## 14 Sweden                        353.             255459.            723
    ## 15 United States                 347.             252025.            727
    ## 16 Norway                        331.             239962.            725
    ## 17 Spain                         324.             236046.            728
    ## 18 Greece                        305.             218673.            718
    ## 19 Argentina                     303.             215203.            711
    ## 20 Italy                         287.             211543.            736

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2134    11769
    ##  2 Sudan                 6.36       3908    61458
    ##  3 Peru                  5.99     210407  3512404
    ##  4 Mexico                5.78     318014  5502586
    ##  5 Syria                 5.64       3071    54480
    ##  6 Somalia               5.12       1348    26313
    ##  7 Egypt                 4.98      24040   482248
    ##  8 Afghanistan           4.38       7593   173395
    ##  9 Ecuador               4.26      35223   827760
    ## 10 Niger                 3.51        307     8751
    ## 11 Myanmar               3.30      19365   586198
    ## 12 Bulgaria              3.26      35482  1088520
    ## 13 Malawi                3.06       2615    85328
    ## 14 Paraguay              2.86      18346   640552
    ## 15 Tunisia               2.78      27773   997754
    ## 16 El Salvador           2.75       4068   147786
    ## 17 Haiti                 2.70        820    30340
    ## 18 South Africa          2.70      99229  3673257
    ## 19 Indonesia             2.67     148073  5539394
    ## 20 Chad                  2.62        190     7248

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7035.     210407   29.9 
    ##  2 Bulgaria               4963.      35482    7.15
    ##  3 Hungary                4403.      43949    9.98
    ##  4 Czech Republic         3684.      38592   10.5 
    ##  5 Slovakia               3389.      18485    5.46
    ##  6 Brazil                 3227.     648913  201.  
    ##  7 Argentina              3051.     126120   41.3 
    ##  8 United States          3030.     939950  310.  
    ##  9 Colombia               2900.     138598   47.8 
    ## 10 Belgium                2895.      30121   10.4 
    ## 11 Poland                 2891.     111317   38.5 
    ## 12 Romania                2885.      63353   22.0 
    ## 13 Paraguay               2877.      18346    6.38
    ## 14 Mexico                 2828.     318014  112.  
    ## 15 Tunisia                2623.      27773   10.6 
    ## 16 United Kingdom         2586.     161224   62.3 
    ## 17 Italy                  2561.     154560   60.3 
    ## 18 Chile                  2520.      42200   16.7 
    ## 19 Russia                 2499.     351660  141.  
    ## 20 Ecuador                2381.      35223   14.8

EOL
