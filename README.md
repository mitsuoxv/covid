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

Updated: 2020-11-07

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
    ##  1 United States           37702.  9387978            249
    ##  2 India                   35492.  8411724            237
    ##  3 Brazil                  23389.  5590025            239
    ##  4 Russia                   7439.  1733440            233
    ##  5 France                   6269.  1567332            250
    ##  6 Spain                    5246.  1306316            249
    ##  7 Argentina                5153.  1205928            234
    ##  8 Colombia                 4755.  1108084            233
    ##  9 United Kingdom           4529.  1123201            248
    ## 10 Mexico                   4049.   943630            233
    ## 11 Peru                     3896.   911787            234
    ## 12 Italy                    3209.   824879            257
    ## 13 South Africa             3129.   732414            234
    ## 14 Iran                     2568.   654936            255
    ## 15 Germany                  2466.   619089            251
    ## 16 Chile                    2198.   516582            235
    ## 17 Iraq                     2065.   489571            237
    ## 18 Poland                   1969.   466679            237
    ## 19 Belgium                  1940.   479246            247
    ## 20 Ukraine                  1939.   440188            227

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area           speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                        <dbl>               <dbl>          <int>
    ##  1 Belgium                      186.               46068.            247
    ##  2 Israel                       181.               43252.            239
    ##  3 Czech Republic               156.               37414.            239
    ##  4 Chile                        131.               30847.            235
    ##  5 Peru                         130.               30487.            234
    ##  6 Argentina                    125.               29169.            234
    ##  7 United States                122.               30261.            249
    ##  8 Brazil                       116.               27797.            239
    ##  9 Spain                        113.               28089.            249
    ## 10 Switzerland                  107.               26619.            249
    ## 11 Colombia                      99.5              23187.            233
    ## 12 France                        96.8              24199.            250
    ## 13 Netherlands                   95.6              23432.            245
    ## 14 United Kingdom                72.6              18015.            248
    ## 15 Iraq                          69.6              16500.            237
    ## 16 Austria                       66.3              16122.            243
    ## 17 Jordan                        65.3              14962.            229
    ## 18 Bolivia                       64.9              14281.            220
    ## 19 South Africa                  63.9              14947.            234
    ## 20 Portugal                      63.5              15113.            238

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  29.1         602     2067
    ##  2 Mexico                  9.88      93228   943630
    ##  3 Ecuador                 7.41      12730   171783
    ##  4 Chad                    6.47         99     1529
    ##  5 Bolivia                 6.16       8758   142062
    ##  6 Sudan                   6.00        837    13943
    ##  7 Egypt                   5.83       6329   108530
    ##  8 Iran                    5.65      36985   654936
    ##  9 Niger                   5.65         69     1222
    ## 10 China                   5.15       4748    92121
    ## 11 Syria                   5.05        305     6040
    ## 12 Italy                   4.87      40192   824879
    ## 13 United Kingdom          4.28      48120  1123201
    ## 14 Sweden                  4.23       6002   141764
    ## 15 Canada                  4.17      10331   247703
    ## 16 Tanzania                4.13         21      509
    ## 17 Peru                    3.80      34671   911787
    ## 18 Mali                    3.77        137     3633
    ## 19 Afghanistan             3.71       1554    41935
    ## 20 Nicaragua               3.50        157     4480

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Belgium                1203.      12520   10.4 
    ##  2 Peru                   1159.      34671   29.9 
    ##  3 Bolivia                 880.       8758    9.95
    ##  4 Ecuador                 861.      12730   14.8 
    ##  5 Chile                   860.      14404   16.7 
    ##  6 Mexico                  829.      93228  112.  
    ##  7 Spain                   828.      38486   46.5 
    ##  8 Brazil                  801.     161106  201.  
    ##  9 Argentina               787.      32520   41.3 
    ## 10 United Kingdom          772.      48120   62.3 
    ## 11 United States           748.     232166  310.  
    ## 12 Colombia                670.      32013   47.8 
    ## 13 Italy                   666.      40192   60.3 
    ## 14 Sweden                  628.       6002    9.56
    ## 15 France                  598.      38718   64.8 
    ## 16 Iran                    481.      36985   76.9 
    ## 17 Netherlands             466.       7759   16.6 
    ## 18 Czech Republic          413.       4330   10.5 
    ## 19 South Africa            402.      19677   49   
    ## 20 Iraq                    377.      11175   29.7

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
