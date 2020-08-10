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

Updated: 2020-08-11

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

Region classification is mostly based on [UN M49
Standard](https://unstats.un.org/unsd/methodology/m49/).

![](README_files/figure-gfm/chart-1.png)<!-- -->

## Fastest spreading areas

Among areas with more than 5 million population, highest
“speed\_since\_100”, which is average number of newly confirmed cases
per day since cumulative cases became more than 100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_since_100 cum_conf days_since_100
    ##    <chr>                    <dbl>    <dbl>          <int>
    ##  1 United States           30948.  4951851            160
    ##  2 Brazil                  20217.  3012412            149
    ##  3 India                   14866.  2215074            149
    ##  4 Russia                   6155.   892654            145
    ##  5 South Africa             3860.   559859            145
    ##  6 Mexico                   3304.   475902            144
    ##  7 Peru                     3247.   471012            145
    ##  8 Colombia                 2616.   376870            144
    ##  9 Chile                    2537.   373056            147
    ## 10 Bangladesh               2043.   257600            126
    ## 11 Iran                     1967.   326712            166
    ## 12 United Kingdom           1967.   310829            158
    ## 13 Spain                    1952.   314362            161
    ## 14 Saudi Arabia             1937.   288690            149
    ## 15 Pakistan                 1935.   284660            147
    ## 16 Argentina                1690.   241811            143
    ## 17 Turkey                   1659.   240804            145
    ## 18 Italy                    1482.   250566            169
    ## 19 Germany                  1335.   216327            162
    ## 20 France                   1150.   185353            161

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            151.               22277.            147
    ##  2 Peru                             109.               15749.            145
    ##  3 Brazil                           101.               14979.            149
    ##  4 United States                     99.8              15962.            160
    ##  5 South Africa                      78.8              11426.            145
    ##  6 Saudi Arabia                      75.3              11219.            149
    ##  7 Israel                            75.1              11207.            149
    ##  8 Bolivia                           67.7               8953.            132
    ##  9 Dominican Republic                57.8               8116.            140
    ## 10 Sweden                            54.8               8615.            157
    ## 11 Colombia                          54.7               7886.            144
    ## 12 Kyrgyzstan                        54.7               7293.            133
    ## 13 Belarus                           53.3               7109.            133
    ## 14 Kazakhstan                        53.1               7290.            137
    ## 15 Belgium                           45.3               7119.            157
    ## 16 Ecuador                           44.0               6386.            145
    ## 17 Honduras                          43.8               5879.            134
    ## 18 Russia                            43.7               6344.            145
    ## 19 Spain                             42.0               6760.            161
    ## 20 Argentina                         40.9               5849.            143

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  28.5         516     1808
    ##  2 France                 16.3       30201   185353
    ##  3 United Kingdom         15.0       46574   310829
    ##  4 Italy                  14.1       35205   250566
    ##  5 Belgium                13.3        9872    74059
    ##  6 Hungary                12.8         602     4696
    ##  7 Mexico                 10.9       52006   475902
    ##  8 Netherlands            10.5        6157    58564
    ##  9 Spain                   9.07      28503   314362
    ## 10 Chad                    8.05         76      944
    ## 11 Canada                  7.53       8976   119221
    ## 12 Sweden                  7.00       5763    82323
    ## 13 Sudan                   6.53        781    11956
    ## 14 Ecuador                 6.27       5922    94459
    ## 15 Niger                   5.96         69     1158
    ## 16 Iran                    5.64      18427   326712
    ## 17 China                   5.26       4693    89270
    ## 18 Egypt                   5.25       5009    95492
    ## 19 Mali                    4.87        125     2567
    ## 20 Switzerland             4.69       1711    36514

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                 949.       9872   10.4 
    ##  2 United Kingdom          747.      46574   62.3 
    ##  3 Peru                    697.      20844   29.9 
    ##  4 Spain                   613.      28503   46.5 
    ##  5 Sweden                  603.       5763    9.56
    ##  6 Chile                   602.      10077   16.7 
    ##  7 Italy                   583.      35205   60.3 
    ##  8 United States           519.     160989  310.  
    ##  9 Brazil                  500.     100477  201.  
    ## 10 France                  466.      30201   64.8 
    ## 11 Mexico                  462.      52006  112.  
    ## 12 Ecuador                 400.       5922   14.8 
    ## 13 Bolivia                 371.       3687    9.95
    ## 14 Netherlands             370.       6157   16.6 
    ## 15 Kyrgyzstan              268.       1474    5.51
    ## 16 Canada                  267.       8976   33.7 
    ## 17 Colombia                262.      12540   47.8 
    ## 18 Iran                    240.      18427   76.9 
    ## 19 Switzerland             226.       1711    7.58
    ## 20 South Africa            212.      10408   49

EOL
