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

Updated: 2020-10-07

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
    ##  1 United States           33676.  7341406            218
    ##  2 India                   32451.  6685082            206
    ##  3 Brazil                  23631.  4915289            208
    ##  4 Russia                   6095.  1237504            203
    ##  5 Colombia                 4232.   855052            202
    ##  6 Peru                     4079.   828169            203
    ##  7 Argentina                3933.   798486            203
    ##  8 Mexico                   3770.   761665            202
    ##  9 Spain                    3623.   789932            218
    ## 10 South Africa             3360.   682215            203
    ## 11 France                   2706.   598058            221
    ## 12 United Kingdom           2375.   515575            217
    ## 13 Chile                    2312.   471746            204
    ## 14 Iran                     2123.   475674            224
    ## 15 Bangladesh               2011.   370132            184
    ## 16 Iraq                     1858.   382949            206
    ## 17 Saudi Arabia             1626.   336766            207
    ## 18 Turkey                   1605.   326046            203
    ## 19 Philippines              1576.   324762            206
    ## 20 Pakistan                 1544.   315260            204

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Israel                           174.               36008.            207
    ##  2 Chile                            138.               28170.            204
    ##  3 Peru                             136.               27691.            203
    ##  4 Brazil                           118.               24442.            208
    ##  5 United States                    109.               23664.            218
    ##  6 Argentina                         95.1              19314.            203
    ##  7 Colombia                          88.6              17892.            202
    ##  8 Spain                             77.9              16986.            218
    ##  9 Bolivia                           72.7              13759.            189
    ## 10 South Africa                      68.6              13923.            203
    ## 11 Saudi Arabia                      63.2              13088.            207
    ## 12 Iraq                              62.6              12906.            206
    ## 13 Dominican Republic                59.3              11712.            197
    ## 14 Belgium                           58.7              12699.            216
    ## 15 Honduras                          52.1               9967.            191
    ## 16 Kazakhstan                        47.4               9247.            195
    ## 17 Ecuador                           47.0               9556.            203
    ## 18 Sweden                            46.0               9866.            214
    ## 19 Kyrgyzstan                        45.6               8677.            190
    ## 20 Libya                             44.1               5794.            131

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  29.0         593     2045
    ##  2 Italy                  11.0       36002   327586
    ##  3 Mexico                 10.4       79088   761665
    ##  4 Ecuador                 8.26      11681   141339
    ##  5 United Kingdom          8.22      42369   515575
    ##  6 Belgium                 7.63      10078   132109
    ##  7 Chad                    7.03         86     1223
    ##  8 Sweden                  6.25       5895    94283
    ##  9 Sudan                   6.12        836    13653
    ## 10 Bolivia                 5.92       8101   136868
    ## 11 Egypt                   5.77       5990   103781
    ## 12 Niger                   5.75         69     1200
    ## 13 Iran                    5.72      27192   475674
    ## 14 Canada                  5.71       9481   166156
    ## 15 France                  5.36      32069   598058
    ## 16 China                   5.21       4746    91170
    ## 17 Syria                   4.69        207     4411
    ## 18 Netherlands             4.60       6452   140321
    ## 19 Tanzania                4.13         21      509
    ## 20 Mali                    4.11        131     3189

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   1095.      32742   29.9 
    ##  2 Belgium                 969.      10078   10.4 
    ##  3 Bolivia                 814.       8101    9.95
    ##  4 Ecuador                 790.      11681   14.8 
    ##  5 Chile                   778.      13037   16.7 
    ##  6 Brazil                  728.     146352  201.  
    ##  7 Mexico                  703.      79088  112.  
    ##  8 Spain                   690.      32086   46.5 
    ##  9 United Kingdom          680.      42369   62.3 
    ## 10 United States           672.     208433  310.  
    ## 11 Sweden                  617.       5895    9.56
    ## 12 Italy                   597.      36002   60.3 
    ## 13 Colombia                559.      26712   47.8 
    ## 14 Argentina               508.      21018   41.3 
    ## 15 France                  495.      32069   64.8 
    ## 16 Netherlands             388.       6452   16.6 
    ## 17 Iran                    353.      27192   76.9 
    ## 18 South Africa            347.      17016   49   
    ## 19 Iraq                    319.       9464   29.7 
    ## 20 Honduras                303.       2422    7.99

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
