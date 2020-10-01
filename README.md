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

Updated: 2020-10-02

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
    ##  1 United States           33406.  7115491            213
    ##  2 India                   31405.  6312584            201
    ##  3 Brazil                  23534.  4777522            203
    ##  4 Russia                   5985.  1185231            198
    ##  5 Colombia                 4182.   824042            197
    ##  6 Peru                     4099.   811768            198
    ##  7 Mexico                   3746.   738163            197
    ##  8 Argentina                3720.   736609            198
    ##  9 Spain                    3611.   769188            213
    ## 10 South Africa             3405.   674339            198
    ## 11 France                   2492.   538290            216
    ## 12 Chile                    2326.   462991            199
    ## 13 United Kingdom           2138.   453268            212
    ## 14 Iran                     2087.   457219            219
    ## 15 Bangladesh               2030.   363479            179
    ## 16 Iraq                     1805.   362981            201
    ## 17 Saudi Arabia             1656.   334605            202
    ## 18 Turkey                   1608.   318663            198
    ## 19 Pakistan                 1568.   312263            199
    ## 20 Philippines              1550    311694            201

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Israel                           159.               32425.            204
    ##  2 Chile                            139.               27647.            199
    ##  3 Peru                             137.               27143.            198
    ##  4 Brazil                           117.               23757.            203
    ##  5 United States                    108.               22936.            213
    ##  6 Argentina                         90.0              17817.            198
    ##  7 Colombia                          87.5              17243.            197
    ##  8 Spain                             77.6              16540.            213
    ##  9 Bolivia                           73.5              13535.            184
    ## 10 South Africa                      69.5              13762.            198
    ## 11 Saudi Arabia                      64.4              13004.            202
    ## 12 Iraq                              60.8              12233.            201
    ## 13 Dominican Republic                59.3              11422.            192
    ## 14 Belgium                           53.9              11377.            211
    ## 15 Honduras                          51.1               9525.            186
    ## 16 Kazakhstan                        48.2               9173.            190
    ## 17 Ecuador                           46.7               9266.            198
    ## 18 Sweden                            46.4               9718.            209
    ## 19 Kyrgyzstan                        45.9               8503.            185
    ## 20 Belarus                           43.6               8119.            186

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  28.9         588     2035
    ##  2 Italy                  11.4       35894   314861
    ##  3 Mexico                 10.5       77163   738163
    ##  4 United Kingdom          9.30      42143   453268
    ##  5 Belgium                 8.46      10016   118358
    ##  6 Ecuador                 8.29      11355   137047
    ##  7 Chad                    7.08         85     1200
    ##  8 Sweden                  6.35       5893    92863
    ##  9 Sudan                   6.13        836    13640
    ## 10 Canada                  5.92       9291   156961
    ## 11 France                  5.90      31746   538290
    ## 12 Bolivia                 5.89       7931   134641
    ## 13 Niger                   5.76         69     1197
    ## 14 Egypt                   5.74       5914   103079
    ## 15 Iran                    5.72      26169   457219
    ## 16 Netherlands             5.30       6397   120713
    ## 17 China                   5.21       4746    91061
    ## 18 Syria                   4.75        197     4148
    ## 19 Mali                    4.20        131     3118
    ## 20 Spain                   4.13      31791   769188

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   1083.      32396   29.9 
    ##  2 Belgium                 963.      10016   10.4 
    ##  3 Bolivia                 797.       7931    9.95
    ##  4 Ecuador                 768.      11355   14.8 
    ##  5 Chile                   761.      12741   16.7 
    ##  6 Brazil                  711.     142921  201.  
    ##  7 Mexico                  686.      77163  112.  
    ##  8 Spain                   684.      31791   46.5 
    ##  9 United Kingdom          676.      42143   62.3 
    ## 10 United States           660.     204642  310.  
    ## 11 Sweden                  617.       5893    9.56
    ## 12 Italy                   595.      35894   60.3 
    ## 13 Colombia                540.      25828   47.8 
    ## 14 France                  490.      31746   64.8 
    ## 15 Argentina               400.      16519   41.3 
    ## 16 Netherlands             384.       6397   16.6 
    ## 17 South Africa            342.      16734   49   
    ## 18 Iran                    340.      26169   76.9 
    ## 19 Iraq                    309.       9181   29.7 
    ## 20 Honduras                291.       2323    7.99

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
