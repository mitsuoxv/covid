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

Updated: 2021-05-09

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
    ##  1 United States           74843. 32257416            431
    ##  2 India                   52125. 21892676            420
    ##  3 Brazil                  35638. 15003563            421
    ##  4 France                  13061.  5655548            433
    ##  5 Turkey                  12014.  4998089            416
    ##  6 Russia                  11711.  4871843            416
    ##  7 United Kingdom          10281.  4431047            431
    ##  8 Italy                    9301.  4092747            440
    ##  9 Spain                    8239.  3559222            432
    ## 10 Germany                  8082.  3507673            434
    ## 11 Argentina                7459.  3095582            415
    ## 12 Colombia                 7094.  2951101            416
    ## 13 Poland                   6736.  2829196            420
    ## 14 Iran                     5998.  2627094            438
    ## 15 Mexico                   5670.  2358831            416
    ## 16 Ukraine                  5156.  2114138            410
    ## 17 Peru                     4395.  1832671            417
    ## 18 Indonesia                4066.  1703632            419
    ## 19 Czech Republic           3896.  1644335            422
    ## 20 South Africa             3828.  1592626            416

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                372.             156962.            422
    ##  2 Jordan                        272.             112162.            412
    ##  3 Israel                        271.             114059.            421
    ##  4 Sweden                        247.             105463.            427
    ##  5 United States                 241.             103978.            431
    ##  6 Serbia                        229.              95103.            415
    ##  7 Belgium                       226.              97182.            430
    ##  8 Netherlands                   218.              92885.            427
    ##  9 Switzerland                   204.              88057.            431
    ## 10 France                        202.              87320.            433
    ## 11 Hungary                       191.              79061.            414
    ## 12 Portugal                      187.              78538.            421
    ## 13 Argentina                     180.              74875.            415
    ## 14 Austria                       179.              76151.            426
    ## 15 Brazil                        177.              74606.            421
    ## 16 Spain                         177.              76533.            432
    ## 17 Chile                         177.              73793.            418
    ## 18 Poland                        175.              73486.            420
    ## 19 Slovakia                      170.              70650.            415
    ## 20 United Kingdom                165.              71069.            431

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                19.7        1270     6450
    ##  2 Mexico                9.25     218173  2358831
    ##  3 Syria                 7.05       1639    23256
    ##  4 Sudan                 6.86       2365    34461
    ##  5 Egypt                 5.86      13779   235140
    ##  6 Somalia               5.19        745    14368
    ##  7 Ecuador               4.80      19061   396888
    ##  8 China                 4.68       4858   103774
    ##  9 Afghanistan           4.34       2683    61755
    ## 10 Bolivia               4.19      13151   314190
    ## 11 Tanzania              4.13         21      509
    ## 12 Bulgaria              4.12      16886   409495
    ## 13 Zimbabwe              4.10       1576    38403
    ## 14 Niger                 3.62        192     5310
    ## 15 Hungary               3.60      28403   789188
    ## 16 Tunisia               3.54      11277   318236
    ## 17 Mali                  3.54        497    14059
    ## 18 Chad                  3.50        170     4862
    ## 19 Peru                  3.45      63223  1832671
    ## 20 South Africa          3.43      54687  1592626

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Hungary                2845.      28403    9.98
    ##  2 Czech Republic         2830.      29647   10.5 
    ##  3 Bulgaria               2362.      16886    7.15
    ##  4 Belgium                2353.      24483   10.4 
    ##  5 Slovakia               2198.      11990    5.46
    ##  6 Peru                   2114.      63223   29.9 
    ##  7 Brazil                 2073.     416949  201.  
    ##  8 United Kingdom         2047.     127598   62.3 
    ##  9 Italy                  2030.     122470   60.3 
    ## 10 Mexico                 1940.     218173  112.  
    ## 11 United States          1852.     574518  310.  
    ## 12 Poland                 1815.      69886   38.5 
    ## 13 Spain                  1693.      78726   46.5 
    ## 14 France                 1626.     105339   64.8 
    ## 15 Chile                  1613.      27004   16.7 
    ## 16 Argentina              1603.      66263   41.3 
    ## 17 Colombia               1599.      76414   47.8 
    ## 18 Portugal               1591.      16988   10.7 
    ## 19 Sweden                 1483.      14173    9.56
    ## 20 Jordan                 1412.       9047    6.41

EOL
