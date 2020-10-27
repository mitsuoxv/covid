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

Updated: 2020-10-28

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
    ##  1 United States           35766.  8548111            239
    ##  2 India                   35006.  7946429            227
    ##  3 Brazil                  23555.  5394128            229
    ##  4 Russia                   6940.  1547774            223
    ##  5 Argentina                4868.  1090589            224
    ##  6 France                   4726.  1134296            240
    ##  7 Colombia                 4555.  1015885            223
    ##  8 Spain                    4377.  1046132            239
    ##  9 Mexico                   3996.   891160            223
    ## 10 Peru                     3967.   888715            224
    ## 11 United Kingdom           3759.   894694            238
    ## 12 South Africa             3199.   716759            224
    ## 13 Iran                     2346.   574856            245
    ## 14 Chile                    2238.   503598            225
    ## 15 Italy                    2197.   542789            247
    ## 16 Iraq                     2006.   455398            227
    ## 17 Bangladesh               1952.   400251            205
    ## 18 Germany                  1864.   449275            241
    ## 19 Indonesia                1730.   392934            227
    ## 20 Ukraine                  1638.   355601            217

Above calculation might be unfair to populous areas. Below
“per\_capita\_cum\_conf” is cumulative cases per 1 million population.
Highest “speed\_std\_since\_100”, which is per day growth of cumulative
cases per 1 million population since cumulative cases became more than
100, are:

    ## # A tibble: 20 x 4
    ##    area               speed_std_since_100 per_capita_cum_conf days_since_100
    ##    <chr>                            <dbl>               <dbl>          <int>
    ##  1 Israel                           185.               42168.            228
    ##  2 Belgium                          135.               32070.            237
    ##  3 Chile                            134.               30072.            225
    ##  4 Peru                             133.               29716.            224
    ##  5 Argentina                        118.               26379.            224
    ##  6 Brazil                           117.               26823.            229
    ##  7 United States                    115.               27554.            239
    ##  8 Czech Republic                   112.               25618.            229
    ##  9 Colombia                          95.3              21257.            223
    ## 10 Spain                             94.1              22495.            239
    ## 11 Netherlands                       77.0              18098.            235
    ## 12 France                            73.0              17513.            240
    ## 13 Iraq                              67.6              15348.            227
    ## 14 Bolivia                           67.4              14160.            210
    ## 15 Switzerland                       66.5              15919.            239
    ## 16 South Africa                      65.3              14628.            224
    ## 17 United Kingdom                    60.3              14350.            238
    ## 18 Saudi Arabia                      58.8              13417.            228
    ## 19 Libya                             58.2               8856.            152
    ## 20 Dominican Republic                58.1              12708.            218

## Highest fatality rate areas

Among areas with more than 5 million population and more than 10
cumulative deaths, highest “fatality\_rate”, which is cumulative deaths
per 100 cumulative confirmed cases, are:

    ## # A tibble: 20 x 4
    ##    area           fatality_rate cum_deaths cum_conf
    ##    <chr>                  <dbl>      <dbl>    <dbl>
    ##  1 Yemen                  29.1         600     2064
    ##  2 Mexico                  9.98      88924   891160
    ##  3 Ecuador                 7.77      12553   161635
    ##  4 Italy                   6.90      37479   542789
    ##  5 Chad                    6.66         96     1441
    ##  6 Bolivia                 6.14       8645   140853
    ##  7 Sudan                   6.09        837    13747
    ##  8 Egypt                   5.82       6211   106707
    ##  9 Iran                    5.73      32953   574856
    ## 10 Niger                   5.68         69     1215
    ## 11 Sweden                  5.36       5933   110594
    ## 12 China                   5.17       4746    91725
    ## 13 United Kingdom          5.03      44998   894694
    ## 14 Syria                   4.98        272     5461
    ## 15 Canada                  4.60       9946   216104
    ## 16 Tanzania                4.13         21      509
    ## 17 Peru                    3.84      34149   888715
    ## 18 Mali                    3.80        133     3499
    ## 19 Afghanistan             3.71       1518    40937
    ## 20 Nicaragua               3.55        155     4362

## Highest deaths per population areas

Among areas with more than 5 million population, highest
“deaths\_per\_1m”, which is cumulative deaths per 1 million
population, are:

    ## # A tibble: 20 x 4
    ##    area           deaths_per_1m cum_deaths pop_mil
    ##    <chr>                  <dbl>      <dbl>   <dbl>
    ##  1 Peru                   1142.      34149   29.9 
    ##  2 Belgium                1048.      10899   10.4 
    ##  3 Bolivia                 869.       8645    9.95
    ##  4 Ecuador                 849.      12553   14.8 
    ##  5 Chile                   836.      14003   16.7 
    ##  6 Mexico                  791.      88924  112.  
    ##  7 Brazil                  781.     157134  201.  
    ##  8 Spain                   747.      34752   46.5 
    ##  9 United Kingdom          722.      44998   62.3 
    ## 10 United States           721.     223699  310.  
    ## 11 Argentina               699.      28896   41.3 
    ## 12 Colombia                631.      30154   47.8 
    ## 13 Italy                   621.      37479   60.3 
    ## 14 Sweden                  621.       5933    9.56
    ## 15 France                  536.      34721   64.8 
    ## 16 Iran                    428.      32953   76.9 
    ## 17 Netherlands             424.       7062   16.6 
    ## 18 South Africa            388.      19008   49   
    ## 19 Iraq                    360.      10671   29.7 
    ## 20 Israel                  331.       2435    7.35

## Save data

You can see the data I use in table2.csv in data directory of this
repository.

EOL
