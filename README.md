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

Updated: 2020-07-19

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
    ##  1 United States           25869.  3544143            137
    ##  2 Brazil                  15968.  2012151            126
    ##  3 India                    8243.  1038716            126
    ##  4 Russia                   6273.   765437            122
    ##  5 Peru                     2799.   341586            122
    ##  6 South Africa             2766.   337594            122
    ##  7 Mexico                   2677.   324041            121
    ##  8 Chile                    2632.   326539            124
    ##  9 United Kingdom           2171.   293243            135
    ## 10 Pakistan                 2111.   261917            124
    ## 11 Saudi Arabia             1950.   245851            126
    ## 12 Bangladesh               1934.   199357            103
    ## 13 Spain                    1885.   260255            138
    ## 14 Iran                     1883.   269440            143
    ## 15 Turkey                   1784.   217799            122
    ## 16 Italy                    1670.   243967            146
    ## 17 Germany                  1448.   201372            139
    ## 18 Colombia                 1431.   173206            121
    ## 19 France                   1189.   164247            138
    ## 20 Argentina                 955.   114783            120

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            157.               19499.            124
    ##  2 Peru                              93.6              11422.            122
    ##  3 United States                     83.4              11424.            137
    ##  4 Brazil                            79.4              10006.            126
    ##  5 Saudi Arabia                      75.8               9554.            126
    ##  6 Belarus                           61.6               6792.            110
    ##  7 Sweden                            60.2               8087.            134
    ##  8 South Africa                      56.5               6890.            122
    ##  9 Israel                            49.9               6315.            126
    ## 10 Bolivia                           49.8               5444.            109
    ## 11 Belgium                           45.5               6104.            134
    ## 12 Russia                            44.6               5440.            122
    ## 13 Dominican Republic                43.4               5101.            117
    ## 14 Kyrgyzstan                        41.1               4535.            110
    ## 15 Spain                             40.5               5596.            138
    ## 16 Ecuador                           40.1               4898.            122
    ## 17 Kazakhstan                        39.2               4479.            114
    ## 18 Portugal                          35.4               4503.            127
    ## 19 United Kingdom                    34.8               4703.            135
    ## 20 Honduras                          34.7               3863.            111

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  27.9         441     1580
    ##  2 France                 18.3       30046   164247
    ##  3 Belgium                15.4        9800    63499
    ##  4 United Kingdom         15.4       45233   293243
    ##  5 Italy                  14.4       35028   243967
    ##  6 Hungary                13.9         595     4293
    ##  7 Netherlands            11.9        6129    51399
    ##  8 Mexico                 11.6       37574   324041
    ##  9 Spain                  10.9       28420   260255
    ## 10 Chad                    8.46         75      887
    ## 11 Canada                  8.08       8827   109264
    ## 12 Sweden                  7.27       5619    77281
    ## 13 Ecuador                 7.25       5250    72444
    ## 14 Sudan                   6.35        668    10527
    ## 15 Niger                   6.26         69     1102
    ## 16 Romania                 5.55       1988    35802
    ## 17 China                   5.42       4652    85857
    ## 18 Iran                    5.12      13791   269440
    ## 19 Burkina Faso            5.07         53     1045
    ## 20 Switzerland             5.07       1687    33296

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                 942.       9800   10.4 
    ##  2 United Kingdom          725.      45233   62.3 
    ##  3 Spain                   611.      28420   46.5 
    ##  4 Sweden                  588.       5619    9.56
    ##  5 Italy                   581.      35028   60.3 
    ##  6 Chile                   498.       8347   16.7 
    ##  7 France                  464.      30046   64.8 
    ##  8 United States           444.     137674  310.  
    ##  9 Peru                    422.      12615   29.9 
    ## 10 Brazil                  381.      76688  201.  
    ## 11 Netherlands             368.       6129   16.6 
    ## 12 Ecuador                 355.       5250   14.8 
    ## 13 Mexico                  334.      37574  112.  
    ## 14 Canada                  262.       8827   33.7 
    ## 15 Switzerland             223.       1687    7.58
    ## 16 Bolivia                 199.       1984    9.95
    ## 17 Iran                    179.      13791   76.9 
    ## 18 Kyrgyzstan              168.        923    5.51
    ## 19 Portugal                158.       1682   10.7 
    ## 20 Colombia                126.       6029   47.8

EOL
