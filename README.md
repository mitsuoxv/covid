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

Updated: 2020-09-18

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
    ##  1 United States           32815.  6530324            199
    ##  2 India                   27370.  5118253            187
    ##  3 Brazil                  23186.  4382263            189
    ##  4 Russia                   5897.  1085281            184
    ##  5 Peru                     4010.   738020            184
    ##  6 Colombia                 3981.   728590            183
    ##  7 Mexico                   3696.   676487            183
    ##  8 South Africa             3551.   653444            184
    ##  9 Argentina                3137.   577338            184
    ## 10 Spain                    3087.   614360            199
    ## 11 Chile                    2374.   439287            185
    ## 12 Bangladesh               2076.   342671            165
    ## 13 Iran                     2001.   410334            205
    ## 14 United Kingdom           1910.   378223            198
    ## 15 France                   1900.   383838            202
    ## 16 Saudi Arabia             1742.   327551            188
    ## 17 Pakistan                 1640.   303634            185
    ## 18 Iraq                     1620.   303059            187
    ## 19 Turkey                   1610.   296391            184
    ## 20 Philippines              1459.   272934            187

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            142.               26232.            185
    ##  2 Peru                             134.               24677.            184
    ##  3 Israel                           115.               21922.            190
    ##  4 Brazil                           115.               21791.            189
    ##  5 United States                    106.               21050.            199
    ##  6 Colombia                          83.3              15246.            183
    ##  7 Argentina                         75.9              13965.            184
    ##  8 Bolivia                           75.8              12896.            170
    ##  9 South Africa                      72.5              13336.            184
    ## 10 Saudi Arabia                      67.7              12729.            188
    ## 11 Spain                             66.4              13210.            199
    ## 12 Dominican Republic                60.2              10741.            178
    ## 13 Iraq                              54.6              10214.            187
    ## 14 Kazakhstan                        50.7               8935.            176
    ## 15 Honduras                          49.9               8589.            172
    ## 16 Kyrgyzstan                        47.8               8197.            171
    ## 17 Sweden                            46.9               9165.            195
    ## 18 Belgium                           46.7               9214.            197
    ## 19 Belarus                           44.8               7719.            172
    ## 20 Ecuador                           44.6               8216.            184

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  28.9         584     2023
    ##  2 Italy                  12.2       35645   291442
    ##  3 United Kingdom         11.0       41684   378223
    ##  4 Mexico                 10.6       71678   676487
    ##  5 Belgium                10.4        9935    95854
    ##  6 Ecuador                 9.05      10996   121525
    ##  7 France                  8.05      30880   383838
    ##  8 Chad                    7.43         81     1090
    ##  9 Netherlands             7.25       6251    86237
    ## 10 Sweden                  6.69       5860    87575
    ## 11 Canada                  6.62       9188   138803
    ## 12 Sudan                   6.18        836    13535
    ## 13 Niger                   5.85         69     1180
    ## 14 Bolivia                 5.80       7447   128286
    ## 15 Iran                    5.76      23632   410334
    ## 16 Egypt                   5.61       5696   101500
    ## 17 China                   5.23       4743    90753
    ## 18 Spain                   4.92      30243   614360
    ## 19 Syria                   4.46        163     3654
    ## 20 Hungary                 4.37        663    15170

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   1034.      30927   29.9 
    ##  2 Belgium                 955.       9935   10.4 
    ##  3 Bolivia                 749.       7447    9.95
    ##  4 Ecuador                 743.      10996   14.8 
    ##  5 Chile                   720.      12058   16.7 
    ##  6 United Kingdom          669.      41684   62.3 
    ##  7 Brazil                  662.     133119  201.  
    ##  8 Spain                   650.      30243   46.5 
    ##  9 Mexico                  637.      71678  112.  
    ## 10 United States           627.     194434  310.  
    ## 11 Sweden                  613.       5860    9.56
    ## 12 Italy                   591.      35645   60.3 
    ## 13 Colombia                487.      23288   47.8 
    ## 14 France                  477.      30880   64.8 
    ## 15 Netherlands             376.       6251   16.6 
    ## 16 South Africa            321.      15705   49   
    ## 17 Iran                    307.      23632   76.9 
    ## 18 Argentina               288.      11910   41.3 
    ## 19 Iraq                    278.       8248   29.7 
    ## 20 Canada                  273.       9188   33.7

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
