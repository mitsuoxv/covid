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

Updated: 2020-07-15

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
    ##  1 United States           24706.  3286063            133
    ##  2 Brazil                  15283.  1864681            122
    ##  3 India                    7432.   906752            122
    ##  4 Russia                   6269.   739947            118
    ##  5 Peru                     2764.   326326            118
    ##  6 Chile                    2646.   317657            120
    ##  7 Mexico                   2561.   299750            117
    ##  8 South Africa             2438.   287796            118
    ##  9 United Kingdom           2214.   290137            131
    ## 10 Pakistan                 2112.   253604            120
    ## 11 Saudi Arabia             1926.   235111            122
    ## 12 Spain                    1909.   255953            134
    ## 13 Bangladesh               1887.   186894             99
    ## 14 Iran                     1867.   259652            139
    ## 15 Turkey                   1812.   214001            118
    ## 16 Italy                    1712.   243230            142
    ## 17 Germany                  1473.   198963            135
    ## 18 Colombia                 1285.   150445            117
    ## 19 France                   1210.   162390            134
    ## 20 Canada                    867.   107590            124

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            158.               18969.            120
    ##  2 Peru                              92.4              10911.            118
    ##  3 United States                     79.6              10592.            133
    ##  4 Brazil                            76.0               9272.            122
    ##  5 Saudi Arabia                      74.9               9137.            122
    ##  6 Belarus                           63.3               6723.            106
    ##  7 Sweden                            60.9               7935.            130
    ##  8 South Africa                      49.8               5873.            118
    ##  9 Belgium                           46.3               6035.            130
    ## 10 Bolivia                           46.0               4844.            105
    ## 11 Russia                            44.6               5259.            118
    ## 12 Israel                            43.6               5343.            122
    ## 13 Spain                             41.1               5504.            134
    ## 14 Dominican Republic                40.8               4632.            113
    ## 15 Ecuador                           39.1               4629.            118
    ## 16 Kazakhstan                        36.5               4026.            110
    ## 17 Portugal                          35.6               4385.            123
    ## 18 United Kingdom                    35.5               4653.            131
    ## 19 Switzerland                       33.1               4335.            130
    ## 20 Honduras                          32.7               3516.            107

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  28.3         425     1502
    ##  2 France                 18.4       29925   162390
    ##  3 Belgium                15.6        9787    62781
    ##  4 United Kingdom         15.5       44830   290137
    ##  5 Italy                  14.4       34967   243230
    ##  6 Hungary                14.0         595     4247
    ##  7 Netherlands            12.0        6128    51038
    ##  8 Mexico                 11.7       35006   299750
    ##  9 Spain                  11.1       28406   255953
    ## 10 Chad                    8.52         75      880
    ## 11 Canada                  8.16       8783   107590
    ## 12 Ecuador                 7.40       5063    68459
    ## 13 Sweden                  7.30       5536    75826
    ## 14 Sudan                   6.37        657    10316
    ## 15 Niger                   6.19         68     1099
    ## 16 Romania                 5.77       1901    32948
    ## 17 China                   5.43       4649    85623
    ## 18 Algeria                 5.17       1018    19689
    ## 19 Switzerland             5.13       1685    32861
    ## 20 Burkina Faso            5.12         53     1036

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                 941.       9787   10.4 
    ##  2 United Kingdom          719.      44830   62.3 
    ##  3 Spain                   611.      28406   46.5 
    ##  4 Italy                   579.      34967   60.3 
    ##  5 Sweden                  579.       5536    9.56
    ##  6 France                  462.      29925   64.8 
    ##  7 United States           434.     134704  310.  
    ##  8 Chile                   419.       7024   16.7 
    ##  9 Peru                    397.      11870   29.9 
    ## 10 Netherlands             368.       6128   16.6 
    ## 11 Brazil                  359.      72100  201.  
    ## 12 Ecuador                 342.       5063   14.8 
    ## 13 Mexico                  311.      35006  112.  
    ## 14 Canada                  261.       8783   33.7 
    ## 15 Switzerland             222.       1685    7.58
    ## 16 Bolivia                 182.       1807    9.95
    ## 17 Iran                    169.      13032   76.9 
    ## 18 Portugal                156.       1662   10.7 
    ## 19 Denmark                 111.        610    5.48
    ## 20 Colombia                111.       5307   47.8

EOL
