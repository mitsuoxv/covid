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

Updated: 2021-05-23

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
    ##  1 United States           72103. 32734993            454
    ##  2 India                   60574. 26289290            434
    ##  3 Brazil                  36538. 15894094            435
    ##  4 France                  13022.  5820918            447
    ##  5 Turkey                  12023.  5169951            430
    ##  6 Russia                  11610.  4992554            430
    ##  7 United Kingdom          10018.  4457927            445
    ##  8 Italy                    9214.  4183476            454
    ##  9 Spain                    8142.  3631661            446
    ## 10 Germany                  8130.  3642244            448
    ## 11 Argentina                8035.  3447044            429
    ## 12 Colombia                 7389.  3177212            430
    ## 13 Poland                   6600.  2864546            434
    ## 14 Iran                     6230.  2815882            452
    ## 15 Mexico                   5558.  2390140            430
    ## 16 Ukraine                  5141.  2179988            424
    ## 17 Peru                     4432.  1910360            431
    ## 18 Indonesia                4075.  1764644            433
    ## 19 Czech Republic           3801.  1657558            436
    ## 20 South Africa             3786.  1628335            430

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                363.             158224.            436
    ##  2 Jordan                        267.             113809.            426
    ##  3 Israel                        262.             114127.            435
    ##  4 Sweden                        251.             110753.            441
    ##  5 United States                 232.             105517.            454
    ##  6 Belgium                       226.             100414.            444
    ##  7 Serbia                        225.              96567.            429
    ##  8 Netherlands                   221.              97305.            441
    ##  9 Switzerland                   203.              90261.            445
    ## 10 France                        201.              89873.            447
    ## 11 Argentina                     194.              83376.            429
    ## 12 Hungary                       188.              80312.            428
    ## 13 Chile                         182.              78578.            432
    ## 14 Portugal                      182.              79083.            435
    ## 15 Brazil                        182.              79034.            435
    ## 16 Austria                       176.              77542.            440
    ## 17 Spain                         175.              78090.            446
    ## 18 Poland                        171.              74404.            434
    ## 19 Slovakia                      166.              71259.            429
    ## 20 United Kingdom                161.              71500.            445

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                19.6        1303     6636
    ##  2 Mexico                9.25     221080  2390140
    ##  3 Syria                 7.18       1724    23996
    ##  4 Sudan                 7.01       2446    34889
    ##  5 Egypt                 5.81      14611   251539
    ##  6 Somalia               5.26        767    14594
    ##  7 Ecuador               4.83      20107   416621
    ##  8 China                 4.59       4861   105972
    ##  9 Afghanistan           4.26       2792    65486
    ## 10 Bulgaria              4.20      17474   416417
    ## 11 Tanzania              4.13         21      509
    ## 12 Zimbabwe              4.10       1586    38664
    ## 13 Bolivia               4.02      13780   343065
    ## 14 Hungary               3.68      29475   801672
    ## 15 Tunisia               3.65      12141   332833
    ## 16 Mali                  3.60        512    14236
    ## 17 Niger                 3.58        192     5364
    ## 18 Peru                  3.52      67253  1910360
    ## 19 Chad                  3.52        173     4919
    ## 20 South Africa          3.42      55719  1628335

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Hungary                2953.      29475    9.98
    ##  2 Czech Republic         2865.      30012   10.5 
    ##  3 Bulgaria               2444.      17474    7.15
    ##  4 Belgium                2385.      24809   10.4 
    ##  5 Slovakia               2252.      12286    5.46
    ##  6 Peru                   2249.      67253   29.9 
    ##  7 Brazil                 2208.     444094  201.  
    ##  8 Italy                  2072.     125028   60.3 
    ##  9 United Kingdom         2048.     127710   62.3 
    ## 10 Mexico                 1966.     221080  112.  
    ## 11 Poland                 1893.      72882   38.5 
    ## 12 United States          1879.     582953  310.  
    ## 13 Argentina              1758.      72699   41.3 
    ## 14 Colombia               1742.      83233   47.8 
    ## 15 Spain                  1712.      79601   46.5 
    ## 16 Chile                  1689.      28290   16.7 
    ## 17 France                 1658.     107403   64.8 
    ## 18 Portugal               1594.      17017   10.7 
    ## 19 Sweden                 1503.      14366    9.56
    ## 20 Jordan                 1458.       9342    6.41

EOL
