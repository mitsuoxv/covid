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

Updated: 2021-05-08

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
    ##  1 United States           74909. 32210817            430
    ##  2 India                   51292. 21491598            419
    ##  3 Brazil                  35548. 14930183            420
    ##  4 France                  13050.  5637744            432
    ##  5 Turkey                  11995.  4977982            415
    ##  6 Russia                  11719.  4863514            415
    ##  7 United Kingdom          10299.  4428557            430
    ##  8 Italy                    9299.  4082198            439
    ##  9 Spain                    8258.  3559222            431
    ## 10 Germany                  8064.  3491988            433
    ## 11 Argentina                7419.  3071496            414
    ## 12 Colombia                 7071.  2934611            415
    ## 13 Poland                   6741.  2824425            419
    ## 14 Iran                     5972.  2610018            437
    ## 15 Mexico                   5677.  2355985            415
    ## 16 Ukraine                  5147.  2105428            409
    ## 17 Peru                     4385.  1824457            416
    ## 18 Indonesia                4060.  1697305            418
    ## 19 Czech Republic           3902.  1642696            421
    ## 20 South Africa             3832.  1590370            415

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                372.             156806.            421
    ##  2 Jordan                        273.             112053.            411
    ##  3 Israel                        272.             114059.            420
    ##  4 Sweden                        246.             104869.            426
    ##  5 United States                 241.             103828.            430
    ##  6 Serbia                        229.              94929.            414
    ##  7 Belgium                       226.              96824.            429
    ##  8 Netherlands                   217.              92436.            426
    ##  9 Switzerland                   204.              87853.            430
    ## 10 France                        201.              87045.            432
    ## 11 Hungary                       191.              79061.            413
    ## 12 Portugal                      187.              78538.            420
    ## 13 Argentina                     179.              74293.            414
    ## 14 Austria                       179.              75982.            425
    ## 15 Spain                         178.              76533.            431
    ## 16 Brazil                        177.              74241.            420
    ## 17 Chile                         176.              73403.            417
    ## 18 Poland                        175.              73362.            419
    ## 19 Slovakia                      170.              70581.            414
    ## 20 United Kingdom                165.              71029.            430

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                19.7        1266     6430
    ##  2 Mexico                9.25     218007  2355985
    ##  3 Syria                 7.03       1631    23191
    ##  4 Sudan                 6.86       2365    34461
    ##  5 Egypt                 5.86      13714   234015
    ##  6 Somalia               5.19        745    14368
    ##  7 Ecuador               4.81      19018   395327
    ##  8 China                 4.68       4858   103759
    ##  9 Afghanistan           4.35       2673    61455
    ## 10 Bolivia               4.20      13123   312407
    ## 11 Tanzania              4.13         21      509
    ## 12 Bulgaria              4.11      16800   408372
    ## 13 Zimbabwe              4.10       1575    38398
    ## 14 Niger                 3.62        192     5309
    ## 15 Hungary               3.60      28403   789188
    ## 16 Tunisia               3.54      11208   317010
    ## 17 Mali                  3.51        493    14029
    ## 18 Chad                  3.50        170     4854
    ## 19 Peru                  3.45      62976  1824457
    ## 20 South Africa          3.43      54620  1590370

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Hungary                2845.      28403    9.98
    ##  2 Czech Republic         2826.      29608   10.5 
    ##  3 Bulgaria               2350.      16800    7.15
    ##  4 Belgium                2350.      24444   10.4 
    ##  5 Slovakia               2190.      11946    5.46
    ##  6 Peru                   2106.      62976   29.9 
    ##  7 Brazil                 2061.     414399  201.  
    ##  8 United Kingdom         2046.     127583   62.3 
    ##  9 Italy                  2026.     122263   60.3 
    ## 10 Mexico                 1938.     218007  112.  
    ## 11 United States          1849.     573722  310.  
    ## 12 Poland                 1804.      69445   38.5 
    ## 13 Spain                  1693.      78726   46.5 
    ## 14 France                 1623.     105133   64.8 
    ## 15 Chile                  1606.      26895   16.7 
    ## 16 Argentina              1593.      65865   41.3 
    ## 17 Portugal               1591.      16988   10.7 
    ## 18 Colombia               1591.      76015   47.8 
    ## 19 Sweden                 1482.      14158    9.56
    ## 20 Jordan                 1407.       9014    6.41

EOL
