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

Updated: 2020-10-25

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
    ##  1 United States           35256.  8320491            236
    ##  2 India                   34886.  7814682            224
    ##  3 Brazil                  23555.  5323630            226
    ##  4 Russia                   6805.  1497167            220
    ##  5 Argentina                4767.  1053650            221
    ##  6 Colombia                 4501.   990270            220
    ##  7 Spain                    4432.  1046132            236
    ##  8 France                   4263.  1010554            237
    ##  9 Peru                     3981.   879876            221
    ## 10 Mexico                   3973.   874171            220
    ## 11 United Kingdom           3536.   831002            235
    ## 12 South Africa             3223.   712412            221
    ## 13 Iran                     2301.   556891            242
    ## 14 Chile                    2247.   498906            222
    ## 15 Iraq                     1990.   445949            224
    ## 16 Italy                    1987.   484869            244
    ## 17 Bangladesh               1962.   396413            202
    ## 18 Germany                  1756.   418005            238
    ## 19 Indonesia                1704.   381910            224
    ## 20 Philippines              1632.   365799            224

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Israel                           186.               41826.            225
    ##  2 Chile                            134.               29792.            222
    ##  3 Peru                             133.               29420.            221
    ##  4 Belgium                          118.               27646.            234
    ##  5 Brazil                           117.               26472.            226
    ##  6 Argentina                        115.               25485.            221
    ##  7 United States                    114.               26820.            236
    ##  8 Czech Republic                   101.               22749.            226
    ##  9 Spain                             95.3              22495.            236
    ## 10 Colombia                          94.2              20721.            220
    ## 11 Netherlands                       70.4              16347.            232
    ## 12 Bolivia                           68.2              14119.            207
    ## 13 Iraq                              67.1              15029.            224
    ## 14 France                            65.8              15603.            237
    ## 15 South Africa                      65.8              14539.            221
    ## 16 Saudi Arabia                      59.4              13375.            225
    ## 17 Dominican Republic                58.0              12508.            215
    ## 18 Switzerland                       57.7              13629.            236
    ## 19 United Kingdom                    56.7              13328.            235
    ## 20 Libya                             55.3               8262.            149

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  29.1         601     2064
    ##  2 Mexico                 10.1       87894   874171
    ##  3 Ecuador                 7.99      12500   156451
    ##  4 Italy                   7.64      37059   484869
    ##  5 Chad                    6.75         96     1423
    ##  6 Bolivia                 6.11       8584   140445
    ##  7 Sudan                   6.09        836    13733
    ##  8 Egypt                   5.81       6176   106230
    ##  9 Iran                    5.74      31985   556891
    ## 10 Niger                   5.68         69     1215
    ## 11 Sweden                  5.36       5933   110594
    ## 12 United Kingdom          5.36      44571   831002
    ## 13 China                   5.18       4746    91653
    ## 14 Syria                   4.96        264     5319
    ## 15 Canada                  4.72       9862   209148
    ## 16 Tanzania                4.13         21      509
    ## 17 Peru                    3.86      33984   879876
    ## 18 Mali                    3.84        132     3440
    ## 19 Belgium                 3.71      10658   287606
    ## 20 Afghanistan             3.70       1507    40687

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   1136.      33984   29.9 
    ##  2 Belgium                1025.      10658   10.4 
    ##  3 Bolivia                 863.       8584    9.95
    ##  4 Ecuador                 845.      12500   14.8 
    ##  5 Chile                   827.      13844   16.7 
    ##  6 Mexico                  781.      87894  112.  
    ##  7 Brazil                  775.     155900  201.  
    ##  8 Spain                   747.      34752   46.5 
    ##  9 United Kingdom          715.      44571   62.3 
    ## 10 United States           714.     221564  310.  
    ## 11 Argentina               676.      27957   41.3 
    ## 12 Sweden                  621.       5933    9.56
    ## 13 Colombia                620.      29636   47.8 
    ## 14 Italy                   614.      37059   60.3 
    ## 15 France                  528.      34225   64.8 
    ## 16 Netherlands             418.       6954   16.6 
    ## 17 Iran                    416.      31985   76.9 
    ## 18 South Africa            386.      18891   49   
    ## 19 Iraq                    354.      10513   29.7 
    ## 20 Honduras                326.       2604    7.99

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
