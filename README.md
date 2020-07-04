WHO, Covid-19 situation report
================
Mitsuo Shiota
2020/3/7

  - [Summary](#summary)
  - [Load](#load)
  - [Newly confirmed cases by region](#newly-confirmed-cases-by-region)
  - [Fastest spreading areas](#fastest-spreading-areas)
  - [Highest fatality rate areas](#highest-fatality-rate-areas)
  - [Highest deaths per population
    areas](#highest-deaths-per-population-areas)

Updated: 2020-07-05

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

WHO offers those numbers in [the situation
reports](https://www.who.int/emergencies/diseases/novel-coronavirus-2019/situation-reports/),
which are unfortunately pdf files.

So I scratched numbers from pdf files, scratched my head learning
regular expressions, and made the shiny app above. I would like to
update frequently, but I am not sure. The ugly codes I wrote are in R
directory. Data in Table 1 (In China) and Table 2 (World including
China) in the situation reports are in table1.csv, table2.csv and
tables.rdata in data directory.

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

## Load

Here, I load Table 1 and Table 2, which I managed to scratch from WHO
situation reports. Beware Table 1 (in\_china) includes total, but Table
2 (world) does not include subtotal or total, as I cut them.

``` r
# load data
load("data/tables.rdata")
```

## Newly confirmed cases by region

I watch newly confirmed cases. China is suceeding to contain the
coronavirus, but areas outside China now face the challenge.

    ## `summarise()` regrouping output by 'publish_date' (override with `.groups` argument)

![](README_files/figure-gfm/chart-1.png)<!-- -->

## Fastest spreading areas

Among areas with more than 5 million population, highest
“speed\_since\_100”, which is average number of newly confirmed cases
per day since cumulative cases became more than 100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_since_100 cum_conf days_since_100
    ##    <chr>                    <dbl>    <dbl>          <int>
    ##  1 United States           22149.  2724433            123
    ##  2 Brazil                  13364.  1496858            112
    ##  3 Russia                   6244.   674515            108
    ##  4 India                    5788.   648315            112
    ##  5 Peru                     2702.   292004            108
    ##  6 Chile                    2618.   288089            110
    ##  7 United Kingdom           2348.   284280            121
    ##  8 Mexico                   2228.   238511            107
    ##  9 Pakistan                 2046.   225283            110
    ## 10 Spain                    2020.   250545            124
    ## 11 Turkey                   1882.   203456            108
    ## 12 Italy                    1826.   241184            132
    ## 13 Iran                     1824.   235429            129
    ## 14 Saudi Arabia             1801.   201801            112
    ## 15 Bangladesh               1756.   156391             89
    ## 16 South Africa             1639.   177124            108
    ## 17 Germany                  1568.   196096            125
    ## 18 France                   1279.   158734            124
    ## 19 Colombia                  991.   106110            107
    ## 20 Canada                    918.   104772            114

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            156.               17203.            110
    ##  2 Peru                              90.4               9764.            108
    ##  3 United States                     71.4               8782.            123
    ##  4 Saudi Arabia                      70.0               7842.            112
    ##  5 Belarus                           67.6               6505.             96
    ##  6 Brazil                            66.5               7443.            112
    ##  7 Sweden                            62.2               7474.            120
    ##  8 Belgium                           49.4               5944.            120
    ##  9 Russia                            44.4               4794.            108
    ## 10 Spain                             43.4               5387.            124
    ## 11 Ecuador                           37.9               4101.            108
    ## 12 United Kingdom                    37.7               4560.            121
    ## 13 Bolivia                           37.5               3572.             95
    ## 14 Portugal                          35.7               4042.            113
    ## 15 Switzerland                       35.0               4223.            120
    ## 16 Dominican Republic                34.5               3578.            103
    ## 17 South Africa                      33.4               3615.            108
    ## 18 Israel                            33.2               3738.            112
    ## 19 Italy                             30.3               3997.            132
    ## 20 Kazakhstan                        29.7               2980.            100

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  27.0         336     1244
    ##  2 France                 18.8       29808   158734
    ##  3 Belgium                15.8        9771    61838
    ##  4 United Kingdom         15.5       44131   284280
    ##  5 Italy                  14.4       34833   241184
    ##  6 Hungary                14.1         588     4172
    ##  7 Mexico                 12.2       29189   238511
    ##  8 Netherlands            12.1        6111    50432
    ##  9 Spain                  11.3       28385   250545
    ## 10 Chad                    8.50         74      871
    ## 11 Canada                  8.25       8642   104772
    ## 12 Ecuador                 7.75       4700    60657
    ## 13 Sweden                  7.59       5420    71419
    ## 14 Niger                   6.28         68     1082
    ## 15 Sudan                   6.25        604     9663
    ## 16 Algeria                 6.22        937    15070
    ## 17 Romania                 6.06       1708    28166
    ## 18 Greece                  5.51        192     3486
    ## 19 Angola                  5.49         18      328
    ## 20 China                   5.45       4648    85287

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                 939.       9771   10.4 
    ##  2 United Kingdom          708.      44131   62.3 
    ##  3 Spain                   610.      28385   46.5 
    ##  4 Italy                   577.      34833   60.3 
    ##  5 Sweden                  567.       5420    9.56
    ##  6 France                  460.      29808   64.8 
    ##  7 United States           414.     128481  310.  
    ##  8 Netherlands             367.       6111   16.6 
    ##  9 Chile                   361.       6051   16.7 
    ## 10 Peru                    336.      10045   29.9 
    ## 11 Ecuador                 318.       4700   14.8 
    ## 12 Brazil                  308.      61884  201.  
    ## 13 Mexico                  260.      29189  112.  
    ## 14 Canada                  257.       8642   33.7 
    ## 15 Switzerland             222.       1685    7.58
    ## 16 Portugal                150.       1598   10.7 
    ## 17 Iran                    146.      11260   76.9 
    ## 18 Bolivia                 128.       1271    9.95
    ## 19 Denmark                 111.        606    5.48
    ## 20 Germany                 110.       9010   81.8

EOL
