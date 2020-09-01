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

Updated: 2020-09-02

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
    ##  1 United States           32440.  5936572            183
    ##  2 Brazil                  22325.  3862311            173
    ##  3 India                   21585.  3691166            171
    ##  4 Russia                   5952.  1000048            168
    ##  5 Peru                     3851.   647166            168
    ##  6 South Africa             3732.   627041            168
    ##  7 Colombia                 3640.   607938            167
    ##  8 Mexico                   3567.   595841            167
    ##  9 Chile                    2435.   411726            169
    ## 10 Argentina                2431.   408426            168
    ## 11 Spain                    2400.   439286            183
    ## 12 Bangladesh               2100.   312996            149
    ## 13 Iran                     1984.   375212            189
    ## 14 United Kingdom           1845.   335877            182
    ## 15 Saudi Arabia             1835.   315772            172
    ## 16 Pakistan                 1751.   296149            169
    ## 17 Turkey                   1607.   270133            168
    ## 18 France                   1424.   264953            186
    ## 19 Italy                    1401.   269214            192
    ## 20 Iraq                     1373.   234934            171

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            145.               24586.            169
    ##  2 Peru                             129.               21639.            168
    ##  3 Brazil                           111.               19206.            173
    ##  4 United States                    105.               19136.            183
    ##  5 Israel                            90.1              15597.            173
    ##  6 Colombia                          76.2              12721.            167
    ##  7 South Africa                      76.2              12797.            168
    ##  8 Bolivia                           75.6              11658.            154
    ##  9 Saudi Arabia                      71.3              12272.            172
    ## 10 Dominican Republic                59.3               9641.            162
    ## 11 Argentina                         58.8               9879.            168
    ## 12 Kazakhstan                        53.6               8579.            160
    ## 13 Spain                             51.6               9446.            183
    ## 14 Kyrgyzstan                        51.4               7980.            155
    ## 15 Sweden                            49.5               8830.            178
    ## 16 Honduras                          48.2               7532.            156
    ## 17 Belarus                           47.5               7418.            156
    ## 18 Iraq                              46.3               7918.            171
    ## 19 Ecuador                           45.7               7692.            168
    ## 20 Belgium                           45.2               8184.            181

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  28.9         567     1962
    ##  2 Italy                  13.2       35483   269214
    ##  3 United Kingdom         12.4       41501   335877
    ##  4 Belgium                11.6        9895    85142
    ##  5 France                 11.5       30494   264953
    ##  6 Mexico                 10.8       64158   595841
    ##  7 Hungary                10.0         615     6139
    ##  8 Netherlands             8.80       6215    70596
    ##  9 Chad                    7.60         77     1013
    ## 10 Canada                  7.13       9117   127940
    ## 11 Sweden                  6.88       5808    84379
    ## 12 Spain                   6.60      29011   439286
    ## 13 Sudan                   6.24        823    13189
    ## 14 Niger                   5.87         69     1176
    ## 15 Ecuador                 5.76       6556   113767
    ## 16 Iran                    5.75      21571   375212
    ## 17 Egypt                   5.48       5421    98939
    ## 18 China                   5.23       4730    90402
    ## 19 Mali                    4.54        126     2776
    ## 20 Peru                    4.45      28788   647166

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                    963.      28788   29.9 
    ##  2 Belgium                 951.       9895   10.4 
    ##  3 Chile                   674.      11289   16.7 
    ##  4 United Kingdom          666.      41501   62.3 
    ##  5 Spain                   624.      29011   46.5 
    ##  6 Sweden                  608.       5808    9.56
    ##  7 Brazil                  601.     120828  201.  
    ##  8 Italy                   588.      35483   60.3 
    ##  9 United States           587.     182162  310.  
    ## 10 Mexico                  570.      64158  112.  
    ## 11 Bolivia                 499.       4966    9.95
    ## 12 France                  471.      30494   64.8 
    ## 13 Ecuador                 443.       6556   14.8 
    ## 14 Colombia                405.      19364   47.8 
    ## 15 Netherlands             373.       6215   16.6 
    ## 16 South Africa            289.      14149   49   
    ## 17 Iran                    280.      21571   76.9 
    ## 18 Canada                  271.       9117   33.7 
    ## 19 Iraq                    237.       7042   29.7 
    ## 20 Honduras                233.       1858    7.99

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
