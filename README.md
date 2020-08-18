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

Updated: 2020-08-19

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

WHO offers those numbers at [Data Table tab in its
Dashboard](https://covid19.who.int/table). Fortunately I can download a
csv file, whose URL is
<https://covid19.who.int/WHO-COVID-19-global-data.csv>.

The ugly codes I wrote are in R directory. Data in Table 1 (In China)
and Table 2 (World including China) are in table1.csv, table2.csv and
tables.rdata in data directory in this repository.

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

Here, I load Table 1 and Table 2. Beware Table 1 (in\_china) includes
total, but Table 2 (world) does not include subtotal or total.

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
    ##  1 United States           31680.  5354013            169
    ##  2 Brazil                  21007.  3340197            159
    ##  3 India                   17214.  2702742            157
    ##  4 Russia                   6054.   932493            154
    ##  5 South Africa             3830.   589886            154
    ##  6 Peru                     3479.   535946            154
    ##  7 Mexico                   3412.   522162            153
    ##  8 Colombia                 3060.   468332            153
    ##  9 Chile                    2499.   387502            155
    ## 10 Bangladesh               2067.   279144            135
    ## 11 Spain                    2028.   342813            169
    ## 12 Iran                     1973.   345450            175
    ## 13 Argentina                1912.   294569            154
    ## 14 United Kingdom           1899.   319201            168
    ## 15 Saudi Arabia             1898.   299914            158
    ## 16 Pakistan                 1869.   289832            155
    ## 17 Turkey                   1626.   250542            154
    ## 18 Italy                    1428.   254235            178
    ## 19 Germany                  1309.   224014            171
    ## 20 France                   1193.   205380            172

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            149.               23139.            155
    ##  2 Peru                             116.               17920.            154
    ##  3 Brazil                           104.               16609.            159
    ##  4 United States                    102.               17258.            169
    ##  5 Israel                            79.3              12695.            160
    ##  6 South Africa                      78.2              12038.            154
    ##  7 Saudi Arabia                      73.7              11655.            158
    ##  8 Bolivia                           72.0              10087.            140
    ##  9 Colombia                          64.0               9800.            153
    ## 10 Dominican Republic                59.4               8829.            148
    ## 11 Kazakhstan                        54.2               7930.            146
    ## 12 Kyrgyzstan                        54.1               7651.            141
    ## 13 Sweden                            53.5               8900.            166
    ## 14 Belarus                           50.5               7185.            142
    ## 15 Argentina                         46.3               7125.            154
    ## 16 Belgium                           45.1               7540.            167
    ## 17 Ecuador                           44.6               6879.            154
    ## 18 Honduras                          44.4               6321.            142
    ## 19 Spain                             43.6               7371.            169
    ## 20 Russia                            43.0               6627.            154

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  28.4         536     1886
    ##  2 France                 14.8       30296   205380
    ##  3 Italy                  13.9       35400   254235
    ##  4 United Kingdom         13.0       41369   319201
    ##  5 Belgium                12.7        9944    78441
    ##  6 Hungary                12.3         609     4970
    ##  7 Mexico                 10.9       56757   522162
    ##  8 Netherlands             9.72       6163    63424
    ##  9 Spain                   8.35      28617   342813
    ## 10 Chad                    7.92         76      959
    ## 11 Canada                  7.39       9026   122087
    ## 12 Sweden                  6.80       5787    85045
    ## 13 Sudan                   6.45        805    12485
    ## 14 Ecuador                 5.98       6083   101751
    ## 15 Niger                   5.91         69     1167
    ## 16 Iran                    5.73      19804   345450
    ## 17 Egypt                   5.36       5173    96590
    ## 18 China                   5.24       4710    89926
    ## 19 Peru                    4.90      26281   535946
    ## 20 Mali                    4.73        125     2640

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                 956.       9944   10.4 
    ##  2 Peru                    879.      26281   29.9 
    ##  3 United Kingdom          664.      41369   62.3 
    ##  4 Chile                   628.      10513   16.7 
    ##  5 Spain                   615.      28617   46.5 
    ##  6 Sweden                  606.       5787    9.56
    ##  7 Italy                   587.      35400   60.3 
    ##  8 United States           545.     168999  310.  
    ##  9 Brazil                  536.     107852  201.  
    ## 10 Mexico                  505.      56757  112.  
    ## 11 France                  468.      30296   64.8 
    ## 12 Ecuador                 411.       6083   14.8 
    ## 13 Bolivia                 407.       4048    9.95
    ## 14 Netherlands             370.       6163   16.6 
    ## 15 Colombia                316.      15097   47.8 
    ## 16 Kyrgyzstan              272.       1498    5.51
    ## 17 Canada                  268.       9026   33.7 
    ## 18 Iran                    257.      19804   76.9 
    ## 19 South Africa            245.      11982   49   
    ## 20 Switzerland             226.       1715    7.58

EOL
