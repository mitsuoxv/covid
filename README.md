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

Updated: 2020-10-11

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
    ##  1 United States           33900.  7525920            222
    ##  2 India                   33235.  6979423            210
    ##  3 Brazil                  23719.  5028444            212
    ##  4 Russia                   6238.  1285084            206
    ##  5 Colombia                 4301.   886179            206
    ##  6 Argentina                4137.   856369            207
    ##  7 Peru                     4051.   838614            207
    ##  8 Mexico                   3905.   804488            206
    ##  9 Spain                    3878.   861112            222
    ## 10 South Africa             3326.   688532            207
    ## 11 France                   2954.   664693            225
    ## 12 United Kingdom           2604.   575683            221
    ## 13 Chile                    2296.   477769            208
    ## 14 Iran                     2159.   492378            228
    ## 15 Bangladesh               1999.   375870            188
    ## 16 Iraq                     1894.   397780            210
    ## 17 Turkey                   1613.   332382            206
    ## 18 Saudi Arabia             1604.   338539            211
    ## 19 Philippines              1593.   334770            210
    ## 20 Indonesia                1545.   324658            210

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Israel                           184.               38905.            211
    ##  2 Chile                            137.               28529.            208
    ##  3 Peru                             135.               28041.            207
    ##  4 Brazil                           118.               25004.            212
    ##  5 United States                    109.               24259.            222
    ##  6 Argentina                        100.               20714.            207
    ##  7 Colombia                          90.0              18543.            206
    ##  8 Spain                             83.4              18516.            222
    ##  9 Bolivia                           71.8              13870.            193
    ## 10 South Africa                      67.9              14052.            207
    ## 11 Belgium                           65.0              14312.            220
    ## 12 Iraq                              63.8              13406.            210
    ## 13 Saudi Arabia                      62.3              13156.            211
    ## 14 Dominican Republic                59.3              11956.            201
    ## 15 Honduras                          52.4              10223.            195
    ## 16 Czech Republic                    49.2              10440.            212
    ## 17 Ecuador                           47.3               9807.            207
    ## 18 Libya                             47.3               6402.            135
    ## 19 Sweden                            47.2              10303.            218
    ## 20 Kazakhstan                        46.9               9340.            199

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  28.9         594     2055
    ##  2 Italy                  10.5       36111   343770
    ##  3 Mexico                 10.3       83096   804488
    ##  4 Ecuador                 8.37      12141   145045
    ##  5 United Kingdom          7.41      42679   575683
    ##  6 Chad                    7.06         90     1274
    ##  7 Belgium                 6.82      10147   148888
    ##  8 Sudan                   6.12        836    13670
    ##  9 Sweden                  5.99       5894    98451
    ## 10 Bolivia                 5.96       8228   137969
    ## 11 Egypt                   5.78       6029   104262
    ## 12 Niger                   5.75         69     1200
    ## 13 Iran                    5.71      28098   492378
    ## 14 Canada                  5.44       9557   175559
    ## 15 China                   5.20       4746    91278
    ## 16 France                  4.87      32395   664693
    ## 17 Syria                   4.72        218     4616
    ## 18 Tanzania                4.13         21      509
    ## 19 Netherlands             4.04       6535   161589
    ## 20 Mali                    4.03        131     3248

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   1107.      33098   29.9 
    ##  2 Belgium                 975.      10147   10.4 
    ##  3 Bolivia                 827.       8228    9.95
    ##  4 Ecuador                 821.      12141   14.8 
    ##  5 Chile                   789.      13220   16.7 
    ##  6 Brazil                  741.     148957  201.  
    ##  7 Mexico                  739.      83096  112.  
    ##  8 Spain                   708.      32929   46.5 
    ##  9 United Kingdom          685.      42679   62.3 
    ## 10 United States           681.     211311  310.  
    ## 11 Sweden                  617.       5894    9.56
    ## 12 Italy                   598.      36111   60.3 
    ## 13 Colombia                572.      27331   47.8 
    ## 14 Argentina               549.      22710   41.3 
    ## 15 France                  500.      32395   64.8 
    ## 16 Netherlands             393.       6535   16.6 
    ## 17 Iran                    365.      28098   76.9 
    ## 18 South Africa            358.      17547   49   
    ## 19 Iraq                    328.       9735   29.7 
    ## 20 Honduras                310.       2477    7.99

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
