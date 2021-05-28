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

Updated: 2021-05-29

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
    ##  1 United States           71454. 32869009            460
    ##  2 India                   62626. 27555457            440
    ##  3 Brazil                  36904. 16274695            441
    ##  4 France                  12220.  5535701            453
    ##  5 Turkey                  11973.  5220549            436
    ##  6 Russia                  11570.  5044459            436
    ##  7 United Kingdom           9919.  4473681            451
    ##  8 Italy                    9143.  4205970            460
    ##  9 Argentina                8326.  3622135            435
    ## 10 Spain                    8104.  3663176            452
    ## 11 Germany                  8083.  3669870            454
    ## 12 Colombia                 7555.  3294101            436
    ## 13 Poland                   6524.  2870595            440
    ## 14 Iran                     6279.  2875858            458
    ## 15 Mexico                   5511.  2402722            436
    ## 16 Ukraine                  5108.  2196673            430
    ## 17 Peru                     4433.  1937245            437
    ## 18 Indonesia                4094.  1797499            439
    ## 19 South Africa             3784.  1649977            436
    ## 20 Czech Republic           3756.  1660481            442

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                359.             158503.            442
    ##  2 Jordan                        265.             114567.            432
    ##  3 Israel                        259.             114144.            441
    ##  4 Sweden                        250.             111813.            447
    ##  5 United States                 230.             105949.            460
    ##  6 Belgium                       225.             101465.            450
    ##  7 Serbia                        223.              96863.            435
    ##  8 Netherlands                   220.              98376.            447
    ##  9 Switzerland                   201.              90887.            451
    ## 10 Argentina                     201.              87611.            435
    ## 11 France                        189.              85469.            453
    ## 12 Hungary                       185.              80502.            434
    ## 13 Chile                         184.              80777.            438
    ## 14 Brazil                        184.              80927.            441
    ## 15 Portugal                      180.              79337.            441
    ## 16 Austria                       175.              77886.            446
    ## 17 Spain                         174.              78768.            452
    ## 18 Poland                        169.              74561.            440
    ## 19 Slovakia                      164.              71391.            435
    ## 20 United Kingdom                159.              71753.            451

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                19.6        1316     6700
    ##  2 Mexico                9.25     222232  2402722
    ##  3 Sudan                 7.37       2600    35289
    ##  4 Syria                 7.20       1754    24365
    ##  5 Egypt                 5.77      14904   258407
    ##  6 Somalia               5.24        767    14632
    ##  7 Ecuador               4.82      20357   422329
    ##  8 China                 4.47       4905   109693
    ##  9 Bulgaria              4.22      17637   417819
    ## 10 Afghanistan           4.17       2881    69130
    ## 11 Tanzania              4.13         21      509
    ## 12 Zimbabwe              4.10       1592    38854
    ## 13 Bolivia               3.97      14226   358562
    ## 14 Hungary               3.68      29597   803567
    ## 15 Tunisia               3.66      12451   340250
    ## 16 Mali                  3.60        514    14259
    ## 17 Niger                 3.55        192     5406
    ## 18 Peru                  3.54      68634  1937245
    ## 19 Chad                  3.51        173     4924
    ## 20 South Africa          3.40      56170  1649977

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Hungary                2965.      29597    9.98
    ##  2 Czech Republic         2872.      30088   10.5 
    ##  3 Bulgaria               2467.      17637    7.15
    ##  4 Belgium                2394.      24902   10.4 
    ##  5 Peru                   2295.      68634   29.9 
    ##  6 Slovakia               2261.      12333    5.46
    ##  7 Brazil                 2260.     454429  201.  
    ##  8 Italy                  2085.     125793   60.3 
    ##  9 United Kingdom         2049.     127758   62.3 
    ## 10 Mexico                 1976.     222232  112.  
    ## 11 Poland                 1911.      73557   38.5 
    ## 12 United States          1892.     586890  310.  
    ## 13 Argentina              1828.      75588   41.3 
    ## 14 Colombia               1803.      86180   47.8 
    ## 15 Chile                  1720.      28809   16.7 
    ## 16 Spain                  1718.      79888   46.5 
    ## 17 France                 1673.     108354   64.8 
    ## 18 Portugal               1594.      17022   10.7 
    ## 19 Sweden                 1512.      14451    9.56
    ## 20 Jordan                 1471.       9423    6.41

EOL
