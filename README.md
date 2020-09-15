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

Updated: 2020-09-16

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
    ##  1 United States           32802.  6462135            197
    ##  2 India                   26649.  4930236            185
    ##  3 Brazil                  23157.  4330455            187
    ##  4 Russia                   5899.  1073849            182
    ##  5 Peru                     4008.   729619            182
    ##  6 Colombia                 3957.   716319            181
    ##  7 Mexico                   3692.   668381            181
    ##  8 South Africa             3575.   650749            182
    ##  9 Argentina                3052.   555537            182
    ## 10 Spain                    2874.   566326            197
    ## 11 Chile                    2384.   436433            183
    ## 12 Bangladesh               2081.   339332            163
    ## 13 Iran                     1993.   404648            203
    ## 14 United Kingdom           1893.   371129            196
    ## 15 France                   1834.   366980            200
    ## 16 Saudi Arabia             1754.   326258            186
    ## 17 Pakistan                 1652.   302424            183
    ## 18 Turkey                   1608.   292878            182
    ## 19 Iraq                     1591.   294478            185
    ## 20 Philippines              1436.   265888            185

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            142.               26061.            183
    ##  2 Peru                             134.               24396.            182
    ##  3 Brazil                           115.               21533.            187
    ##  4 Israel                           111.               20819.            188
    ##  5 United States                    106.               20830.            197
    ##  6 Colombia                          82.8              14989.            181
    ##  7 Bolivia                           75.8              12746.            168
    ##  8 Argentina                         73.8              13437.            182
    ##  9 South Africa                      73.0              13281.            182
    ## 10 Saudi Arabia                      68.1              12679.            186
    ## 11 Spain                             61.8              12177.            197
    ## 12 Dominican Republic                60.0              10598.            176
    ## 13 Iraq                              53.6               9925.            185
    ## 14 Kazakhstan                        51.1               8904.            174
    ## 15 Honduras                          49.8               8485.            170
    ## 16 Kyrgyzstan                        48.2               8169.            169
    ## 17 Sweden                            46.8               9053.            193
    ## 18 Belgium                           46.4               9056.            195
    ## 19 Belarus                           45.1               7678.            170
    ## 20 Ecuador                           44.1               8040.            182

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  29.0         584     2017
    ##  2 Italy                  12.3       35624   288761
    ##  3 United Kingdom         11.2       41637   371129
    ##  4 Mexico                 10.6       70821   668381
    ##  5 Belgium                10.5        9927    94212
    ##  6 Ecuador                 9.19      10922   118911
    ##  7 France                  8.39      30789   366980
    ##  8 Netherlands             7.50       6247    83321
    ##  9 Chad                    7.47         81     1085
    ## 10 Sweden                  6.76       5846    86505
    ## 11 Canada                  6.71       9171   136659
    ## 12 Sudan                   6.18        836    13535
    ## 13 Niger                   5.86         69     1178
    ## 14 Bolivia                 5.79       7344   126791
    ## 15 Iran                    5.76      23313   404648
    ## 16 Egypt                   5.60       5661   101177
    ## 17 Spain                   5.25      29747   566326
    ## 18 China                   5.23       4742    90718
    ## 19 Hungary                 4.88        642    13153
    ## 20 Syria                   4.39        157     3576

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   1027.      30710   29.9 
    ##  2 Belgium                 954.       9927   10.4 
    ##  3 Ecuador                 738.      10922   14.8 
    ##  4 Bolivia                 738.       7344    9.95
    ##  5 Chile                   717.      12013   16.7 
    ##  6 United Kingdom          668.      41637   62.3 
    ##  7 Brazil                  655.     131625  201.  
    ##  8 Spain                   640.      29747   46.5 
    ##  9 Mexico                  630.      70821  112.  
    ## 10 United States           622.     193119  310.  
    ## 11 Sweden                  612.       5846    9.56
    ## 12 Italy                   590.      35624   60.3 
    ## 13 Colombia                480.      22924   47.8 
    ## 14 France                  475.      30789   64.8 
    ## 15 Netherlands             375.       6247   16.6 
    ## 16 South Africa            316.      15499   49   
    ## 17 Iran                    303.      23313   76.9 
    ## 18 Argentina               276.      11412   41.3 
    ## 19 Iraq                    273.       8086   29.7 
    ## 20 Canada                  272.       9171   33.7

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
