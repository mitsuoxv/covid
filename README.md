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

Updated: 2020-11-01

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
    ##    area          speed_since_100 cum_conf days_since_100
    ##    <chr>                   <dbl>    <dbl>          <int>
    ##  1 United States          36688.  8952086            244
    ##  2 India                  35276.  8184082            232
    ##  3 Brazil                 23575.  5516658            234
    ##  4 Argentina               5053.  1157179            229
    ##  5 Colombia                4662.  1063151            228
    ##  6 Mexico                  4029.   918811            228
    ##  7 Peru                    3930.   900180            229
    ##  8 Iran                    2451.   612772            250
    ##  9 Chile                   2218.   510256            230
    ## 10 Iraq                    2037.   472630            232
    ## 11 Bangladesh              1941.   407684            210
    ## 12 Indonesia               1767.   410088            232
    ## 13 Philippines             1640.   380729            232
    ## 14 Saudi Arabia            1490.   347282            233
    ## 15 Pakistan                1447.   332993            230
    ## 16 Canada                   991.   231999            234
    ## 17 Morocco                  973.   219084            225
    ## 18 Nepal                    959.   170743            178
    ## 19 Ecuador                  734.   168192            229
    ## 20 Bolivia                  658.   141631            215

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Chile                            132.               30469.            230
    ##  2 Peru                             131.               30099.            229
    ##  3 Argentina                        122.               27990.            229
    ##  4 United States                    118.               28856.            244
    ##  5 Brazil                           117.               27432.            234
    ##  6 Colombia                          97.6              22246.            228
    ##  7 Iraq                              68.6              15929.            232
    ##  8 Bolivia                           66.2              14238.            215
    ##  9 Libya                             60.1               9455.            157
    ## 10 Saudi Arabia                      57.9              13496.            233
    ## 11 Dominican Republic                57.8              12930.            223
    ## 12 Honduras                          55.8              12127.            217
    ## 13 Jordan                            50.5              11332.            224
    ## 14 Ecuador                           49.6              11372.            229
    ## 15 Paraguay                          46.7               9818.            210
    ## 16 Guatemala                         38.8               7966.            205
    ## 17 Mexico                            35.8               8169.            228
    ## 18 Nepal                             33.1               5897.            178
    ## 19 Iran                              31.9               7966.            250
    ## 20 Morocco                           30.8               6927.            225

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area        fatality_rate cum_deaths cum_conf
    ##    <chr>               <dbl>      <dbl>    <dbl>
    ##  1 Yemen               29.0         600     2067
    ##  2 Mexico               9.94      91289   918811
    ##  3 Ecuador              7.53      12670   168192
    ##  4 Bolivia              6.15       8715   141631
    ##  5 Sudan                6.06        837    13804
    ##  6 Egypt                5.83       6266   107555
    ##  7 Iran                 5.69      34864   612772
    ##  8 China                5.16       4746    91921
    ##  9 Syria                5.03        288     5728
    ## 10 Canada               4.36      10110   231999
    ## 11 Peru                 3.82      34411   900180
    ## 12 Afghanistan          3.71       1536    41425
    ## 13 Nicaragua            3.53        156     4424
    ## 14 Guatemala            3.45       3729   107939
    ## 15 Indonesia            3.38      13869   410088
    ## 16 Australia            3.29        907    27590
    ## 17 Vietnam              2.97         35     1180
    ## 18 Colombia             2.93      31135  1063151
    ## 19 El Salvador          2.92        975    33445
    ## 20 Brazil               2.89     159477  5516658

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area               deaths_per_1m cum_deaths pop_mil
    ##    <chr>                      <dbl>      <dbl>   <dbl>
    ##  1 Peru                       1151.      34411   29.9 
    ##  2 Bolivia                     876.       8715    9.95
    ##  3 Ecuador                     857.      12670   14.8 
    ##  4 Chile                       848.      14207   16.7 
    ##  5 Mexico                      812.      91289  112.  
    ##  6 Brazil                      793.     159477  201.  
    ##  7 Argentina                   745.      30792   41.3 
    ##  8 United States               736.     228185  310.  
    ##  9 Colombia                    651.      31135   47.8 
    ## 10 Iran                        453.      34864   76.9 
    ## 11 Iraq                        368.      10910   29.7 
    ## 12 Honduras                    334.       2669    7.99
    ## 13 Canada                      300.      10110   33.7 
    ## 14 Guatemala                   275.       3729   13.6 
    ## 15 Dominican Republic          229.       2245    9.82
    ## 16 Paraguay                    218.       1387    6.38
    ## 17 Saudi Arabia                210.       5402   25.7 
    ## 18 El Salvador                 161.        975    6.05
    ## 19 Libya                       133.        857    6.46
    ## 20 Jordan                      129.        829    6.41

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
