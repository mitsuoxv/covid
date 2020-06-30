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

Updated: 2020-07-01

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
    ##  1 United States           21324.  2537636            119
    ##  2 Brazil                  12445.  1344143            108
    ##  3 Russia                   6228.   647849            104
    ##  4 India                    5248.   566840            108
    ##  5 Peru                     2685.   279419            104
    ##  6 United Kingdom           2665.   311969            117
    ##  7 Chile                    2602.   275999            106
    ##  8 Mexico                   2104.   216852            103
    ##  9 Spain                    2074.   248970            120
    ## 10 Pakistan                 1973.   209337            106
    ## 11 Turkey                   1908.   198613            104
    ## 12 Italy                    1877.   240436            128
    ## 13 Iran                     1801.   225205            125
    ## 14 Saudi Arabia             1725.   186436            108
    ## 15 Bangladesh               1667.   141801             85
    ## 16 Germany                  1604.   194259            121
    ## 17 South Africa             1386.   144264            104
    ## 18 France                   1306.   156930            120
    ## 19 Canada                    937.   103250            110
    ## 20 Colombia                  890.    91769            103

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            155.               16481.            106
    ##  2 Peru                              89.8               9343.            104
    ##  3 Belarus                           69.2               6380.             92
    ##  4 United States                     68.7               8180.            119
    ##  5 Saudi Arabia                      67.0               7245.            108
    ##  6 Brazil                            61.9               6684.            108
    ##  7 Sweden                            60.9               7081.            116
    ##  8 Belgium                           50.8               5905.            116
    ##  9 Spain                             44.6               5354.            120
    ## 10 Russia                            44.3               4604.            104
    ## 11 United Kingdom                    42.7               5004.            117
    ## 12 Ecuador                           36.1               3764.            104
    ## 13 Portugal                          35.9               3926.            109
    ## 14 Switzerland                       35.7               4164.            116
    ## 15 Bolivia                           34.7               3169.             91
    ## 16 Dominican Republic                32.5               3239.             99
    ## 17 Italy                             31.1               3985.            128
    ## 18 Israel                            29.8               3240.            108
    ## 19 South Africa                      28.3               2944.            104
    ## 20 Canada                            27.8               3066.            110

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  26.9         305     1132
    ##  2 France                 18.9       29730   156930
    ##  3 Belgium                15.9        9747    61427
    ##  4 Italy                  14.5       34744   240436
    ##  5 Hungary                14.1         585     4145
    ##  6 United Kingdom         14.0       43575   311969
    ##  7 Mexico                 12.3       26648   216852
    ##  8 Netherlands            12.2        6107    50223
    ##  9 Spain                  11.4       28346   248970
    ## 10 Chad                    8.55         74      866
    ## 11 Canada                  8.25       8522   103250
    ## 12 Ecuador                 8.09       4502    55665
    ## 13 Sweden                  7.85       5310    67667
    ## 14 Algeria                 6.67        905    13571
    ## 15 Niger                   6.23         67     1075
    ## 16 Sudan                   6.18        572     9258
    ## 17 Romania                 6.15       1634    26582
    ## 18 Greece                  5.63        191     3390
    ## 19 Burkina Faso            5.53         53      959
    ## 20 China                   5.45       4648    85227

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                 937.       9747   10.4 
    ##  2 United Kingdom          699.      43575   62.3 
    ##  3 Spain                   610.      28346   46.5 
    ##  4 Italy                   576.      34744   60.3 
    ##  5 Sweden                  556.       5310    9.56
    ##  6 France                  459.      29730   64.8 
    ##  7 United States           407.     126203  310.  
    ##  8 Netherlands             367.       6107   16.6 
    ##  9 Chile                   333.       5575   16.7 
    ## 10 Peru                    312.       9317   29.9 
    ## 11 Ecuador                 304.       4502   14.8 
    ## 12 Brazil                  287.      57622  201.  
    ## 13 Canada                  253.       8522   33.7 
    ## 14 Mexico                  237.      26648  112.  
    ## 15 Switzerland             222.       1681    7.58
    ## 16 Portugal                147.       1568   10.7 
    ## 17 Iran                    139.      10670   76.9 
    ## 18 Denmark                 110.        605    5.48
    ## 19 Germany                 110.       8973   81.8 
    ## 20 Bolivia                 102.       1014    9.95

EOL
