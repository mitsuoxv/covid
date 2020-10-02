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

Updated: 2020-10-03

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
    ##  1 United States           33460.  7160476            214
    ##  2 India                   31653.  6394068            202
    ##  3 Brazil                  23583.  4810935            204
    ##  4 Russia                   6002.  1194643            199
    ##  5 Colombia                 4190.   829679            198
    ##  6 Peru                     4094.   814829            199
    ##  7 Argentina                3773.   751001            199
    ##  8 Mexico                   3753.   743216            198
    ##  9 Spain                    3638.   778607            214
    ## 10 South Africa             3397.   676084            199
    ## 11 France                   2544.   552249            217
    ## 12 Chile                    2323.   464750            200
    ## 13 United Kingdom           2160.   460182            213
    ## 14 Iran                     2095.   461044            220
    ## 15 Bangladesh               2027.   364987            180
    ## 16 Iraq                     1819.   367474            202
    ## 17 Saudi Arabia             1650.   335097            203
    ## 18 Turkey                   1607.   320070            199
    ## 19 Pakistan                 1566.   313431            200
    ## 20 Philippines              1554.   314079            202

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Israel                           158.               32425.            205
    ##  2 Chile                            139.               27752.            200
    ##  3 Peru                             137.               27245.            199
    ##  4 Brazil                           117.               23923.            204
    ##  5 United States                    108.               23081.            214
    ##  6 Argentina                         91.3              18165.            199
    ##  7 Colombia                          87.7              17361.            198
    ##  8 Spain                             78.2              16742.            214
    ##  9 Bolivia                           73.5              13603.            185
    ## 10 South Africa                      69.3              13798.            199
    ## 11 Saudi Arabia                      64.1              13023.            203
    ## 12 Iraq                              61.3              12385.            202
    ## 13 Dominican Republic                59.3              11475.            193
    ## 14 Belgium                           54.8              11628.            212
    ## 15 Honduras                          51.4               9625.            187
    ## 16 Kazakhstan                        48.1               9189.            191
    ## 17 Ecuador                           47.0               9370.            199
    ## 18 Sweden                            46.6               9797.            210
    ## 19 Kyrgyzstan                        45.8               8542.            186
    ## 20 Belarus                           43.5               8159.            187

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  28.8         588     2043
    ##  2 Italy                  11.3       35918   317409
    ##  3 Mexico                 10.4       77646   743216
    ##  4 United Kingdom          9.17      42202   460182
    ##  5 Belgium                 8.29      10023   120965
    ##  6 Ecuador                 8.25      11433   138584
    ##  7 Chad                    7.07         85     1203
    ##  8 Sweden                  6.29       5893    93615
    ##  9 Sudan                   6.12        836    13653
    ## 10 Bolivia                 5.89       7965   135311
    ## 11 Canada                  5.86       9297   158758
    ## 12 Niger                   5.76         69     1197
    ## 13 France                  5.76      31808   552249
    ## 14 Egypt                   5.76       5946   103317
    ## 15 Iran                    5.72      26380   461044
    ## 16 China                   5.21       4746    91082
    ## 17 Netherlands             5.17       6410   123966
    ## 18 Syria                   4.76        202     4247
    ## 19 Mali                    4.18        131     3131
    ## 20 Tanzania                4.13         21      509

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   1085.      32463   29.9 
    ##  2 Belgium                 963.      10023   10.4 
    ##  3 Bolivia                 801.       7965    9.95
    ##  4 Ecuador                 773.      11433   14.8 
    ##  5 Chile                   766.      12822   16.7 
    ##  6 Brazil                  716.     143952  201.  
    ##  7 Mexico                  690.      77646  112.  
    ##  8 Spain                   688.      31973   46.5 
    ##  9 United Kingdom          677.      42202   62.3 
    ## 10 United States           663.     205666  310.  
    ## 11 Sweden                  617.       5893    9.56
    ## 12 Italy                   595.      35918   60.3 
    ## 13 Colombia                544.      25998   47.8 
    ## 14 France                  491.      31808   64.8 
    ## 15 Argentina               410.      16937   41.3 
    ## 16 Netherlands             385.       6410   16.6 
    ## 17 South Africa            344.      16866   49   
    ## 18 Iran                    343.      26380   76.9 
    ## 19 Iraq                    311.       9231   29.7 
    ## 20 Honduras                295.       2353    7.99

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
