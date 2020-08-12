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

Updated: 2020-08-13

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
    ##  1 United States           31109.  5039709            162
    ##  2 Brazil                  20247.  3057470            151
    ##  3 India                   15427.  2329638            151
    ##  4 Russia                   6140.   902701            147
    ##  5 South Africa             3850.   566109            147
    ##  6 Mexico                   3327.   485836            146
    ##  7 Peru                     3286.   483133            147
    ##  8 Colombia                 2723.   397623            146
    ##  9 Chile                    2527.   376616            149
    ## 10 Bangladesh               2058.   263503            128
    ## 11 Spain                    2003.   326612            163
    ## 12 Iran                     1971.   331189            168
    ## 13 United Kingdom           1954.   312793            160
    ## 14 Saudi Arabia             1930.   291468            151
    ## 15 Pakistan                 1918.   285921            149
    ## 16 Argentina                1750.   253868            145
    ## 17 Turkey                   1653.   243180            147
    ## 18 Italy                    1468.   251237            171
    ## 19 Germany                  1332.   218519            164
    ## 20 France                   1172.   191265            163

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            151.               22489.            149
    ##  2 Peru                             110.               16155.            147
    ##  3 Brazil                           101.               15203.            151
    ##  4 United States                    100.               16245.            162
    ##  5 South Africa                      78.6              11553.            147
    ##  6 Israel                            76.4              11566.            151
    ##  7 Saudi Arabia                      75.0              11327.            151
    ##  8 Bolivia                           68.7               9212.            134
    ##  9 Dominican Republic                58.0               8255.            142
    ## 10 Colombia                          57.0               8320.            146
    ## 11 Kyrgyzstan                        54.7               7399.            135
    ## 12 Sweden                            54.6               8699.            159
    ## 13 Kazakhstan                        54.2               7537.            139
    ## 14 Belarus                           52.7               7125.            135
    ## 15 Belgium                           45.2               7201.            159
    ## 16 Honduras                          44.0               5992.            136
    ## 17 Ecuador                           43.9               6461.            147
    ## 18 Russia                            43.6               6416.            147
    ## 19 Spain                             43.1               7023.            163
    ## 20 Argentina                         42.3               6141.            145

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  28.6         524     1835
    ##  2 France                 15.8       30227   191265
    ##  3 United Kingdom         14.9       46526   312793
    ##  4 Italy                  14.0       35215   251237
    ##  5 Belgium                13.2        9885    74915
    ##  6 Hungary                12.7         605     4746
    ##  7 Mexico                 10.9       53003   485836
    ##  8 Netherlands            10.3        6150    59918
    ##  9 Spain                   8.75      28581   326612
    ## 10 Chad                    8.03         76      946
    ## 11 Canada                  7.48       8987   120132
    ## 12 Sweden                  6.94       5770    83126
    ## 13 Sudan                   6.53        786    12033
    ## 14 Ecuador                 6.23       5951    95563
    ## 15 Niger                   5.96         69     1158
    ## 16 Iran                    5.68      18800   331189
    ## 17 Egypt                   5.28       5059    95834
    ## 18 China                   5.25       4699    89444
    ## 19 Mali                    4.85        125     2577
    ## 20 Switzerland             4.65       1712    36806

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                 950.       9885   10.4 
    ##  2 United Kingdom          746.      46526   62.3 
    ##  3 Peru                    711.      21276   29.9 
    ##  4 Spain                   615.      28581   46.5 
    ##  5 Chile                   608.      10178   16.7 
    ##  6 Sweden                  604.       5770    9.56
    ##  7 Italy                   584.      35215   60.3 
    ##  8 United States           523.     162104  310.  
    ##  9 Brazil                  506.     101752  201.  
    ## 10 Mexico                  471.      53003  112.  
    ## 11 France                  467.      30227   64.8 
    ## 12 Ecuador                 402.       5951   14.8 
    ## 13 Bolivia                 373.       3712    9.95
    ## 14 Netherlands             369.       6150   16.6 
    ## 15 Colombia                275.      13154   47.8 
    ## 16 Kyrgyzstan              269.       1484    5.51
    ## 17 Canada                  267.       8987   33.7 
    ## 18 Iran                    244.      18800   76.9 
    ## 19 Switzerland             226.       1712    7.58
    ## 20 South Africa            219.      10751   49

EOL
