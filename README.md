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

Updated: 2021-05-21

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
    ##  1 United States           72294. 32676954            452
    ##  2 India                   59658. 25772440            432
    ##  3 Brazil                  36334. 15732836            433
    ##  4 France                  13080.  5820918            445
    ##  5 Turkey                  12035.  5151038            428
    ##  6 Russia                  11623.  4974908            428
    ##  7 United Kingdom          10051.  4452531            443
    ##  8 Italy                    9231.  4172525            452
    ##  9 Spain                    8153.  3619848            444
    ## 10 Germany                  8131.  3626393            446
    ## 11 Argentina                7896.  3371508            427
    ## 12 Colombia                 7347.  3144547            428
    ## 13 Poland                   6623.  2861351            432
    ## 14 Iran                     6205.  2792204            450
    ## 15 Mexico                   5573.  2385512            428
    ## 16 Ukraine                  5143.  2170398            422
    ## 17 Peru                     4424.  1897900            429
    ## 18 Indonesia                4067.  1753101            431
    ## 19 Czech Republic           3816.  1656202            434
    ## 20 South Africa             3788.  1621362            428

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                364.             158095.            434
    ##  2 Jordan                        268.             113564.            424
    ##  3 Israel                        263.             114110.            433
    ##  4 Sweden                        251.             110064.            439
    ##  5 United States                 233.             105330.            452
    ##  6 Belgium                       226.              99828.            442
    ##  7 Serbia                        226.              96439.            427
    ##  8 Netherlands                   220.              96778.            439
    ##  9 Switzerland                   203.              89945.            443
    ## 10 France                        202.              89873.            445
    ## 11 Argentina                     191.              81549.            427
    ## 12 Hungary                       188.              80181.            426
    ## 13 Portugal                      182.              78988.            433
    ## 14 Brazil                        181.              78233.            433
    ## 15 Chile                         181.              77666.            430
    ## 16 Austria                       177.              77387.            438
    ## 17 Spain                         175.              77836.            444
    ## 18 Poland                        172.              74321.            432
    ## 19 Slovakia                      167.              71199.            427
    ## 20 United Kingdom                161.              71414.            443

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                19.7        1299     6597
    ##  2 Mexico                9.25     220746  2385512
    ##  3 Syria                 7.18       1714    23884
    ##  4 Sudan                 7.01       2446    34889
    ##  5 Egypt                 5.82      14498   249238
    ##  6 Somalia               5.23        762    14575
    ##  7 Ecuador               4.84      19979   412907
    ##  8 China                 4.61       4860   105330
    ##  9 Afghanistan           4.29       2772    64575
    ## 10 Bulgaria              4.19      17416   415687
    ## 11 Tanzania              4.13         21      509
    ## 12 Zimbabwe              4.10       1583    38612
    ## 13 Bolivia               4.04      13635   337441
    ## 14 Hungary               3.67      29380   800368
    ## 15 Tunisia               3.65      12032   329925
    ## 16 Mali                  3.60        512    14221
    ## 17 Niger                 3.58        192     5356
    ## 18 Chad                  3.52        173     4914
    ## 19 Peru                  3.52      66770  1897900
    ## 20 South Africa          3.42      55507  1621362

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Hungary                2943.      29380    9.98
    ##  2 Czech Republic         2861.      29967   10.5 
    ##  3 Bulgaria               2436.      17416    7.15
    ##  4 Belgium                2381.      24768   10.4 
    ##  5 Slovakia               2250.      12272    5.46
    ##  6 Peru                   2233.      66770   29.9 
    ##  7 Brazil                 2183.     439050  201.  
    ##  8 Italy                  2066.     124646   60.3 
    ##  9 United Kingdom         2048.     127694   62.3 
    ## 10 Mexico                 1963.     220746  112.  
    ## 11 Poland                 1883.      72500   38.5 
    ## 12 United States          1875.     581717  310.  
    ## 13 Argentina              1736.      71771   41.3 
    ## 14 Colombia               1722.      82291   47.8 
    ## 15 Spain                  1710.      79502   46.5 
    ## 16 Chile                  1672.      27997   16.7 
    ## 17 France                 1658.     107403   64.8 
    ## 18 Portugal               1594.      17013   10.7 
    ## 19 Sweden                 1502.      14349    9.56
    ## 20 Jordan                 1454.       9314    6.41

EOL
