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

Updated: 2020-08-16

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
    ##  1 United States           31534.  5203206            165
    ##  2 Brazil                  20940.  3224876            154
    ##  3 India                   16403.  2526192            154
    ##  4 Russia                   6118.   917884            150
    ##  5 South Africa             3860.   579140            150
    ##  6 Mexico                   3394.   505751            149
    ##  7 Peru                     3386.   507996            150
    ##  8 Colombia                 2911.   433805            149
    ##  9 Chile                    2513.   382111            152
    ## 10 Bangladesh               2074.   271881            131
    ## 11 Spain                    2064.   342813            166
    ## 12 Iran                     1981.   338825            171
    ## 13 United Kingdom           1940.   316371            163
    ## 14 Saudi Arabia             1921.   295902            154
    ## 15 Pakistan                 1894.   288047            152
    ## 16 Argentina                1864.   276072            148
    ## 17 Turkey                   1644.   246861            150
    ## 18 Italy                    1452.   252809            174
    ## 19 Germany                  1334.   222828            167
    ## 20 France                   1197.   198876            166

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            150.               22817.            152
    ##  2 Peru                             113.               16986.            150
    ##  3 Brazil                           104.               16036.            154
    ##  4 United States                    102.               16772.            165
    ##  5 South Africa                      78.8              11819.            150
    ##  6 Israel                            78.0              12033.            154
    ##  7 Saudi Arabia                      74.6              11499.            154
    ##  8 Bolivia                           70.7               9697.            137
    ##  9 Colombia                          60.9               9077.            149
    ## 10 Dominican Republic                59.1               8600.            145
    ## 11 Kazakhstan                        54.9               7808.            142
    ## 12 Kyrgyzstan                        54.6               7560.            138
    ## 13 Sweden                            54.4               8821.            162
    ## 14 Belarus                           51.7               7156.            138
    ## 15 Belgium                           45.6               7404.            162
    ## 16 Argentina                         45.1               6678.            148
    ## 17 Ecuador                           44.7               6721.            150
    ## 18 Spain                             44.4               7371.            166
    ## 19 Honduras                          44.1               6138.            139
    ## 20 Russia                            43.5               6524.            150

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  28.4         529     1862
    ##  2 France                 15.2       30275   198876
    ##  3 Italy                  13.9       35234   252809
    ##  4 United Kingdom         13.1       41357   316371
    ##  5 Belgium                12.9        9924    77020
    ##  6 Hungary                12.5         607     4853
    ##  7 Mexico                 10.9       55293   505751
    ##  8 Netherlands             9.97       6158    61785
    ##  9 Spain                   8.35      28617   342813
    ## 10 Chad                    7.99         76      951
    ## 11 Canada                  7.44       9015   121234
    ## 12 Sweden                  6.86       5783    84294
    ## 13 Sudan                   6.52        796    12211
    ## 14 Ecuador                 6.07       6030    99409
    ## 15 Niger                   5.92         69     1165
    ## 16 Iran                    5.71      19331   338825
    ## 17 Egypt                   5.33       5124    96220
    ## 18 China                   5.25       4708    89695
    ## 19 Peru                    5.05      25648   507996
    ## 20 Mali                    4.80        125     2605

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                 954.       9924   10.4 
    ##  2 Peru                    858.      25648   29.9 
    ##  3 United Kingdom          663.      41357   62.3 
    ##  4 Chile                   617.      10340   16.7 
    ##  5 Spain                   615.      28617   46.5 
    ##  6 Sweden                  605.       5783    9.56
    ##  7 Italy                   584.      35234   60.3 
    ##  8 United States           535.     165995  310.  
    ##  9 Brazil                  524.     105463  201.  
    ## 10 Mexico                  492.      55293  112.  
    ## 11 France                  467.      30275   64.8 
    ## 12 Ecuador                 408.       6030   14.8 
    ## 13 Bolivia                 390.       3884    9.95
    ## 14 Netherlands             370.       6158   16.6 
    ## 15 Colombia                296.      14145   47.8 
    ## 16 Kyrgyzstan              271.       1493    5.51
    ## 17 Canada                  268.       9015   33.7 
    ## 18 Iran                    251.      19331   76.9 
    ## 19 South Africa            236.      11556   49   
    ## 20 Switzerland             226.       1715    7.58

EOL
