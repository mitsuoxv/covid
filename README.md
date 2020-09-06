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

Updated: 2020-09-07

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
    ##  1 United States           32681.  6144138            188
    ##  2 India                   23373.  4113811            176
    ##  3 Brazil                  22993.  4092832            178
    ##  4 Russia                   5927.  1025505            173
    ##  5 Peru                     3912.   676848            173
    ##  6 Colombia                 3779.   650062            172
    ##  7 South Africa             3681.   636884            173
    ##  8 Mexico                   3622.   623090            172
    ##  9 Argentina                2669.   461882            173
    ## 10 Spain                    2654.   498989            188
    ## 11 Chile                    2415.   420434            174
    ## 12 Bangladesh               2100.   323565            154
    ## 13 Iran                     1982.   384666            194
    ## 14 United Kingdom           1840.   344168            187
    ## 15 Saudi Arabia             1807.   319932            177
    ## 16 Pakistan                 1714.   298509            174
    ## 17 Turkey                   1607.   278228            173
    ## 18 France                   1573.   300515            191
    ## 19 Iraq                     1458.   256719            176
    ## 20 Italy                    1402.   276338            197

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            144.               25106.            174
    ##  2 Peru                             131.               22632.            173
    ##  3 Brazil                           114.               20352.            178
    ##  4 United States                    105.               19805.            188
    ##  5 Israel                            96.0              17009.            177
    ##  6 Colombia                          79.1              13602.            172
    ##  7 Bolivia                           75.5              12021.            159
    ##  8 South Africa                      75.1              12998.            173
    ##  9 Saudi Arabia                      70.2              12433.            177
    ## 10 Argentina                         64.6              11172.            173
    ## 11 Dominican Republic                60.0              10055.            167
    ## 12 Spain                             57.1              10730.            188
    ## 13 Kazakhstan                        52.9               8730.            165
    ## 14 Kyrgyzstan                        50.3               8061.            160
    ## 15 Honduras                          49.5               7985.            161
    ## 16 Iraq                              49.1               8652.            176
    ## 17 Sweden                            48.3               8893.            184
    ## 18 Belarus                           46.5               7503.            161
    ## 19 Ecuador                           46.1               7981.            173
    ## 20 Belgium                           45.3               8433.            186

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  28.8         573     1987
    ##  2 Italy                  12.9       35534   276338
    ##  3 United Kingdom         12.1       41549   344168
    ##  4 Belgium                11.3        9905    87731
    ##  5 Mexico                 10.7       66851   623090
    ##  6 France                 10.2       30546   300515
    ##  7 Netherlands             8.45       6232    73790
    ##  8 Hungary                 7.91        624     7892
    ##  9 Chad                    7.45         77     1034
    ## 10 Canada                  6.97       9141   131124
    ## 11 Sweden                  6.87       5835    84985
    ## 12 Sudan                   6.21        832    13407
    ## 13 Spain                   5.90      29418   498989
    ## 14 Niger                   5.86         69     1177
    ## 15 Iran                    5.76      22154   384666
    ## 16 Ecuador                 5.70       6724   118045
    ## 17 Egypt                   5.53       5511    99712
    ## 18 China                   5.23       4735    90517
    ## 19 Bolivia                 4.47       5343   119580
    ## 20 Mali                    4.45        126     2833

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                    988.      29554   29.9 
    ##  2 Belgium                 952.       9905   10.4 
    ##  3 Chile                   690.      11551   16.7 
    ##  4 United Kingdom          666.      41549   62.3 
    ##  5 Spain                   633.      29418   46.5 
    ##  6 Brazil                  624.     125521  201.  
    ##  7 Sweden                  611.       5835    9.56
    ##  8 United States           602.     186663  310.  
    ##  9 Mexico                  594.      66851  112.  
    ## 10 Italy                   589.      35534   60.3 
    ## 11 Bolivia                 537.       5343    9.95
    ## 12 France                  472.      30546   64.8 
    ## 13 Ecuador                 455.       6724   14.8 
    ## 14 Colombia                437.      20888   47.8 
    ## 15 Netherlands             374.       6232   16.6 
    ## 16 South Africa            302.      14779   49   
    ## 17 Iran                    288.      22154   76.9 
    ## 18 Canada                  271.       9141   33.7 
    ## 19 Iraq                    250.       7422   29.7 
    ## 20 Honduras                248.       1984    7.99

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
