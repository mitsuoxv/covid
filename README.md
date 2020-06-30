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

Updated: 2020-06-30

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
    ##  1 United States           21157.  2496628            118
    ##  2 Brazil                  12276.  1313667            107
    ##  3 Russia                   6223.   641156            103
    ##  4 India                    5123.   548318            107
    ##  5 United Kingdom           2681.   311155            116
    ##  6 Peru                     2678.   275989            103
    ##  7 Chile                    2589.   271982            105
    ##  8 Spain                    2090.   248770            119
    ##  9 Mexico                   2085.   212802            102
    ## 10 Pakistan                 1965    206512            105
    ## 11 Turkey                   1913.   197239            103
    ## 12 Italy                    1891.   240310            127
    ## 13 Iran                     1795.   222669            124
    ## 14 Saudi Arabia             1705.   182493            107
    ## 15 Bangladesh               1639.   137787             84
    ## 16 Germany                  1614.   193761            120
    ## 17 South Africa             1340.   138134            103
    ## 18 France                   1311.   156156            119
    ## 19 Canada                    944.   103032            109
    ## 20 Colombia                  867.    88591            102

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            155.               16241.            105
    ##  2 Peru                              89.5               9228.            103
    ##  3 Belarus                           69.6               6347.             91
    ##  4 United States                     68.2               8048.            118
    ##  5 Saudi Arabia                      66.2               7092.            107
    ##  6 Brazil                            61.0               6532.            107
    ##  7 Sweden                            59.1               6816.            115
    ##  8 Belgium                           51.2               5898.            115
    ##  9 Spain                             44.9               5349.            119
    ## 10 Russia                            44.2               4557.            103
    ## 11 United Kingdom                    43.0               4991.            116
    ## 12 Ecuador                           36.2               3736.            103
    ## 13 Portugal                          36.0               3901.            108
    ## 14 Switzerland                       35.9               4160.            115
    ## 15 Bolivia                           34.1               3084.             90
    ## 16 Dominican Republic                32.3               3194.             98
    ## 17 Italy                             31.3               3983.            127
    ## 18 Israel                            29.6               3190.            107
    ## 19 Canada                            28.0               3059.            109
    ## 20 South Africa                      27.3               2819.            103

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  27.0         303     1122
    ##  2 France                 19.0       29700   156156
    ##  3 Belgium                15.9        9732    61361
    ##  4 Italy                  14.5       34738   240310
    ##  5 Hungary                14.0         581     4142
    ##  6 United Kingdom         14.0       43550   311155
    ##  7 Mexico                 12.4       26381   212802
    ##  8 Netherlands            12.2        6105    50147
    ##  9 Spain                  11.4       28343   248770
    ## 10 Chad                    8.55         74      866
    ## 11 Canada                  8.27       8516   103032
    ## 12 Sweden                  8.11       5280    65137
    ## 13 Ecuador                 8.02       4429    55255
    ## 14 Algeria                 6.76        897    13273
    ## 15 Niger                   6.24         67     1074
    ## 16 Sudan                   6.18        572     9258
    ## 17 Romania                 6.13       1612    26313
    ## 18 Greece                  5.66        191     3376
    ## 19 Burkina Faso            5.53         53      959
    ## 20 China                   5.46       4648    85204

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                935.        9732   10.4 
    ##  2 United Kingdom         698.       43550   62.3 
    ##  3 Spain                  609.       28343   46.5 
    ##  4 Italy                  576.       34738   60.3 
    ##  5 Sweden                 553.        5280    9.56
    ##  6 France                 459.       29700   64.8 
    ##  7 United States          404.      125318  310.  
    ##  8 Netherlands            367.        6105   16.6 
    ##  9 Chile                  329.        5509   16.7 
    ## 10 Peru                   305.        9135   29.9 
    ## 11 Ecuador                299.        4429   14.8 
    ## 12 Brazil                 284.       57070  201.  
    ## 13 Canada                 253.        8516   33.7 
    ## 14 Mexico                 235.       26381  112.  
    ## 15 Switzerland            222.        1681    7.58
    ## 16 Portugal               146.        1564   10.7 
    ## 17 Iran                   137.       10508   76.9 
    ## 18 Denmark                110.         604    5.48
    ## 19 Germany                110.        8961   81.8 
    ## 20 Bolivia                 97.5        970    9.95

EOL
