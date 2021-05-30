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

Updated: 2021-05-31

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
    ##  1 United States           71248. 32916501            462
    ##  2 India                   63110. 27894800            442
    ##  3 Brazil                  37002. 16391930            443
    ##  4 France                  12214.  5557673            455
    ##  5 Turkey                  11954.  5235978            438
    ##  6 Russia                  11560.  5063442            438
    ##  7 United Kingdom           9891.  4480949            453
    ##  8 Italy                    9119.  4213055            462
    ##  9 Argentina                8472.  3702422            437
    ## 10 Spain                    8068.  3663176            454
    ## 11 Germany                  8068.  3679148            456
    ## 12 Colombia                 7631.  3342567            438
    ## 13 Poland                   6497.  2871950            442
    ## 14 Iran                     6289.  2893218            460
    ## 15 Mexico                   5499.  2408778            438
    ## 16 Ukraine                  5096.  2201472            432
    ## 17 Peru                     4436.  1947555            439
    ## 18 Indonesia                4104.  1809926            441
    ## 19 South Africa             3787.  1659070            438
    ## 20 Czech Republic           3741.  1661159            444

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                357.             158568.            444
    ##  2 Jordan                        264.             114738.            434
    ##  3 Israel                        258.             114150.            443
    ##  4 Sweden                        249.             111813.            449
    ##  5 United States                 230.             106103.            462
    ##  6 Belgium                       225.             101871.            452
    ##  7 Serbia                        222.              96945.            437
    ##  8 Netherlands                   220.              98810.            449
    ##  9 Argentina                     205.              89553.            437
    ## 10 Switzerland                   201.              91007.            453
    ## 11 France                        189.              85808.            455
    ## 12 Chile                         186.              81794.            440
    ## 13 Hungary                       185.              80548.            436
    ## 14 Brazil                        184.              81510.            443
    ## 15 Portugal                      179.              79450.            443
    ## 16 Austria                       174.              78021.            448
    ## 17 Spain                         173.              78768.            454
    ## 18 Poland                        169.              74596.            442
    ## 19 Slovakia                      163.              71437.            437
    ## 20 Colombia                      160.              69943.            438

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                19.6        1320     6735
    ##  2 Mexico                9.26     223072  2408778
    ##  3 Sudan                 7.37       2600    35289
    ##  4 Syria                 7.21       1763    24440
    ##  5 Egypt                 5.76      15001   260659
    ##  6 Somalia               5.24        768    14653
    ##  7 Ecuador               4.82      20485   424741
    ##  8 China                 4.46       4945   110766
    ##  9 Bulgaria              4.22      17657   418221
    ## 10 Tanzania              4.13         21      509
    ## 11 Afghanistan           4.13       2919    70761
    ## 12 Zimbabwe              4.09       1594    38933
    ## 13 Bolivia               3.94      14377   364570
    ## 14 Hungary               3.68      29624   804032
    ## 15 Tunisia               3.66      12574   343374
    ## 16 Mali                  3.62        517    14265
    ## 17 Niger                 3.55        192     5410
    ## 18 Peru                  3.54      68978  1947555
    ## 19 Chad                  3.51        173     4928
    ## 20 South Africa          3.40      56363  1659070

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Hungary                2968.      29624    9.98
    ##  2 Czech Republic         2874.      30104   10.5 
    ##  3 Bulgaria               2470.      17657    7.15
    ##  4 Belgium                2396.      24921   10.4 
    ##  5 Peru                   2306.      68978   29.9 
    ##  6 Brazil                 2283.     459045  201.  
    ##  7 Slovakia               2262.      12339    5.46
    ##  8 Italy                  2088.     126002   60.3 
    ##  9 United Kingdom         2049.     127775   62.3 
    ## 10 Mexico                 1983.     223072  112.  
    ## 11 Poland                 1915.      73738   38.5 
    ## 12 United States          1896.     588292  310.  
    ## 13 Argentina              1855.      76693   41.3 
    ## 14 Colombia               1825.      87207   47.8 
    ## 15 Chile                  1735.      29047   16.7 
    ## 16 Spain                  1718.      79888   46.5 
    ## 17 France                 1676.     108543   64.8 
    ## 18 Portugal               1595.      17023   10.7 
    ## 19 Sweden                 1512.      14451    9.56
    ## 20 Jordan                 1474.       9443    6.41

EOL
