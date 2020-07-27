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

Updated: 2020-07-28

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

Region classification is mostly based on [UN M49
Standard](https://unstats.un.org/unsd/methodology/m49/).

![](README_files/figure-gfm/chart-1.png)<!-- -->

## Fastest spreading areas

Among areas with more than 5 million population, highest
“speed\_since\_100”, which is average number of newly confirmed cases
per day since cumulative cases became more than 100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_since_100 cum_conf days_since_100
    ##    <chr>                    <dbl>    <dbl>          <int>
    ##  1 United States           28410.  4148011            146
    ##  2 Brazil                  17736.  2394513            135
    ##  3 India                   10632.  1435453            135
    ##  4 Russia                   6244.   818120            131
    ##  5 South Africa             3399.   445433            131
    ##  6 Mexico                   2961.   385036            130
    ##  7 Peru                     2899.   379884            131
    ##  8 Chile                    2599.   345790            133
    ##  9 United Kingdom           2079.   299430            144
    ## 10 Pakistan                 2061.   274289            133
    ## 11 Bangladesh               1994.   223453            112
    ## 12 Saudi Arabia             1977.   266941            135
    ## 13 Iran                     1915.   291172            152
    ## 14 Spain                    1852.   272421            147
    ## 15 Colombia                 1851.   240795            130
    ## 16 Turkey                   1724.   226100            131
    ## 17 Italy                    1587.   246118            155
    ## 18 Germany                  1388.   205609            148
    ## 19 Argentina                1226.   158321            129
    ## 20 France                   1150.   169222            147

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            155.               20649.            133
    ##  2 Peru                              96.9              12702.            131
    ##  3 United States                     91.6              13371.            146
    ##  4 Brazil                            88.2              11907.            135
    ##  5 Saudi Arabia                      76.8              10374.            135
    ##  6 South Africa                      69.4               9090.            131
    ##  7 Israel                            61.6               8341.            135
    ##  8 Bolivia                           58.1               6864.            118
    ##  9 Belarus                           57.9               6902.            119
    ## 10 Sweden                            57.7               8267.            143
    ## 11 Kyrgyzstan                        50.6               6044.            119
    ## 12 Dominican Republic                50.6               6404.            126
    ## 13 Russia                            44.4               5815.            131
    ## 14 Belgium                           44.2               6338.            143
    ## 15 Kazakhstan                        44.0               5419.            123
    ## 16 Ecuador                           41.6               5456.            131
    ## 17 Honduras                          40.0               4811.            120
    ## 18 Spain                             39.8               5858.            147
    ## 19 Colombia                          38.7               5039.            130
    ## 20 Portugal                          34.5               4699.            136

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  28.5         480     1685
    ##  2 France                 17.8       30078   169222
    ##  3 United Kingdom         15.3       45752   299430
    ##  4 Belgium                14.9        9821    65933
    ##  5 Italy                  14.3       35107   246118
    ##  6 Hungary                13.4         596     4448
    ##  7 Netherlands            11.6        6140    52946
    ##  8 Mexico                 11.3       43374   385036
    ##  9 Spain                  10.4       28432   272421
    ## 10 Chad                    8.20         75      915
    ## 11 Canada                  7.82       8885   113556
    ## 12 Sweden                  7.21       5697    78997
    ## 13 Ecuador                 6.83       5515    80694
    ## 14 Sudan                   6.30        720    11424
    ## 15 Niger                   6.10         69     1132
    ## 16 Syria                   5.85         38      650
    ## 17 Iran                    5.39      15700   291172
    ## 18 China                   5.35       4659    87028
    ## 19 Egypt                   5.00       4606    92062
    ## 20 Switzerland             4.95       1700    34325

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                 944.       9821   10.4 
    ##  2 United Kingdom          734.      45752   62.3 
    ##  3 Spain                   611.      28432   46.5 
    ##  4 Peru                    603.      18030   29.9 
    ##  5 Sweden                  596.       5697    9.56
    ##  6 Italy                   582.      35107   60.3 
    ##  7 Chile                   544.       9112   16.7 
    ##  8 United States           470.     145727  310.  
    ##  9 France                  464.      30078   64.8 
    ## 10 Brazil                  430.      86449  201.  
    ## 11 Mexico                  386.      43374  112.  
    ## 12 Ecuador                 373.       5515   14.8 
    ## 13 Netherlands             369.       6140   16.6 
    ## 14 Canada                  264.       8885   33.7 
    ## 15 Bolivia                 255.       2535    9.95
    ## 16 Kyrgyzstan              236.       1301    5.51
    ## 17 Switzerland             224.       1700    7.58
    ## 18 Iran                    204.      15700   76.9 
    ## 19 Colombia                173.       8269   47.8 
    ## 20 Portugal                161.       1717   10.7

EOL
