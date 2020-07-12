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

Updated: 2020-07-13

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
    ##  1 United States           24149.  3163581            131
    ##  2 Brazil                  15006.  1800827            120
    ##  3 India                    7079.   849553            120
    ##  4 Russia                   6267.   727162            116
    ##  5 Peru                     2754.   319646            116
    ##  6 Chile                    2643.   312029            118
    ##  7 Mexico                   2514.   289174            115
    ##  8 South Africa             2276.   264184            116
    ##  9 United Kingdom           2239.   288957            129
    ## 10 Pakistan                 2108.   248872            118
    ## 11 Spain                    1923.   253908            132
    ## 12 Saudi Arabia             1911.   229480            120
    ## 13 Bangladesh               1866.   181129             97
    ## 14 Iran                     1861.   255117            137
    ## 15 Turkey                   1826.   211981            116
    ## 16 Italy                    1734.   242827            140
    ## 17 Germany                  1494.   198804            133
    ## 18 Colombia                 1223.   140776            115
    ## 19 France                   1220.   161275            132
    ## 20 Canada                    877.   107126            122

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            158.               18633.            118
    ##  2 Peru                              92.1              10688.            116
    ##  3 United States                     77.8              10197.            131
    ##  4 Brazil                            74.6               8955.            120
    ##  5 Saudi Arabia                      74.3               8918.            120
    ##  6 Belarus                           64.1               6687.            104
    ##  7 Sweden                            61.1               7838.            128
    ##  8 Belgium                           46.9               6018.            128
    ##  9 South Africa                      46.5               5392.            116
    ## 10 Russia                            44.5               5168.            116
    ## 11 Bolivia                           44.4               4581.            103
    ## 12 Israel                            41.5               5007.            120
    ## 13 Spain                             41.3               5460.            132
    ## 14 Dominican Republic                39.3               4389.            111
    ## 15 Ecuador                           39.1               4544.            116
    ## 16 United Kingdom                    35.9               4635.            129
    ## 17 Portugal                          35.7               4329.            121
    ## 18 Kazakhstan                        35.1               3797.            108
    ## 19 Switzerland                       33.5               4315.            128
    ## 20 Honduras                          32.1               3386.            105

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  26.3         365     1389
    ##  2 France                 18.5       29907   161275
    ##  3 Belgium                15.6        9782    62606
    ##  4 United Kingdom         15.5       44798   288957
    ##  5 Italy                  14.4       34945   242827
    ##  6 Hungary                14.1         595     4229
    ##  7 Netherlands            12.0        6128    50866
    ##  8 Mexico                 11.8       34191   289174
    ##  9 Spain                  11.2       28403   253908
    ## 10 Chad                    8.47         74      874
    ## 11 Canada                  8.18       8759   107126
    ## 12 Ecuador                 7.49       5031    67209
    ## 13 Sweden                  7.38       5526    74898
    ## 14 Sudan                   6.34        650    10250
    ## 15 Niger                   6.19         68     1099
    ## 16 Romania                 5.83       1871    32079
    ## 17 China                   5.43       4648    85522
    ## 18 Algeria                 5.37       1004    18712
    ## 19 Burkina Faso            5.29         54     1020
    ## 20 Angola                  5.18         25      483

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                 940.       9782   10.4 
    ##  2 United Kingdom          719.      44798   62.3 
    ##  3 Spain                   611.      28403   46.5 
    ##  4 Italy                   579.      34945   60.3 
    ##  5 Sweden                  578.       5526    9.56
    ##  6 France                  462.      29907   64.8 
    ##  7 United States           430.     133486  310.  
    ##  8 Chile                   411.       6881   16.7 
    ##  9 Peru                    385.      11500   29.9 
    ## 10 Netherlands             368.       6128   16.6 
    ## 11 Brazil                  350.      70398  201.  
    ## 12 Ecuador                 340.       5031   14.8 
    ## 13 Mexico                  304.      34191  112.  
    ## 14 Canada                  260.       8759   33.7 
    ## 15 Switzerland             222.       1685    7.58
    ## 16 Bolivia                 171.       1702    9.95
    ## 17 Iran                    164.      12635   76.9 
    ## 18 Portugal                155.       1654   10.7 
    ## 19 Denmark                 111.        609    5.48
    ## 20 Germany                 111.       9063   81.8

EOL
