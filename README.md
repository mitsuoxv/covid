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

Updated: 2020-07-14

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
    ##  1 United States           24438.  3225950            132
    ##  2 Brazil                  15204.  1839850            121
    ##  3 India                    7257.   878254            121
    ##  4 Russia                   6270.   733699            117
    ##  5 Peru                     2757.   322710            117
    ##  6 Chile                    2646.   315041            119
    ##  7 Mexico                   2544.   295268            116
    ##  8 South Africa             2360.   276242            117
    ##  9 United Kingdom           2227.   289607            130
    ## 10 Pakistan                 2113.   251625            119
    ## 11 Saudi Arabia             1919.   232259            121
    ## 12 Spain                    1908.   253908            133
    ## 13 Bangladesh               1874.   183795             98
    ## 14 Iran                     1863.   257303            138
    ## 15 Turkey                   1819.   212993            117
    ## 16 Italy                    1723.   243061            141
    ## 17 Germany                  1484.   198963            134
    ## 18 Colombia                 1252.   145362            116
    ## 19 France                   1211.   161275            133
    ## 20 Canada                    872.   107347            123

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            158.               18812.            119
    ##  2 Peru                              92.2              10790.            117
    ##  3 United States                     78.8              10398.            132
    ##  4 Brazil                            75.6               9149.            121
    ##  5 Saudi Arabia                      74.6               9026.            121
    ##  6 Belarus                           63.7               6704.            105
    ##  7 Sweden                            60.6               7838.            129
    ##  8 South Africa                      48.2               5638.            117
    ##  9 Belgium                           46.6               6028.            129
    ## 10 Bolivia                           45.5               4745.            104
    ## 11 Russia                            44.6               5215.            117
    ## 12 Israel                            42.5               5169.            121
    ## 13 Spain                             41.0               5460.            133
    ## 14 Dominican Republic                40.3               4533.            112
    ## 15 Ecuador                           39.1               4589.            117
    ## 16 Kazakhstan                        35.7               3905.            109
    ## 17 United Kingdom                    35.7               4645.            130
    ## 18 Portugal                          35.6               4357.            122
    ## 19 Switzerland                       33.2               4315.            129
    ## 20 Honduras                          32.4               3452.            106

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  28.5         418     1469
    ##  2 France                 18.5       29907   161275
    ##  3 Belgium                15.6        9782    62707
    ##  4 United Kingdom         15.5       44819   289607
    ##  5 Italy                  14.4       34954   243061
    ##  6 Hungary                14.1         595     4234
    ##  7 Netherlands            12.0        6128    50967
    ##  8 Mexico                 11.8       34730   295268
    ##  9 Spain                  11.2       28403   253908
    ## 10 Chad                    8.52         75      880
    ## 11 Canada                  8.17       8773   107347
    ## 12 Ecuador                 7.44       5047    67870
    ## 13 Sweden                  7.38       5526    74898
    ## 14 Sudan                   6.34        650    10250
    ## 15 Niger                   6.19         68     1099
    ## 16 Romania                 5.79       1884    32535
    ## 17 China                   5.43       4648    85568
    ## 18 Algeria                 5.27       1011    19195
    ## 19 Switzerland             5.15       1685    32713
    ## 20 Angola                  5.14         26      506

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                 940.       9782   10.4 
    ##  2 United Kingdom          719.      44819   62.3 
    ##  3 Spain                   611.      28403   46.5 
    ##  4 Italy                   579.      34954   60.3 
    ##  5 Sweden                  578.       5526    9.56
    ##  6 France                  462.      29907   64.8 
    ##  7 United States           433.     134392  310.  
    ##  8 Chile                   417.       6979   16.7 
    ##  9 Peru                    391.      11682   29.9 
    ## 10 Netherlands             368.       6128   16.6 
    ## 11 Brazil                  355.      71469  201.  
    ## 12 Ecuador                 341.       5047   14.8 
    ## 13 Mexico                  309.      34730  112.  
    ## 14 Canada                  260.       8773   33.7 
    ## 15 Switzerland             222.       1685    7.58
    ## 16 Bolivia                 176.       1754    9.95
    ## 17 Iran                    167.      12829   76.9 
    ## 18 Portugal                155.       1660   10.7 
    ## 19 Denmark                 111.        609    5.48
    ## 20 Germany                 111.       9064   81.8

EOL
