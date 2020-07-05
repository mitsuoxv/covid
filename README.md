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

Updated: 2020-07-06

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
    ##  1 United States           22389.  2776366            124
    ##  2 Brazil                  13619.  1539081            113
    ##  3 Russia                   6249.   681251            109
    ##  4 India                    5956.   673165            113
    ##  5 Peru                     2711.   295599            109
    ##  6 Chile                    2628.   291847            111
    ##  7 United Kingdom           2334.   284904            122
    ##  8 Mexico                   2270.   245251            108
    ##  9 Pakistan                 2057.   228474            111
    ## 10 Spain                    2003.   250545            125
    ## 11 Turkey                   1875.   204610            109
    ## 12 Iran                     1829.   237878            130
    ## 13 Saudi Arabia             1821.   205929            113
    ## 14 Italy                    1814.   241419            133
    ## 15 Bangladesh               1773.   159679             90
    ## 16 South Africa             1723.   187977            109
    ## 17 Germany                  1557.   196335            126
    ## 18 France                   1268.   158734            125
    ## 19 Colombia                 1013.   109505            108
    ## 20 Canada                    913.   105091            115

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            157.               17427.            111
    ##  2 Peru                              90.6               9884.            109
    ##  3 United States                     72.2               8949.            124
    ##  4 Saudi Arabia                      70.8               8003.            113
    ##  5 Brazil                            67.7               7653.            113
    ##  6 Belarus                           67.2               6533.             97
    ##  7 Sweden                            61.6               7474.            121
    ##  8 Belgium                           49.1               5951.            121
    ##  9 Russia                            44.4               4842.            109
    ## 10 Spain                             43.1               5387.            125
    ## 11 Bolivia                           38.4               3701.             96
    ## 12 Ecuador                           38.1               4160.            109
    ## 13 United Kingdom                    37.4               4570.            122
    ## 14 Portugal                          35.7               4081.            114
    ## 15 Dominican Republic                35.2               3683.            104
    ## 16 South Africa                      35.2               3836.            109
    ## 17 Switzerland                       34.8               4236.            121
    ## 18 Israel                            34.0               3866.            113
    ## 19 Kazakhstan                        30.4               3075.            101
    ## 20 Italy                             30.1               4001.            133

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  27.0         338     1252
    ##  2 France                 18.8       29808   158734
    ##  3 Belgium                15.8        9771    61909
    ##  4 United Kingdom         15.5       44198   284904
    ##  5 Italy                  14.4       34854   241419
    ##  6 Hungary                14.1         589     4183
    ##  7 Mexico                 12.2       29843   245251
    ##  8 Netherlands            12.1        6117    50493
    ##  9 Spain                  11.3       28385   250545
    ## 10 Chad                    8.50         74      871
    ## 11 Canada                  8.24       8663   105091
    ## 12 Ecuador                 7.75       4769    61535
    ## 13 Sweden                  7.59       5420    71419
    ## 14 Niger                   6.28         68     1082
    ## 15 Sudan                   6.23        608     9767
    ## 16 Algeria                 6.10        946    15500
    ## 17 Romania                 6.06       1731    28582
    ## 18 Angola                  5.49         19      346
    ## 19 Greece                  5.47        192     3511
    ## 20 China                   5.45       4648    85306

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                 939.       9771   10.4 
    ##  2 United Kingdom          709.      44198   62.3 
    ##  3 Spain                   610.      28385   46.5 
    ##  4 Italy                   578.      34854   60.3 
    ##  5 Sweden                  567.       5420    9.56
    ##  6 France                  460.      29808   64.8 
    ##  7 United States           417.     129226  310.  
    ##  8 Chile                   370.       6192   16.7 
    ##  9 Netherlands             367.       6117   16.6 
    ## 10 Peru                    342.      10226   29.9 
    ## 11 Ecuador                 322.       4769   14.8 
    ## 12 Brazil                  314.      63174  201.  
    ## 13 Mexico                  265.      29843  112.  
    ## 14 Canada                  257.       8663   33.7 
    ## 15 Switzerland             222.       1685    7.58
    ## 16 Portugal                150.       1605   10.7 
    ## 17 Iran                    148.      11408   76.9 
    ## 18 Bolivia                 133.       1320    9.95
    ## 19 Denmark                 111.        606    5.48
    ## 20 Germany                 110.       9012   81.8

EOL
