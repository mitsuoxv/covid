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

Updated: 2021-04-13

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
    ##  1 United States           75982. 30772857            405
    ##  2 India                   34334. 13527717            394
    ##  3 Brazil                  34038. 13445006            395
    ##  4 France                  12236.  4980133            407
    ##  5 Russia                  11922.  4649710            390
    ##  6 United Kingdom          10789.  4369779            405
    ##  7 Turkey                   9869.  3849011            390
    ##  8 Italy                    9106.  3769814            414
    ##  9 Spain                    8218.  3336637            406
    ## 10 Germany                  7381.  3011513            408
    ## 11 Poland                   6565.  2586647            394
    ## 12 Argentina                6471.  2517300            389
    ## 13 Colombia                 6458.  2518715            390
    ## 14 Mexico                   5842.  2278420            390
    ## 15 Iran                     5024.  2070141            412
    ## 16 Ukraine                  4846.  1861105            384
    ## 17 Peru                     4193.  1639767            391
    ## 18 South Africa             3996.  1558458            390
    ## 19 Czech Republic           3993.  1581184            396
    ## 20 Indonesia                3987.  1566995            393

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                381.             150934.            396
    ##  2 Israel                        288.             113690.            395
    ##  3 Jordan                        269.             103906.            386
    ##  4 United States                 245.              99193.            405
    ##  5 Serbia                        225.              87437.            389
    ##  6 Sweden                        224.              89725.            401
    ##  7 Belgium                       220.              88962.            404
    ##  8 Netherlands                   202.              81145.            401
    ##  9 Switzerland                   200.              81087.            405
    ## 10 Portugal                      196.              77510.            395
    ## 11 France                        189.              76891.            407
    ## 12 Hungary                       187.              72655.            388
    ## 13 Spain                         177.              71746.            406
    ## 14 Austria                       175.              69951.            400
    ## 15 Slovakia                      175.              68022.            389
    ## 16 United Kingdom                173.              70086.            405
    ## 17 Poland                        171.              67186.            394
    ## 18 Brazil                        169.              66856.            395
    ## 19 Chile                         164.              64282.            392
    ## 20 Argentina                     157.              60888.            389

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                19.6        1050     5361
    ##  2 Mexico                9.18     209212  2278420
    ##  3 Syria                 6.81       1378    20226
    ##  4 Sudan                 6.48       2063    31833
    ##  5 Egypt                 5.91      12445   210489
    ##  6 Ecuador               4.99      17293   346817
    ##  7 Somalia               4.98        618    12406
    ##  8 China                 4.71       4854   103113
    ##  9 Bolivia               4.42      12442   281570
    ## 10 Afghanistan           4.42       2529    57242
    ## 11 Tanzania              4.13         21      509
    ## 12 Zimbabwe              4.12       1538    37288
    ## 13 Bulgaria              3.88      14418   371993
    ## 14 Niger                 3.72        189     5074
    ## 15 Chad                  3.60        167     4636
    ## 16 Guatemala             3.45       7001   202640
    ## 17 Mali                  3.44        408    11844
    ## 18 South Africa          3.42      53322  1558458
    ## 19 Tunisia               3.42       9293   271861
    ## 20 Nicaragua             3.34        179     5366

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Czech Republic         2665.      27918   10.5 
    ##  2 Hungary                2375.      23708    9.98
    ##  3 Belgium                2256.      23473   10.4 
    ##  4 United Kingdom         2038.     127087   62.3 
    ##  5 Bulgaria               2017.      14418    7.15
    ##  6 Slovakia               1937.      10565    5.46
    ##  7 Italy                  1893.     114254   60.3 
    ##  8 Mexico                 1860.     209212  112.  
    ##  9 Peru                   1828.      54669   29.9 
    ## 10 United States          1791.     555712  310.  
    ## 11 Brazil                 1747.     351334  201.  
    ## 12 Spain                  1638.      76179   46.5 
    ## 13 Portugal               1584.      16916   10.7 
    ## 14 Poland                 1519.      58481   38.5 
    ## 15 France                 1515.      98132   64.8 
    ## 16 Chile                  1454.      24346   16.7 
    ## 17 Sweden                 1425.      13621    9.56
    ## 18 Argentina              1394.      57647   41.3 
    ## 19 Colombia               1373.      65608   47.8 
    ## 20 Switzerland            1286.       9750    7.58

EOL
