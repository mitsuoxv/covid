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

Updated: 2022-02-23

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
    ##  1 United States          107808. 77729481            721
    ##  2 India                   60355. 42851929            710
    ##  3 Brazil                  39674. 28208212            711
    ##  4 France                  29945. 21650413            723
    ##  5 United Kingdom          25873. 18654576            721
    ##  6 Russia                  22178. 15657928            706
    ##  7 Turkey                  19247. 13588620            706
    ##  8 Germany                 19009. 13762895            724
    ##  9 Italy                   17116. 12494459            730
    ## 10 Spain                   15039. 10858000            722
    ## 11 Argentina               12537.  8838674            705
    ## 12 Iran                     9562.  6961562            728
    ## 13 Colombia                 8565.  6047042            706
    ## 14 Netherlands              8533.  6118542            717
    ## 15 Poland                   7862.  5582217            710
    ## 16 Mexico                   7603.  5413425            712
    ## 17 Indonesia                7450.  5289414            710
    ## 18 Ukraine                  6798.  4758773            700
    ## 19 Japan                    6203.  4540656            732
    ## 20 South Africa             5184.  3659698            706

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        681.             485413.            713
    ##  2 Denmark                       665.             475371.            715
    ##  3 Netherlands                   513.             367590.            717
    ##  4 Switzerland                   491.             354192.            721
    ##  5 Czech Republic                472.             336375.            712
    ##  6 Belgium                       469.             337615.            720
    ##  7 France                        462.             334274.            723
    ##  8 Austria                       428.             305920.            715
    ##  9 Portugal                      421.             299099.            711
    ## 10 United Kingdom                415.             299199.            721
    ## 11 Serbia                        365.             256996.            705
    ## 12 Sweden                        354.             253546.            717
    ## 13 Slovakia                      353.             249503.            706
    ## 14 Jordan                        352.             246939.            702
    ## 15 United States                 348.             250552.            721
    ## 16 Spain                         323.             233475.            722
    ## 17 Norway                        315.             226864.            719
    ## 18 Argentina                     303.             213788.            705
    ## 19 Greece                        296.             210638.            712
    ## 20 Italy                         284.             207066.            730

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2123    11741
    ##  2 Sudan                 6.36       3894    61251
    ##  3 Peru                  5.99     209468  3496009
    ##  4 Mexico                5.83     315688  5413425
    ##  5 Syria                 5.68       3053    53784
    ##  6 Somalia               5.12       1348    26313
    ##  7 Egypt                 5.05      23806   471460
    ##  8 Afghanistan           4.38       7549   172441
    ##  9 Ecuador               4.29      35160   819886
    ## 10 Niger                 3.50        306     8743
    ## 11 Myanmar               3.40      19338   568564
    ## 12 Bulgaria              3.28      35185  1072493
    ## 13 China                 3.07       5788   188487
    ## 14 Malawi                3.06       2606    85228
    ## 15 Paraguay              2.86      18199   635591
    ## 16 Tunisia               2.78      27486   987256
    ## 17 Indonesia             2.78     146798  5289414
    ## 18 El Salvador           2.74       4044   147786
    ## 19 South Africa          2.70      98804  3659698
    ## 20 Haiti                 2.70        814    30162

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7004.     209468   29.9 
    ##  2 Bulgaria               4922.      35185    7.15
    ##  3 Hungary                4351.      43430    9.98
    ##  4 Czech Republic         3659.      38335   10.5 
    ##  5 Slovakia               3346.      18252    5.46
    ##  6 Brazil                 3204.     644286  201.  
    ##  7 Argentina              3034.     125451   41.3 
    ##  8 United States          2986.     926287  310.  
    ##  9 Colombia               2890.     138106   47.8 
    ## 10 Belgium                2885.      30015   10.4 
    ## 11 Poland                 2861.     110157   38.5 
    ## 12 Paraguay               2854.      18199    6.38
    ## 13 Romania                2852.      62624   22.0 
    ## 14 Mexico                 2807.     315688  112.  
    ## 15 Tunisia                2596.      27486   10.6 
    ## 16 United Kingdom         2576.     160610   62.3 
    ## 17 Italy                  2539.     153190   60.3 
    ## 18 Chile                  2478.      41491   16.7 
    ## 19 Russia                 2466.     347031  141.  
    ## 20 Ecuador                2377.      35160   14.8

EOL
