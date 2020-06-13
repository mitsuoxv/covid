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

Updated: 2020-06-14

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
    ##  1 United States           19709.  2010391            102
    ##  2 Brazil                   8821.   802828             91
    ##  3 Russia                   5977.   520129             87
    ##  4 India                    3394.   308993             91
    ##  5 United Kingdom           2928.   292954            100
    ##  6 Peru                     2467.   214788             87
    ##  7 Spain                    2360.   243209            103
    ##  8 Italy                    2128.   236305            111
    ##  9 Turkey                   2012.   175218             87
    ## 10 Chile                    1806.   160846             89
    ## 11 Germany                  1787.   186022            104
    ## 12 Iran                     1689.   182545            108
    ## 13 Mexico                   1556.   133974             86
    ## 14 Pakistan                 1486.   132405             89
    ## 15 France                   1475.   152067            103
    ## 16 Saudi Arabia             1317.   119942             91
    ## 17 Bangladesh               1197.    81523             68
    ## 18 Canada                   1047.    97530             93
    ## 19 South Africa              710.    61927             87
    ## 20 Belarus                   698.    52520             75

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            108.                9605.             89
    ##  2 Peru                              82.5               7182.             87
    ##  3 Belarus                           72.1               5423.             75
    ##  4 United States                     63.5               6480.            102
    ##  5 Belgium                           58.0               5750.             99
    ##  6 Sweden                            52.4               5199.             99
    ##  7 Saudi Arabia                      51.2               4661.             91
    ##  8 Spain                             50.7               5230.            103
    ##  9 United Kingdom                    47.0               4699.            100
    ## 10 Brazil                            43.9               3992.             91
    ## 11 Russia                            42.5               3697.             87
    ## 12 Switzerland                       41.0               4087.             99
    ## 13 Portugal                          36.7               3389.             92
    ## 14 Ecuador                           35.5               3095.             87
    ## 15 Italy                             35.3               3916.            111
    ## 16 Canada                            31.1               2896.             93
    ## 17 Netherlands                       29.3               2911.             99
    ## 18 Israel                            27.7               2543.             91
    ## 19 Dominican Republic                27.0               2240.             82
    ## 20 Turkey                            25.9               2252.             87

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  22.0         140      636
    ##  2 France                 19.3       29312   152067
    ##  3 Belgium                16.1        9646    59819
    ##  4 Italy                  14.5       34223   236305
    ##  5 United Kingdom         14.2       41481   292954
    ##  6 Hungary                13.7         555     4053
    ##  7 Netherlands            12.5        6053    48461
    ##  8 Mexico                 11.9       15944   133974
    ##  9 Spain                  11.2       27136   243209
    ## 10 Sweden                  9.77       4854    49684
    ## 11 Chad                    8.49         72      848
    ## 12 Ecuador                 8.36       3828    45778
    ## 13 Canada                  8.20       7994    97530
    ## 14 Algeria                 7.02        751    10698
    ## 15 Niger                   6.65         65      978
    ## 16 Romania                 6.45       1380    21404
    ## 17 Sudan                   6.29        433     6879
    ## 18 Burkina Faso            5.94         53      892
    ## 19 Greece                  5.89        183     3108
    ## 20 Mali                    5.76        101     1752

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                927.        9646   10.4 
    ##  2 United Kingdom         665.       41481   62.3 
    ##  3 Spain                  583.       27136   46.5 
    ##  4 Italy                  567.       34223   60.3 
    ##  5 Sweden                 508.        4854    9.56
    ##  6 France                 453.       29312   64.8 
    ##  7 United States          367.      113757  310.  
    ##  8 Netherlands            364.        6053   16.6 
    ##  9 Ecuador                259.        3828   14.8 
    ## 10 Canada                 237.        7994   33.7 
    ## 11 Switzerland            221.        1676    7.58
    ## 12 Peru                   204.        6109   29.9 
    ## 13 Brazil                 203.       40919  201.  
    ## 14 Chile                  171.        2870   16.7 
    ## 15 Mexico                 142.       15944  112.  
    ## 16 Portugal               141.        1505   10.7 
    ## 17 Iran                   113.        8659   76.9 
    ## 18 Denmark                108.         594    5.48
    ## 19 Germany                107.        8781   81.8 
    ## 20 Austria                 82.3        675    8.20

EOL
