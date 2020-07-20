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

Updated: 2020-07-21

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
    ##  1 United States           26513.  3685460            139
    ##  2 Brazil                  16209.  2074860            128
    ##  3 India                    8734.  1118043            128
    ##  4 Russia                   6269.   777486            124
    ##  5 South Africa             2937.   364328            124
    ##  6 Peru                     2817.   349500            124
    ##  7 Mexico                   2754.   338913            123
    ##  8 Chile                    2625.   330930            126
    ##  9 United Kingdom           2151.   294796            137
    ## 10 Pakistan                 2102.   265083            126
    ## 11 Saudi Arabia             1960.   250920            128
    ## 12 Bangladesh               1947.   204525            105
    ## 13 Iran                     1887.   273788            145
    ## 14 Spain                    1858.   260255            140
    ## 15 Turkey                   1770.   219641            124
    ## 16 Italy                    1651.   244434            148
    ## 17 Colombia                 1550.   190700            123
    ## 18 Germany                  1430.   201823            141
    ## 19 France                   1172.   164247            140
    ## 20 Argentina                1003.   122524            122

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            157.               19761.            126
    ##  2 Peru                              94.2              11686.            124
    ##  3 United States                     85.5              11880.            139
    ##  4 Brazil                            80.6              10317.            128
    ##  5 Saudi Arabia                      76.2               9751.            128
    ##  6 Belarus                           60.8               6824.            112
    ##  7 South Africa                      59.9               7435.            124
    ##  8 Sweden                            59.4               8087.            136
    ##  9 Bolivia                           52.6               5845.            111
    ## 10 Israel                            52.4               6728.            128
    ## 11 Belgium                           45.1               6142.            136
    ## 12 Dominican Republic                45.0               5380.            119
    ## 13 Russia                            44.6               5526.            124
    ## 14 Kyrgyzstan                        43.8               4927.            112
    ## 15 Kazakhstan                        40.3               4683.            116
    ## 16 Ecuador                           40.3               5004.            124
    ## 17 Spain                             40.0               5596.            140
    ## 18 Honduras                          36.2               4105.            113
    ## 19 Portugal                          35.2               4556.            129
    ## 20 United Kingdom                    34.5               4728.            137

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  27.6         445     1610
    ##  2 France                 18.3       30046   164247
    ##  3 United Kingdom         15.4       45300   294796
    ##  4 Belgium                15.3        9800    63893
    ##  5 Italy                  14.3       35045   244434
    ##  6 Hungary                13.8         596     4333
    ##  7 Netherlands            11.9        6129    51670
    ##  8 Mexico                 11.5       38888   338913
    ##  9 Spain                  10.9       28420   260255
    ## 10 Chad                    8.44         75      889
    ## 11 Canada                  8.04       8848   109999
    ## 12 Sweden                  7.27       5619    77281
    ## 13 Ecuador                 7.18       5313    74013
    ## 14 Sudan                   6.30        693    10992
    ## 15 Niger                   6.25         69     1104
    ## 16 Romania                 5.41       2026    37458
    ## 17 China                   5.41       4653    86068
    ## 18 Iran                    5.18      14188   273788
    ## 19 Syria                   5.04         25      496
    ## 20 Switzerland             5.04       1687    33504

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                 942.       9800   10.4 
    ##  2 United Kingdom          727.      45300   62.3 
    ##  3 Spain                   611.      28420   46.5 
    ##  4 Sweden                  588.       5619    9.56
    ##  5 Italy                   581.      35045   60.3 
    ##  6 Chile                   508.       8503   16.7 
    ##  7 France                  464.      30046   64.8 
    ##  8 United States           450.     139468  310.  
    ##  9 Peru                    435.      12998   29.9 
    ## 10 Brazil                  392.      78772  201.  
    ## 11 Netherlands             368.       6129   16.6 
    ## 12 Ecuador                 359.       5313   14.8 
    ## 13 Mexico                  346.      38888  112.  
    ## 14 Canada                  263.       8848   33.7 
    ## 15 Switzerland             223.       1687    7.58
    ## 16 Bolivia                 212.       2106    9.95
    ## 17 Kyrgyzstan              188.       1037    5.51
    ## 18 Iran                    184.      14188   76.9 
    ## 19 Portugal                158.       1689   10.7 
    ## 20 Colombia                136.       6516   47.8

EOL
