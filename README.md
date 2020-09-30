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

Updated: 2020-10-01

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
    ##  1 United States           33382.  7077015            212
    ##  2 India                   31128.  6225763            200
    ##  3 Brazil                  23492.  4745464            202
    ##  4 Russia                   5970.  1176286            197
    ##  5 Colombia                 4174.   818203            196
    ##  6 Peru                     4104.   808714            197
    ##  7 Mexico                   3743.   733717            196
    ##  8 Argentina                3670.   723132            197
    ##  9 South Africa             3413.   672572            197
    ## 10 Spain                    3379.   716481            212
    ## 11 France                   2448.   526435            215
    ## 12 Chile                    2329.   461300            198
    ## 13 United Kingdom           2114.   446160            211
    ## 14 Iran                     2080.   453637            218
    ## 15 Bangladesh               2033.   362043            178
    ## 16 Iraq                     1791.   358290            200
    ## 17 Saudi Arabia             1662.   334187            201
    ## 18 Turkey                   1610.   317272            197
    ## 19 Pakistan                 1576.   312263            198
    ## 20 Philippines              1546.   309303            200

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Israel                           156.               31746.            203
    ##  2 Chile                            139.               27546.            198
    ##  3 Peru                             137.               27041.            197
    ##  4 Brazil                           117.               23597.            202
    ##  5 United States                    108.               22812.            212
    ##  6 Argentina                         88.8              17491.            197
    ##  7 Colombia                          87.3              17121.            196
    ##  8 Bolivia                           73.7              13493.            183
    ##  9 Spain                             72.7              15406.            212
    ## 10 South Africa                      69.7              13726.            197
    ## 11 Saudi Arabia                      64.6              12987.            201
    ## 12 Iraq                              60.4              12075.            200
    ## 13 Dominican Republic                59.5              11391.            191
    ## 14 Belgium                           53.5              11249.            210
    ## 15 Honduras                          51.0               9455.            185
    ## 16 Kazakhstan                        48.5               9173.            189
    ## 17 Ecuador                           46.5               9178.            197
    ## 18 Sweden                            46.4               9676.            208
    ## 19 Kyrgyzstan                        45.9               8472.            184
    ## 20 Belarus                           43.6               8081.            185

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  28.9         588     2035
    ##  2 Italy                  11.5       35875   313011
    ##  3 Mexico                 10.4       76603   733717
    ##  4 United Kingdom          9.43      42072   446160
    ##  5 Belgium                 8.55      10001   117021
    ##  6 Ecuador                 8.33      11312   135749
    ##  7 Chad                    7.12         85     1193
    ##  8 Sweden                  6.37       5890    92466
    ##  9 Sudan                   6.13        836    13640
    ## 10 France                  6.02      31691   526435
    ## 11 Canada                  5.97       9278   155301
    ## 12 Bolivia                 5.89       7900   134223
    ## 13 Niger                   5.77         69     1196
    ## 14 Egypt                   5.74       5914   103079
    ## 15 Iran                    5.73      25986   453637
    ## 16 Netherlands             5.44       6384   117420
    ## 17 China                   5.21       4746    91041
    ## 18 Syria                   4.75        197     4148
    ## 19 Spain                   4.36      31232   716481
    ## 20 Mali                    4.22        131     3101

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   1081.      32324   29.9 
    ##  2 Belgium                 961.      10001   10.4 
    ##  3 Bolivia                 794.       7900    9.95
    ##  4 Ecuador                 765.      11312   14.8 
    ##  5 Chile                   760.      12725   16.7 
    ##  6 Brazil                  706.     142058  201.  
    ##  7 Mexico                  681.      76603  112.  
    ##  8 United Kingdom          675.      42072   62.3 
    ##  9 Spain                   672.      31232   46.5 
    ## 10 United States           657.     203875  310.  
    ## 11 Sweden                  616.       5890    9.56
    ## 12 Italy                   595.      35875   60.3 
    ## 13 Colombia                537.      25641   47.8 
    ## 14 France                  489.      31691   64.8 
    ## 15 Argentina               390.      16113   41.3 
    ## 16 Netherlands             384.       6384   16.6 
    ## 17 South Africa            340.      16667   49   
    ## 18 Iran                    338.      25986   76.9 
    ## 19 Iraq                    307.       9122   29.7 
    ## 20 Honduras                288.       2301    7.99

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
