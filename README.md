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

Updated: 2021-06-05

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

    ## # A tibble: 20 x 4
    ##    area           speed_since_100 cum_conf days_since_100
    ##    <chr>                    <dbl>    <dbl>          <int>
    ##  1 United States           70619. 32979307            467
    ##  2 India                   63924. 28574350            447
    ##  3 Brazil                  37321. 16720081            448
    ##  4 France                  12157.  5592210            460
    ##  5 Turkey                  11896.  5270299            443
    ##  6 Russia                  11530.  5108129            443
    ##  7 United Kingdom           9825.  4499882            458
    ##  8 Italy                    9047.  4225163            467
    ##  9 Argentina                8715.  3852156            442
    ## 10 Spain                    8046.  3693012            459
    ## 11 Germany                  8016.  3695633            461
    ## 12 Colombia                 7809.  3459422            443
    ## 13 Poland                   6430.  2874411            447
    ## 14 Iran                     6333.  2945100            465
    ## 15 Mexico                   5471.  2423928            443
    ## 16 Ukraine                  5061.  2211683            437
    ## 17 Peru                     4426.  1965432            444
    ## 18 Indonesia                4119.  1837126            446
    ## 19 South Africa             3793.  1680373            443
    ## 20 Czech Republic           3704.  1663040            449

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                354.             158748.            449
    ##  2 Jordan                        263.             115266.            439
    ##  3 Israel                        255.             114161.            448
    ##  4 Sweden                        248.             112705.            454
    ##  5 United States                 228.             106305.            467
    ##  6 Belgium                       224.             102562.            457
    ##  7 Serbia                        220.              97103.            442
    ##  8 Netherlands                   219.              99550.            454
    ##  9 Argentina                     211.              93175.            442
    ## 10 Switzerland                   200.              91504.            458
    ## 11 Chile                         188.              83785.            445
    ## 12 France                        188.              86342.            460
    ## 13 Brazil                        186.              83142.            448
    ## 14 Hungary                       183.              80702.            441
    ## 15 Portugal                      178.              79714.            448
    ## 16 Spain                         173.              79409.            459
    ## 17 Austria                       173.              78225.            453
    ## 18 Poland                        167.              74660.            447
    ## 19 Colombia                      163.              72388.            443
    ## 20 Slovakia                      162.              71535.            442

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                19.6        1325     6767
    ##  2 Mexico                9.41     228146  2423928
    ##  3 Peru                  9.41     184942  1965432
    ##  4 Sudan                 7.47       2662    35656
    ##  5 Syria                 7.25       1782    24591
    ##  6 Egypt                 5.73      15222   265489
    ##  7 Somalia               5.25        771    14699
    ##  8 Ecuador               4.82      20681   428865
    ##  9 China                 4.43       5012   113068
    ## 10 Bulgaria              4.24      17792   419180
    ## 11 Tanzania              4.13         21      509
    ## 12 Zimbabwe              4.10       1604    39092
    ## 13 Afghanistan           4.00       3068    76628
    ## 14 Bolivia               3.90      14732   378028
    ## 15 Hungary               3.69      29734   805571
    ## 16 Tunisia               3.66      12839   350487
    ## 17 Mali                  3.62        517    14281
    ## 18 Niger                 3.55        192     5416
    ## 19 Chad                  3.51        173     4935
    ## 20 South Africa          3.38      56765  1680373

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   6184.     184942   29.9 
    ##  2 Hungary                2979.      29734    9.98
    ##  3 Czech Republic         2877.      30142   10.5 
    ##  4 Bulgaria               2489.      17792    7.15
    ##  5 Belgium                2403.      24995   10.4 
    ##  6 Brazil                 2326.     467706  201.  
    ##  7 Slovakia               2270.      12382    5.46
    ##  8 Italy                  2094.     126342   60.3 
    ##  9 United Kingdom         2050.     127812   62.3 
    ## 10 Mexico                 2029.     228146  112.  
    ## 11 Poland                 1925.      74101   38.5 
    ## 12 Argentina              1919.      79320   41.3 
    ## 13 United States          1902.     590095  310.  
    ## 14 Colombia               1879.      89808   47.8 
    ## 15 Chile                  1767.      29598   16.7 
    ## 16 Spain                  1722.      80099   46.5 
    ## 17 France                 1683.     108994   64.8 
    ## 18 Portugal               1595.      17029   10.7 
    ## 19 Sweden                 1519.      14512    9.56
    ## 20 Jordan                 1483.       9500    6.41

EOL
