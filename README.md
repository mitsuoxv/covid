WHO, Covid-19 situation report
================
Mitsuo Shiota
2020/3/7

  - [Summary](#summary)
  - [Read data from WHO](#read-data-from-who)
  - [Newly confirmed cases by region](#newly-confirmed-cases-by-region)
  - [Fastest spreading areas](#fastest-spreading-areas)
  - [Highest fatality rate areas](#highest-fatality-rate-areas)
  - [Highest deaths per population
    areas](#highest-deaths-per-population-areas)
  - [Save data](#save-data)

Updated: 2020-09-30

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

## Read data from WHO

WHO offers [Data Table in its Dashboard](https://covid19.who.int/table).
I use the data from
<https://covid19.who.int/WHO-COVID-19-global-data.csv>.

I also use the data, like area name and population, from
<https://countrycode.org/>.

## Newly confirmed cases by region

I watch newly confirmed cases. China is suceeding to contain the
coronavirus, but areas outside China now face the challenge.

Region classification is mostly based on [UN M49
Standard](https://unstats.un.org/unsd/methodology/m49/). One exception
is “West Europe”, which I make by combining “Western”, “Northern” and
“Southern Europe”. “West Europe” is basically Europe other than
“Eastern Europe”.

![](README_files/figure-gfm/chart-1.png)<!-- -->

## Fastest spreading areas

Among areas with more than 5 million population, highest
“speed\_since\_100”, which is average number of newly confirmed cases
per day since cumulative cases became more than 100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_since_100 cum_conf days_since_100
    ##    <chr>                    <dbl>    <dbl>          <int>
    ##  1 United States           33385.  7044327            211
    ##  2 India                   30880.  6145291            199
    ##  3 Brazil                  23543.  4732309            201
    ##  4 Russia                   5957.  1167805            196
    ##  5 Colombia                 4169.   813056            195
    ##  6 Peru                     4108.   805302            196
    ##  7 Mexico                   3745.   730317            195
    ##  8 Argentina                3629.   711325            196
    ##  9 South Africa             3426.   671669            196
    ## 10 Spain                    3395.   716481            211
    ## 11 France                   2423.   518622            214
    ## 12 Chile                    2333.   459671            197
    ## 13 United Kingdom           2090.   439017            210
    ## 14 Iran                     2073.   449960            217
    ## 15 Bangladesh               2036.   360555            177
    ## 16 Iraq                     1776.   353566            199
    ## 17 Saudi Arabia             1668.   333648            200
    ## 18 Turkey                   1610.   315845            196
    ## 19 Pakistan                 1580.   311516            197
    ## 20 Philippines              1543.   307288            199

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Israel                           154.               31118.            202
    ##  2 Chile                            139.               27449.            197
    ##  3 Peru                             137.               26927.            196
    ##  4 Brazil                           117.               23532.            201
    ##  5 United States                    108.               22707.            211
    ##  6 Argentina                         87.8              17205.            196
    ##  7 Colombia                          87.2              17013.            195
    ##  8 Bolivia                           73.9              13461.            182
    ##  9 Spain                             73.0              15406.            211
    ## 10 South Africa                      69.9              13708.            196
    ## 11 Saudi Arabia                      64.8              12966.            200
    ## 12 Iraq                              59.9              11916.            199
    ## 13 Dominican Republic                59.7              11367.            190
    ## 14 Belgium                           53.0              11079.            209
    ## 15 Honduras                          51.0               9401.            184
    ## 16 Kazakhstan                        48.6               9148.            188
    ## 17 Ecuador                           46.5               9125.            196
    ## 18 Kyrgyzstan                        46.0               8445.            183
    ## 19 Sweden                            45.9               9515.            207
    ## 20 Belarus                           43.7               8048.            184

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  28.9         588     2035
    ##  2 Italy                  11.5       35851   311364
    ##  3 Mexico                 10.5       76430   730317
    ##  4 United Kingdom          9.57      42001   439017
    ##  5 Belgium                 8.66       9987   115259
    ##  6 Ecuador                 8.36      11280   134965
    ##  7 Chad                    7.17         85     1185
    ##  8 Sweden                  6.47       5880    90923
    ##  9 Sudan                   6.14        836    13606
    ## 10 France                  6.09      31608   518622
    ## 11 Canada                  6.05       9268   153125
    ## 12 Bolivia                 5.87       7858   133901
    ## 13 Niger                   5.77         69     1196
    ## 14 Egypt                   5.73       5901   102955
    ## 15 Iran                    5.73      25779   449960
    ## 16 Netherlands             5.57       6371   114419
    ## 17 China                   5.21       4746    91018
    ## 18 Syria                   4.73        194     4102
    ## 19 Spain                   4.36      31232   716481
    ## 20 Mali                    4.21        130     3090

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   1079.      32262   29.9 
    ##  2 Belgium                 960.       9987   10.4 
    ##  3 Bolivia                 790.       7858    9.95
    ##  4 Ecuador                 763.      11280   14.8 
    ##  5 Chile                   758.      12698   16.7 
    ##  6 Brazil                  705.     141741  201.  
    ##  7 Mexico                  680.      76430  112.  
    ##  8 United Kingdom          674.      42001   62.3 
    ##  9 Spain                   672.      31232   46.5 
    ## 10 United States           656.     203620  310.  
    ## 11 Sweden                  615.       5880    9.56
    ## 12 Italy                   594.      35851   60.3 
    ## 13 Colombia                533.      25488   47.8 
    ## 14 France                  488.      31608   64.8 
    ## 15 Netherlands             383.       6371   16.6 
    ## 16 Argentina               381.      15749   41.3 
    ## 17 South Africa            338.      16586   49   
    ## 18 Iran                    335.      25779   76.9 
    ## 19 Iraq                    305.       9052   29.7 
    ## 20 Honduras                287.       2289    7.99

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
