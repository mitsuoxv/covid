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

Updated: 2020-09-27

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
    ##  1 United States           33221.  6910082            208
    ##  2 India                   30122.  5903932            196
    ##  3 Brazil                  23523.  4657702            198
    ##  4 Russia                   5924.  1143571            193
    ##  5 Colombia                 4118.   790823            192
    ##  6 Peru                     4087.   788930            193
    ##  7 Mexico                   3726.   715457            192
    ##  8 Argentina                3514.   678266            193
    ##  9 South Africa             3463.   668529            193
    ## 10 Spain                    3444.   716481            208
    ## 11 Chile                    2339.   453868            194
    ## 12 France                   2321.   489813            211
    ## 13 Iran                     2055.   439882            214
    ## 14 Bangladesh               2050.   356767            174
    ## 15 United Kingdom           2044.   423240            207
    ## 16 Iraq                     1743.   341699            196
    ## 17 Saudi Arabia             1686.   332329            197
    ## 18 Turkey                   1613.   311455            193
    ## 19 Pakistan                 1595.   309581            194
    ## 20 Philippines              1527.   299361            196

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Israel                           146.               29110.            199
    ##  2 Chile                            140.               27102.            194
    ##  3 Peru                             137.               26379.            193
    ##  4 Brazil                           117.               23161.            198
    ##  5 United States                    107.               22274.            208
    ##  6 Colombia                          86.2              16548.            192
    ##  7 Argentina                         85.0              16406.            193
    ##  8 Bolivia                           74.4              13332.            179
    ##  9 Spain                             74.1              15406.            208
    ## 10 South Africa                      70.7              13643.            193
    ## 11 Saudi Arabia                      65.5              12915.            197
    ## 12 Dominican Republic                60.0              11258.            187
    ## 13 Iraq                              58.7              11516.            196
    ## 14 Belgium                           51.7              10659.            206
    ## 15 Honduras                          50.5               9161.            181
    ## 16 Kazakhstan                        49.1               9099.            185
    ## 17 Sweden                            46.8               9515.            203
    ## 18 Kyrgyzstan                        46.4               8367.            180
    ## 19 Ecuador                           46.4               8957.            193
    ## 20 Belarus                           43.8               7946.            181

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  28.9         588     2033
    ##  2 Italy                  11.7       35801   306235
    ##  3 Mexico                 10.5       75439   715457
    ##  4 United Kingdom          9.91      41936   423240
    ##  5 Belgium                 8.99       9969   110882
    ##  6 Ecuador                 8.48      11236   132475
    ##  7 Chad                    7.06         83     1175
    ##  8 Sweden                  6.47       5880    90923
    ##  9 France                  6.43      31475   489813
    ## 10 Canada                  6.20       9249   149094
    ## 11 Sudan                   6.15        836    13592
    ## 12 Netherlands             5.97       6319   105810
    ## 13 Bolivia                 5.86       7765   132618
    ## 14 Niger                   5.78         69     1194
    ## 15 Iran                    5.73      25222   439882
    ## 16 Egypt                   5.70       5853   102625
    ## 17 China                   5.22       4746    90951
    ## 18 Syria                   4.62        185     4001
    ## 19 Spain                   4.36      31232   716481
    ## 20 Mali                    4.24        130     3064

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   1068.      31938   29.9 
    ##  2 Belgium                 958.       9969   10.4 
    ##  3 Bolivia                 781.       7765    9.95
    ##  4 Ecuador                 760.      11236   14.8 
    ##  5 Chile                   748.      12527   16.7 
    ##  6 Brazil                  695.     139808  201.  
    ##  7 United Kingdom          673.      41936   62.3 
    ##  8 Spain                   672.      31232   46.5 
    ##  9 Mexico                  671.      75439  112.  
    ## 10 United States           650.     201634  310.  
    ## 11 Sweden                  615.       5880    9.56
    ## 12 Italy                   593.      35801   60.3 
    ## 13 Colombia                522.      24924   47.8 
    ## 14 France                  486.      31475   64.8 
    ## 15 Netherlands             380.       6319   16.6 
    ## 16 Argentina               357.      14766   41.3 
    ## 17 South Africa            333.      16312   49   
    ## 18 Iran                    328.      25222   76.9 
    ## 19 Iraq                    299.       8867   29.7 
    ## 20 Honduras                281.       2249    7.99

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
