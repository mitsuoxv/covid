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

Updated: 2020-06-01

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
    ##  1 United States           19281.  1716078             89
    ##  2 Brazil                   5962.   465166             78
    ##  3 Russia                   5482.   405843             74
    ##  4 United Kingdom           3135.   272830             87
    ##  5 Spain                    2661.   239600             90
    ##  6 Italy                    2373.   232664             98
    ##  7 India                    2334.   182143             78
    ##  8 Turkey                   2202.   163103             74
    ##  9 Peru                     2002.   148285             74
    ## 10 Germany                  1993.   181482             91
    ## 11 France                   1647.   148436             90
    ## 12 Iran                     1566.   148950             95
    ## 13 Chile                    1246.    94858             76
    ## 14 Mexico                   1158.    84627             73
    ## 15 Canada                   1120.    89741             80
    ## 16 Saudi Arabia             1068.    83384             78
    ## 17 Pakistan                  912.    69496             76
    ## 18 Bangladesh                809.    44608             55
    ## 19 Belgium                   675.    58186             86
    ## 20 China                     639.    84570            132

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Chile                         74.4               5664.             76
    ##  2 Peru                          66.9               4958.             74
    ##  3 Belgium                       64.9               5593.             86
    ##  4 United States                 62.1               5532.             89
    ##  5 Spain                         57.2               5152.             90
    ##  6 United Kingdom                50.3               4376.             87
    ##  7 Saudi Arabia                  41.5               3241.             78
    ##  8 Italy                         39.3               3856.             98
    ##  9 Russia                        39.0               2884.             74
    ## 10 Portugal                      38.0               3016.             79
    ## 11 Ecuador                       35.1               2608.             74
    ## 12 Canada                        33.3               2665.             80
    ## 13 Netherlands                   32.2               2779.             86
    ## 14 Brazil                        29.6               2313.             78
    ## 15 Turkey                        28.3               2096.             74
    ## 16 France                        25.4               2292.             90
    ## 17 Germany                       24.4               2219.             91
    ## 18 Iran                          20.4               1936.             95
    ## 19 Romania                       11.1                871.             78
    ## 20 Czech Republic                10.9                881.             80

## Highest fatality rate areas

Among areas with more than 10 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  24.8          78      314
    ##  2 France                 19.3       28717   148436
    ##  3 Belgium                16.2        9453    58186
    ##  4 Italy                  14.3       33340   232664
    ##  5 United Kingdom         14.1       38376   272830
    ##  6 Netherlands            12.9        5951    46257
    ##  7 Spain                  12.1       29043   239600
    ##  8 Mexico                 11.1        9415    84627
    ##  9 Ecuador                 8.64       3334    38571
    ## 10 Chad                    8.56         65      759
    ## 11 Canada                  7.80       6996    89741
    ## 12 Algeria                 6.97        646     9267
    ## 13 Niger                   6.69         64      956
    ## 14 Romania                 6.55       1253    19133
    ## 15 Burkina Faso            6.21         53      853
    ## 16 Indonesia               6.10       1573    25773
    ## 17 Mali                    6.08         76     1250
    ## 18 Greece                  6.00        175     2915
    ## 19 Brazil                  5.99      27878   465166
    ## 20 United States           5.92     101567  1716078

## Highest deaths per population areas

Among areas with more than 10 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                909.        9453    10.4
    ##  2 Spain                  625.       29043    46.5
    ##  3 United Kingdom         616.       38376    62.3
    ##  4 Italy                  553.       33340    60.3
    ##  5 France                 443.       28717    64.8
    ##  6 Netherlands            358.        5951    16.6
    ##  7 United States          327.      101567   310. 
    ##  8 Ecuador                225.        3334    14.8
    ##  9 Canada                 208.        6996    33.7
    ## 10 Peru                   141.        4230    29.9
    ## 11 Brazil                 139.       27878   201. 
    ## 12 Portugal               131.        1396    10.7
    ## 13 Germany                104.        8500    81.8
    ## 14 Iran                   101.        7734    76.9
    ## 15 Mexico                  83.7       9415   112. 
    ## 16 Chile                   59.5        997    16.7
    ## 17 Turkey                  58.0       4515    77.8
    ## 18 Romania                 57.1       1253    22.0
    ## 19 Russia                  33.4       4693   141. 
    ## 20 Czech Republic          30.5        319    10.5

EOL
