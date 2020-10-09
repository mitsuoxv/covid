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

Updated: 2020-10-10

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
    ##  1 United States           33808.  7471688            221
    ##  2 India                   33043.  6906151            209
    ##  3 Brazil                  23699.  5000694            211
    ##  4 Russia                   6205.  1272238            205
    ##  5 Colombia                 4281.   877683            205
    ##  6 Argentina                4082.   840915            206
    ##  7 Peru                     4056.   835662            206
    ##  8 Spain                    3838.   848324            221
    ##  9 Mexico                   3775.   774020            205
    ## 10 South Africa             3334.   686891            206
    ## 11 France                   2877.   644573            224
    ## 12 United Kingdom           2553.   561819            220
    ## 13 Chile                    2299.   476016            207
    ## 14 Iran                     2150.   488236            227
    ## 15 Bangladesh               2003.   374592            187
    ## 16 Iraq                     1887.   394566            209
    ## 17 Turkey                   1612.   330753            205
    ## 18 Saudi Arabia             1610.   338132            210
    ## 19 Philippines              1587.   331869            209
    ## 20 Pakistan                 1533.   317595            207

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Israel                           177.               37185.            210
    ##  2 Chile                            137.               28425.            207
    ##  3 Peru                             136.               27942.            206
    ##  4 Brazil                           118.               24866.            211
    ##  5 United States                    109.               24084.            221
    ##  6 Argentina                         98.7              20340.            206
    ##  7 Colombia                          89.6              18365.            205
    ##  8 Spain                             82.5              18241.            221
    ##  9 Bolivia                           72.0              13843.            192
    ## 10 South Africa                      68.0              14018.            206
    ## 11 Iraq                              63.6              13298.            209
    ## 12 Belgium                           62.9              13794.            219
    ## 13 Saudi Arabia                      62.6              13141.            210
    ## 14 Dominican Republic                59.3              11897.            200
    ## 15 Honduras                          52.3              10158.            194
    ## 16 Ecuador                           47.6               9807.            206
    ## 17 Sweden                            47.0              10206.            217
    ## 18 Kazakhstan                        46.8               9272.            198
    ## 19 Libya                             46.4               6236.            134
    ## 20 Kyrgyzstan                        45.6               8826.            193

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  28.9         594     2054
    ##  2 Italy                  10.7       36083   338398
    ##  3 Mexico                 10.3       80083   774020
    ##  4 Ecuador                 8.37      12141   145045
    ##  5 United Kingdom          7.58      42592   561819
    ##  6 Belgium                 7.06      10126   143503
    ##  7 Chad                    7.05         89     1262
    ##  8 Sudan                   6.12        836    13670
    ##  9 Sweden                  6.04       5892    97532
    ## 10 Bolivia                 5.95       8192   137706
    ## 11 Egypt                   5.78       6017   104156
    ## 12 Niger                   5.75         69     1200
    ## 13 Iran                    5.71      27888   488236
    ## 14 Canada                  5.51       9541   173123
    ## 15 China                   5.20       4746    91252
    ## 16 France                  5.01      32287   644573
    ## 17 Syria                   4.71        215     4566
    ## 18 Netherlands             4.19       6522   155630
    ## 19 Tanzania                4.13         21      509
    ## 20 Mali                    4.05        131     3235

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   1104.      33009   29.9 
    ##  2 Belgium                 973.      10126   10.4 
    ##  3 Bolivia                 824.       8192    9.95
    ##  4 Ecuador                 821.      12141   14.8 
    ##  5 Chile                   786.      13167   16.7 
    ##  6 Brazil                  737.     148228  201.  
    ##  7 Mexico                  712.      80083  112.  
    ##  8 Spain                   703.      32688   46.5 
    ##  9 United Kingdom          683.      42592   62.3 
    ## 10 United States           678.     210338  310.  
    ## 11 Sweden                  617.       5892    9.56
    ## 12 Italy                   598.      36083   60.3 
    ## 13 Colombia                569.      27180   47.8 
    ## 14 Argentina               538.      22226   41.3 
    ## 15 France                  498.      32287   64.8 
    ## 16 Netherlands             392.       6522   16.6 
    ## 17 Iran                    363.      27888   76.9 
    ## 18 South Africa            355.      17408   49   
    ## 19 Iraq                    326.       9683   29.7 
    ## 20 Honduras                309.       2466    7.99

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
