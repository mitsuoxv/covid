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

Updated: 2020-08-31

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
    ##  1 United States           32350.  5855521            181
    ##  2 Brazil                  22250.  3804803            171
    ##  3 India                   20962.  3542733            169
    ##  4 Russia                   5965.   990326            166
    ##  5 Peru                     3794.   629961            166
    ##  6 South Africa             3750.   622551            166
    ##  7 Colombia                 3578.   590520            165
    ##  8 Mexico                   3549.   585738            165
    ##  9 Chile                    2442.   408009            167
    ## 10 Spain                    2426.   439286            181
    ## 11 Argentina                2361.   392009            166
    ## 12 Bangladesh               2101.   308925            147
    ## 13 Iran                     1988.   371816            187
    ## 14 United Kingdom           1848.   332756            180
    ## 15 Saudi Arabia             1846.   313911            170
    ## 16 Pakistan                 1769.   295636            167
    ## 17 Turkey                   1608.   267064            166
    ## 18 Italy                    1404.   266853            190
    ## 19 France                   1395.   256829            184
    ## 20 Iraq                     1345.   227446            169

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            146.               24364.            167
    ##  2 Peru                             127.               21064.            166
    ##  3 Brazil                           111.               18920.            171
    ##  4 United States                    104.               18875.            181
    ##  5 Israel                            88.1              15075.            171
    ##  6 South Africa                      76.5              12705.            166
    ##  7 Bolivia                           75.6              11501.            152
    ##  8 Colombia                          74.9              12357.            165
    ##  9 Saudi Arabia                      71.7              12199.            170
    ## 10 Dominican Republic                59.4               9541.            160
    ## 11 Argentina                         57.1               9482.            166
    ## 12 Kazakhstan                        53.9               8518.            158
    ## 13 Spain                             52.2               9446.            181
    ## 14 Kyrgyzstan                        51.9               7955.            153
    ## 15 Sweden                            49.8               8786.            176
    ## 16 Belarus                           47.9               7385.            154
    ## 17 Honduras                          47.7               7361.            154
    ## 18 Ecuador                           45.9               7634.            166
    ## 19 Iraq                              45.3               7665.            169
    ## 20 Belgium                           45.3               8123.            179

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  28.9         564     1950
    ##  2 Italy                  13.3       35473   266853
    ##  3 United Kingdom         12.5       41498   332756
    ##  4 France                 11.9       30465   256829
    ##  5 Belgium                11.7        9891    84505
    ##  6 Hungary                10.8         614     5669
    ##  7 Mexico                 10.8       63146   585738
    ##  8 Netherlands             8.93       6215    69563
    ##  9 Chad                    7.64         77     1008
    ## 10 Canada                  7.15       9108   127358
    ## 11 Sweden                  6.93       5821    83958
    ## 12 Spain                   6.60      29011   439286
    ## 13 Sudan                   6.24        823    13189
    ## 14 Niger                   5.87         69     1175
    ## 15 Ecuador                 5.79       6537   112906
    ## 16 Iran                    5.74      21359   371816
    ## 17 Egypt                   5.46       5376    98497
    ## 18 China                   5.23       4728    90351
    ## 19 Mali                    4.57        126     2757
    ## 20 Peru                    4.52      28471   629961

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                    952.      28471   29.9 
    ##  2 Belgium                 951.       9891   10.4 
    ##  3 Chile                   668.      11181   16.7 
    ##  4 United Kingdom          666.      41498   62.3 
    ##  5 Spain                   624.      29011   46.5 
    ##  6 Sweden                  609.       5821    9.56
    ##  7 Brazil                  594.     119504  201.  
    ##  8 Italy                   588.      35473   60.3 
    ##  9 United States           582.     180689  310.  
    ## 10 Mexico                  561.      63146  112.  
    ## 11 Bolivia                 487.       4846    9.95
    ## 12 France                  470.      30465   64.8 
    ## 13 Ecuador                 442.       6537   14.8 
    ## 14 Colombia                393.      18767   47.8 
    ## 15 Netherlands             373.       6215   16.6 
    ## 16 South Africa            285.      13981   49   
    ## 17 Iran                    278.      21359   76.9 
    ## 18 Canada                  270.       9108   33.7 
    ## 19 Iraq                    232.       6891   29.7 
    ## 20 Honduras                229.       1827    7.99

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
