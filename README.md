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

Updated: 2020-05-31

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
    ##  1 United States           19259.  1694864             88
    ##  2 Brazil                   5690.   438238             77
    ##  3 Russia                   5431.   396575             73
    ##  4 United Kingdom           3152.   271226             86
    ##  5 Spain                    2683.   238936             89
    ##  6 Italy                    2393.   232248             97
    ##  7 India                    2255.   173763             77
    ##  8 Turkey                   2218.   162120             73
    ##  9 Germany                  2012.   181196             90
    ## 10 Peru                     1940.   141779             73
    ## 11 France                   1646.   146657             89
    ## 12 Iran                     1559.   146668             94
    ## 13 Chile                    1206.    90638             75
    ## 14 Mexico                   1129.    81400             72
    ## 15 Canada                   1123.    88856             79
    ## 16 Saudi Arabia             1061.    81766             77
    ## 17 Pakistan                  884.    66457             75
    ## 18 Bangladesh                791.    42844             54
    ## 19 Belgium                   682.    58061             85
    ## 20 China                     643.    84565            131

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Chile                         72.0               5412.             75
    ##  2 Belgium                       65.5               5581.             85
    ##  3 Peru                          64.9               4741.             73
    ##  4 United States                 62.1               5463.             88
    ##  5 Spain                         57.7               5138.             89
    ##  6 United Kingdom                50.6               4350.             86
    ##  7 Saudi Arabia                  41.2               3178.             77
    ##  8 Italy                         39.7               3849.             97
    ##  9 Russia                        38.6               2819.             73
    ## 10 Portugal                      38.2               2992.             78
    ## 11 Ecuador                       35.6               2608.             73
    ## 12 Canada                        33.3               2638.             79
    ## 13 Netherlands                   32.5               2771.             85
    ## 14 Turkey                        28.5               2084.             73
    ## 15 Brazil                        28.3               2179.             77
    ## 16 France                        25.4               2264.             89
    ## 17 Germany                       24.6               2215.             90
    ## 18 Iran                          20.3               1907.             94
    ## 19 Romania                       11.2                864.             77
    ## 20 Czech Republic                11.0                878.             79

## Highest fatality rate areas

Among areas with more than 10 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  23.0          66      287
    ##  2 France                 19.5       28660   146657
    ##  3 Belgium                16.3        9443    58061
    ##  4 Italy                  14.3       33229   232248
    ##  5 United Kingdom         14.1       38161   271226
    ##  6 Netherlands            12.9        5931    46126
    ##  7 Spain                  12.2       29039   238936
    ##  8 Mexico                 11.1        9044    81400
    ##  9 Ecuador                 8.64       3334    38571
    ## 10 Chad                    8.56         65      759
    ## 11 Canada                  7.79       6918    88856
    ## 12 Algeria                 6.98        638     9134
    ## 13 Niger                   6.70         64      955
    ## 14 Romania                 6.53       1240    18982
    ## 15 Burkina Faso            6.26         53      847
    ## 16 Brazil                  6.10      26754   438238
    ## 17 Indonesia               6.03       1520    25216
    ## 18 Greece                  6.02        175     2909
    ## 19 Mali                    5.95         73     1226
    ## 20 United States           5.92     100304  1694864

## Highest deaths per population areas

Among areas with more than 10 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                908.        9443    10.4
    ##  2 Spain                  624.       29039    46.5
    ##  3 United Kingdom         612.       38161    62.3
    ##  4 Italy                  551.       33229    60.3
    ##  5 France                 442.       28660    64.8
    ##  6 Netherlands            356.        5931    16.6
    ##  7 United States          323.      100304   310. 
    ##  8 Ecuador                225.        3334    14.8
    ##  9 Canada                 205.        6918    33.7
    ## 10 Peru                   137.        4099    29.9
    ## 11 Brazil                 133.       26754   201. 
    ## 12 Portugal               130.        1383    10.7
    ## 13 Germany                104.        8489    81.8
    ## 14 Iran                    99.8       7677    76.9
    ## 15 Mexico                  80.4       9044   112. 
    ## 16 Turkey                  57.7       4489    77.8
    ## 17 Romania                 56.5       1240    22.0
    ## 18 Chile                   56.4        944    16.7
    ## 19 Russia                  32.4       4555   141. 
    ## 20 Czech Republic          30.5        319    10.5

EOL
