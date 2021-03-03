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
-   [Save data](#save-data)

Updated: 2021-03-04

I added “USA, Covid-19 situation by state” in [another page](USA.md).

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
    ##  1 United States           77447. 28345585            366
    ##  2 India                   31467. 11139516            354
    ##  3 Brazil                  29738. 10587001            356
    ##  4 Russia                  12225.  4278750            350
    ##  5 United Kingdom          11475.  4188404            365
    ##  6 France                  10128.  3717272            367
    ##  7 Spain                    8552.  3130184            366
    ##  8 Italy                    7902.  2955434            374
    ##  9 Turkey                   7780.  2723316            350
    ## 10 Germany                  6685.  2460030            368
    ## 11 Colombia                 6443.  2255260            350
    ## 12 Argentina                6036.  2118676            351
    ## 13 Mexico                   5969.  2089281            350
    ## 14 Poland                   4902.  1735406            354
    ## 15 Iran                     4430.  1648174            372
    ## 16 South Africa             4315.  1514815            351
    ## 17 Ukraine                  3967.  1364705            344
    ## 18 Indonesia                3805.  1347026            354
    ## 19 Peru                     3797.  1332939            351
    ## 20 Czech Republic           3564.  1269058            356

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Czech Republic                340.             121140.            356
    ##  2 Israel                        299.             106322.            355
    ##  3 United States                 250.              91369.            366
    ##  4 Portugal                      213.              75463.            355
    ##  5 Belgium                       204.              74435.            364
    ##  6 Switzerland                   201.              73337.            365
    ##  7 Sweden                        194.              70021.            361
    ##  8 United Kingdom                184.              67177.            365
    ##  9 Spain                         184.              67307.            366
    ## 10 Netherlands                   182.              65872.            361
    ## 11 Serbia                        182.              63566.            349
    ## 12 Jordan                        181.              62787.            346
    ## 13 Slovakia                      165.              57628.            349
    ## 14 France                        156.              57393.            367
    ## 15 Austria                       155.              55964.            360
    ## 16 Brazil                        148.              52645.            356
    ## 17 Argentina                     146.              51246.            351
    ## 18 Chile                         141.              49713.            352
    ## 19 Colombia                      135.              47191.            350
    ## 20 Italy                         131.              48979.            374

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               27.3         641     2346
    ##  2 Mexico               8.91     186152  2089281
    ##  3 Syria                6.62       1039    15696
    ##  4 Sudan                6.22       1895    30479
    ##  5 Egypt                5.87      10778   183591
    ##  6 Ecuador              5.53      15850   286725
    ##  7 China                4.75       4845   101968
    ##  8 Bolivia              4.67      11666   249767
    ##  9 Afghanistan          4.39       2446    55770
    ## 10 Mali                 4.22        355     8420
    ## 11 Tanzania             4.13         21      509
    ## 12 Bulgaria             4.12      10391   252029
    ## 13 Zimbabwe             4.07       1472    36148
    ## 14 Guatemala            3.67       6402   174653
    ## 15 Iran                 3.66      60267  1648174
    ## 16 Niger                3.63        172     4740
    ## 17 Peru                 3.50      46685  1332939
    ## 18 Chad                 3.50        140     3999
    ## 19 Hungary              3.48      15324   439900
    ## 20 Tunisia              3.44       8047   234231

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million population,
are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                2128.      22141   10.4 
    ##  2 Czech Republic         1999.      20941   10.5 
    ##  3 United Kingdom         1978.     123296   62.3 
    ##  4 Mexico                 1655.     186152  112.  
    ##  5 United States          1647.     510924  310.  
    ##  6 Italy                  1629.      98288   60.3 
    ##  7 Peru                   1561.      46685   29.9 
    ##  8 Hungary                1535.      15324    9.98
    ##  9 Portugal               1535.      16389   10.7 
    ## 10 Spain                  1501.      69801   46.5 
    ## 11 Bulgaria               1454.      10391    7.15
    ## 12 Slovakia               1373.       7489    5.46
    ## 13 Sweden                 1348.      12882    9.56
    ## 14 France                 1340.      86771   64.8 
    ## 15 Brazil                 1272.     255720  201.  
    ## 16 Argentina              1262.      52192   41.3 
    ## 17 Colombia               1253.      59866   47.8 
    ## 18 Chile                  1235.      20684   16.7 
    ## 19 Switzerland            1220.       9251    7.58
    ## 20 Bolivia                1173.      11666    9.95

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
