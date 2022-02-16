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

Updated: 2022-02-17

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
    ##  1 United States          108114. 77301430            715
    ##  2 India                   60687. 42723558            704
    ##  3 Brazil                  39062. 27538503            705
    ##  4 France                  29631. 21245489            717
    ##  5 United Kingdom          25726. 18393955            715
    ##  6 Russia                  20942. 14659880            700
    ##  7 Turkey                  18684. 13078792            700
    ##  8 Germany                 17828. 12800315            718
    ##  9 Italy                   16858. 12205474            724
    ## 10 Spain                   14954. 10707287            716
    ## 11 Argentina               12541.  8766174            699
    ## 12 Iran                     9502.  6860255            722
    ## 13 Colombia                 8604.  6023257            700
    ## 14 Netherlands              8218.  5842989            711
    ## 15 Poland                   7764.  5466094            704
    ## 16 Mexico                   7508.  5300537            706
    ## 17 Indonesia                7054.  4966046            704
    ## 18 Ukraine                  6634.  4603930            694
    ## 19 Japan                    5586.  4055675            726
    ## 20 South Africa             5207.  3645269            700

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        669.             473010.            707
    ##  2 Denmark                       617.             437610.            709
    ##  3 Netherlands                   494.             351036.            711
    ##  4 Switzerland                   479.             342463.            715
    ##  5 Czech Republic                467.             329450.            706
    ##  6 Belgium                       466.             332625.            714
    ##  7 France                        457.             328023.            717
    ##  8 Portugal                      413.             291482.            705
    ##  9 United Kingdom                413.             295019.            715
    ## 10 Austria                       402.             284862.            709
    ## 11 Serbia                        361.             252582.            699
    ## 12 Sweden                        355.             252104.            711
    ## 13 United States                 348.             249172.            715
    ## 14 Jordan                        338.             235513.            696
    ## 15 Slovakia                      337.             236210.            700
    ## 16 Spain                         322.             230235.            716
    ## 17 Argentina                     303.             212034.            699
    ## 18 Norway                        295.             210494.            713
    ## 19 Greece                        285.             201492.            706
    ## 20 Italy                         279.             202277.            724

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.0        2110    11699
    ##  2 Sudan                 6.37       3821    59939
    ##  3 Peru                  6.04     208466  3449712
    ##  4 Mexico                5.90     312965  5300537
    ##  5 Syria                 5.73       3035    53011
    ##  6 Somalia               5.11       1340    26203
    ##  7 Egypt                 5.11      23465   459198
    ##  8 Ecuador               4.38      35036   799140
    ##  9 Afghanistan           4.38       7504   171422
    ## 10 China                 3.72       5712   153611
    ## 11 Myanmar               3.51      19314   550824
    ## 12 Niger                 3.47        303     8724
    ## 13 Bulgaria              3.30      34686  1049543
    ## 14 Malawi                3.06       2599    85065
    ## 15 Indonesia             2.93     145622  4966046
    ## 16 Paraguay              2.87      17964   626355
    ## 17 Tunisia               2.80      27233   971460
    ## 18 El Salvador           2.71       4011   147786
    ## 19 Haiti                 2.69        809    30055
    ## 20 South Africa          2.67      97431  3645269

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6970.     208466   29.9 
    ##  2 Bulgaria               4852.      34686    7.15
    ##  3 Hungary                4293.      42851    9.98
    ##  4 Czech Republic         3626.      37991   10.5 
    ##  5 Slovakia               3326.      18145    5.46
    ##  6 Brazil                 3177.     638835  201.  
    ##  7 Argentina              3013.     124585   41.3 
    ##  8 United States          2951.     915622  310.  
    ##  9 Colombia               2873.     137301   47.8 
    ## 10 Belgium                2862.      29778   10.4 
    ## 11 Poland                 2828.     108887   38.5 
    ## 12 Romania                2818.      61880   22.0 
    ## 13 Paraguay               2818.      17964    6.38
    ## 14 Mexico                 2783.     312965  112.  
    ## 15 Tunisia                2572.      27233   10.6 
    ## 16 United Kingdom         2564.     159839   62.3 
    ## 17 Italy                  2514.     151684   60.3 
    ## 18 Russia                 2433.     342383  141.  
    ## 19 Chile                  2430.      40698   16.7 
    ## 20 Ecuador                2369.      35036   14.8

EOL
