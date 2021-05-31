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

Updated: 2021-06-01

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
    ##  1 United States           71121. 32929178            463
    ##  2 India                   63312. 28047534            443
    ##  3 Brazil                  37098. 16471600            444
    ##  4 France                  12206.  5566214            456
    ##  5 Turkey                  11942.  5242911            439
    ##  6 Russia                  11553.  5071917            439
    ##  7 United Kingdom           9877.  4484060            454
    ##  8 Italy                    9106.  4216003            463
    ##  9 Argentina                8521.  3732263            438
    ## 10 Germany                  8055.  3681126            457
    ## 11 Spain                    8051.  3663176            455
    ## 12 Colombia                 7660.  3363061            439
    ## 13 Poland                   6483.  2872283            443
    ## 14 Iran                     6295.  2902094            461
    ## 15 Mexico                   5493.  2411503            439
    ## 16 Ukraine                  5086.  2202494            433
    ## 17 Peru                     4435.  1951651            440
    ## 18 Indonesia                4108.  1816041            442
    ## 19 South Africa             3787.  1662825            439
    ## 20 Czech Republic           3733.  1661272            445

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                356.             158579.            445
    ##  2 Jordan                        264.             114843.            435
    ##  3 Israel                        257.             114150.            444
    ##  4 Sweden                        248.             111813.            450
    ##  5 United States                 229.             106143.            463
    ##  6 Belgium                       225.             102009.            453
    ##  7 Serbia                        221.              96969.            438
    ##  8 Netherlands                   220.              98974.            450
    ##  9 Argentina                     206.              90275.            438
    ## 10 Switzerland                   200.              91007.            454
    ## 11 France                        188.              85940.            456
    ## 12 Chile                         187.              82256.            441
    ## 13 Brazil                        184.              81906.            444
    ## 14 Hungary                       184.              80599.            437
    ## 15 Portugal                      179.              79492.            444
    ## 16 Austria                       174.              78066.            449
    ## 17 Spain                         173.              78768.            455
    ## 18 Poland                        168.              74605.            443
    ## 19 Slovakia                      163.              71443.            438
    ## 20 Colombia                      160.              70372.            439

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                19.6        1320     6737
    ##  2 Mexico                9.27     223455  2411503
    ##  3 Sudan                 7.41       2630    35495
    ##  4 Syria                 7.22       1766    24467
    ##  5 Egypt                 5.75      15047   261666
    ##  6 Somalia               5.25        769    14660
    ##  7 Ecuador               4.82      20545   425841
    ##  8 China                 4.46       4955   111147
    ##  9 Bulgaria              4.22      17662   418274
    ## 10 Tanzania              4.13         21      509
    ## 11 Afghanistan           4.10       2944    71838
    ## 12 Zimbabwe              4.09       1594    38944
    ## 13 Bolivia               3.94      14435   366714
    ## 14 Hungary               3.69      29649   804538
    ## 15 Tunisia               3.66      12623   344688
    ## 16 Mali                  3.62        517    14265
    ## 17 Niger                 3.55        192     5410
    ## 18 Peru                  3.55      69202  1951651
    ## 19 Chad                  3.51        173     4929
    ## 20 South Africa          3.39      56439  1662825

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Hungary                2970.      29649    9.98
    ##  2 Czech Republic         2874.      30108   10.5 
    ##  3 Bulgaria               2471.      17662    7.15
    ##  4 Belgium                2397.      24940   10.4 
    ##  5 Peru                   2314.      69202   29.9 
    ##  6 Brazil                 2293.     461057  201.  
    ##  7 Slovakia               2263.      12343    5.46
    ##  8 Italy                  2089.     126046   60.3 
    ##  9 United Kingdom         2049.     127781   62.3 
    ## 10 Mexico                 1987.     223455  112.  
    ## 11 Poland                 1915.      73745   38.5 
    ## 12 United States          1897.     588596  310.  
    ## 13 Argentina              1865.      77108   41.3 
    ## 14 Colombia               1836.      87747   47.8 
    ## 15 Chile                  1742.      29168   16.7 
    ## 16 Spain                  1718.      79888   46.5 
    ## 17 France                 1676.     108558   64.8 
    ## 18 Portugal               1595.      17023   10.7 
    ## 19 Sweden                 1512.      14451    9.56
    ## 20 Jordan                 1475.       9452    6.41

EOL
