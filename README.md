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

Updated: 2020-07-02

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
    ##  1 United States           21444.  2573393            120
    ##  2 Brazil                  12551.  1368195            109
    ##  3 Russia                   6231.   654405            105
    ##  4 India                    5371.   585493            109
    ##  5 Peru                     2688.   282365            105
    ##  6 United Kingdom           2649.   312658            118
    ##  7 Chile                    2610.   279393            107
    ##  8 Mexico                   2121.   220657            104
    ##  9 Spain                    2059.   249271            121
    ## 10 Pakistan                 1993.   213470            107
    ## 11 Turkey                   1902.   199906            105
    ## 12 Italy                    1864.   240578            129
    ## 13 Iran                     1806.   227662            126
    ## 14 Saudi Arabia             1750.   190823            109
    ## 15 Bangladesh               1690.   145483             86
    ## 16 Germany                  1595.   194725            122
    ## 17 South Africa             1439.   151209            105
    ## 18 France                   1298.   157194            121
    ## 19 Canada                    935.   103918            111
    ## 20 Colombia                  913.    95043            104

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            156.               16684.            107
    ##  2 Peru                              89.9               9441.            105
    ##  3 United States                     69.1               8295.            120
    ##  4 Belarus                           68.8               6414.             93
    ##  5 Saudi Arabia                      68.0               7416.            109
    ##  6 Brazil                            62.4               6803.            109
    ##  7 Sweden                            61.1               7163.            117
    ##  8 Belgium                           50.4               5913.            117
    ##  9 Russia                            44.3               4651.            105
    ## 10 Spain                             44.3               5360.            121
    ## 11 United Kingdom                    42.5               5015.            118
    ## 12 Ecuador                           36.2               3809.            105
    ## 13 Portugal                          35.8               3947.            110
    ## 14 Switzerland                       35.4               4172.            117
    ## 15 Bolivia                           35.0               3229.             92
    ## 16 Dominican Republic                32.9               3315.            100
    ## 17 Italy                             30.9               3987.            129
    ## 18 Israel                            30.4               3341.            109
    ## 19 South Africa                      29.4               3086.            105
    ## 20 Canada                            27.8               3086.            111

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  26.9         313     1162
    ##  2 France                 18.9       29760   157194
    ##  3 Belgium                15.9        9754    61509
    ##  4 Italy                  14.5       34767   240578
    ##  5 Hungary                14.1         585     4155
    ##  6 United Kingdom         14.0       43730   312658
    ##  7 Mexico                 12.3       27121   220657
    ##  8 Netherlands            12.2        6113    50273
    ##  9 Spain                  11.4       28355   249271
    ## 10 Chad                    8.55         74      866
    ## 11 Canada                  8.24       8566   103918
    ## 12 Ecuador                 8.03       4527    56342
    ## 13 Sweden                  7.79       5333    68451
    ## 14 Algeria                 6.56        912    13907
    ## 15 Niger                   6.23         67     1075
    ## 16 Sudan                   6.18        572     9258
    ## 17 Romania                 6.12       1651    26970
    ## 18 Greece                  5.63        192     3409
    ## 19 Burkina Faso            5.51         53      962
    ## 20 China                   5.45       4648    85232

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                 938.       9754   10.4 
    ##  2 United Kingdom          701.      43730   62.3 
    ##  3 Spain                   610.      28355   46.5 
    ##  4 Italy                   576.      34767   60.3 
    ##  5 Sweden                  558.       5333    9.56
    ##  6 France                  459.      29760   64.8 
    ##  7 United States           408.     126573  310.  
    ##  8 Netherlands             367.       6113   16.6 
    ##  9 Chile                   340.       5688   16.7 
    ## 10 Peru                    318.       9504   29.9 
    ## 11 Ecuador                 306.       4527   14.8 
    ## 12 Brazil                  290.      58314  201.  
    ## 13 Canada                  254.       8566   33.7 
    ## 14 Mexico                  241.      27121  112.  
    ## 15 Switzerland             222.       1683    7.58
    ## 16 Portugal                148.       1576   10.7 
    ## 17 Iran                    141.      10817   76.9 
    ## 18 Denmark                 110.        605    5.48
    ## 19 Germany                 110.       8985   81.8 
    ## 20 Bolivia                 108.       1071    9.95

EOL
