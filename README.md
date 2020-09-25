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

Updated: 2020-09-26

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
    ##  1 United States           33182.  6868828            207
    ##  2 India                   29838.  5818570            195
    ##  3 Brazil                  23476.  4624885            197
    ##  4 Russia                   5916.  1136048            192
    ##  5 Colombia                 4106.   784268            191
    ##  6 Peru                     4076.   782695            192
    ##  7 Mexico                   3717.   710049            191
    ##  8 South Africa             3474.   667049            192
    ##  9 Argentina                3462.   664799            192
    ## 10 Spain                    3401.   704209            207
    ## 11 Chile                    2339.   451634            193
    ## 12 France                   2258.   474200            210
    ## 13 Bangladesh               2054.   355384            173
    ## 14 Iran                     2048.   436319            213
    ## 15 United Kingdom           2021.   416367            206
    ## 16 Iraq                     1728.   337106            195
    ## 17 Saudi Arabia             1693.   331857            196
    ## 18 Turkey                   1612.   309790            192
    ## 19 Pakistan                 1600.   309015            193
    ## 20 Philippines              1521.   296755            195

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Israel                           141.               28019.            198
    ##  2 Chile                            140.               26969.            193
    ##  3 Peru                             136.               26171.            192
    ##  4 Brazil                           117.               22998.            197
    ##  5 United States                    107.               22141.            207
    ##  6 Colombia                          85.9              16411.            191
    ##  7 Argentina                         83.7              16080.            192
    ##  8 Bolivia                           74.5              13269.            178
    ##  9 Spain                             73.1              15142.            207
    ## 10 South Africa                      70.9              13613.            192
    ## 11 Saudi Arabia                      65.8              12897.            196
    ## 12 Dominican Republic                60.1              11210.            186
    ## 13 Iraq                              58.2              11361.            195
    ## 14 Belgium                           50.9              10446.            205
    ## 15 Honduras                          50.5               9096.            180
    ## 16 Kazakhstan                        49.4               9099.            184
    ## 17 Sweden                            46.7               9449.            202
    ## 18 Kyrgyzstan                        46.5               8338.            179
    ## 19 Ecuador                           46.1               8867.            192
    ## 20 Belarus                           43.9               7914.            180

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  28.9         587     2033
    ##  2 Italy                  11.8       35781   304323
    ##  3 Mexico                 10.6       74949   710049
    ##  4 United Kingdom         10.1       41902   416367
    ##  5 Belgium                 9.17       9965   108674
    ##  6 Ecuador                 8.55      11213   131146
    ##  7 Chad                    7.00         82     1171
    ##  8 France                  6.61      31325   474200
    ##  9 Sweden                  6.51       5878    90289
    ## 10 Canada                  6.26       9243   147753
    ## 11 Sudan                   6.15        836    13592
    ## 12 Netherlands             6.12       6303   103034
    ## 13 Bolivia                 5.86       7731   131990
    ## 14 Niger                   5.78         69     1193
    ## 15 Iran                    5.73      25015   436319
    ## 16 Egypt                   5.69       5835   102513
    ## 17 China                   5.22       4745    90933
    ## 18 Syria                   4.61        183     3966
    ## 19 Spain                   4.42      31118   704209
    ## 20 Mali                    4.27        130     3041

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   1066.      31870   29.9 
    ##  2 Belgium                 958.       9965   10.4 
    ##  3 Bolivia                 777.       7731    9.95
    ##  4 Ecuador                 758.      11213   14.8 
    ##  5 Chile                   745.      12469   16.7 
    ##  6 Brazil                  691.     138977  201.  
    ##  7 United Kingdom          672.      41902   62.3 
    ##  8 Spain                   669.      31118   46.5 
    ##  9 Mexico                  666.      74949  112.  
    ## 10 United States           647.     200725  310.  
    ## 11 Sweden                  615.       5878    9.56
    ## 12 Italy                   593.      35781   60.3 
    ## 13 Colombia                518.      24746   47.8 
    ## 14 France                  484.      31325   64.8 
    ## 15 Netherlands             379.       6303   16.6 
    ## 16 Argentina               348.      14376   41.3 
    ## 17 South Africa            332.      16283   49   
    ## 18 Iran                    325.      25015   76.9 
    ## 19 Iraq                    297.       8799   29.7 
    ## 20 Honduras                278.       2222    7.99

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
