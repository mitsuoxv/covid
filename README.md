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

Updated: 2020-08-27

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
    ##  1 United States           32106.  5682811            177
    ##  2 Brazil                  21693.  3622861            167
    ##  3 India                   19602.  3234474            165
    ##  4 Russia                   5992.   970865            162
    ##  5 South Africa             3783.   613017            162
    ##  6 Peru                     3705.   600438            162
    ##  7 Mexico                   3501.   563705            161
    ##  8 Colombia                 3426.   551696            161
    ##  9 Chile                    2459.   400985            163
    ## 10 Spain                    2330.   412553            177
    ## 11 Argentina                2165.   350867            162
    ## 12 Bangladesh               2094.   299628            143
    ## 13 Iran                     1985.   363363            183
    ## 14 Saudi Arabia             1865.   309768            166
    ## 15 United Kingdom           1862.   327802            176
    ## 16 Pakistan                 1804.   294193            163
    ## 17 Turkey                   1611.   261194            162
    ## 18 Italy                    1403.   261174            186
    ## 19 Germany                  1320.   236429            179
    ## 20 France                   1295.   233293            180

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            147.               23944.            163
    ##  2 Peru                             124.               20077.            162
    ##  3 Brazil                           108.               18015.            167
    ##  4 United States                    103.               18318.            177
    ##  5 Israel                            85.3              14263.            167
    ##  6 South Africa                      77.2              12511.            162
    ##  7 Bolivia                           74.7              11073.            148
    ##  8 Saudi Arabia                      72.5              12038.            166
    ##  9 Colombia                          71.7              11544.            161
    ## 10 Dominican Republic                60.0               9387.            156
    ## 11 Kazakhstan                        54.0               8322.            154
    ## 12 Kyrgyzstan                        52.7               7871.            149
    ## 13 Argentina                         52.4               8487.            162
    ## 14 Sweden                            52.2               9093.            174
    ## 15 Spain                             50.1               8871.            177
    ## 16 Belarus                           48.6               7303.            150
    ## 17 Honduras                          46.2               6944.            150
    ## 18 Ecuador                           45.4               7372.            162
    ## 19 Belgium                           45.2               7916.            175
    ## 20 Iraq                              43.3               7143.            165

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  28.9         558     1928
    ##  2 Italy                  13.6       35445   261174
    ##  3 France                 13.0       30411   233293
    ##  4 United Kingdom         12.6       41449   327802
    ##  5 Belgium                12.0        9878    82353
    ##  6 Hungary                11.8         614     5215
    ##  7 Mexico                 10.8       60800   563705
    ##  8 Netherlands             9.19       6198    67476
    ##  9 Chad                    7.74         77      995
    ## 10 Canada                  7.23       9083   125647
    ## 11 Spain                   7.01      28924   412553
    ## 12 Sweden                  6.69       5814    86891
    ## 13 Sudan                   6.31        819    12974
    ## 14 Niger                   5.88         69     1173
    ## 15 Ecuador                 5.84       6368   109030
    ## 16 Iran                    5.75      20901   363363
    ## 17 Egypt                   5.43       5298    97619
    ## 18 China                   5.23       4719    90239
    ## 19 Peru                    4.63      27813   600438
    ## 20 Mali                    4.62        125     2708

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                 950.       9878   10.4 
    ##  2 Peru                    930.      27813   29.9 
    ##  3 United Kingdom          665.      41449   62.3 
    ##  4 Chile                   654.      10958   16.7 
    ##  5 Spain                   622.      28924   46.5 
    ##  6 Sweden                  608.       5814    9.56
    ##  7 Italy                   587.      35445   60.3 
    ##  8 Brazil                  573.     115309  201.  
    ##  9 United States           568.     176201  310.  
    ## 10 Mexico                  541.      60800  112.  
    ## 11 France                  470.      30411   64.8 
    ## 12 Bolivia                 460.       4578    9.95
    ## 13 Ecuador                 431.       6368   14.8 
    ## 14 Netherlands             372.       6198   16.6 
    ## 15 Colombia                369.      17612   47.8 
    ## 16 Iran                    272.      20901   76.9 
    ## 17 South Africa            272.      13308   49   
    ## 18 Canada                  270.       9083   33.7 
    ## 19 Switzerland             227.       1722    7.58
    ## 20 Iraq                    222.       6596   29.7

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
