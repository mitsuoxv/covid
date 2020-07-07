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

Updated: 2020-07-08

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
    ##  1 United States           22834.  2877238            126
    ##  2 Brazil                  13939.  1603055            115
    ##  3 India                    6257.   719665            115
    ##  4 Russia                   6253    694230            111
    ##  5 Peru                     2726.   302718            111
    ##  6 Chile                    2641.   298557            113
    ##  7 Mexico                   2334.   256848            110
    ##  8 United Kingdom           2304.   285772            124
    ##  9 Pakistan                 2074.   234509            113
    ## 10 Spain                    1982.   251789            127
    ## 11 Turkey                   1862.   206844            111
    ## 12 Saudi Arabia             1858.   213716            115
    ## 13 South Africa             1852.   205721            111
    ## 14 Iran                     1840.   243051            132
    ## 15 Bangladesh               1799.   165618             92
    ## 16 Italy                    1790.   241819            135
    ## 17 Germany                  1538.   196944            128
    ## 18 France                   1255.   159568            127
    ## 19 Colombia                 1064.   117110            110
    ## 20 Canada                    901.   105536            117

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            158.               17828.            113
    ##  2 Peru                              91.1              10122.            111
    ##  3 United States                     73.6               9274.            126
    ##  4 Saudi Arabia                      72.2               8306.            115
    ##  5 Brazil                            69.3               7971.            115
    ##  6 Belarus                           66.4               6588.             99
    ##  7 Sweden                            62.0               7646.            123
    ##  8 Belgium                           48.4               5965.            123
    ##  9 Russia                            44.4               4934.            111
    ## 10 Spain                             42.6               5414.            127
    ## 11 Bolivia                           40.2               3950.             98
    ## 12 Ecuador                           37.9               4218.            111
    ## 13 South Africa                      37.8               4198.            111
    ## 14 United Kingdom                    36.9               4583.            124
    ## 15 Dominican Republic                36.4               3881.            106
    ## 16 Portugal                          35.5               4133.            116
    ## 17 Israel                            35.3               4087.            115
    ## 18 Switzerland                       34.3               4251.            123
    ## 19 Kazakhstan                        31.4               3239.            103
    ## 20 Honduras                          29.8               2997.            100

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  26.7         346     1294
    ##  2 France                 18.7       29831   159568
    ##  3 Belgium                15.7        9774    62058
    ##  4 United Kingdom         15.5       44236   285772
    ##  5 Italy                  14.4       34869   241819
    ##  6 Hungary                14.1         589     4189
    ##  7 Netherlands            12.1        6119    50602
    ##  8 Mexico                 11.9       30639   256848
    ##  9 Spain                  11.3       28388   251789
    ## 10 Chad                    8.49         74      872
    ## 11 Canada                  8.23       8684   105536
    ## 12 Ecuador                 7.73       4821    62380
    ## 13 Sweden                  7.44       5433    73061
    ## 14 Sudan                   6.23        616     9894
    ## 15 Niger                   6.22         68     1093
    ## 16 Romania                 6.05       1768    29223
    ## 17 Algeria                 5.85        959    16404
    ## 18 China                   5.45       4648    85345
    ## 19 Greece                  5.39        192     3562
    ## 20 Angola                  5.38         19      353

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                 940.       9774   10.4 
    ##  2 United Kingdom          709.      44236   62.3 
    ##  3 Spain                   610.      28388   46.5 
    ##  4 Italy                   578.      34869   60.3 
    ##  5 Sweden                  569.       5433    9.56
    ##  6 France                  461.      29831   64.8 
    ##  7 United States           418.     129643  310.  
    ##  8 Chile                   381.       6384   16.7 
    ##  9 Netherlands             368.       6119   16.6 
    ## 10 Peru                    354.      10589   29.9 
    ## 11 Ecuador                 326.       4821   14.8 
    ## 12 Brazil                  323.      64867  201.  
    ## 13 Mexico                  272.      30639  112.  
    ## 14 Canada                  258.       8684   33.7 
    ## 15 Switzerland             222.       1685    7.58
    ## 16 Iran                    153.      11731   76.9 
    ## 17 Portugal                152.       1620   10.7 
    ## 18 Bolivia                 144.       1434    9.95
    ## 19 Denmark                 111.        607    5.48
    ## 20 Germany                 110.       9024   81.8

EOL
