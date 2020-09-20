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

Updated: 2020-09-21

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
    ##  1 United States           32980.  6662003            202
    ##  2 India                   28424.  5400619            190
    ##  3 Brazil                  23412.  4495183            192
    ##  4 Russia                   5900.  1103399            187
    ##  5 Peru                     4044.   756412            187
    ##  6 Colombia                 4034.   750471            186
    ##  7 Mexico                   3703.   688954            186
    ##  8 South Africa             3527.   659656            187
    ##  9 Argentina                3281.   613658            187
    ## 10 Spain                    3168.   640040            202
    ## 11 Chile                    2364.   444674            188
    ## 12 Bangladesh               2067.   347372            168
    ## 13 France                   2052.   420855            205
    ## 14 Iran                     2014.   419043            208
    ## 15 United Kingdom           1942.   390362            201
    ## 16 Saudi Arabia             1723.   329271            191
    ## 17 Iraq                     1660.   315597            190
    ## 18 Pakistan                 1625.   305671            188
    ## 19 Turkey                   1610.   301348            187
    ## 20 Philippines              1491.   283460            190

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            141.               26553.            188
    ##  2 Peru                             135.               25292.            187
    ##  3 Israel                           124.               23994.            193
    ##  4 Brazil                           116.               22353.            192
    ##  5 United States                    106.               21474.            202
    ##  6 Colombia                          84.4              15704.            186
    ##  7 Argentina                         79.4              14843.            187
    ##  8 Bolivia                           75.5              13074.            173
    ##  9 South Africa                      72.0              13462.            187
    ## 10 Spain                             68.1              13763.            202
    ## 11 Saudi Arabia                      67.0              12796.            191
    ## 12 Dominican Republic                60.4              10963.            181
    ## 13 Iraq                              56.0              10636.            190
    ## 14 Honduras                          50.4               8838.            175
    ## 15 Kazakhstan                        50.3               9019.            179
    ## 16 Belgium                           48.3               9675.            200
    ## 17 Kyrgyzstan                        47.3               8245.            174
    ## 18 Sweden                            46.6               9234.            198
    ## 19 Ecuador                           45.4               8493.            187
    ## 20 Belarus                           44.4               7792.            175

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  28.9         586     2030
    ##  2 Italy                  12.0       35692   296569
    ##  3 United Kingdom         10.7       41759   390362
    ##  4 Mexico                 10.6       72803   688954
    ##  5 Belgium                 9.88       9944   100654
    ##  6 Ecuador                 8.83      11089   125620
    ##  7 France                  7.39      31109   420855
    ##  8 Chad                    7.05         81     1149
    ##  9 Netherlands             6.82       6266    91841
    ## 10 Sweden                  6.65       5865    88237
    ## 11 Canada                  6.49       9205   141911
    ## 12 Sudan                   6.18        836    13535
    ## 13 Niger                   5.84         69     1182
    ## 14 Bolivia                 5.81       7550   130051
    ## 15 Iran                    5.76      24118   419043
    ## 16 Egypt                   5.64       5750   101900
    ## 17 China                   5.22       4744    90840
    ## 18 Spain                   4.76      30495   640040
    ## 19 Syria                   4.52        170     3765
    ## 20 Mali                    4.26        128     3006

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   1046.      31283   29.9 
    ##  2 Belgium                 956.       9944   10.4 
    ##  3 Bolivia                 759.       7550    9.95
    ##  4 Ecuador                 750.      11089   14.8 
    ##  5 Chile                   732.      12254   16.7 
    ##  6 Brazil                  675.     135793  201.  
    ##  7 United Kingdom          670.      41759   62.3 
    ##  8 Spain                   656.      30495   46.5 
    ##  9 Mexico                  647.      72803  112.  
    ## 10 United States           636.     197442  310.  
    ## 11 Sweden                  614.       5865    9.56
    ## 12 Italy                   592.      35692   60.3 
    ## 13 Colombia                499.      23850   47.8 
    ## 14 France                  480.      31109   64.8 
    ## 15 Netherlands             376.       6266   16.6 
    ## 16 South Africa            325.      15940   49   
    ## 17 Iran                    314.      24118   76.9 
    ## 18 Argentina               307.      12705   41.3 
    ## 19 Iraq                    286.       8491   29.7 
    ## 20 Canada                  273.       9205   33.7

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
