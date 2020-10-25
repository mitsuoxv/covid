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

Updated: 2020-10-26

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
    ##  1 United States           35456.  8403121            237
    ##  2 India                   34954.  7864811            225
    ##  3 Brazil                  23584.  5353656            227
    ##  4 Russia                   6849.  1513877            221
    ##  5 Argentina                4817.  1069368            222
    ##  6 Colombia                 4520.   998942            221
    ##  7 France                   4436.  1055942            238
    ##  8 Spain                    4414.  1046132            237
    ##  9 Mexico                   3985.   880775            221
    ## 10 Peru                     3977.   883116            222
    ## 11 United Kingdom           3618.   854014            236
    ## 12 South Africa             3217.   714246            222
    ## 13 Iran                     2315.   562705            243
    ## 14 Chile                    2244.   500542            223
    ## 15 Italy                    2059.   504509            245
    ## 16 Iraq                     1996.   449153            225
    ## 17 Bangladesh               1958.   397507            203
    ## 18 Germany                  1795.   429181            239
    ## 19 Indonesia                1715.   385980            225
    ## 20 Philippines              1634.   367819            225

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Israel                           185.               41826.            226
    ##  2 Chile                            134.               29889.            223
    ##  3 Peru                             133.               29529.            222
    ##  4 Belgium                          125.               29349.            235
    ##  5 Brazil                           117.               26621.            227
    ##  6 Argentina                        117.               25866.            222
    ##  7 United States                    114.               27086.            237
    ##  8 Czech Republic                   105.               23940.            227
    ##  9 Spain                             94.9              22495.            237
    ## 10 Colombia                          94.6              20903.            221
    ## 11 Netherlands                       72.4              16866.            233
    ## 12 France                            68.5              16303.            238
    ## 13 Bolivia                           67.9              14136.            208
    ## 14 Iraq                              67.3              15137.            225
    ## 15 South Africa                      65.6              14576.            222
    ## 16 Saudi Arabia                      59.2              13390.            226
    ## 17 Dominican Republic                58.3              12624.            216
    ## 18 United Kingdom                    58.0              13697.            236
    ## 19 Switzerland                       57.5              13629.            237
    ## 20 Libya                             56.0               8415.            150

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  29.1         600     2064
    ##  2 Mexico                 10.0       88312   880775
    ##  3 Ecuador                 7.86      12542   159614
    ##  4 Italy                   7.38      37210   504509
    ##  5 Chad                    6.69         96     1434
    ##  6 Bolivia                 6.12       8608   140612
    ##  7 Sudan                   6.09        837    13742
    ##  8 Egypt                   5.82       6187   106397
    ##  9 Iran                    5.74      32320   562705
    ## 10 Niger                   5.68         69     1215
    ## 11 Sweden                  5.36       5933   110594
    ## 12 United Kingdom          5.24      44745   854014
    ## 13 China                   5.18       4746    91675
    ## 14 Syria                   4.98        267     5359
    ## 15 Canada                  4.67       9888   211732
    ## 16 Tanzania                4.13         21      509
    ## 17 Peru                    3.85      34033   883116
    ## 18 Mali                    3.80        132     3472
    ## 19 Afghanistan             3.71       1511    40768
    ## 20 Nicaragua               3.55        155     4362

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   1138.      34033   29.9 
    ##  2 Belgium                1032.      10737   10.4 
    ##  3 Bolivia                 865.       8608    9.95
    ##  4 Ecuador                 848.      12542   14.8 
    ##  5 Chile                   830.      13892   16.7 
    ##  6 Mexico                  785.      88312  112.  
    ##  7 Brazil                  778.     156471  201.  
    ##  8 Spain                   747.      34752   46.5 
    ##  9 United Kingdom          718.      44745   62.3 
    ## 10 United States           717.     222507  310.  
    ## 11 Argentina               685.      28338   41.3 
    ## 12 Colombia                624.      29802   47.8 
    ## 13 Sweden                  621.       5933    9.56
    ## 14 Italy                   617.      37210   60.3 
    ## 15 France                  531.      34362   64.8 
    ## 16 Netherlands             421.       7009   16.6 
    ## 17 Iran                    420.      32320   76.9 
    ## 18 South Africa            387.      18944   49   
    ## 19 Iraq                    356.      10568   29.7 
    ## 20 Honduras                327.       2612    7.99

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
