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

Updated: 2020-09-06

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
    ##  1 United States           32593.  6095007            187
    ##  2 India                   22989.  4023179            175
    ##  3 Brazil                  22834.  4041638            177
    ##  4 Russia                   5931.  1020310            172
    ##  5 Peru                     3895.   670145            172
    ##  6 Colombia                 3751.   641574            171
    ##  7 South Africa             3692.   635078            172
    ##  8 Mexico                   3607.   616894            171
    ##  9 Spain                    2668.   498989            187
    ## 10 Argentina                2623.   451198            172
    ## 11 Chile                    2418.   418469            173
    ## 12 Bangladesh               2101.   321615            153
    ## 13 Iran                     1983.   382772            193
    ## 14 United Kingdom           1840.   342355            186
    ## 15 Saudi Arabia             1813.   319141            176
    ## 16 Pakistan                 1722.   298025            173
    ## 17 Turkey                   1607.   276555            172
    ## 18 France                   1537.   292125            190
    ## 19 Iraq                     1440.   252075            175
    ## 20 Italy                    1401.   274644            196

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            144.               24988.            173
    ##  2 Peru                             130.               22408.            172
    ##  3 Brazil                           114.               20097.            177
    ##  4 United States                    105.               19647.            187
    ##  5 Israel                            96.5              17009.            176
    ##  6 Colombia                          78.5              13425.            171
    ##  7 Bolivia                           75.5              11941.            158
    ##  8 South Africa                      75.3              12961.            172
    ##  9 Saudi Arabia                      70.4              12403.            176
    ## 10 Argentina                         63.4              10913.            172
    ## 11 Dominican Republic                59.1               9836.            166
    ## 12 Spain                             57.4              10730.            187
    ## 13 Kazakhstan                        52.8               8665.            164
    ## 14 Kyrgyzstan                        50.5               8045.            159
    ## 15 Honduras                          49.3               7905.            160
    ## 16 Iraq                              48.5               8495.            175
    ## 17 Sweden                            48.5               8893.            183
    ## 18 Belarus                           46.7               7484.            160
    ## 19 Ecuador                           46.0               7922.            172
    ## 20 Belgium                           45.2               8371.            185

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  28.8         573     1987
    ##  2 Italy                  12.9       35518   274644
    ##  3 United Kingdom         12.1       41537   342355
    ##  4 Belgium                11.4        9901    87080
    ##  5 Mexico                 10.8       66329   616894
    ##  6 France                 10.5       30535   292125
    ##  7 Netherlands             8.52       6228    73136
    ##  8 Hungary                 8.41        621     7382
    ##  9 Chad                    7.53         77     1023
    ## 10 Canada                  7.00       9141   130493
    ## 11 Sweden                  6.87       5835    84985
    ## 12 Sudan                   6.24        823    13189
    ## 13 Spain                   5.90      29418   498989
    ## 14 Niger                   5.86         69     1177
    ## 15 Iran                    5.76      22044   382772
    ## 16 Ecuador                 5.70       6674   117175
    ## 17 Egypt                   5.52       5495    99582
    ## 18 China                   5.23       4735    90498
    ## 19 Mali                    4.48        126     2814
    ## 20 Bolivia                 4.45       5288   118781

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                    983.      29405   29.9 
    ##  2 Belgium                 952.       9901   10.4 
    ##  3 Chile                   686.      11494   16.7 
    ##  4 United Kingdom          666.      41537   62.3 
    ##  5 Spain                   633.      29418   46.5 
    ##  6 Brazil                  620.     124614  201.  
    ##  7 Sweden                  611.       5835    9.56
    ##  8 United States           599.     185687  310.  
    ##  9 Mexico                  590.      66329  112.  
    ## 10 Italy                   589.      35518   60.3 
    ## 11 Bolivia                 532.       5288    9.95
    ## 12 France                  471.      30535   64.8 
    ## 13 Ecuador                 451.       6674   14.8 
    ## 14 Colombia                431.      20618   47.8 
    ## 15 Netherlands             374.       6228   16.6 
    ## 16 South Africa            300.      14678   49   
    ## 17 Iran                    287.      22044   76.9 
    ## 18 Canada                  271.       9141   33.7 
    ## 19 Iraq                    248.       7359   29.7 
    ## 20 Honduras                245.       1954    7.99

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
