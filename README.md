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

Updated: 2020-10-29

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
    ##  1 United States           35880.  8611256            240
    ##  2 India                   35045.  7990322            228
    ##  3 Brazil                  23521.  5409854            230
    ##  4 Russia                   6981.  1563976            224
    ##  5 Argentina                4899.  1102301            225
    ##  6 France                   4845.  1167701            241
    ##  7 Colombia                 4576.  1025052            224
    ##  8 Spain                    4358.  1046132            240
    ##  9 Mexico                   3996.   895326            224
    ## 10 Peru                     3957.   890574            225
    ## 11 United Kingdom           3839.   917579            239
    ## 12 South Africa             3190.   717851            225
    ## 13 Iran                     2365.   581824            246
    ## 14 Italy                    2277.   564778            248
    ## 15 Chile                    2232.   504525            226
    ## 16 Iraq                     2017.   459908            228
    ## 17 Bangladesh               1949.   401586            206
    ## 18 Germany                  1918.   464239            242
    ## 19 Indonesia                1738.   396454            228
    ## 20 Ukraine                  1665.   363075            218

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Israel                           184.               42168.            229
    ##  2 Belgium                          140.               33375.            238
    ##  3 Chile                            133.               30127.            226
    ##  4 Peru                             132.               29778.            225
    ##  5 Argentina                        118.               26662.            225
    ##  6 Czech Republic                   118.               27113.            230
    ##  7 Brazil                           117.               26901.            230
    ##  8 United States                    116.               27757.            240
    ##  9 Colombia                          95.7              21449.            224
    ## 10 Spain                             93.7              22495.            240
    ## 11 Netherlands                       79.3              18716.            236
    ## 12 France                            74.8              18029.            241
    ## 13 Switzerland                       69.8              16758.            240
    ## 14 Iraq                              68.0              15500.            228
    ## 15 Bolivia                           67.1              14170.            211
    ## 16 South Africa                      65.1              14650.            225
    ## 17 United Kingdom                    61.6              14717.            239
    ## 18 Saudi Arabia                      58.6              13432.            229
    ## 19 Libya                             58.5               8972.            153
    ## 20 Dominican Republic                58.0              12725.            219

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  29.1         600     2064
    ##  2 Mexico                  9.96      89171   895326
    ##  3 Ecuador                 7.71      12588   163192
    ##  4 Italy                   6.68      37700   564778
    ##  5 Chad                    6.58         96     1460
    ##  6 Bolivia                 6.14       8658   140952
    ##  7 Sudan                   6.08        837    13765
    ##  8 Egypt                   5.82       6222   106877
    ##  9 Iran                    5.72      33299   581824
    ## 10 Niger                   5.67         69     1218
    ## 11 China                   5.17       4746    91772
    ## 12 Sweden                  5.11       5918   115785
    ## 13 Syria                   4.97        275     5528
    ## 14 United Kingdom          4.94      45365   917579
    ## 15 Canada                  4.53       9973   220213
    ## 16 Tanzania                4.13         21      509
    ## 17 Mali                    3.87        136     3515
    ## 18 Peru                    3.84      34197   890574
    ## 19 Afghanistan             3.71       1523    41032
    ## 20 Nicaragua               3.53        156     4424

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   1143.      34197   29.9 
    ##  2 Belgium                1061.      11038   10.4 
    ##  3 Bolivia                 870.       8658    9.95
    ##  4 Ecuador                 851.      12588   14.8 
    ##  5 Chile                   838.      14026   16.7 
    ##  6 Mexico                  793.      89171  112.  
    ##  7 Brazil                  783.     157397  201.  
    ##  8 Spain                   747.      34752   46.5 
    ##  9 United Kingdom          728.      45365   62.3 
    ## 10 United States           723.     224178  310.  
    ## 11 Argentina               709.      29301   41.3 
    ## 12 Colombia                635.      30348   47.8 
    ## 13 Italy                   625.      37700   60.3 
    ## 14 Sweden                  619.       5918    9.56
    ## 15 France                  544.      35243   64.8 
    ## 16 Iran                    433.      33299   76.9 
    ## 17 Netherlands             428.       7132   16.6 
    ## 18 South Africa            389.      19053   49   
    ## 19 Iraq                    361.      10724   29.7 
    ## 20 Israel                  331.       2435    7.35

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
