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

Updated: 2021-05-19

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
    ##  1 United States           72496. 32623220            450
    ##  2 India                   58672. 25228996            430
    ##  3 Brazil                  36258. 15627475            431
    ##  4 France                  13060.  5785850            443
    ##  5 Turkey                  12036.  5127548            426
    ##  6 Russia                  11638.  4957756            426
    ##  7 United Kingdom          10097.  4452760            441
    ##  8 Italy                    9250.  4162576            450
    ##  9 Spain                    8180.  3615860            442
    ## 10 Germany                  8115.  3603055            444
    ## 11 Argentina                7782.  3307285            425
    ## 12 Colombia                 7320.  3118426            426
    ## 13 Poland                   6644.  2856924            430
    ## 14 Iran                     6173.  2765485            448
    ## 15 Mexico                   5591.  2381923            426
    ## 16 Ukraine                  5143.  2160095            420
    ## 17 Peru                     4424.  1889052            427
    ## 18 Indonesia                4065.  1744045            429
    ## 19 Czech Republic           3829.  1654219            432
    ## 20 South Africa             3792.  1615485            426

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                365.             157906.            432
    ##  2 Jordan                        268.             113196.            422
    ##  3 Israel                        265.             114110.            431
    ##  4 Sweden                        248.             108533.            437
    ##  5 United States                 234.             105157.            450
    ##  6 Serbia                        226.              96262.            425
    ##  7 Belgium                       226.              99288.            440
    ##  8 Netherlands                   220.              96185.            437
    ##  9 Switzerland                   203.              89576.            441
    ## 10 France                        202.              89331.            443
    ## 11 Hungary                       189.              80040.            424
    ## 12 Argentina                     188.              79996.            425
    ## 13 Portugal                      183.              78904.            431
    ## 14 Brazil                        180.              77709.            431
    ## 15 Chile                         180.              77156.            428
    ## 16 Austria                       177.              77205.            436
    ## 17 Spain                         176.              77750.            442
    ## 18 Poland                        173.              74206.            430
    ## 19 Slovakia                      167.              71108.            425
    ## 20 United Kingdom                162.              71417.            441

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                19.7        1295     6572
    ##  2 Mexico                9.25     220437  2381923
    ##  3 Syria                 7.17       1705    23788
    ##  4 Sudan                 7.01       2446    34889
    ##  5 Egypt                 5.83      14388   246909
    ##  6 Somalia               5.20        753    14486
    ##  7 Ecuador               4.82      19786   410870
    ##  8 China                 4.64       4858   104786
    ##  9 Afghanistan           4.31       2751    63819
    ## 10 Bulgaria              4.18      17343   414869
    ## 11 Tanzania              4.13         21      509
    ## 12 Zimbabwe              4.10       1582    38572
    ## 13 Bolivia               4.06      13517   332567
    ## 14 Hungary               3.66      29277   798955
    ## 15 Tunisia               3.63      11899   327473
    ## 16 Mali                  3.60        511    14194
    ## 17 Niger                 3.60        192     5339
    ## 18 Chad                  3.53        173     4904
    ## 19 Peru                  3.51      66220  1889052
    ## 20 South Africa          3.42      55260  1615485

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Hungary                2933.      29277    9.98
    ##  2 Czech Republic         2857.      29933   10.5 
    ##  3 Bulgaria               2426.      17343    7.15
    ##  4 Belgium                2377.      24723   10.4 
    ##  5 Slovakia               2245.      12248    5.46
    ##  6 Peru                   2214.      66220   29.9 
    ##  7 Brazil                 2167.     435751  201.  
    ##  8 Italy                  2060.     124296   60.3 
    ##  9 United Kingdom         2048.     127684   62.3 
    ## 10 Mexico                 1960.     220437  112.  
    ## 11 United States          1871.     580468  310.  
    ## 12 Poland                 1868.      71920   38.5 
    ## 13 Spain                  1708.      79432   46.5 
    ## 14 Argentina              1706.      70522   41.3 
    ## 15 Colombia               1701.      81300   47.8 
    ## 16 Chile                  1668.      27934   16.7 
    ## 17 France                 1653.     107042   64.8 
    ## 18 Portugal               1593.      17009   10.7 
    ## 19 Sweden                 1494.      14275    9.56
    ## 20 Jordan                 1448.       9276    6.41

EOL
