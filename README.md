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

Updated: 2020-08-17

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
    ##  1 United States           31677.  5258565            166
    ##  2 Brazil                  21132.  3275520            155
    ##  3 India                   16707.  2589682            155
    ##  4 Russia                   6111.   922853            151
    ##  5 South Africa             3864.   583653            151
    ##  6 Peru                     3418.   516296            151
    ##  7 Mexico                   3408.   511369            150
    ##  8 Colombia                 2967.   445111            150
    ##  9 Chile                    2508.   383902            153
    ## 10 Bangladesh               2079.   274525            132
    ## 11 Spain                    2052.   342813            167
    ## 12 Iran                     1982.   341070            172
    ## 13 United Kingdom           1928.   316371            164
    ## 14 Saudi Arabia             1917.   297315            155
    ## 15 Argentina                1895.   282437            149
    ## 16 Pakistan                 1886.   288717            153
    ## 17 Turkey                   1642.   248117            151
    ## 18 Italy                    1448.   253438            175
    ## 19 Germany                  1329.   223453            168
    ## 20 France                   1209.   202118            167

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            150.               22924.            153
    ##  2 Peru                             114.               17263.            151
    ##  3 Brazil                           105.               16288.            155
    ##  4 United States                    102.               16950.            166
    ##  5 South Africa                      78.9              11911.            151
    ##  6 Israel                            77.5              12033.            155
    ##  7 Saudi Arabia                      74.5              11554.            155
    ##  8 Bolivia                           71.3               9847.            138
    ##  9 Colombia                          62.1               9314.            150
    ## 10 Dominican Republic                59.5               8708.            146
    ## 11 Kazakhstan                        54.5               7808.            143
    ## 12 Kyrgyzstan                        54.5               7598.            139
    ## 13 Sweden                            54.0               8821.            163
    ## 14 Belarus                           51.5               7168.            139
    ## 15 Argentina                         45.8               6832.            149
    ## 16 Belgium                           45.8               7476.            163
    ## 17 Ecuador                           45.0               6808.            151
    ## 18 Honduras                          44.1               6192.            140
    ## 19 Spain                             44.1               7371.            167
    ## 20 Russia                            43.4               6559.            151

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  28.4         529     1862
    ##  2 France                 15.0       30277   202118
    ##  3 Italy                  14.0       35392   253438
    ##  4 United Kingdom         13.1       41358   316371
    ##  5 Belgium                12.8        9935    77776
    ##  6 Hungary                12.4         607     4877
    ##  7 Mexico                 10.9       55908   511369
    ##  8 Netherlands             9.87       6160    62437
    ##  9 Spain                   8.35      28617   342813
    ## 10 Chad                    7.98         76      952
    ## 11 Canada                  7.41       9020   121652
    ## 12 Sweden                  6.86       5783    84294
    ## 13 Sudan                   6.48        798    12314
    ## 14 Ecuador                 6.02       6065   100688
    ## 15 Niger                   5.92         69     1165
    ## 16 Iran                    5.71      19492   341070
    ## 17 Egypt                   5.34       5141    96336
    ## 18 China                   5.25       4710    89761
    ## 19 Peru                    5.01      25856   516296
    ## 20 Mali                    4.78        125     2614

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                 955.       9935   10.4 
    ##  2 Peru                    865.      25856   29.9 
    ##  3 United Kingdom          663.      41358   62.3 
    ##  4 Chile                   621.      10395   16.7 
    ##  5 Spain                   615.      28617   46.5 
    ##  6 Sweden                  605.       5783    9.56
    ##  7 Italy                   587.      35392   60.3 
    ##  8 United States           539.     167201  310.  
    ##  9 Brazil                  530.     106523  201.  
    ## 10 Mexico                  497.      55908  112.  
    ## 11 France                  467.      30277   64.8 
    ## 12 Ecuador                 410.       6065   14.8 
    ## 13 Bolivia                 396.       3939    9.95
    ## 14 Netherlands             370.       6160   16.6 
    ## 15 Colombia                303.      14492   47.8 
    ## 16 Kyrgyzstan              271.       1495    5.51
    ## 17 Canada                  268.       9020   33.7 
    ## 18 Iran                    253.      19492   76.9 
    ## 19 South Africa            238.      11677   49   
    ## 20 Switzerland             226.       1714    7.58

EOL
