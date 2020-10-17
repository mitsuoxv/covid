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

Updated: 2020-10-18

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
    ##  1 United States           34484.  7896895            229
    ##  2 India                   34251.  7432680            217
    ##  3 Brazil                  23604.  5169386            219
    ##  4 Russia                   6498.  1384235            213
    ##  5 Argentina                4434.   949063            214
    ##  6 Colombia                 4398.   936982            213
    ##  7 Spain                    4089.   936560            229
    ##  8 Peru                     4017.   859740            214
    ##  9 Mexico                   3919.   834910            213
    ## 10 France                   3472.   805718            232
    ## 11 South Africa             3271.   700203            214
    ## 12 United Kingdom           3023.   689261            228
    ## 13 Chile                    2270.   488190            215
    ## 14 Iran                     2222.   522387            235
    ## 15 Bangladesh               1979.   386086            195
    ## 16 Iraq                     1936.   420303            217
    ## 17 Italy                    1652.   391611            237
    ## 18 Indonesia                1628.   353461            217
    ## 19 Philippines              1620.   351750            217
    ## 20 Turkey                   1614.   343955            213

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Israel                           188.               40933.            218
    ##  2 Chile                            136.               29152.            215
    ##  3 Peru                             134.               28747.            214
    ##  4 Brazil                           117.               25705.            219
    ##  5 United States                    111.               25455.            229
    ##  6 Argentina                        107.               22956.            214
    ##  7 Colombia                          92.0              19606.            213
    ##  8 Spain                             87.9              20138.            229
    ##  9 Belgium                           85.5              19423.            227
    ## 10 Bolivia                           70.0              14006.            200
    ## 11 Czech Republic                    69.7              15284.            219
    ## 12 South Africa                      66.8              14290.            214
    ## 13 Iraq                              65.3              14165.            217
    ## 14 Saudi Arabia                      60.9              13271.            218
    ## 15 Dominican Republic                58.8              12261.            208
    ## 16 Netherlands                       56.5              12718.            225
    ## 17 France                            53.6              12440.            232
    ## 18 Honduras                          53.3              10775.            202
    ## 19 Libya                             52.0               7405.            142
    ## 20 United Kingdom                    48.5              11055.            228

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  29.0         597     2059
    ##  2 Mexico                 10.2       85285   834910
    ##  3 Italy                   9.30      36427   391611
    ##  4 Ecuador                 8.15      12357   151659
    ##  5 Chad                    6.83         93     1361
    ##  6 United Kingdom          6.30      43429   689261
    ##  7 Sudan                   6.11        836    13691
    ##  8 Bolivia                 6.03       8407   139319
    ##  9 Egypt                   5.80       6099   105159
    ## 10 Sweden                  5.73       5918   103200
    ## 11 Iran                    5.72      29870   522387
    ## 12 Niger                   5.71         69     1209
    ## 13 China                   5.19       4746    91460
    ## 14 Belgium                 5.13      10359   202058
    ## 15 Canada                  5.06       9699   191732
    ## 16 Syria                   4.83        241     4987
    ## 17 Tanzania                4.13         21      509
    ## 18 France                  4.10      33030   805718
    ## 19 Mali                    3.92        132     3368
    ## 20 Peru                    3.91      33577   859740

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   1123.      33577   29.9 
    ##  2 Belgium                 996.      10359   10.4 
    ##  3 Bolivia                 845.       8407    9.95
    ##  4 Ecuador                 835.      12357   14.8 
    ##  5 Chile                   808.      13529   16.7 
    ##  6 Mexico                  758.      85285  112.  
    ##  7 Brazil                  758.     152460  201.  
    ##  8 Spain                   726.      33775   46.5 
    ##  9 United Kingdom          697.      43429   62.3 
    ## 10 United States           696.     216073  310.  
    ## 11 Sweden                  619.       5918    9.56
    ## 12 Argentina               613.      25342   41.3 
    ## 13 Italy                   604.      36427   60.3 
    ## 14 Colombia                595.      28457   47.8 
    ## 15 France                  510.      33030   64.8 
    ## 16 Netherlands             402.       6699   16.6 
    ## 17 Iran                    388.      29870   76.9 
    ## 18 South Africa            375.      18370   49   
    ## 19 Iraq                    342.      10142   29.7 
    ## 20 Honduras                319.       2552    7.99

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
