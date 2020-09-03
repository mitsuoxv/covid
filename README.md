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

Updated: 2020-09-04

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
    ##  1 United States           32492.  6011042            185
    ##  2 Brazil                  22576.  3950931            175
    ##  3 India                   22273.  3853406            173
    ##  4 Russia                   5940.  1009995            170
    ##  5 Peru                     3865.   657129            170
    ##  6 South Africa             3709.   630595            170
    ##  7 Colombia                 3692.   624069            169
    ##  8 Mexico                   3585.   606036            169
    ##  9 Spain                    2592.   479554            185
    ## 10 Argentina                2518.   428239            170
    ## 11 Chile                    2424.   414739            171
    ## 12 Bangladesh               2102.   317528            151
    ## 13 Iran                     1982.   378752            191
    ## 14 United Kingdom           1840.   338680            184
    ## 15 Saudi Arabia             1824.   317486            174
    ## 16 Pakistan                 1736.   297014            171
    ## 17 Turkey                   1607.   273301            170
    ## 18 France                   1470.   276466            188
    ## 19 Iraq                     1400.   242284            173
    ## 20 Italy                    1399.   271515            194

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            145.               24766.            171
    ##  2 Peru                             129.               21972.            170
    ##  3 Brazil                           112.               19646.            175
    ##  4 United States                    105.               19376.            185
    ##  5 Israel                            93.0              16192.            174
    ##  6 Colombia                          77.3              13059.            169
    ##  7 South Africa                      75.7              12869.            170
    ##  8 Bolivia                           75.5              11789.            156
    ##  9 Saudi Arabia                      70.9              12338.            174
    ## 10 Argentina                         60.9              10358.            170
    ## 11 Dominican Republic                59.2               9734.            164
    ## 12 Spain                             55.7              10312.            185
    ## 13 Kazakhstan                        52.9               8585.            162
    ## 14 Kyrgyzstan                        50.9               8012.            157
    ## 15 Honduras                          48.8               7731.            158
    ## 16 Sweden                            48.8               8846.            181
    ## 17 Iraq                              47.2               8166.            173
    ## 18 Belarus                           47.0               7449.            158
    ## 19 Ecuador                           45.9               7806.            170
    ## 20 Belgium                           45.0               8249.            183

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  28.9         572     1980
    ##  2 Italy                  13.1       35497   271515
    ##  3 United Kingdom         12.3       41514   338680
    ##  4 Belgium                11.5        9898    85817
    ##  5 France                 11.0       30539   276466
    ##  6 Mexico                 10.8       65241   606036
    ##  7 Hungary                 9.35        619     6622
    ##  8 Netherlands             8.65       6226    71971
    ##  9 Chad                    7.57         77     1017
    ## 10 Canada                  7.06       9132   129425
    ## 11 Sweden                  6.88       5820    84532
    ## 12 Sudan                   6.24        823    13189
    ## 13 Spain                   6.09      29194   479554
    ## 14 Niger                   5.87         69     1176
    ## 15 Iran                    5.75      21797   378752
    ## 16 Ecuador                 5.73       6619   115457
    ## 17 Egypt                   5.50       5461    99280
    ## 18 China                   5.23       4734    90442
    ## 19 Mali                    4.50        126     2802
    ## 20 Peru                    4.42      29068   657129

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                    972.      29068   29.9 
    ##  2 Belgium                 951.       9898   10.4 
    ##  3 Chile                   677.      11344   16.7 
    ##  4 United Kingdom          666.      41514   62.3 
    ##  5 Spain                   628.      29194   46.5 
    ##  6 Brazil                  610.     122596  201.  
    ##  7 Sweden                  609.       5820    9.56
    ##  8 United States           592.     183610  310.  
    ##  9 Italy                   588.      35497   60.3 
    ## 10 Mexico                  580.      65241  112.  
    ## 11 Bolivia                 513.       5101    9.95
    ## 12 France                  472.      30539   64.8 
    ## 13 Ecuador                 448.       6619   14.8 
    ## 14 Colombia                420.      20052   47.8 
    ## 15 Netherlands             374.       6226   16.6 
    ## 16 South Africa            294.      14389   49   
    ## 17 Iran                    283.      21797   76.9 
    ## 18 Canada                  271.       9132   33.7 
    ## 19 Iraq                    243.       7201   29.7 
    ## 20 Honduras                236.       1888    7.99

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
