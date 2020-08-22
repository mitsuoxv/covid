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

Updated: 2020-08-22

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
    ##  1 United States           31844.  5477305            172
    ##  2 Brazil                  21337.  3456652            162
    ##  3 India                   18161.  2905823            160
    ##  4 Russia                   6031.   946976            157
    ##  5 South Africa             3821.   599940            157
    ##  6 Peru                     3556.   558420            157
    ##  7 Mexico                   3442.   537031            156
    ##  8 Colombia                 3218.   502178            156
    ##  9 Chile                    2479.   391849            158
    ## 10 Spain                    2196.   377906            172
    ## 11 Bangladesh               2086.   287959            138
    ## 12 Argentina                1991.   312659            157
    ## 13 Iran                     1980.   352558            178
    ## 14 Saudi Arabia             1887.   303973            161
    ## 15 United Kingdom           1884.   322284            171
    ## 16 Pakistan                 1844.   291588            158
    ## 17 Turkey                   1620.   254520            157
    ## 18 Italy                    1414.   256118            181
    ## 19 Germany                  1313.   228621            174
    ## 20 France                   1233.   215913            175

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            148.               23399.            158
    ##  2 Peru                             119.               18672.            157
    ##  3 Brazil                           106.               17188.            162
    ##  4 United States                    103.               17655.            172
    ##  5 Israel                            82.4              13368.            162
    ##  6 South Africa                      78.0              12244.            157
    ##  7 Bolivia                           73.8              10561.            143
    ##  8 Saudi Arabia                      73.3              11813.            161
    ##  9 Colombia                          67.3              10508.            156
    ## 10 Dominican Republic                59.2               8971.            151
    ## 11 Kazakhstan                        54.8               8170.            149
    ## 12 Kyrgyzstan                        53.7               7752.            144
    ## 13 Sweden                            53.0               8980.            169
    ## 14 Belarus                           49.7               7223.            145
    ## 15 Argentina                         48.2               7563.            157
    ## 16 Spain                             47.2               8126.            172
    ## 17 Ecuador                           45.4               7133.            157
    ## 18 Belgium                           45.2               7698.            170
    ## 19 Honduras                          45.0               6546.            145
    ## 20 Russia                            42.9               6730.            157

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  28.5         542     1903
    ##  2 France                 14.1       30346   215913
    ##  3 Italy                  13.8       35418   256118
    ##  4 United Kingdom         12.8       41403   322284
    ##  5 Belgium                12.5        9976    80084
    ##  6 Hungary                12.1         609     5046
    ##  7 Mexico                 10.9       58481   537031
    ##  8 Netherlands             9.51       6182    64992
    ##  9 Chad                    7.82         76      972
    ## 10 Spain                   7.62      28813   377906
    ## 11 Canada                  7.33       9049   123490
    ## 12 Sweden                  6.76       5805    85810
    ## 13 Sudan                   6.45        812    12582
    ## 14 Niger                   5.90         69     1169
    ## 15 Ecuador                 5.88       6200   105508
    ## 16 Iran                    5.75      20264   352558
    ## 17 Egypt                   5.37       5212    97025
    ## 18 China                   5.24       4716    90053
    ## 19 Peru                    4.81      26834   558420
    ## 20 Mali                    4.69        125     2667

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                 959.       9976   10.4 
    ##  2 Peru                    897.      26834   29.9 
    ##  3 United Kingdom          664.      41403   62.3 
    ##  4 Chile                   637.      10671   16.7 
    ##  5 Spain                   620.      28813   46.5 
    ##  6 Sweden                  607.       5805    9.56
    ##  7 Italy                   587.      35418   60.3 
    ##  8 United States           555.     172033  310.  
    ##  9 Brazil                  552.     111100  201.  
    ## 10 Mexico                  520.      58481  112.  
    ## 11 France                  469.      30346   64.8 
    ## 12 Bolivia                 426.       4233    9.95
    ## 13 Ecuador                 419.       6200   14.8 
    ## 14 Netherlands             371.       6182   16.6 
    ## 15 Colombia                334.      15979   47.8 
    ## 16 Canada                  269.       9049   33.7 
    ## 17 Iran                    263.      20264   76.9 
    ## 18 South Africa            258.      12618   49   
    ## 19 Switzerland             227.       1718    7.58
    ## 20 Iraq                    209.       6208   29.7

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
