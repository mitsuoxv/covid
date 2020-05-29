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

Updated: 2020-05-30

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
    ##  1 United States           19255.  1675258             87
    ##  2 Brazil                   5417.   411821             76
    ##  3 Russia                   5382.   387623             72
    ##  4 United Kingdom           3165.   269131             85
    ##  5 Spain                    2706.   238278             88
    ##  6 Italy                    2413.   231732             96
    ##  7 Turkey                   2233.   160979             72
    ##  8 India                    2180.   165799             76
    ##  9 Germany                  2026.   180458             89
    ## 10 Peru                     1886.   135905             72
    ## 11 France                   1658.   146122             88
    ## 12 Iran                     1545.   143849             93
    ## 13 Chile                    1173.    86943             74
    ## 14 Canada                   1125.    87902             78
    ## 15 Mexico                   1097.    78023             71
    ## 16 Saudi Arabia             1054.    80185             76
    ## 17 Pakistan                  863.    64028             74
    ## 18 Bangladesh                758.    40321             53
    ## 19 Belgium                   687.    57849             84
    ## 20 China                     648.    84547            130

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Chile                         70.0               5192.             74
    ##  2 Belgium                       66.1               5561.             84
    ##  3 Peru                          63.0               4544.             72
    ##  4 United States                 62.1               5400.             87
    ##  5 Spain                         58.2               5124.             88
    ##  6 United Kingdom                50.8               4317.             85
    ##  7 Saudi Arabia                  40.9               3116.             76
    ##  8 Italy                         40.0               3840.             96
    ##  9 Portugal                      38.3               2960.             77
    ## 10 Russia                        38.2               2755.             72
    ## 11 Ecuador                       36.0               2601.             72
    ## 12 Canada                        33.4               2610.             78
    ## 13 Netherlands                   32.8               2761.             84
    ## 14 Turkey                        28.7               2069.             72
    ## 15 Brazil                        26.9               2048.             76
    ## 16 France                        25.6               2256.             88
    ## 17 Germany                       24.8               2206.             89
    ## 18 Iran                          20.1               1870.             93
    ## 19 Romania                       11.2                856.             76
    ## 20 Czech Republic                11.0                872.             78

## Highest fatality rate areas

Among areas with more than 10 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  21.6          61      282
    ##  2 France                 19.6       28608   146122
    ##  3 Belgium                16.2        9388    57849
    ##  4 Italy                  14.3       33142   231732
    ##  5 United Kingdom         14.1       37837   269131
    ##  6 Netherlands            12.8        5903    45950
    ##  7 Spain                  12.2       29037   238278
    ##  8 Mexico                 11.0        8597    78023
    ##  9 Chad                    8.95         65      726
    ## 10 Ecuador                 8.61       3313    38471
    ## 11 Canada                  7.73       6799    87902
    ## 12 Algeria                 7.00        630     8997
    ## 13 Niger                   6.70         64      955
    ## 14 Romania                 6.54       1229    18791
    ## 15 Burkina Faso            6.26         53      847
    ## 16 Brazil                  6.22      25598   411821
    ## 17 Indonesia               6.10       1496    24538
    ## 18 Mali                    6.03         72     1194
    ## 19 Greece                  6.02        175     2906
    ## 20 Philippines             5.91        921    15588

## Highest deaths per population areas

Among areas with more than 10 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                902.        9388    10.4
    ##  2 Spain                  624.       29037    46.5
    ##  3 United Kingdom         607.       37837    62.3
    ##  4 Italy                  549.       33142    60.3
    ##  5 France                 442.       28608    64.8
    ##  6 Netherlands            355.        5903    16.6
    ##  7 United States          319.       98889   310. 
    ##  8 Ecuador                224.        3313    14.8
    ##  9 Canada                 202.        6799    33.7
    ## 10 Peru                   133.        3983    29.9
    ## 11 Portugal               128.        1369    10.7
    ## 12 Brazil                 127.       25598   201. 
    ## 13 Germany                103.        8450    81.8
    ## 14 Iran                    99.2       7627    76.9
    ## 15 Mexico                  76.4       8597   112. 
    ## 16 Turkey                  57.3       4461    77.8
    ## 17 Romania                 56.0       1229    22.0
    ## 18 Chile                   53.1        890    16.7
    ## 19 Russia                  31.1       4374   141. 
    ## 20 Czech Republic          30.5        319    10.5

EOL
