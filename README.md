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

Updated: 2020-06-07

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
    ##  1 United States           19555.  1857872             95
    ##  2 Brazil                   7319.   614941             84
    ##  3 Russia                   5732.   458689             80
    ##  4 United Kingdom           3045.   283315             93
    ##  5 India                    2816.   236657             84
    ##  6 Spain                    2509    240978             96
    ##  7 Peru                     2288.   183198             80
    ##  8 Italy                    2254.   234531            104
    ##  9 Turkey                   2102.   168340             80
    ## 10 Germany                  1892.   183678             97
    ## 11 Iran                     1654.   167156            101
    ## 12 France                   1555.   149495             96
    ## 13 Chile                    1492.   122499             82
    ## 14 Mexico                   1336.   105680             79
    ## 15 Pakistan                 1144.    93983             82
    ## 16 Saudi Arabia             1139.    95748             84
    ## 17 Canada                   1092.    94070             86
    ## 18 Bangladesh                988     60391             61
    ## 19 Belarus                   687     46868             68
    ## 20 Belgium                   639.    58907             92

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                             89.1               7315.             82
    ##  2 Peru                              76.5               6126.             80
    ##  3 Belarus                           70.9               4839.             68
    ##  4 United States                     63.0               5989.             95
    ##  5 Belgium                           61.4               5663.             92
    ##  6 Spain                             54.0               5182.             96
    ##  7 United Kingdom                    48.8               4544.             93
    ##  8 Sweden                            48.7               4493.             92
    ##  9 Saudi Arabia                      44.2               3721.             84
    ## 10 Switzerland                       43.9               4070.             92
    ## 11 Russia                            40.7               3260.             80
    ## 12 Italy                             37.4               3887.            104
    ## 13 Portugal                          37.3               3182.             85
    ## 14 Brazil                            36.4               3058.             84
    ## 15 Ecuador                           35.5               2847.             80
    ## 16 Canada                            32.4               2793.             86
    ## 17 Netherlands                       30.7               2833.             92
    ## 18 Israel                            28.1               2388.             84
    ## 19 Turkey                            27.0               2164.             80
    ## 20 Dominican Republic                25.1               1904.             75

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  23.7         112      473
    ##  2 France                 19.4       29053   149495
    ##  3 Belgium                16.2        9566    58907
    ##  4 Italy                  14.4       33774   234531
    ##  5 United Kingdom         14.2       40261   283315
    ##  6 Hungary                13.7         542     3970
    ##  7 Netherlands            12.7        6005    47152
    ##  8 Mexico                 11.9       12545   105680
    ##  9 Spain                  11.3       27134   240978
    ## 10 Sweden                 10.8        4639    42939
    ## 11 Ecuador                 8.53       3592    42106
    ## 12 Canada                  8.13       7652    94070
    ## 13 Chad                    8.13         68      836
    ## 14 Algeria                 6.95        690     9935
    ## 15 Niger                   6.73         65      966
    ## 16 Romania                 6.51       1308    20103
    ## 17 Greece                  6.09        179     2937
    ## 18 Bulgaria                6.00        160     2668
    ## 19 Indonesia               6.00       1770    29521
    ## 20 Burkina Faso            5.99         53      885

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                920.        9566   10.4 
    ##  2 United Kingdom         646.       40261   62.3 
    ##  3 Spain                  583.       27134   46.5 
    ##  4 Italy                  560.       33774   60.3 
    ##  5 Sweden                 485.        4639    9.56
    ##  6 France                 449.       29053   64.8 
    ##  7 Netherlands            361.        6005   16.6 
    ##  8 United States          348.      107911  310.  
    ##  9 Ecuador                243.        3592   14.8 
    ## 10 Canada                 227.        7652   33.7 
    ## 11 Switzerland            219.        1659    7.58
    ## 12 Brazil                 169.       34021  201.  
    ## 13 Peru                   168.        5031   29.9 
    ## 14 Portugal               137.        1465   10.7 
    ## 15 Mexico                 112.       12545  112.  
    ## 16 Denmark                107.         586    5.48
    ## 17 Iran                   106.        8134   76.9 
    ## 18 Germany                106.        8646   81.8 
    ## 19 Chile                   86.5       1448   16.7 
    ## 20 Austria                 81.9        672    8.20

EOL
