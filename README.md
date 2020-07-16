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

Updated: 2020-07-17

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
    ##  1 United States           25225.  3405494            135
    ##  2 Brazil                  15538.  1926824            124
    ##  3 India                    7813.   968876            124
    ##  4 Russia                   6272.   752797            120
    ##  5 Peru                     2781.   333867            120
    ##  6 Chile                    2632.   321205            122
    ##  7 Mexico                   2617.   311486            119
    ##  8 South Africa             2591.   311049            120
    ##  9 United Kingdom           2194.   291915            133
    ## 10 Pakistan                 2113.   257914            122
    ## 11 Saudi Arabia             1938.   240474            124
    ## 12 Bangladesh               1916.   193590            101
    ## 13 Spain                    1892.   257494            136
    ## 14 Iran                     1875.   264561            141
    ## 15 Turkey                   1798.   215940            120
    ## 16 Italy                    1690.   243506            144
    ## 17 Germany                  1461.   200260            137
    ## 18 Colombia                 1343.   159898            119
    ## 19 France                   1198.   163157            136
    ## 20 Argentina                 905.   106910            118

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            157.               19180.            122
    ##  2 Peru                              93.0              11164.            120
    ##  3 United States                     81.3              10977.            135
    ##  4 Brazil                            77.3               9581.            124
    ##  5 Saudi Arabia                      75.3               9345.            124
    ##  6 Belarus                           62.4               6757.            108
    ##  7 Sweden                            60.5               8005.            132
    ##  8 South Africa                      52.9               6348.            120
    ##  9 Bolivia                           47.7               5114.            107
    ## 10 Israel                            46.5               5793.            124
    ## 11 Belgium                           45.8               6060.            132
    ## 12 Russia                            44.6               5350.            120
    ## 13 Dominican Republic                42.0               4853.            115
    ## 14 Spain                             40.7               5537.            136
    ## 15 Ecuador                           39.5               4755.            120
    ## 16 Kazakhstan                        37.9               4250.            112
    ## 17 Portugal                          35.5               4442.            125
    ## 18 United Kingdom                    35.2               4682.            133
    ## 19 Honduras                          33.3               3643.            109
    ## 20 Switzerland                       32.8               4361.            132

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  28.4         434     1530
    ##  2 France                 18.4       30015   163157
    ##  3 Belgium                15.5        9792    63039
    ##  4 United Kingdom         15.4       45053   291915
    ##  5 Italy                  14.4       34997   243506
    ##  6 Hungary                14.0         595     4263
    ##  7 Netherlands            12.0        6127    51197
    ##  8 Mexico                 11.7       36327   311486
    ##  9 Spain                  11.0       28413   257494
    ## 10 Chad                    8.47         75      885
    ## 11 Canada                  8.11       8798   108486
    ## 12 Ecuador                 7.33       5158    70329
    ## 13 Sweden                  7.28       5572    76492
    ## 14 Sudan                   6.35        668    10527
    ## 15 Niger                   6.19         68     1099
    ## 16 Romania                 5.70       1952    34226
    ## 17 China                   5.43       4651    85697
    ## 18 Burkina Faso            5.11         53     1038
    ## 19 Switzerland             5.10       1687    33063
    ## 20 Iran                    5.07      13410   264561

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                 941.       9792   10.4 
    ##  2 United Kingdom          723.      45053   62.3 
    ##  3 Spain                   611.      28413   46.5 
    ##  4 Sweden                  583.       5572    9.56
    ##  5 Italy                   580.      34997   60.3 
    ##  6 France                  463.      30015   64.8 
    ##  7 United States           438.     135807  310.  
    ##  8 Chile                   429.       7186   16.7 
    ##  9 Peru                    409.      12229   29.9 
    ## 10 Brazil                  369.      74133  201.  
    ## 11 Netherlands             368.       6127   16.6 
    ## 12 Ecuador                 349.       5158   14.8 
    ## 13 Mexico                  323.      36327  112.  
    ## 14 Canada                  261.       8798   33.7 
    ## 15 Switzerland             223.       1687    7.58
    ## 16 Bolivia                 191.       1898    9.95
    ## 17 Iran                    174.      13410   76.9 
    ## 18 Portugal                157.       1676   10.7 
    ## 19 Colombia                118.       5625   47.8 
    ## 20 Iraq                    116.       3432   29.7

EOL
