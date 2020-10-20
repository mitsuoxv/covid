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

Updated: 2020-10-21

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
    ##  1 United States           34765.  8065615            232
    ##  2 India                   34532.  7597063            220
    ##  3 Brazil                  23582.  5235344            222
    ##  4 Russia                   6627.  1431635            216
    ##  5 Argentina                4560.   989680            217
    ##  6 Colombia                 4442.   959572            216
    ##  7 Spain                    4036.   936560            232
    ##  8 Peru                     4002.   868675            217
    ##  9 Mexico                   3940.   851227            216
    ## 10 France                   3748.   880922            235
    ## 11 South Africa             3249.   705254            217
    ## 12 United Kingdom           3208.   741216            231
    ## 13 Chile                    2262.   493305            218
    ## 14 Iran                     2246.   534631            238
    ## 15 Bangladesh               1970.   390206            198
    ## 16 Iraq                     1957.   430678            220
    ## 17 Italy                    1764.   423578            240
    ## 18 Indonesia                1660.   365240            220
    ## 19 Philippines              1632.   359169            220
    ## 20 Turkey                   1617.   349519            216

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Israel                           187.               41303.            221
    ##  2 Chile                            135.               29457.            218
    ##  3 Peru                             134.               29046.            217
    ##  4 Brazil                           117.               26033.            222
    ##  5 United States                    112.               25999.            232
    ##  6 Argentina                        110.               23938.            217
    ##  7 Belgium                           96.2              22146.            230
    ##  8 Colombia                          92.9              20079.            216
    ##  9 Spain                             86.8              20138.            232
    ## 10 Czech Republic                    78.2              17369.            222
    ## 11 Bolivia                           69.2              14051.            203
    ## 12 South Africa                      66.3              14393.            217
    ## 13 Iraq                              66.0              14515.            220
    ## 14 Netherlands                       62.1              14176.            228
    ## 15 Saudi Arabia                      60.2              13314.            221
    ## 16 Dominican Republic                58.5              12385.            211
    ## 17 France                            57.9              13601.            235
    ## 18 Honduras                          53.9              11069.            205
    ## 19 Libya                             53.2               7730.            145
    ## 20 United Kingdom                    51.5              11888.            231

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  29.1         599     2060
    ##  2 Mexico                 10.1       86167   851227
    ##  3 Italy                   8.64      36616   423578
    ##  4 Ecuador                 8.08      12395   153423
    ##  5 Chad                    6.69         93     1390
    ##  6 Sudan                   6.09        836    13724
    ##  7 Bolivia                 6.07       8481   139771
    ##  8 United Kingdom          5.90      43726   741216
    ##  9 Egypt                   5.81       6130   105547
    ## 10 Iran                    5.74      30712   534631
    ## 11 Sweden                  5.73       5918   103200
    ## 12 Niger                   5.70         69     1211
    ## 13 China                   5.18       4746    91546
    ## 14 Canada                  4.93       9760   198148
    ## 15 Syria                   4.89        251     5134
    ## 16 Belgium                 4.53      10443   230387
    ## 17 Tanzania                4.13         21      509
    ## 18 Peru                    3.89      33759   868675
    ## 19 Mali                    3.87        132     3407
    ## 20 France                  3.79      33350   880922

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   1129.      33759   29.9 
    ##  2 Belgium                1004.      10443   10.4 
    ##  3 Bolivia                 853.       8481    9.95
    ##  4 Ecuador                 838.      12395   14.8 
    ##  5 Chile                   817.      13676   16.7 
    ##  6 Mexico                  766.      86167  112.  
    ##  7 Brazil                  765.     153905  201.  
    ##  8 Spain                   726.      33775   46.5 
    ##  9 United States           703.     218131  310.  
    ## 10 United Kingdom          701.      43726   62.3 
    ## 11 Argentina               635.      26267   41.3 
    ## 12 Sweden                  619.       5918    9.56
    ## 13 Italy                   607.      36616   60.3 
    ## 14 Colombia                606.      28970   47.8 
    ## 15 France                  515.      33350   64.8 
    ## 16 Netherlands             406.       6759   16.6 
    ## 17 Iran                    399.      30712   76.9 
    ## 18 South Africa            377.      18492   49   
    ## 19 Iraq                    348.      10317   29.7 
    ## 20 Honduras                321.       2568    7.99

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
