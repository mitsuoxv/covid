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

Updated: 2020-10-14

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
    ##  1 United States           34142.  7682128            225
    ##  2 India                   33689.  7175880            213
    ##  3 Brazil                  23697.  5094979            215
    ##  4 Russia                   6345.  1326178            209
    ##  5 Colombia                 4360.   911316            209
    ##  6 Argentina                4258.   894206            210
    ##  7 Peru                     4044.   849371            210
    ##  8 Mexico                   3911.   817503            209
    ##  9 Spain                    3827.   861112            225
    ## 10 South Africa             3301.   693359            210
    ## 11 France                   3139.   715764            228
    ## 12 United Kingdom           2757.   617692            224
    ## 13 Chile                    2288.   482888            211
    ## 14 Iran                     2182.   504281            231
    ## 15 Bangladesh               1988.   379738            191
    ## 16 Iraq                     1903.   405437            213
    ## 17 Turkey                   1612.   337147            209
    ## 18 Philippines              1609.   342816            213
    ## 19 Saudi Arabia             1586.   339615            214
    ## 20 Indonesia                1580.   336716            213

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Israel                           185.               39655.            214
    ##  2 Chile                            137.               28835.            211
    ##  3 Peru                             135.               28400.            210
    ##  4 Brazil                           118.               25335.            215
    ##  5 United States                    110.               24762.            225
    ##  6 Argentina                        103.               21629.            210
    ##  7 Colombia                          91.2              19069.            209
    ##  8 Spain                             82.3              18516.            225
    ##  9 Belgium                           71.4              15936.            223
    ## 10 Bolivia                           71.0              13931.            196
    ## 11 South Africa                      67.4              14150.            210
    ## 12 Iraq                              64.1              13664.            213
    ## 13 Saudi Arabia                      61.7              13198.            214
    ## 14 Dominican Republic                59.1              12097.            204
    ## 15 Czech Republic                    53.9              11590.            215
    ## 16 Honduras                          53.1              10524.            198
    ## 17 Netherlands                       49.2              10892.            221
    ## 18 Libya                             49.0               6782.            138
    ## 19 France                            48.5              11051.            228
    ## 20 Ecuador                           47.4               9960.            210

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  29.0         597     2056
    ##  2 Mexico                 10.2       83781   817503
    ##  3 Italy                  10.1       36205   359569
    ##  4 Ecuador                 8.29      12218   147315
    ##  5 Chad                    7.03         92     1308
    ##  6 United Kingdom          6.94      42875   617692
    ##  7 Belgium                 6.16      10211   165787
    ##  8 Sudan                   6.11        836    13691
    ##  9 Bolivia                 6.00       8308   138574
    ## 10 Sweden                  5.99       5894    98451
    ## 11 Egypt                   5.79       6062   104648
    ## 12 Niger                   5.75         69     1201
    ## 13 Iran                    5.71      28816   504281
    ## 14 Canada                  5.29       9613   181864
    ## 15 China                   5.19       4746    91359
    ## 16 Syria                   4.78        228     4774
    ## 17 France                  4.55      32589   715764
    ## 18 Tanzania                4.13         21      509
    ## 19 Mali                    4.00        132     3296
    ## 20 Peru                    3.92      33305   849371

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   1114.      33305   29.9 
    ##  2 Belgium                 982.      10211   10.4 
    ##  3 Bolivia                 835.       8308    9.95
    ##  4 Ecuador                 826.      12218   14.8 
    ##  5 Chile                   799.      13379   16.7 
    ##  6 Brazil                  748.     150488  201.  
    ##  7 Mexico                  745.      83781  112.  
    ##  8 Spain                   708.      32929   46.5 
    ##  9 United Kingdom          688.      42875   62.3 
    ## 10 United States           688.     213291  310.  
    ## 11 Sweden                  617.       5894    9.56
    ## 12 Italy                   600.      36205   60.3 
    ## 13 Colombia                582.      27834   47.8 
    ## 14 Argentina               577.      23868   41.3 
    ## 15 France                  503.      32589   64.8 
    ## 16 Netherlands             396.       6587   16.6 
    ## 17 Iran                    375.      28816   76.9 
    ## 18 South Africa            365.      17863   49   
    ## 19 Iraq                    334.       9912   29.7 
    ## 20 Honduras                314.       2512    7.99

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
