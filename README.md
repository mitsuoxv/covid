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

Updated: 2020-07-03

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
    ##  1 United States           21627.  2616949            121
    ##  2 Brazil                  12745.  1402041            110
    ##  3 Russia                   6236.   661165            106
    ##  4 India                    5496.   604641            110
    ##  5 Peru                     2689.   285213            106
    ##  6 United Kingdom           2633.   313487            119
    ##  7 Chile                    2610.   282043            108
    ##  8 Mexico                   2152.   226089            105
    ##  9 Spain                    2045.   249659            122
    ## 10 Pakistan                 2015.   217809            108
    ## 11 Turkey                   1895.   201098            106
    ## 12 Italy                    1851.   240760            130
    ## 13 Iran                     1812.   230211            127
    ## 14 Saudi Arabia             1765.   194225            110
    ## 15 Bangladesh               1714.   149258             87
    ## 16 Germany                  1582.   194725            123
    ## 17 South Africa             1502.   159333            106
    ## 18 France                   1292.   157806            122
    ## 19 Colombia                  931.    97846            105
    ## 20 Canada                    929.   104204            112

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            156.               16842.            108
    ##  2 Peru                              89.9               9537.            106
    ##  3 United States                     69.7               8435.            121
    ##  4 Saudi Arabia                      68.6               7548.            110
    ##  5 Belarus                           68.4               6445.             94
    ##  6 Brazil                            63.4               6972.            110
    ##  7 Sweden                            61.7               7293.            118
    ##  8 Belgium                           50.1               5921.            118
    ##  9 Russia                            44.3               4699.            106
    ## 10 Spain                             44.0               5368.            122
    ## 11 United Kingdom                    42.2               5028.            119
    ## 12 Ecuador                           35.8               3809.            106
    ## 13 Bolivia                           35.8               3339.             93
    ## 14 Portugal                          35.7               3977.            111
    ## 15 Switzerland                       35.4               4201.            118
    ## 16 Dominican Republic                33.4               3399.            101
    ## 17 Israel                            31.2               3452.            110
    ## 18 Italy                             30.7               3990.            130
    ## 19 South Africa                      30.7               3252.            106
    ## 20 Kazakhstan                        28.2               2775.             98

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  26.7         319     1194
    ##  2 France                 18.9       29777   157806
    ##  3 Belgium                15.8        9761    61598
    ##  4 Italy                  14.4       34788   240760
    ##  5 Hungary                14.1         586     4157
    ##  6 United Kingdom         14.0       43906   313487
    ##  7 Mexico                 12.3       27769   226089
    ##  8 Netherlands            12.1        6115    50335
    ##  9 Spain                  11.4       28363   249659
    ## 10 Chad                    8.55         74      866
    ## 11 Canada                  8.24       8591   104204
    ## 12 Ecuador                 8.03       4527    56342
    ## 13 Sweden                  7.71       5370    69692
    ## 14 Algeria                 6.45        920    14272
    ## 15 Sudan                   6.29        602     9574
    ## 16 Niger                   6.23         67     1075
    ## 17 Romania                 6.11       1667    27296
    ## 18 Greece                  5.59        192     3432
    ## 19 Burkina Faso            5.51         53      962
    ## 20 China                   5.45       4648    85263

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                 938.       9761   10.4 
    ##  2 United Kingdom          704.      43906   62.3 
    ##  3 Spain                   610.      28363   46.5 
    ##  4 Italy                   577.      34788   60.3 
    ##  5 Sweden                  562.       5370    9.56
    ##  6 France                  460.      29777   64.8 
    ##  7 United States           410.     127133  310.  
    ##  8 Netherlands             367.       6115   16.6 
    ##  9 Chile                   344.       5753   16.7 
    ## 10 Peru                    324.       9677   29.9 
    ## 11 Ecuador                 306.       4527   14.8 
    ## 12 Brazil                  296.      59594  201.  
    ## 13 Canada                  255.       8591   33.7 
    ## 14 Mexico                  247.      27769  112.  
    ## 15 Switzerland             222.       1684    7.58
    ## 16 Portugal                148.       1579   10.7 
    ## 17 Iran                    142.      10958   76.9 
    ## 18 Bolivia                 113.       1123    9.95
    ## 19 Denmark                 111.        606    5.48
    ## 20 Germany                 110.       8985   81.8

EOL
