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

Updated: 2022-02-25

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
    ##  1 United States          107848. 77974225            723
    ##  2 India                   60226. 42881179            712
    ##  3 Brazil                  39763. 28351327            713
    ##  4 France                  30087. 21813080            725
    ##  5 United Kingdom          25912. 18734687            723
    ##  6 Russia                  22498. 15928568            708
    ##  7 Germany                 19543. 14188269            726
    ##  8 Turkey                  19437. 13761290            708
    ##  9 Italy                   17218. 12603758            732
    ## 10 Spain                   15075. 10914105            724
    ## 11 Argentina               12543.  8868188            707
    ## 12 Iran                     9587.  6998975            730
    ## 13 Netherlands              8614.  6193776            719
    ## 14 Colombia                 8548.  6052126            708
    ## 15 Poland                   7894.  5620946            712
    ## 16 Mexico                   7614.  5436566            714
    ## 17 Indonesia                7596.  5408328            712
    ## 18 Ukraine                  6851.  4809624            702
    ## 19 Japan                    6382.  4684839            734
    ## 20 South Africa             5177.  3665149            708

Above calculation might be unfair to populous areas. Below
“per_capita_cum_conf” is cumulative cases per 1 million population.
Highest “speed_std_since_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 × 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Israel                        684.             488740.            715
    ##  2 Denmark                       678.             486224.            717
    ##  3 Netherlands                   518.             372110.            719
    ##  4 Switzerland                   496.             358592.            723
    ##  5 Czech Republic                475.             338820.            714
    ##  6 Belgium                       470.             339233.            722
    ##  7 France                        465.             336786.            725
    ##  8 Austria                       436.             312885.            717
    ##  9 Portugal                      423.             301559.            713
    ## 10 United Kingdom                416.             300484.            723
    ## 11 Serbia                        365.             258218.            707
    ## 12 Slovakia                      365.             258243.            708
    ## 13 Jordan                        355.             249633.            704
    ## 14 Sweden                        354.             254794.            719
    ## 15 United States                 348.             251341.            723
    ## 16 Spain                         324.             234682.            724
    ## 17 Norway                        324.             233384.            721
    ## 18 Argentina                     303.             214502.            707
    ## 19 Greece                        300.             213962.            714
    ## 20 Italy                         285.             208878.            732

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 × 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                18.1        2130    11751
    ##  2 Sudan                 6.36       3901    61376
    ##  3 Peru                  5.99     209808  3500880
    ##  4 Mexico                5.82     316492  5436566
    ##  5 Syria                 5.66       3059    54040
    ##  6 Somalia               5.12       1348    26313
    ##  7 Egypt                 5.03      23889   475341
    ##  8 Afghanistan           4.38       7575   172924
    ##  9 Ecuador               4.29      35172   820541
    ## 10 Niger                 3.50        306     8746
    ## 11 Myanmar               3.36      19349   575508
    ## 12 Bulgaria              3.27      35298  1080571
    ## 13 Malawi                3.06       2610    85257
    ## 14 China                 2.88       5873   203863
    ## 15 Paraguay              2.87      18259   637225
    ## 16 Tunisia               2.78      27640   992574
    ## 17 El Salvador           2.74       4054   147786
    ## 18 Indonesia             2.72     147342  5408328
    ## 19 Haiti                 2.71        820    30299
    ## 20 South Africa          2.70      98978  3665149

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths_per_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 × 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   7015.     209808   29.9 
    ##  2 Bulgaria               4938.      35298    7.15
    ##  3 Hungary                4374.      43664    9.98
    ##  4 Czech Republic         3669.      38433   10.5 
    ##  5 Slovakia               3362.      18338    5.46
    ##  6 Brazil                 3209.     645420  201.  
    ##  7 Argentina              3042.     125775   41.3 
    ##  8 United States          3003.     931612  310.  
    ##  9 Colombia               2894.     138285   47.8 
    ## 10 Belgium                2891.      30076   10.4 
    ## 11 Poland                 2879.     110858   38.5 
    ## 12 Romania                2867.      62958   22.0 
    ## 13 Paraguay               2864.      18259    6.38
    ## 14 Mexico                 2814.     316492  112.  
    ## 15 Tunisia                2610.      27640   10.6 
    ## 16 United Kingdom         2582.     160979   62.3 
    ## 17 Italy                  2548.     153764   60.3 
    ## 18 Chile                  2482.      41571   16.7 
    ## 19 Russia                 2477.     348578  141.  
    ## 20 Ecuador                2378.      35172   14.8

EOL
