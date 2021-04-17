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

Updated: 2021-04-18

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
    ##  1 United States           76041. 31176938            410
    ##  2 India                   36407. 14526609            399
    ##  3 Brazil                  34366. 13746681            400
    ##  4 France                  12486.  5144295            412
    ##  5 Russia                  11882.  4693469            395
    ##  6 United Kingdom          10692.  4383736            410
    ##  7 Turkey                  10506.  4150039            395
    ##  8 Italy                    9169.  3842079            419
    ##  9 Spain                    8264.  3396685            411
    ## 10 Germany                  7562.  3123077            413
    ## 11 Poland                   6706.  2675874            399
    ## 12 Argentina                6673.  2629156            394
    ## 13 Colombia                 6589.  2602719            395
    ## 14 Mexico                   5811.  2295435            395
    ## 15 Iran                     5261.  2194133            417
    ## 16 Ukraine                  4977.  1936228            389
    ## 17 Peru                     4245.  1681063            396
    ## 18 Indonesia                4006.  1594722            398
    ## 19 Czech Republic           3991.  1600341            401
    ## 20 South Africa             3960.  1564355            395

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                381.             152763.            401
    ##  2 Israel                        284.             113780.            400
    ##  3 Jordan                        272.             106424.            391
    ##  4 United States                 245.             100495.            410
    ##  5 Sweden                        232.              94197.            406
    ##  6 Serbia                        227.              89548.            394
    ##  7 Belgium                       222.              90667.            409
    ##  8 Netherlands                   205.              83331.            406
    ##  9 Switzerland                   202.              83037.            410
    ## 10 Portugal                      194.              77736.            400
    ## 11 France                        193.              79426.            412
    ## 12 Hungary                       190.              74815.            393
    ## 13 Spain                         178.              73038.            411
    ## 14 Austria                       176.              71360.            405
    ## 15 Slovakia                      175.              68806.            394
    ## 16 Poland                        174.              69503.            399
    ## 17 United Kingdom                171.              70310.            410
    ## 18 Brazil                        171.              68356.            400
    ## 19 Chile                         167.              66241.            397
    ## 20 Argentina                     161.              63593.            394

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area         fatality_rate cum_deaths cum_conf
    ##    <chr>                <dbl>      <dbl>    <dbl>
    ##  1 Yemen                19.4        1109     5719
    ##  2 Mexico                9.20     211213  2295435
    ##  3 Syria                 6.82       1423    20856
    ##  4 Sudan                 6.69       2208    33022
    ##  5 Egypt                 5.90      12653   214639
    ##  6 Somalia               5.11        656    12837
    ##  7 Ecuador               4.92      17528   355964
    ##  8 China                 4.70       4856   103237
    ##  9 Bolivia               4.40      12603   286114
    ## 10 Afghanistan           4.40       2539    57721
    ## 11 Zimbabwe              4.14       1550    37422
    ## 12 Tanzania              4.13         21      509
    ## 13 Bulgaria              3.92      15100   384887
    ## 14 Niger                 3.72        190     5114
    ## 15 Chad                  3.60        168     4673
    ## 16 South Africa          3.43      53663  1564355
    ## 17 Tunisia               3.42       9639   281777
    ## 18 Guatemala             3.41       7120   208694
    ## 19 Malawi                3.35       1136    33919
    ## 20 Hungary               3.34      24979   746802

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Czech Republic         2711.      28396   10.5 
    ##  2 Hungary                2502.      24979    9.98
    ##  3 Belgium                2276.      23681   10.4 
    ##  4 Bulgaria               2112.      15100    7.15
    ##  5 United Kingdom         2041.     127225   62.3 
    ##  6 Slovakia               2024.      11043    5.46
    ##  7 Italy                  1928.     116366   60.3 
    ##  8 Mexico                 1878.     211213  112.  
    ##  9 Peru                   1877.      56149   29.9 
    ## 10 Brazil                 1817.     365444  201.  
    ## 11 United States          1805.     559947  310.  
    ## 12 Spain                  1653.      76882   46.5 
    ## 13 Poland                 1606.      61825   38.5 
    ## 14 Portugal               1586.      16937   10.7 
    ## 15 France                 1540.      99744   64.8 
    ## 16 Chile                  1488.      24923   16.7 
    ## 17 Sweden                 1443.      13788    9.56
    ## 18 Argentina              1425.      58925   41.3 
    ## 19 Colombia               1406.      67199   47.8 
    ## 20 Switzerland            1295.       9815    7.58

EOL
