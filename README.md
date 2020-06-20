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

Updated: 2020-06-21

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
    ##  1 United States           19928.  2172212            109
    ##  2 Brazil                   9980.   978142             98
    ##  3 Russia                   6136.   576952             94
    ##  4 India                    4030.   395048             98
    ##  5 United Kingdom           2820.   301819            107
    ##  6 Peru                     2598.   244388             94
    ##  7 Chile                    2409.   231393             96
    ##  8 Spain                    2231.   245575            110
    ##  9 Italy                    2016.   238011            118
    ## 10 Turkey                   1969.   185245             94
    ## 11 Pakistan                 1786.   171666             96
    ## 12 Mexico                   1778.   165455             93
    ## 13 Iran                     1740.   200262            115
    ## 14 Germany                  1703.   189135            111
    ## 15 Saudi Arabia             1533.   150292             98
    ## 16 Bangladesh               1405.   105535             75
    ## 17 France                   1400.   154141            110
    ## 18 Canada                   1001.   100220            100
    ## 19 South Africa              932.    87715             94
    ## 20 Belarus                   697.    57333             82

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            144.               13817.             96
    ##  2 Peru                              86.9               8172.             94
    ##  3 Belarus                           72.0               5920.             82
    ##  4 United States                     64.2               7002.            109
    ##  5 Saudi Arabia                      59.6               5841.             98
    ##  6 Sweden                            55.2               5865.            106
    ##  7 Belgium                           54.7               5813.            106
    ##  8 Brazil                            49.6               4864.             98
    ##  9 Spain                             48.0               5281.            110
    ## 10 United Kingdom                    45.2               4841.            107
    ## 11 Russia                            43.6               4101.             94
    ## 12 Switzerland                       38.6               4118.            106
    ## 13 Portugal                          36.3               3603.             99
    ## 14 Ecuador                           35.7               3362.             94
    ## 15 Italy                             33.4               3944.            118
    ## 16 Canada                            29.7               2976.            100
    ## 17 Dominican Republic                28.4               2552.             89
    ## 18 Netherlands                       27.9               2969.            106
    ## 19 Israel                            27.8               2745.             98
    ## 20 Bolivia                           26.5               2161.             81

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  27.3         252      923
    ##  2 France                 19.2       29551   154141
    ##  3 Belgium                16.0        9695    60476
    ##  4 Italy                  14.5       34561   238011
    ##  5 United Kingdom         14.1       42461   301819
    ##  6 Hungary                14.0         570     4086
    ##  7 Netherlands            12.3        6081    49426
    ##  8 Mexico                 11.9       19747   165455
    ##  9 Spain                  11.5       28315   245575
    ## 10 Sweden                  9.02       5053    56043
    ## 11 Chad                    8.62         74      858
    ## 12 Ecuador                 8.36       4156    49731
    ## 13 Canada                  8.28       8300   100220
    ## 14 Algeria                 7.17        825    11504
    ## 15 Niger                   6.53         67     1026
    ## 16 Romania                 6.34       1484    23400
    ## 17 Sudan                   6.10        513     8416
    ## 18 Burkina Faso            5.88         53      901
    ## 19 Greece                  5.84        189     3237
    ## 20 Mali                    5.62        108     1923

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                932.        9695   10.4 
    ##  2 United Kingdom         681.       42461   62.3 
    ##  3 Spain                  609.       28315   46.5 
    ##  4 Italy                  573.       34561   60.3 
    ##  5 Sweden                 529.        5053    9.56
    ##  6 France                 456.       29551   64.8 
    ##  7 United States          381.      118205  310.  
    ##  8 Netherlands            365.        6081   16.6 
    ##  9 Ecuador                281.        4156   14.8 
    ## 10 Peru                   249.        7461   29.9 
    ## 11 Canada                 246.        8300   33.7 
    ## 12 Chile                  244.        4093   16.7 
    ## 13 Brazil                 237.       47748  201.  
    ## 14 Switzerland            222.        1680    7.58
    ## 15 Mexico                 176.       19747  112.  
    ## 16 Portugal               143.        1527   10.7 
    ## 17 Iran                   122.        9392   76.9 
    ## 18 Denmark                109.         600    5.48
    ## 19 Germany                109.        8883   81.8 
    ## 20 Austria                 83.9        688    8.20

EOL
