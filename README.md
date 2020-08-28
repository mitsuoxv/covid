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

Updated: 2020-08-29

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
    ##  1 United States           32208.  5765325            179
    ##  2 Brazil                  21994.  3717156            169
    ##  3 India                   20284.  3387500            167
    ##  4 Russia                   5977.   980405            164
    ##  5 South Africa             3754.   615701            164
    ##  6 Peru                     3739.   613378            164
    ##  7 Mexico                   3520.   573888            163
    ##  8 Colombia                 3510.   572270            163
    ##  9 Chile                    2448.   404102            165
    ## 10 Spain                    2399.   429507            179
    ## 11 Argentina                2257.   370188            164
    ## 12 Bangladesh               2100.   304583            145
    ## 13 Iran                     1987.   367796            185
    ## 14 Saudi Arabia             1856.   311855            168
    ## 15 United Kingdom           1855.   330372            178
    ## 16 Pakistan                 1787.   295053            165
    ## 17 Turkey                   1609.   263998            164
    ## 18 Italy                    1403.   263949            188
    ## 19 France                   1341.   244254            182
    ## 20 Germany                  1323.   239507            181

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            146.               24131.            165
    ##  2 Peru                             125.               20510.            164
    ##  3 Brazil                           109.               18484.            169
    ##  4 United States                    104.               18584.            179
    ##  5 Israel                            87.4              14795.            169
    ##  6 South Africa                      76.6              12565.            164
    ##  7 Bolivia                           75.1              11269.            150
    ##  8 Colombia                          73.5              11975.            163
    ##  9 Saudi Arabia                      72.1              12119.            168
    ## 10 Dominican Republic                59.7               9463.            158
    ## 11 Argentina                         54.6               8954.            164
    ## 12 Kazakhstan                        54.3               8477.            156
    ## 13 Kyrgyzstan                        52.3               7912.            151
    ## 14 Spain                             51.6               9236.            179
    ## 15 Sweden                            50.4               8780.            174
    ## 16 Belarus                           48.2               7348.            152
    ## 17 Honduras                          46.6               7091.            152
    ## 18 Ecuador                           45.8               7520.            164
    ## 19 Belgium                           45.2               8017.            177
    ## 20 Iraq                              44.3               7395.            167

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  29.1         563     1937
    ##  2 Italy                  13.4       35463   263949
    ##  3 United Kingdom         12.6       41477   330372
    ##  4 France                 12.5       30440   244254
    ##  5 Belgium                11.9        9884    83406
    ##  6 Hungary                11.4         614     5379
    ##  7 Mexico                 10.8       62076   573888
    ##  8 Netherlands             9.06       6209    68556
    ##  9 Chad                    7.67         77     1004
    ## 10 Canada                  7.19       9094   126417
    ## 11 Sweden                  6.94       5820    83898
    ## 12 Spain                   6.75      28996   429507
    ## 13 Sudan                   6.31        823    13045
    ## 14 Niger                   5.88         69     1173
    ## 15 Ecuador                 5.82       6471   111219
    ## 16 Iran                    5.75      21137   367796
    ## 17 Egypt                   5.45       5342    98062
    ## 18 China                   5.23       4722    90301
    ## 19 Mali                    4.62        126     2730
    ## 20 Peru                    4.59      28124   613378

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                 950.       9884   10.4 
    ##  2 Peru                    940.      28124   29.9 
    ##  3 United Kingdom          665.      41477   62.3 
    ##  4 Chile                   661.      11072   16.7 
    ##  5 Spain                   623.      28996   46.5 
    ##  6 Sweden                  609.       5820    9.56
    ##  7 Italy                   588.      35463   60.3 
    ##  8 Brazil                  585.     117665  201.  
    ##  9 United States           576.     178561  310.  
    ## 10 Mexico                  552.      62076  112.  
    ## 11 Bolivia                 475.       4726    9.95
    ## 12 France                  470.      30440   64.8 
    ## 13 Ecuador                 438.       6471   14.8 
    ## 14 Colombia                380.      18184   47.8 
    ## 15 Netherlands             373.       6209   16.6 
    ## 16 South Africa            276.      13502   49   
    ## 17 Iran                    275.      21137   76.9 
    ## 18 Canada                  270.       9094   33.7 
    ## 19 Switzerland             227.       1723    7.58
    ## 20 Iraq                    227.       6740   29.7

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
