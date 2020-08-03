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

Updated: 2020-08-04

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
    ##  1 United States           29949.  4582276            153
    ##  2 Brazil                  19069.  2707877            142
    ##  3 India                   12701.  1803695            142
    ##  4 Russia                   6204.   856264            138
    ##  5 South Africa             3706.   511485            138
    ##  6 Mexico                   3168.   434193            137
    ##  7 Peru                     3058.   422183            138
    ##  8 Chile                    2568.   359731            140
    ##  9 Colombia                 2234.   306181            137
    ## 10 Bangladesh               2022.   240746            119
    ## 11 United Kingdom           2017.   304699            151
    ## 12 Pakistan                 1999.   280029            140
    ## 13 Saudi Arabia             1963.   278835            142
    ## 14 Iran                     1945.   309437            159
    ## 15 Spain                    1873.   288522            154
    ## 16 Turkey                   1686.   232856            138
    ## 17 Italy                    1531.   248070            162
    ## 18 Argentina                1444.   196543            136
    ## 19 Germany                  1357.   210402            155
    ## 20 France                   1141.   175920            154

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            153.               21481.            140
    ##  2 Peru                             102.               14117.            138
    ##  3 United States                     96.5              14770.            153
    ##  4 Brazil                            94.8              13465.            142
    ##  5 Saudi Arabia                      76.3              10836.            142
    ##  6 South Africa                      75.6              10438.            138
    ##  7 Israel                            65.4               9314.            142
    ##  8 Bolivia                           63.3               7921.            125
    ##  9 Sweden                            56.0               8416.            150
    ## 10 Belarus                           55.7               7028.            126
    ## 11 Dominican Republic                55.1               7354.            133
    ## 12 Kyrgyzstan                        53.3               6740.            126
    ## 13 Colombia                          46.7               6407.            137
    ## 14 Kazakhstan                        46.4               6041.            130
    ## 15 Belgium                           44.6               6705.            150
    ## 16 Russia                            44.1               6086.            138
    ## 17 Ecuador                           42.2               5830.            138
    ## 18 Honduras                          42.0               5343.            127
    ## 19 Spain                             40.3               6204.            154
    ## 20 Argentina                         34.9               4754.            136

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  28.7         498     1738
    ##  2 France                 17.1       30147   175920
    ##  3 United Kingdom         15.2       46201   304699
    ##  4 Italy                  14.2       35154   248070
    ##  5 Belgium                14.1        9845    69756
    ##  6 Hungary                13.2         597     4535
    ##  7 Netherlands            11.2        6148    55043
    ##  8 Mexico                 10.9       47472   434193
    ##  9 Spain                   9.86      28445   288522
    ## 10 Chad                    8.01         75      936
    ## 11 Canada                  7.67       8941   116599
    ## 12 Sweden                  7.14       5743    80422
    ## 13 Ecuador                 6.65       5736    86232
    ## 14 Sudan                   6.41        752    11738
    ## 15 Niger                   6.06         69     1138
    ## 16 Iran                    5.56      17190   309437
    ## 17 Syria                   5.44         44      809
    ## 18 China                   5.29       4677    88460
    ## 19 Egypt                   5.15       4865    94483
    ## 20 Mali                    4.89        124     2535

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                 946.       9845   10.4 
    ##  2 United Kingdom          741.      46201   62.3 
    ##  3 Peru                    649.      19408   29.9 
    ##  4 Spain                   612.      28445   46.5 
    ##  5 Sweden                  601.       5743    9.56
    ##  6 Italy                   583.      35154   60.3 
    ##  7 Chile                   574.       9608   16.7 
    ##  8 United States           496.     153757  310.  
    ##  9 France                  465.      30147   64.8 
    ## 10 Brazil                  465.      93563  201.  
    ## 11 Mexico                  422.      47472  112.  
    ## 12 Ecuador                 388.       5736   14.8 
    ## 13 Netherlands             369.       6148   16.6 
    ## 14 Bolivia                 308.       3064    9.95
    ## 15 Canada                  265.       8941   33.7 
    ## 16 Kyrgyzstan              258.       1420    5.51
    ## 17 Switzerland             225.       1706    7.58
    ## 18 Iran                    223.      17190   76.9 
    ## 19 Colombia                216.      10330   47.8 
    ## 20 Honduras                171.       1368    7.99

EOL
