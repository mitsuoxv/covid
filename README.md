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

Updated: 2020-09-19

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
    ##  1 United States           32855.  6571119            200
    ##  2 India                   27737.  5214677            188
    ##  3 Brazil                  23258.  4419083            190
    ##  4 Russia                   5897.  1091186            185
    ##  5 Peru                     4023.   744400            185
    ##  6 Colombia                 4001.   736377            184
    ##  7 Mexico                   3700.   680931            184
    ##  8 South Africa             3543.   655572            185
    ##  9 Argentina                3183.   589012            185
    ## 10 Spain                    3128.   625651            200
    ## 11 Chile                    2371.   441150            186
    ## 12 Bangladesh               2073.   344264            166
    ## 13 Iran                     2005.   413149            206
    ## 14 France                   1942.   394306            203
    ## 15 United Kingdom           1917.   381618            199
    ## 16 Saudi Arabia             1736.   328144            189
    ## 17 Pakistan                 1635.   304386            186
    ## 18 Iraq                     1634.   307385            188
    ## 19 Turkey                   1610.   298039            185
    ## 20 Philippines              1469.   276289            188

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            142.               26343.            186
    ##  2 Peru                             135.               24890.            185
    ##  3 Israel                           122.               23309.            191
    ##  4 Brazil                           116.               21974.            190
    ##  5 United States                    106.               21181.            200
    ##  6 Colombia                          83.7              15409.            184
    ##  7 Argentina                         77.0              14247.            185
    ##  8 Bolivia                           75.7              12955.            171
    ##  9 South Africa                      72.3              13379.            185
    ## 10 Saudi Arabia                      67.5              12752.            189
    ## 11 Spain                             67.3              13453.            200
    ## 12 Dominican Republic                60.2              10804.            179
    ## 13 Iraq                              55.1              10360.            188
    ## 14 Kazakhstan                        50.7               8977.            177
    ## 15 Honduras                          50.3               8719.            173
    ## 16 Kyrgyzstan                        47.6               8213.            172
    ## 17 Belgium                           47.5               9409.            198
    ## 18 Sweden                            46.8               9197.            196
    ## 19 Belarus                           44.7               7743.            173
    ## 20 Ecuador                           44.6               8266.            185

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  28.9         586     2026
    ##  2 Italy                  12.2       35658   293025
    ##  3 United Kingdom         10.9       41705   381618
    ##  4 Mexico                 10.6       71978   680931
    ##  5 Belgium                10.2        9936    97882
    ##  6 Ecuador                 9.02      11029   122257
    ##  7 France                  7.84      30930   394306
    ##  8 Chad                    7.26         81     1115
    ##  9 Netherlands             7.11       6257    87987
    ## 10 Sweden                  6.67       5864    87885
    ## 11 Canada                  6.58       9193   139747
    ## 12 Sudan                   6.18        836    13535
    ## 13 Niger                   5.85         69     1180
    ## 14 Bolivia                 5.80       7478   128872
    ## 15 Iran                    5.76      23808   413149
    ## 16 Egypt                   5.62       5715   101641
    ## 17 China                   5.22       4743    90797
    ## 18 Spain                   4.86      30405   625651
    ## 19 Syria                   4.47        165     3691
    ## 20 Mali                    4.29        128     2983

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   1038.      31051   29.9 
    ##  2 Belgium                 955.       9936   10.4 
    ##  3 Bolivia                 752.       7478    9.95
    ##  4 Ecuador                 746.      11029   14.8 
    ##  5 Chile                   725.      12142   16.7 
    ##  6 United Kingdom          669.      41705   62.3 
    ##  7 Brazil                  667.     134106  201.  
    ##  8 Spain                   654.      30405   46.5 
    ##  9 Mexico                  640.      71978  112.  
    ## 10 United States           631.     195638  310.  
    ## 11 Sweden                  614.       5864    9.56
    ## 12 Italy                   591.      35658   60.3 
    ## 13 Colombia                491.      23478   47.8 
    ## 14 France                  478.      30930   64.8 
    ## 15 Netherlands             376.       6257   16.6 
    ## 16 South Africa            322.      15772   49   
    ## 17 Iran                    310.      23808   76.9 
    ## 18 Argentina               296.      12229   41.3 
    ## 19 Iraq                    281.       8332   29.7 
    ## 20 Canada                  273.       9193   33.7

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
