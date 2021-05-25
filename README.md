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

Updated: 2021-05-26

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
    ##  1 United States           71768. 32797873            457
    ##  2 India                   61668. 26948874            437
    ##  3 Brazil                  36719. 16083258            438
    ##  4 France                  12239.  5507810            450
    ##  5 Turkey                  11995.  5194010            433
    ##  6 Russia                  11588.  5017795            433
    ##  7 United Kingdom           9966.  4464904            448
    ##  8 Italy                    9178.  4194672            457
    ##  9 Argentina                8193.  3539484            432
    ## 10 Spain                    8123.  3647520            449
    ## 11 Germany                  8101.  3653551            451
    ## 12 Colombia                 7465.  3232456            433
    ## 13 Poland                   6561.  2867187            437
    ## 14 Iran                     6249.  2843523            455
    ## 15 Mexico                   5535.  2396604            433
    ## 16 Ukraine                  5120.  2186463            427
    ## 17 Peru                     4436.  1925289            434
    ## 18 Indonesia                4085.  1781127            436
    ## 19 South Africa             3782.  1637848            433
    ## 20 Czech Republic           3778.  1658778            439

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                361.             158341.            439
    ##  2 Jordan                        266.             114160.            429
    ##  3 Israel                        261.             114139.            438
    ##  4 Sweden                        249.             110753.            444
    ##  5 United States                 231.             105720.            457
    ##  6 Belgium                       226.             100915.            447
    ##  7 Serbia                        224.              96709.            432
    ##  8 Netherlands                   220.              97863.            444
    ##  9 Switzerland                   201.              90261.            448
    ## 10 Argentina                     198.              85612.            432
    ## 11 France                        189.              85039.            450
    ## 12 Hungary                       187.              80396.            431
    ## 13 Chile                         183.              79734.            435
    ## 14 Brazil                        183.              79975.            438
    ## 15 Portugal                      181.              79193.            438
    ## 16 Austria                       175.              77724.            443
    ## 17 Spain                         175.              78431.            449
    ## 18 Poland                        170.              74472.            437
    ## 19 Slovakia                      165.              71308.            432
    ## 20 United Kingdom                160.              71612.            448

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                19.7        1311     6666
    ##  2 Mexico                9.25     221647  2396604
    ##  3 Syria                 7.19       1740    24187
    ##  4 Sudan                 7.01       2446    34889
    ##  5 Egypt                 5.79      14766   254984
    ##  6 Somalia               5.24        767    14632
    ##  7 Ecuador               4.82      20210   419198
    ##  8 China                 4.52       4875   107807
    ##  9 Afghanistan           4.24       2836    66903
    ## 10 Bulgaria              4.20      17513   416727
    ## 11 Tanzania              4.13         21      509
    ## 12 Zimbabwe              4.10       1586    38696
    ## 13 Bolivia               3.99      13965   349653
    ## 14 Hungary               3.68      29496   802510
    ## 15 Tunisia               3.65      12273   336414
    ## 16 Mali                  3.61        514    14244
    ## 17 Niger                 3.57        192     5385
    ## 18 Peru                  3.53      68053  1925289
    ## 19 Chad                  3.51        173     4924
    ## 20 South Africa          3.41      55874  1637848

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Hungary                2955.      29496    9.98
    ##  2 Czech Republic         2868.      30041   10.5 
    ##  3 Bulgaria               2450.      17513    7.15
    ##  4 Belgium                2389.      24853   10.4 
    ##  5 Peru                   2275.      68053   29.9 
    ##  6 Slovakia               2255.      12301    5.46
    ##  7 Brazil                 2233.     449068  201.  
    ##  8 Italy                  2077.     125335   60.3 
    ##  9 United Kingdom         2049.     127724   62.3 
    ## 10 Mexico                 1971.     221647  112.  
    ## 11 Poland                 1899.      73096   38.5 
    ## 12 United States          1885.     584700  310.  
    ## 13 Argentina              1791.      74063   41.3 
    ## 14 Colombia               1773.      84724   47.8 
    ## 15 Spain                  1714.      79711   46.5 
    ## 16 Chile                  1705.      28548   16.7 
    ## 17 France                 1665.     107863   64.8 
    ## 18 Portugal               1594.      17018   10.7 
    ## 19 Sweden                 1503.      14366    9.56
    ## 20 Jordan                 1465.       9384    6.41

EOL
