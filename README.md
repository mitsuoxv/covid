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

Updated: 2021-05-24

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
    ##  1 United States           72006. 32762914            455
    ##  2 India                   60989. 26530132            435
    ##  3 Brazil                  36630. 15970949            436
    ##  4 France                  12993.  5820918            448
    ##  5 Turkey                  12015.  5178648            431
    ##  6 Russia                  11604.  5001505            431
    ##  7 United Kingdom          10001.  4460450            446
    ##  8 Italy                    9205.  4188190            455
    ##  9 Germany                  8127.  3648958            449
    ## 10 Spain                    8124.  3631661            447
    ## 11 Argentina                8099.  3482512            430
    ## 12 Colombia                 7406.  3192050            431
    ## 13 Poland                   6587.  2865622            435
    ## 14 Iran                     6233.  2823887            453
    ## 15 Mexico                   5551.  2392744            431
    ## 16 Ukraine                  5135.  2182521            425
    ## 17 Peru                     4434.  1915566            432
    ## 18 Indonesia                4078.  1769940            434
    ## 19 Czech Republic           3794.  1657893            437
    ## 20 South Africa             3788.  1632572            431

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                362.             158256.            437
    ##  2 Jordan                        267.             113890.            427
    ##  3 Israel                        262.             114131.            436
    ##  4 Sweden                        251.             110753.            442
    ##  5 United States                 232.             105607.            455
    ##  6 Belgium                       226.             100656.            445
    ##  7 Serbia                        225.              96622.            430
    ##  8 Netherlands                   221.              97495.            442
    ##  9 Switzerland                   202.              90261.            446
    ## 10 France                        201.              89873.            448
    ## 11 Argentina                     196.              84234.            430
    ## 12 Hungary                       187.              80312.            429
    ## 13 Chile                         182.              79026.            433
    ## 14 Brazil                        182.              79417.            436
    ## 15 Portugal                      181.              79132.            436
    ## 16 Austria                       176.              77619.            441
    ## 17 Spain                         175.              78090.            447
    ## 18 Poland                        171.              74432.            435
    ## 19 Slovakia                      166.              71280.            430
    ## 20 United Kingdom                160.              71541.            446

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                19.6        1305     6653
    ##  2 Mexico                9.25     221256  2392744
    ##  3 Syria                 7.19       1729    24052
    ##  4 Sudan                 7.01       2446    34889
    ##  5 Egypt                 5.81      14670   252690
    ##  6 Somalia               5.25        767    14623
    ##  7 Ecuador               4.83      20180   417840
    ##  8 China                 4.56       4863   106715
    ##  9 Afghanistan           4.26       2802    65728
    ## 10 Bulgaria              4.20      17487   416565
    ## 11 Tanzania              4.13         21      509
    ## 12 Zimbabwe              4.10       1586    38679
    ## 13 Bolivia               4.00      13857   346070
    ## 14 Hungary               3.68      29475   801672
    ## 15 Tunisia               3.65      12182   334099
    ## 16 Mali                  3.60        512    14236
    ## 17 Niger                 3.58        192     5364
    ## 18 Peru                  3.53      67569  1915566
    ## 19 Chad                  3.51        173     4923
    ## 20 South Africa          3.42      55772  1632572

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Hungary                2953.      29475    9.98
    ##  2 Czech Republic         2866.      30020   10.5 
    ##  3 Bulgaria               2446.      17487    7.15
    ##  4 Belgium                2386.      24823   10.4 
    ##  5 Peru                   2259.      67569   29.9 
    ##  6 Slovakia               2253.      12292    5.46
    ##  7 Brazil                 2219.     446309  201.  
    ##  8 Italy                  2074.     125153   60.3 
    ##  9 United Kingdom         2048.     127716   62.3 
    ## 10 Mexico                 1967.     221256  112.  
    ## 11 Poland                 1894.      72928   38.5 
    ## 12 United States          1881.     583696  310.  
    ## 13 Argentina              1775.      73391   41.3 
    ## 14 Colombia               1752.      83719   47.8 
    ## 15 Spain                  1712.      79601   46.5 
    ## 16 Chile                  1695.      28386   16.7 
    ## 17 France                 1658.     107403   64.8 
    ## 18 Portugal               1594.      17017   10.7 
    ## 19 Sweden                 1503.      14366    9.56
    ## 20 Jordan                 1460.       9357    6.41

EOL
