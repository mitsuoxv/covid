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

Updated: 2020-05-28

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

![](README_files/figure-gfm/chart-1.png)<!-- -->

## Fastest spreading areas

Among areas with more than 10 million population, highest
“speed\_since\_100”, which is average number of newly confirmed cases
per day since cumulative cases became more than 100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_since_100 cum_conf days_since_100
    ##    <chr>                    <dbl>    <dbl>          <int>
    ##  1 United States           19222.  1634010             85
    ##  2 Russia                   5293.   370680             70
    ##  3 Brazil                   5065.   374898             74
    ##  4 United Kingdom           3194.   265231             83
    ##  5 Spain                    2750.   236631             86
    ##  6 Italy                    2451.   230555             94
    ##  7 Turkey                   2265.   158762             70
    ##  8 Germany                  2060.   179364             87
    ##  9 India                    2049.   151767             74
    ## 10 Peru                     1769.   123979             70
    ## 11 France                   1657.   142704             86
    ## 12 Iran                     1532.   139511             91
    ## 13 Canada                   1130.    85998             76
    ## 14 Chile                    1081.    77961             72
    ## 15 Saudi Arabia             1035.    76726             74
    ## 16 Mexico                   1029.    71105             69
    ## 17 Pakistan                  819.    59151             72
    ## 18 Bangladesh                718.    36751             51
    ## 19 Belgium                   699.    57455             82
    ## 20 China                     658.    84544            128

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Belgium                       67.2               5523.             82
    ##  2 Chile                         64.5               4655.             72
    ##  3 United States                 62.0               5267.             85
    ##  4 Peru                          59.2               4145.             70
    ##  5 Spain                         59.1               5088.             86
    ##  6 United Kingdom                51.2               4254.             83
    ##  7 Italy                         40.6               3821.             94
    ##  8 Saudi Arabia                  40.2               2982.             74
    ##  9 Portugal                      38.6               2904.             75
    ## 10 Russia                        37.6               2635.             70
    ## 11 Ecuador                       35.9               2526.             70
    ## 12 Canada                        33.5               2553.             76
    ## 13 Netherlands                   33.3               2738.             82
    ## 14 Turkey                        29.1               2041.             70
    ## 15 France                        25.6               2203.             86
    ## 16 Germany                       25.2               2193.             87
    ## 17 Brazil                        25.2               1864.             74
    ## 18 Iran                          19.9               1814.             91
    ## 19 Romania                       11.3                839.             74
    ## 20 Czech Republic                11.2                864.             76

## Highest fatality rate areas

Among areas with more than 10 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 France                 20.0       28477   142704
    ##  2 Yemen                  19.8          50      253
    ##  3 Belgium                16.2        9334    57455
    ##  4 Italy                  14.3       32955   230555
    ##  5 United Kingdom         14.0       37048   265231
    ##  6 Netherlands            12.8        5856    45578
    ##  7 Spain                  12.3       29035   236631
    ##  8 Mexico                 10.7        7633    71105
    ##  9 Chad                    8.86         62      700
    ## 10 Ecuador                 8.57       3203    37355
    ## 11 Canada                  7.64       6566    85998
    ## 12 Algeria                 7.09        617     8697
    ## 13 Niger                   6.62         63      952
    ## 14 Romania                 6.57       1210    18429
    ## 15 Mali                    6.50         70     1077
    ## 16 Burkina Faso            6.27         53      845
    ## 17 Brazil                  6.26      23473   374898
    ## 18 Indonesia               6.12       1418    23165
    ## 19 Philippines             6.04        886    14669
    ## 20 Greece                  5.98        173     2892

## Highest deaths per population areas

Among areas with more than 10 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                897.        9334    10.4
    ##  2 Spain                  624.       29035    46.5
    ##  3 United Kingdom         594.       37048    62.3
    ##  4 Italy                  546.       32955    60.3
    ##  5 France                 440.       28477    64.8
    ##  6 Netherlands            352.        5856    16.6
    ##  7 United States          314.       97529   310. 
    ##  8 Ecuador                217.        3203    14.8
    ##  9 Canada                 195.        6566    33.7
    ## 10 Portugal               126.        1342    10.7
    ## 11 Peru                   121.        3629    29.9
    ## 12 Brazil                 117.       23473   201. 
    ## 13 Germany                102.        8349    81.8
    ## 14 Iran                    97.6       7508    76.9
    ## 15 Mexico                  67.9       7633   112. 
    ## 16 Turkey                  56.5       4397    77.8
    ## 17 Romania                 55.1       1210    22.0
    ## 18 Chile                   48.1        806    16.7
    ## 19 Czech Republic          30.3        317    10.5
    ## 20 Russia                  28.2       3968   141.

EOL
