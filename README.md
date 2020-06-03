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

Updated: 2020-06-04

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

Among areas with more than 5 million population, highest
“speed\_since\_100”, which is average number of newly confirmed cases
per day since cumulative cases became more than 100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_since_100 cum_conf days_since_100
    ##    <chr>                    <dbl>    <dbl>          <int>
    ##  1 United States           19546.  1798330             92
    ##  2 Brazil                   6498.   526447             81
    ##  3 Russia                   5612.   432277             77
    ##  4 United Kingdom           3087.   277989             90
    ##  5 Spain                    2583.   240304             93
    ##  6 India                    2562.   207615             81
    ##  7 Italy                    2311.   233515            101
    ##  8 Peru                     2206.   170039             77
    ##  9 Turkey                   2148.   165555             77
    ## 10 Germany                  1939.   182370             94
    ## 11 Iran                     1606.   157562             98
    ## 12 France                   1589.   147935             93
    ## 13 Chile                    1374.   108686             79
    ## 14 Mexico                   1228.    93435             76
    ## 15 Canada                   1109.    92151             83
    ## 16 Saudi Arabia             1098.    89011             81
    ## 17 Pakistan                 1016.    80463             79
    ## 18 Bangladesh                902.    52445             58
    ## 19 Belarus                   679.    44255             65
    ## 20 Belgium                   657.    58615             89

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                             82.0               6490.             79
    ##  2 Peru                              73.8               5686.             77
    ##  3 Belarus                           70.1               4569.             65
    ##  4 Belgium                           63.2               5634.             89
    ##  5 United States                     63.0               5797.             92
    ##  6 Spain                             55.5               5167.             93
    ##  7 United Kingdom                    49.5               4459.             90
    ##  8 Switzerland                       45.3               4062.             89
    ##  9 Sweden                            45.2               4038.             89
    ## 10 Saudi Arabia                      42.7               3459.             81
    ## 11 Russia                            39.9               3072.             77
    ## 12 Italy                             38.3               3870.            101
    ## 13 Portugal                          37.4               3081.             82
    ## 14 Ecuador                           35.3               2732.             77
    ## 15 Canada                            32.9               2736.             83
    ## 16 Brazil                            32.3               2618.             81
    ## 17 Netherlands                       31.4               2802.             89
    ## 18 Israel                            28.4               2321.             81
    ## 19 Turkey                            27.6               2128.             77
    ## 20 Dominican Republic                24.8               1807.             72

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  21.8          88      403
    ##  2 France                 19.5       28883   147935
    ##  3 Belgium                16.2        9505    58615
    ##  4 Italy                  14.4       33530   233515
    ##  5 United Kingdom         14.2       39369   277989
    ##  6 Hungary                13.6         534     3931
    ##  7 Netherlands            12.8        5967    46647
    ##  8 Spain                  12.4       29858   240304
    ##  9 Sweden                 11.6        4468    38589
    ## 10 Mexico                 10.9       10167    93435
    ## 11 Ecuador                 8.51       3438    40414
    ## 12 Chad                    8.22         66      803
    ## 13 Canada                  7.97       7344    92151
    ## 14 Algeria                 6.93        667     9626
    ## 15 Niger                   6.77         65      960
    ## 16 Romania                 6.55       1279    19517
    ## 17 Greece                  6.13        179     2918
    ## 18 Indonesia               6.04       1663    27549
    ## 19 Burkina Faso            6.00         53      884
    ## 20 United States           5.84     105008  1798330

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                914.        9505   10.4 
    ##  2 Spain                  642.       29858   46.5 
    ##  3 United Kingdom         631.       39369   62.3 
    ##  4 Italy                  556.       33530   60.3 
    ##  5 Sweden                 468.        4468    9.56
    ##  6 France                 446.       28883   64.8 
    ##  7 Netherlands            358.        5967   16.6 
    ##  8 United States          338.      105008  310.  
    ##  9 Ecuador                232.        3438   14.8 
    ## 10 Switzerland            218.        1656    7.58
    ## 11 Canada                 218.        7344   33.7 
    ## 12 Peru                   155.        4634   29.9 
    ## 13 Brazil                 149.       29937  201.  
    ## 14 Portugal               135.        1436   10.7 
    ## 15 Denmark                106.         580    5.48
    ## 16 Germany                105.        8551   81.8 
    ## 17 Iran                   103.        7942   76.9 
    ## 18 Mexico                  90.4      10167  112.  
    ## 19 Austria                 81.5        669    8.20
    ## 20 Chile                   70.9       1188   16.7

EOL
