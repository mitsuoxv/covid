WHO, Covid-19 situation report
================
Mitsuo Shiota
2020/3/7

-   [Summary](#summary)
-   [Read data from WHO](#read-data-from-who)
-   [Newly confirmed cases by region](#newly-confirmed-cases-by-region)
-   [Fastest spreading areas](#fastest-spreading-areas)
-   [Highest fatality rate areas](#highest-fatality-rate-areas)
-   [Highest deaths per population
    areas](#highest-deaths-per-population-areas)

Updated: 2021-04-25

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
    ##  1 United States           75763. 31593420            417
    ##  2 India                   40912. 16610481            406
    ##  3 Brazil                  34810. 14167973            407
    ##  4 France                  12787.  5357687            419
    ##  5 Russia                  11825.  4753789            402
    ##  6 Turkey                  11320.  4550820            402
    ##  7 United Kingdom          10554.  4401113            417
    ##  8 Italy                    9238.  3935703            426
    ##  9 Spain                    8270.  3456886            418
    ## 10 Germany                  7782.  3268645            420
    ## 11 Argentina                6974.  2796768            401
    ## 12 Poland                   6777.  2751632            406
    ## 13 Colombia                 6767.  2720619            402
    ## 14 Mexico                   5770.  2319519            402
    ## 15 Iran                     5563.  2358809            424
    ## 16 Ukraine                  5094.  2017341            396
    ## 17 Peru                     4304.  1734606            403
    ## 18 Indonesia                4030.  1632248            405
    ## 19 Czech Republic           3966.  1618068            408
    ## 20 South Africa             3913.  1572985            402

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                379.             154455.            408
    ##  2 Israel                        280.             113937.            407
    ##  3 Jordan                        274.             109124.            398
    ##  4 United States                 244.             101838.            417
    ##  5 Sweden                        238.              98195.            413
    ##  6 Serbia                        229.              92024.            401
    ##  7 Belgium                       224.              93060.            416
    ##  8 Netherlands                   210.              86817.            413
    ##  9 Switzerland                   204.              84891.            417
    ## 10 France                        197.              82721.            419
    ## 11 Hungary                       192.              76857.            400
    ## 12 Portugal                      192.              78063.            407
    ## 13 Spain                         178.              74332.            418
    ## 14 Austria                       178.              73271.            412
    ## 15 Poland                        176.              71471.            406
    ## 16 Slovakia                      173.              69565.            401
    ## 17 Brazil                        173.              70451.            407
    ## 18 Chile                         171.              69024.            404
    ## 19 United Kingdom                169.              70589.            417
    ## 20 Argentina                     169.              67648.            401

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                19.2        1166     6060
    ##  2 Mexico                9.23     214095  2319519
    ##  3 Syria                 6.91       1510    21864
    ##  4 Sudan                 6.83       2300    33673
    ##  5 Egypt                 5.87      12959   220658
    ##  6 Somalia               5.12        689    13459
    ##  7 Ecuador               4.86      18062   371306
    ##  8 China                 4.69       4856   103441
    ##  9 Afghanistan           4.38       2572    58730
    ## 10 Bolivia               4.33      12758   294391
    ## 11 Tanzania              4.13         21      509
    ## 12 Zimbabwe              4.09       1556    38045
    ## 13 Bulgaria              3.99      15826   396302
    ## 14 Niger                 3.72        191     5141
    ## 15 Chad                  3.56        169     4747
    ## 16 Hungary               3.44      26420   767190
    ## 17 South Africa          3.44      54066  1572985
    ## 18 Tunisia               3.43      10170   296343
    ## 19 Mali                  3.41        460    13504
    ## 20 Peru                  3.38      58604  1734606

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Czech Republic         2761.      28920   10.5 
    ##  2 Hungary                2647.      26420    9.98
    ##  3 Belgium                2303.      23954   10.4 
    ##  4 Bulgaria               2214.      15826    7.15
    ##  5 Slovakia               2100.      11458    5.46
    ##  6 United Kingdom         2043.     127385   62.3 
    ##  7 Italy                  1967.     118699   60.3 
    ##  8 Peru                   1960.      58604   29.9 
    ##  9 Brazil                 1907.     383502  201.  
    ## 10 Mexico                 1904.     214095  112.  
    ## 11 United States          1821.     564941  310.  
    ## 12 Poland                 1694.      65222   38.5 
    ## 13 Spain                  1666.      77496   46.5 
    ## 14 Portugal               1588.      16957   10.7 
    ## 15 France                 1572.     101844   64.8 
    ## 16 Chile                  1531.      25641   16.7 
    ## 17 Argentina              1466.      60620   41.3 
    ## 18 Colombia               1465.      70026   47.8 
    ## 19 Sweden                 1457.      13923    9.56
    ## 20 Jordan                 1329.       8514    6.41

EOL
