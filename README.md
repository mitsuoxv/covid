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

Updated: 2020-07-07

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
    ##  1 United States           22668.  2833552            125
    ##  2 Brazil                  13832.  1577004            114
    ##  3 Russia                   6252.   687862            110
    ##  4 India                    6117.   697413            114
    ##  5 Peru                     2718.   299080            110
    ##  6 Chile                    2637.   295532            112
    ##  7 United Kingdom           2320.   285420            123
    ##  8 Mexico                   2312.   252165            109
    ##  9 Pakistan                 2068.   231818            112
    ## 10 Spain                    1988.   250545            126
    ## 11 Turkey                   1869.   205758            110
    ## 12 Saudi Arabia             1837.   209509            114
    ## 13 Iran                     1834.   240438            131
    ## 14 Italy                    1802.   241611            134
    ## 15 South Africa             1788.   196750            110
    ## 16 Bangladesh               1783.   162417             91
    ## 17 Germany                  1547.   196554            127
    ## 18 France                   1258.   158734            126
    ## 19 Colombia                 1039.   113389            109
    ## 20 Canada                    907.   105317            116

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            157.               17647.            112
    ##  2 Peru                              90.9              10000.            110
    ##  3 United States                     73.1               9134.            125
    ##  4 Saudi Arabia                      71.4               8142.            114
    ##  5 Brazil                            68.8               7842.            114
    ##  6 Belarus                           66.8               6562.             98
    ##  7 Sweden                            61.1               7474.            122
    ##  8 Belgium                           48.8               5961.            122
    ##  9 Russia                            44.4               4889.            110
    ## 10 Spain                             42.7               5387.            126
    ## 11 Bolivia                           39.3               3827.             97
    ## 12 Ecuador                           38.0               4189.            110
    ## 13 United Kingdom                    37.2               4578.            123
    ## 14 South Africa                      36.5               4015.            110
    ## 15 Dominican Republic                36.0               3810.            105
    ## 16 Portugal                          35.7               4112.            115
    ## 17 Israel                            34.7               3976.            114
    ## 18 Switzerland                       34.6               4245.            122
    ## 19 Kazakhstan                        31.0               3166.            102
    ## 20 Italy                             29.9               4004.            134

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  26.7         339     1269
    ##  2 France                 18.8       29808   158734
    ##  3 Belgium                15.8        9771    62016
    ##  4 United Kingdom         15.5       44220   285420
    ##  5 Italy                  14.4       34861   241611
    ##  6 Hungary                14.1         589     4183
    ##  7 Netherlands            12.1        6118    50566
    ##  8 Mexico                 12.0       30366   252165
    ##  9 Spain                  11.3       28385   250545
    ## 10 Chad                    8.49         74      872
    ## 11 Canada                  8.24       8674   105317
    ## 12 Ecuador                 7.72       4781    61958
    ## 13 Sweden                  7.59       5420    71419
    ## 14 Sudan                   6.23        608     9767
    ## 15 Niger                   6.22         68     1093
    ## 16 Romania                 6.04       1750    28973
    ## 17 Algeria                 5.97        952    15941
    ## 18 Greece                  5.46        192     3519
    ## 19 China                   5.45       4648    85320
    ## 20 Angola                  5.38         19      353

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                 939.       9771   10.4 
    ##  2 United Kingdom          709.      44220   62.3 
    ##  3 Spain                   610.      28385   46.5 
    ##  4 Italy                   578.      34861   60.3 
    ##  5 Sweden                  567.       5420    9.56
    ##  6 France                  460.      29808   64.8 
    ##  7 United States           417.     129408  310.  
    ##  8 Chile                   377.       6308   16.7 
    ##  9 Netherlands             368.       6118   16.6 
    ## 10 Peru                    348.      10412   29.9 
    ## 11 Ecuador                 323.       4781   14.8 
    ## 12 Brazil                  320.      64265  201.  
    ## 13 Mexico                  270.      30366  112.  
    ## 14 Canada                  258.       8674   33.7 
    ## 15 Switzerland             222.       1685    7.58
    ## 16 Portugal                151.       1614   10.7 
    ## 17 Iran                    150.      11571   76.9 
    ## 18 Bolivia                 139.       1378    9.95
    ## 19 Denmark                 111.        606    5.48
    ## 20 Germany                 110.       9016   81.8

EOL
