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

Updated: 2021-04-26

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
    ##  1 United States           75733. 31656636            418
    ##  2 India                   41671. 16960172            407
    ##  3 Brazil                  34894. 14237078            408
    ##  4 France                  12833.  5390187            420
    ##  5 Russia                  11817.  4762569            403
    ##  6 Turkey                  11393.  4591416            403
    ##  7 United Kingdom          10534.  4403174            418
    ##  8 Italy                    9249.  3949517            427
    ##  9 Spain                    8250.  3456886            419
    ## 10 Germany                  7808.  3287418            421
    ## 11 Argentina                7026.  2824652            402
    ## 12 Colombia                 6800.  2740544            403
    ## 13 Poland                   6778.  2758856            407
    ## 14 Mexico                   5765.  2323430            403
    ## 15 Iran                     5593.  2377039            425
    ## 16 Ukraine                  5101.  2025271            397
    ## 17 Peru                     4321.  1745655            404
    ## 18 Indonesia                4031.  1636792            406
    ## 19 Czech Republic           3956.  1618076            409
    ## 20 South Africa             3906.  1574370            403

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                378.             154456.            409
    ##  2 Israel                        279.             113948.            408
    ##  3 Jordan                        274.             109320.            399
    ##  4 United States                 244.             102042.            418
    ##  5 Sweden                        237.              98195.            414
    ##  6 Serbia                        230.              92306.            402
    ##  7 Belgium                       224.              93439.            417
    ##  8 Netherlands                   211.              87301.            414
    ##  9 Switzerland                   203.              84891.            418
    ## 10 France                        198.              83222.            420
    ## 11 Hungary                       192.              77091.            401
    ## 12 Portugal                      191.              78116.            408
    ## 13 Austria                       178.              73543.            413
    ## 14 Spain                         177.              74332.            419
    ## 15 Poland                        176.              71659.            407
    ## 16 Brazil                        174.              70795.            408
    ## 17 Slovakia                      173.              69645.            402
    ## 18 Chile                         171.              69436.            405
    ## 19 Argentina                     170.              68322.            402
    ## 20 United Kingdom                169.              70622.            418

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                19.3        1176     6109
    ##  2 Mexico                9.23     214504  2323430
    ##  3 Syria                 6.94       1526    21999
    ##  4 Sudan                 6.83       2300    33673
    ##  5 Egypt                 5.87      12998   221570
    ##  6 Somalia               5.12        689    13459
    ##  7 Ecuador               4.87      18158   372754
    ##  8 China                 4.69       4856   103464
    ##  9 Afghanistan           4.39       2582    58843
    ## 10 Bolivia               4.32      12783   295892
    ## 11 Tanzania              4.13         21      509
    ## 12 Zimbabwe              4.09       1556    38064
    ## 13 Bulgaria              3.99      15859   397100
    ## 14 Niger                 3.70        191     5158
    ## 15 Chad                  3.56        169     4752
    ## 16 Hungary               3.46      26625   769518
    ## 17 South Africa          3.44      54125  1574370
    ## 18 Tunisia               3.43      10231   298572
    ## 19 Mali                  3.41        462    13560
    ## 20 Peru                  3.38      59012  1745655

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Czech Republic         2763.      28946   10.5 
    ##  2 Hungary                2667.      26625    9.98
    ##  3 Belgium                2306.      23990   10.4 
    ##  4 Bulgaria               2218.      15859    7.15
    ##  5 Slovakia               2107.      11495    5.46
    ##  6 United Kingdom         2044.     127417   62.3 
    ##  7 Peru                   1973.      59012   29.9 
    ##  8 Italy                  1972.     119021   60.3 
    ##  9 Brazil                 1921.     386416  201.  
    ## 10 Mexico                 1907.     214504  112.  
    ## 11 United States          1824.     565809  310.  
    ## 12 Poland                 1699.      65415   38.5 
    ## 13 Spain                  1666.      77496   46.5 
    ## 14 Portugal               1589.      16959   10.7 
    ## 15 France                 1575.     102031   64.8 
    ## 16 Chile                  1537.      25742   16.7 
    ## 17 Argentina              1480.      61176   41.3 
    ## 18 Colombia               1474.      70446   47.8 
    ## 19 Sweden                 1457.      13923    9.56
    ## 20 Jordan                 1336.       8563    6.41

EOL
