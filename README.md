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

Updated: 2020-09-25

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
    ##  1 United States           33149.  6828785            206
    ##  2 India                   29548.  5732518            194
    ##  3 Brazil                  23426.  4591604            196
    ##  4 Russia                   5909.  1128836            191
    ##  5 Colombia                 4092.   777537            190
    ##  6 Peru                     4065.   776546            191
    ##  7 Mexico                   3711.   705263            190
    ##  8 South Africa             3482.   665188            191
    ##  9 Argentina                3414.   652174            191
    ## 10 Spain                    3366.   693556            206
    ## 11 Chile                    2342.   449903            192
    ## 12 France                   2192.   458132            209
    ## 13 Bangladesh               2057.   353844            172
    ## 14 Iran                     2041.   432798            212
    ## 15 United Kingdom           1998.   409733            205
    ## 16 Iraq                     1714.   332635            194
    ## 17 Saudi Arabia             1699.   331359            195
    ## 18 Turkey                   1612.   308069            191
    ## 19 Pakistan                 1604.   308208            192
    ## 20 Philippines              1518.   294591            194

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            140.               26866.            192
    ##  2 Israel                           137.               27070.            197
    ##  3 Peru                             136.               25965.            191
    ##  4 Brazil                           116.               22832.            196
    ##  5 United States                    107.               22012.            206
    ##  6 Colombia                          85.6              16270.            190
    ##  7 Argentina                         82.6              15775.            191
    ##  8 Bolivia                           74.6              13215.            177
    ##  9 Spain                             72.4              14913.            206
    ## 10 South Africa                      71.1              13575.            191
    ## 11 Saudi Arabia                      66.0              12877.            195
    ## 12 Dominican Republic                60.2              11171.            185
    ## 13 Iraq                              57.8              11211.            194
    ## 14 Honduras                          50.5               9050.            179
    ## 15 Belgium                           50.3              10266.            204
    ## 16 Kazakhstan                        49.6               9080.            183
    ## 17 Kyrgyzstan                        46.6               8306.            178
    ## 18 Sweden                            46.4               9393.            202
    ## 19 Ecuador                           46.0               8788.            191
    ## 20 Belarus                           44.0               7884.            179

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  28.9         587     2033
    ##  2 Italy                  11.8       35758   302537
    ##  3 Mexico                 10.5       74348   705263
    ##  4 United Kingdom         10.2       41862   409733
    ##  5 Belgium                 9.33       9959   106793
    ##  6 Ecuador                 8.59      11171   129982
    ##  7 Chad                    7.04         82     1164
    ##  8 France                  6.83      31273   458132
    ##  9 Sweden                  6.55       5876    89756
    ## 10 Canada                  6.30       9234   146663
    ## 11 Netherlands             6.26       6287   100493
    ## 12 Sudan                   6.16        836    13578
    ## 13 Bolivia                 5.85       7693   131453
    ## 14 Niger                   5.78         69     1193
    ## 15 Iran                    5.74      24840   432798
    ## 16 Egypt                   5.69       5822   102375
    ## 17 China                   5.22       4745    90918
    ## 18 Syria                   4.61        181     3924
    ## 19 Spain                   4.47      31034   693556
    ## 20 Mali                    4.28        130     3034

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   1056.      31568   29.9 
    ##  2 Belgium                 957.       9959   10.4 
    ##  3 Bolivia                 773.       7693    9.95
    ##  4 Ecuador                 755.      11171   14.8 
    ##  5 Chile                   737.      12345   16.7 
    ##  6 Brazil                  687.     138108  201.  
    ##  7 United Kingdom          671.      41862   62.3 
    ##  8 Spain                   667.      31034   46.5 
    ##  9 Mexico                  661.      74348  112.  
    ## 10 United States           643.     199600  310.  
    ## 11 Sweden                  615.       5876    9.56
    ## 12 Italy                   593.      35758   60.3 
    ## 13 Colombia                514.      24570   47.8 
    ## 14 France                  483.      31273   64.8 
    ## 15 Netherlands             378.       6287   16.6 
    ## 16 Argentina               337.      13952   41.3 
    ## 17 South Africa            331.      16206   49   
    ## 18 Iran                    323.      24840   76.9 
    ## 19 Iraq                    295.       8754   29.7 
    ## 20 Honduras                276.       2206    7.99

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
