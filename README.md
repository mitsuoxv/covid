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

Updated: 2020-09-08

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
    ##  1 United States           32748.  6189488            189
    ##  2 India                   23754.  4204613            177
    ##  3 Brazil                  23033.  4123000            179
    ##  4 Russia                   5923.  1030690            174
    ##  5 Peru                     3928.   683702            174
    ##  6 Colombia                 3805.   658456            173
    ##  7 South Africa             3669.   638517            174
    ##  8 Mexico                   3638.   629409            173
    ##  9 Argentina                2711.   471806            174
    ## 10 Spain                    2640.   498989            189
    ## 11 Chile                    2413.   422510            175
    ## 12 Bangladesh               2097.   325157            155
    ## 13 Iran                     1982.   386658            195
    ## 14 United Kingdom           1846.   347156            188
    ## 15 Saudi Arabia             1802.   320827            178
    ## 16 Pakistan                 1707.   298903            175
    ## 17 Turkey                   1607.   279806            174
    ## 18 France                   1601.   307476            192
    ## 19 Iraq                     1470.   260370            177
    ## 20 Italy                    1402.   277634            198

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            144.               25230.            175
    ##  2 Peru                             131.               22861.            174
    ##  3 Brazil                           115.               20502.            179
    ##  4 United States                    106.               19951.            189
    ##  5 Israel                            98.6              17569.            178
    ##  6 Colombia                          79.6              13778.            173
    ##  7 Bolivia                           75.5              12088.            160
    ##  8 South Africa                      74.9              13031.            174
    ##  9 Saudi Arabia                      70.0              12468.            178
    ## 10 Argentina                         65.6              11412.            174
    ## 11 Dominican Republic                60.0              10111.            168
    ## 12 Spain                             56.8              10730.            189
    ## 13 Kazakhstan                        52.5               8730.            166
    ## 14 Kyrgyzstan                        50.0               8071.            161
    ## 15 Honduras                          49.6               8055.            162
    ## 16 Iraq                              49.6               8775.            177
    ## 17 Sweden                            48.0               8893.            185
    ## 18 Belarus                           46.3               7523.            162
    ## 19 Ecuador                           45.8               7981.            174
    ## 20 Belgium                           45.3               8485.            187

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  28.8         573     1991
    ##  2 Italy                  12.8       35541   277634
    ##  3 United Kingdom         12.0       41551   347156
    ##  4 Belgium                11.2        9907    88273
    ##  5 Mexico                 10.7       67326   629409
    ##  6 France                  9.93      30547   307476
    ##  7 Netherlands             8.34       6234    74715
    ##  8 Chad                    7.60         79     1039
    ##  9 Hungary                 7.44        624     8387
    ## 10 Canada                  6.95       9143   131495
    ## 11 Sweden                  6.87       5835    84985
    ## 12 Sudan                   6.20        833    13437
    ## 13 Spain                   5.90      29418   498989
    ## 14 Niger                   5.86         69     1177
    ## 15 Iran                    5.77      22293   386658
    ## 16 Ecuador                 5.70       6724   118045
    ## 17 Egypt                   5.54       5530    99863
    ## 18 China                   5.23       4737    90551
    ## 19 Bolivia                 4.49       5398   120241
    ## 20 Mali                    4.47        127     2842

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                    993.      29687   29.9 
    ##  2 Belgium                 952.       9907   10.4 
    ##  3 Chile                   692.      11592   16.7 
    ##  4 United Kingdom          666.      41551   62.3 
    ##  5 Spain                   633.      29418   46.5 
    ##  6 Brazil                  628.     126203  201.  
    ##  7 Sweden                  611.       5835    9.56
    ##  8 United States           605.     187541  310.  
    ##  9 Mexico                  599.      67326  112.  
    ## 10 Italy                   589.      35541   60.3 
    ## 11 Bolivia                 543.       5398    9.95
    ## 12 France                  472.      30547   64.8 
    ## 13 Ecuador                 455.       6724   14.8 
    ## 14 Colombia                443.      21156   47.8 
    ## 15 Netherlands             375.       6234   16.6 
    ## 16 South Africa            304.      14889   49   
    ## 17 Iran                    290.      22293   76.9 
    ## 18 Canada                  271.       9143   33.7 
    ## 19 Iraq                    253.       7512   29.7 
    ## 20 Honduras                251.       2006    7.99

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
