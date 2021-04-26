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

Updated: 2021-04-27

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
    ##  1 United States           75676. 31708445            419
    ##  2 India                   42434. 17313163            408
    ##  3 Brazil                  34983. 14308215            409
    ##  4 France                  12857.  5413036            421
    ##  5 Russia                  11810.  4771372            404
    ##  6 Turkey                  11460.  4629969            404
    ##  7 United Kingdom          10513.  4404886            419
    ##  8 Italy                    9258.  3962674            428
    ##  9 Spain                    8230.  3456886            420
    ## 10 Germany                  7818.  3299325            422
    ## 11 Argentina                7061.  2845872            403
    ## 12 Colombia                 6825.  2757274            404
    ## 13 Poland                   6770.  2762323            408
    ## 14 Mexico                   5759.  2326738            404
    ## 15 Iran                     5625.  2396204            426
    ## 16 Ukraine                  5101.  2030333            398
    ## 17 Peru                     4331.  1754150            405
    ## 18 Indonesia                4032.  1641194            407
    ## 19 Czech Republic           3951.  1620206            410
    ## 20 South Africa             3899.  1575471            404

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                377.             154659.            410
    ##  2 Israel                        279.             113963.            409
    ##  3 Jordan                        274.             109590.            400
    ##  4 United States                 244.             102209.            419
    ##  5 Sweden                        237.              98195.            415
    ##  6 Serbia                        230.              92537.            403
    ##  7 Belgium                       224.              93667.            418
    ##  8 Netherlands                   212.              87782.            415
    ##  9 Switzerland                   203.              84891.            419
    ## 10 France                        199.              83575.            421
    ## 11 Hungary                       192.              77285.            402
    ## 12 Portugal                      191.              78161.            409
    ## 13 Austria                       178.              73798.            414
    ## 14 Spain                         177.              74332.            420
    ## 15 Poland                        176.              71749.            408
    ## 16 Brazil                        174.              71149.            409
    ## 17 Slovakia                      173.              69663.            403
    ## 18 Chile                         172.              69838.            406
    ## 19 Argentina                     171.              68835.            403
    ## 20 United Kingdom                169.              70649.            419

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                19.3        1188     6141
    ##  2 Mexico                9.23     214853  2326738
    ##  3 Syria                 6.94       1537    22135
    ##  4 Sudan                 6.83       2300    33673
    ##  5 Egypt                 5.86      13049   222523
    ##  6 Somalia               5.12        689    13459
    ##  7 Ecuador               4.87      18177   373362
    ##  8 China                 4.69       4857   103484
    ##  9 Afghanistan           4.39       2592    59015
    ## 10 Bolivia               4.31      12812   297185
    ## 11 Tanzania              4.13         21      509
    ## 12 Zimbabwe              4.09       1557    38086
    ## 13 Bulgaria              4.00      15907   397500
    ## 14 Niger                 3.68        191     5191
    ## 15 Chad                  3.54        169     4770
    ## 16 Hungary               3.47      26801   771454
    ## 17 South Africa          3.44      54148  1575471
    ## 18 Tunisia               3.43      10304   300342
    ## 19 Mali                  3.43        467    13627
    ## 20 Peru                  3.39      59440  1754150

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Czech Republic         2768.      29002   10.5 
    ##  2 Hungary                2685.      26801    9.98
    ##  3 Belgium                2309.      24024   10.4 
    ##  4 Bulgaria               2225.      15907    7.15
    ##  5 Slovakia               2114.      11531    5.46
    ##  6 United Kingdom         2044.     127428   62.3 
    ##  7 Peru                   1987.      59440   29.9 
    ##  8 Italy                  1976.     119238   60.3 
    ##  9 Brazil                 1937.     389492  201.  
    ## 10 Mexico                 1910.     214853  112.  
    ## 11 United States          1826.     566540  310.  
    ## 12 Poland                 1700.      65437   38.5 
    ## 13 Spain                  1666.      77496   46.5 
    ## 14 Portugal               1589.      16965   10.7 
    ## 15 France                 1578.     102184   64.8 
    ## 16 Chile                  1544.      25856   16.7 
    ## 17 Argentina              1487.      61474   41.3 
    ## 18 Colombia               1483.      70886   47.8 
    ## 19 Sweden                 1457.      13923    9.56
    ## 20 Jordan                 1345.       8615    6.41

EOL
