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

Updated: 2022-01-05

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
    ##  1 United States           81712. 54910550            672
    ##  2 India                   52890. 34960261            661
    ##  3 Brazil                  33675. 22293228            662
    ##  4 United Kingdom          20034. 13422819            670
    ##  5 Russia                  16088. 10570212            657
    ##  6 France                  14917. 10053955            674
    ##  7 Turkey                  14607.  9596779            657
    ##  8 Germany                 10723.  7238408            675
    ##  9 Spain                    9907.  6667511            673
    ## 10 Italy                    9392.  6396110            681
    ## 11 Iran                     9129.  6198590            679
    ## 12 Argentina                8681.  5694930            656
    ## 13 Colombia                 7886.  5181173            657
    ## 14 Indonesia                6450.  4263732            661
    ## 15 Poland                   6271.  4145518            661
    ## 16 Mexico                   6019.  3990587            663
    ## 17 Ukraine                  5650.  3678088            651
    ## 18 South Africa             5290.  3475512            657
    ## 19 Netherlands              4761.  3180329            668
    ## 20 Philippines              4320.  2855819            661

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                359.             237986.            663
    ##  2 United Kingdom                321.             215287.            670
    ##  3 Belgium                       306.             205064.            671
    ##  4 Israel                        288.             191463.            664
    ##  5 Netherlands                   286.             191068.            668
    ##  6 Serbia                        271.             177760.            656
    ##  7 Switzerland                   268.             180018.            672
    ##  8 United States                 263.             176998.            672
    ##  9 Jordan                        255.             166574.            653
    ## 10 Slovakia                      237.             155732.            657
    ## 11 Austria                       235.             156648.            666
    ## 12 France                        230.             155229.            674
    ## 13 Denmark                       230.             153180.            666
    ## 14 Spain                         213.             143369.            673
    ## 15 Argentina                     210.             137748.            656
    ## 16 Sweden                        206.             137589.            668
    ## 17 Portugal                      203.             134373.            662
    ## 18 Hungary                       193.             126699.            655
    ## 19 Turkey                        188.             123345.            657
    ## 20 Greece                        178.             117704.            663

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               19.6        1984    10138
    ##  2 Peru                 8.81     202782  2302678
    ##  3 Mexico               7.51     299544  3990587
    ##  4 Sudan                7.07       3340    47272
    ##  5 Ecuador              6.10      33683   552324
    ##  6 Syria                5.77       2908    50364
    ##  7 Somalia              5.66       1333    23532
    ##  8 Egypt                5.62      21817   387882
    ##  9 Afghanistan          4.66       7364   158171
    ## 10 China                4.29       5699   132737
    ## 11 Bulgaria             4.14      31080   751458
    ## 12 Niger                3.69        277     7508
    ## 13 Myanmar              3.63      19278   531299
    ## 14 Paraguay             3.55      16637   468933
    ## 15 Tunisia              3.51      25588   728802
    ## 16 Indonesia            3.38     144105  4263732
    ## 17 Romania              3.24      58814  1813056
    ## 18 Bolivia              3.21      19733   614941
    ## 19 El Salvador          3.14       3826   122038
    ## 20 Hungary              3.12      39517  1264709

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6780.     202782   29.9 
    ##  2 Bulgaria               4348.      31080    7.15
    ##  3 Hungary                3959.      39517    9.98
    ##  4 Czech Republic         3468.      36326   10.5 
    ##  5 Brazil                 3079.     619133  201.  
    ##  6 Slovakia               3078.      16788    5.46
    ##  7 Argentina              2835.     117204   41.3 
    ##  8 Belgium                2729.      28385   10.4 
    ##  9 Colombia               2721.     130026   47.8 
    ## 10 Romania                2678.      58814   22.0 
    ## 11 Mexico                 2663.     299544  112.  
    ## 12 United States          2642.     819656  310.  
    ## 13 Paraguay               2609.      16637    6.38
    ## 14 Poland                 2546.      98034   38.5 
    ## 15 Tunisia                2416.      25588   10.6 
    ## 16 United Kingdom         2388.     148893   62.3 
    ## 17 Chile                  2339.      39173   16.7 
    ## 18 Italy                  2283.     137786   60.3 
    ## 19 Ecuador                2277.      33683   14.8 
    ## 20 Russia                 2219.     312187  141.

EOL
