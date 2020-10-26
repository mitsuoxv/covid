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

Updated: 2020-10-27

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
    ##  1 United States           35654.  8485747            238
    ##  2 India                   34999.  7909959            226
    ##  3 Brazil                  23599.  5380635            228
    ##  4 Russia                   6897.  1531224            222
    ##  5 Argentina                4849.  1081336            223
    ##  6 France                   4635.  1107952            239
    ##  7 Colombia                 4539.  1007711            222
    ##  8 Spain                    4395.  1046132            238
    ##  9 Mexico                   3994.   886800            222
    ## 10 Peru                     3973.   886214            223
    ## 11 United Kingdom           3686.   873804            237
    ## 12 South Africa             3210.   715868            223
    ## 13 Iran                     2331.   568896            244
    ## 14 Chile                    2241.   502063            224
    ## 15 Italy                    2137.   525782            246
    ## 16 Iraq                     1998.   451707            226
    ## 17 Bangladesh               1954.   398815            204
    ## 18 Germany                  1824.   437866            240
    ## 19 Indonesia                1724.   389712            226
    ## 20 Philippines              1637.   370028            226

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Israel                           185.               42090.            227
    ##  2 Chile                            134.               29980.            224
    ##  3 Peru                             133.               29632.            223
    ##  4 Belgium                          131.               30850.            236
    ##  5 Brazil                           117.               26756.            228
    ##  6 Argentina                        117.               26155.            223
    ##  7 United States                    115.               27353.            238
    ##  8 Czech Republic                   108.               24637.            228
    ##  9 Colombia                          95.0              21086.            222
    ## 10 Spain                             94.5              22495.            238
    ## 11 Netherlands                       74.7              17478.            234
    ## 12 France                            71.6              17106.            239
    ## 13 Bolivia                           67.7              14152.            209
    ## 14 Iraq                              67.3              15224.            226
    ## 15 South Africa                      65.5              14610.            223
    ## 16 United Kingdom                    59.1              14015.            237
    ## 17 Saudi Arabia                      59.0              13403.            227
    ## 18 Dominican Republic                58.3              12676.            217
    ## 19 Libya                             57.3               8669.            151
    ## 20 Switzerland                       57.2              13629.            238

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  29.1         600     2064
    ##  2 Mexico                 10.0       88743   886800
    ##  3 Ecuador                 7.77      12553   161635
    ##  4 Italy                   7.10      37338   525782
    ##  5 Chad                    6.68         96     1437
    ##  6 Bolivia                 6.13       8627   140779
    ##  7 Sudan                   6.09        837    13742
    ##  8 Egypt                   5.82       6199   106540
    ##  9 Iran                    5.73      32616   568896
    ## 10 Niger                   5.68         69     1215
    ## 11 Sweden                  5.36       5933   110594
    ## 12 China                   5.18       4746    91701
    ## 13 United Kingdom          5.14      44896   873804
    ## 14 Syria                   4.97        269     5408
    ## 15 Canada                  4.64       9922   213959
    ## 16 Tanzania                4.13         21      509
    ## 17 Peru                    3.85      34095   886214
    ## 18 Mali                    3.80        132     3472
    ## 19 Afghanistan             3.71       1514    40833
    ## 20 Nicaragua               3.55        155     4362

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   1140.      34095   29.9 
    ##  2 Belgium                1039.      10810   10.4 
    ##  3 Bolivia                 867.       8627    9.95
    ##  4 Ecuador                 849.      12553   14.8 
    ##  5 Chile                   833.      13944   16.7 
    ##  6 Mexico                  789.      88743  112.  
    ##  7 Brazil                  780.     156903  201.  
    ##  8 Spain                   747.      34752   46.5 
    ##  9 United Kingdom          720.      44896   62.3 
    ## 10 United States           720.     223328  310.  
    ## 11 Argentina               692.      28613   41.3 
    ## 12 Colombia                628.      30000   47.8 
    ## 13 Sweden                  621.       5933    9.56
    ## 14 Italy                   619.      37338   60.3 
    ## 15 France                  532.      34478   64.8 
    ## 16 Iran                    424.      32616   76.9 
    ## 17 Netherlands             423.       7036   16.6 
    ## 18 South Africa            387.      18968   49   
    ## 19 Iraq                    358.      10623   29.7 
    ## 20 Honduras                328.       2617    7.99

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
