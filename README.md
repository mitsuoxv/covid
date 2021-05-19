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

Updated: 2021-05-20

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
    ##  1 United States           72388. 32647162            451
    ##  2 India                   59156. 25496330            431
    ##  3 Brazil                  36244. 15657391            432
    ##  4 France                  13068.  5802138            444
    ##  5 Turkey                  12036.  5139485            427
    ##  6 Russia                  11610.  4957756            427
    ##  7 United Kingdom          10069.  4450396            442
    ##  8 Italy                    9239.  4167025            451
    ##  9 Spain                    8171.  3619848            443
    ## 10 Germany                  8121.  3614095            445
    ## 11 Argentina                7831.  3335965            426
    ## 12 Colombia                 7333.  3131410            427
    ## 13 Poland                   6634.  2859261            431
    ## 14 Iran                     6190.  2779415            449
    ## 15 Mexico                   5580.  2382745            427
    ## 16 Ukraine                  5143.  2165233            421
    ## 17 Peru                     4423.  1893334            428
    ## 18 Indonesia                4065.  1748230            430
    ## 19 Czech Republic           3823.  1655414            433
    ## 20 South Africa             3788.  1617840            427

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                365.             158020.            433
    ##  2 Jordan                        268.             113379.            423
    ##  3 Israel                        264.             114110.            432
    ##  4 Sweden                        250.             109581.            438
    ##  5 United States                 233.             105234.            451
    ##  6 Serbia                        226.              96356.            426
    ##  7 Belgium                       226.              99463.            441
    ##  8 Netherlands                   220.              96505.            438
    ##  9 Switzerland                   203.              89740.            442
    ## 10 France                        202.              89583.            444
    ## 11 Argentina                     189.              80690.            426
    ## 12 Hungary                       188.              80103.            425
    ## 13 Portugal                      183.              78940.            432
    ## 14 Chile                         180.              77381.            429
    ## 15 Brazil                        180.              77857.            432
    ## 16 Austria                       177.              77282.            437
    ## 17 Spain                         176.              77836.            443
    ## 18 Poland                        172.              74267.            431
    ## 19 Slovakia                      167.              71153.            426
    ## 20 United Kingdom                161.              71379.            442

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                19.7        1298     6590
    ##  2 Mexico                9.25     220493  2382745
    ##  3 Syria                 7.18       1710    23830
    ##  4 Sudan                 7.01       2446    34889
    ##  5 Egypt                 5.82      14441   248078
    ##  6 Somalia               5.23        762    14575
    ##  7 Ecuador               4.83      19877   411466
    ##  8 China                 4.63       4860   105044
    ##  9 Afghanistan           4.31       2762    64122
    ## 10 Bulgaria              4.18      17379   415326
    ## 11 Tanzania              4.13         21      509
    ## 12 Zimbabwe              4.10       1583    38595
    ## 13 Bolivia               4.05      13566   334824
    ## 14 Hungary               3.67      29329   799588
    ## 15 Tunisia               3.64      11971   328528
    ## 16 Mali                  3.60        511    14207
    ## 17 Niger                 3.60        192     5339
    ## 18 Chad                  3.53        173     4905
    ## 19 Peru                  3.51      66471  1893334
    ## 20 South Africa          3.42      55340  1617840

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Hungary                2938.      29329    9.98
    ##  2 Czech Republic         2859.      29948   10.5 
    ##  3 Bulgaria               2431.      17379    7.15
    ##  4 Belgium                2379.      24749   10.4 
    ##  5 Slovakia               2248.      12262    5.46
    ##  6 Peru                   2223.      66471   29.9 
    ##  7 Brazil                 2171.     436537  201.  
    ##  8 Italy                  2063.     124497   60.3 
    ##  9 United Kingdom         2048.     127691   62.3 
    ## 10 Mexico                 1960.     220493  112.  
    ## 11 Poland                 1877.      72250   38.5 
    ## 12 United States          1873.     580983  310.  
    ## 13 Argentina              1718.      71027   41.3 
    ## 14 Colombia               1712.      81809   47.8 
    ## 15 Spain                  1710.      79502   46.5 
    ## 16 Chile                  1670.      27965   16.7 
    ## 17 France                 1656.     107234   64.8 
    ## 18 Portugal               1593.      17011   10.7 
    ## 19 Sweden                 1497.      14301    9.56
    ## 20 Jordan                 1451.       9295    6.41

EOL
